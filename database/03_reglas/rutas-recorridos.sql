-- 03_reglas/rutas-recorridos.sql · Responsable: Sebastián Armas
-- Spec: specs/mobility-routes/rutas-recorridos/spec.md
-- Triggers, funciones y procedimientos en PL/pgSQL de esta capacidad.
-- Cada objeto que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- Sección 8 de la spec: RR-112, RR-114 y RR-115 se verifican cuando se escribe el
-- recorrido (al iniciarlo, registrar un paso o terminarlo), no cuando la ruta
-- cambia después. Por eso ningún trigger de esta capacidad está en las tablas de
-- rutas-gestion: cambiar la secuencia o la visibilidad de una ruta no invalida el
-- historial.
--
-- Iniciar un recorrido escribe recorrido, realiza y sobre juntos, en cualquier
-- orden: RR-44, RR-45 y RR-112 se verifican al confirmar. Terminar puede registrar
-- el último paso y el fin en la misma transacción: RR-115 también se verifica al
-- confirmar. RR-114 se verifica al escribir cada paso o cambiar el inicio o el fin.

-- RR-44
CREATE FUNCTION tf_recorrido_con_visitante() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_id recorrido.id_recorrido%TYPE;
BEGIN
    IF TG_TABLE_NAME = 'recorrido' THEN
        v_id := NEW.id_recorrido;
    ELSE
        v_id := OLD.id_recorrido;
    END IF;
    IF EXISTS (SELECT 1 FROM recorrido WHERE id_recorrido = v_id)
       AND NOT EXISTS (SELECT 1 FROM realiza WHERE id_recorrido = v_id) THEN
        RAISE EXCEPTION 'RR-44: el recorrido % debe tener el visitante que lo hace.', v_id
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

CREATE CONSTRAINT TRIGGER tg_recorrido_con_visitante
    AFTER INSERT ON recorrido
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_recorrido_con_visitante();

CREATE CONSTRAINT TRIGGER tg_realiza_con_visitante
    AFTER DELETE OR UPDATE OF id_recorrido ON realiza
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_recorrido_con_visitante();

-- RR-45
CREATE FUNCTION tf_recorrido_con_ruta() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_id recorrido.id_recorrido%TYPE;
BEGIN
    IF TG_TABLE_NAME = 'recorrido' THEN
        v_id := NEW.id_recorrido;
    ELSE
        v_id := OLD.id_recorrido;
    END IF;
    IF EXISTS (SELECT 1 FROM recorrido WHERE id_recorrido = v_id)
       AND NOT EXISTS (SELECT 1 FROM sobre WHERE id_recorrido = v_id) THEN
        RAISE EXCEPTION 'RR-45: el recorrido % debe ser sobre una ruta.', v_id
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

CREATE CONSTRAINT TRIGGER tg_recorrido_con_ruta
    AFTER INSERT ON recorrido
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_recorrido_con_ruta();

CREATE CONSTRAINT TRIGGER tg_sobre_con_ruta
    AFTER DELETE OR UPDATE OF id_recorrido ON sobre
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_recorrido_con_ruta();

-- RR-112 (HU-28, criterio 2): la ruta es fija, dinámica pública o dinámica creada
-- por el mismo visitante. Se revisa al escribir sobre o realiza. Si todavía falta
-- uno de los dos, lo reclaman RR-44 o RR-45.
CREATE FUNCTION tf_sobre_ruta_permitida() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_sobre sobre%ROWTYPE;
    v_visitante realiza.cedula_pasaporte%TYPE;
BEGIN
    SELECT * INTO v_sobre FROM sobre WHERE id_recorrido = NEW.id_recorrido;
    SELECT cedula_pasaporte INTO v_visitante FROM realiza WHERE id_recorrido = NEW.id_recorrido;
    IF v_sobre.id_recorrido IS NULL OR v_visitante IS NULL THEN
        RETURN NULL;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM ruta_fija
                   WHERE nombre_estado = v_sobre.nombre_estado AND nombre_municipio = v_sobre.nombre_municipio
                     AND nombre_ruta = v_sobre.nombre_ruta)
       AND NOT EXISTS (SELECT 1 FROM ruta_dinamica
                       WHERE nombre_estado = v_sobre.nombre_estado AND nombre_municipio = v_sobre.nombre_municipio
                         AND nombre_ruta = v_sobre.nombre_ruta AND visibilidad = 'pública')
       AND NOT EXISTS (SELECT 1 FROM crea
                       WHERE nombre_estado = v_sobre.nombre_estado AND nombre_municipio = v_sobre.nombre_municipio
                         AND nombre_ruta = v_sobre.nombre_ruta AND cedula_pasaporte = v_visitante) THEN
        RAISE EXCEPTION 'RR-112: el recorrido % no puede ser sobre la ruta % (%, %): solo rutas fijas, dinámicas públicas o las del propio visitante.',
            NEW.id_recorrido, v_sobre.nombre_ruta, v_sobre.nombre_municipio, v_sobre.nombre_estado
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

CREATE CONSTRAINT TRIGGER tg_sobre_ruta_permitida
    AFTER INSERT OR UPDATE ON sobre
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_sobre_ruta_permitida();

CREATE CONSTRAINT TRIGGER tg_realiza_ruta_permitida
    AFTER INSERT OR UPDATE ON realiza
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_sobre_ruta_permitida();

-- RR-114, al registrar un paso: el hito está en la secuencia de la ruta del
-- recorrido y el paso ocurre entre el inicio y el fin. Solo se revisa el paso
-- escrito, no los anteriores, que pudieron ser válidos con la secuencia de entonces.
CREATE FUNCTION tf_transita_paso_valido() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_recorrido recorrido%ROWTYPE;
BEGIN
    IF NOT EXISTS (SELECT 1
                   FROM sobre s
                   JOIN conforma c ON c.estado_ruta = s.nombre_estado
                                  AND c.municipio_ruta = s.nombre_municipio
                                  AND c.nombre_ruta = s.nombre_ruta
                   WHERE s.id_recorrido = NEW.id_recorrido
                     AND c.estado_hito = NEW.nombre_estado AND c.municipio_hito = NEW.nombre_municipio
                     AND c.parroquia_hito = NEW.nombre_parroquia AND c.nombre_hito = NEW.nombre_hito) THEN
        RAISE EXCEPTION 'RR-114: el hito % no es parte de la ruta del recorrido %.',
            NEW.nombre_hito, NEW.id_recorrido
            USING ERRCODE = 'check_violation';
    END IF;
    SELECT * INTO v_recorrido FROM recorrido WHERE id_recorrido = NEW.id_recorrido;
    IF NEW.fecha_hora_paso < v_recorrido.fecha_hora_inicio
       OR NEW.fecha_hora_paso > v_recorrido.fecha_hora_fin THEN
        RAISE EXCEPTION 'RR-114: el paso por % debe ocurrir entre el inicio y el fin del recorrido %.',
            NEW.nombre_hito, NEW.id_recorrido
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

CREATE TRIGGER tg_transita_paso_valido
    AFTER INSERT OR UPDATE ON transita
    FOR EACH ROW EXECUTE FUNCTION tf_transita_paso_valido();

-- RR-114, al cambiar el inicio o el fin: los pasos ya registrados quedan dentro.
CREATE FUNCTION tf_recorrido_pasos_en_rango() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM transita
               WHERE id_recorrido = NEW.id_recorrido
                 AND (fecha_hora_paso < NEW.fecha_hora_inicio OR fecha_hora_paso > NEW.fecha_hora_fin)) THEN
        RAISE EXCEPTION 'RR-114: el recorrido % tiene pasos fuera de su inicio y su fin.', NEW.id_recorrido
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

CREATE TRIGGER tg_recorrido_pasos_en_rango
    AFTER UPDATE OF fecha_hora_inicio, fecha_hora_fin ON recorrido
    FOR EACH ROW EXECUTE FUNCTION tf_recorrido_pasos_en_rango();

-- RR-115: un recorrido completado pasó por todos los hitos de su ruta. Se revisa al
-- completarlo, al quitarle un paso o al cambiarle la ruta, no al cambiar la ruta.
CREATE FUNCTION tf_recorrido_completo() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_id recorrido.id_recorrido%TYPE;
BEGIN
    IF TG_TABLE_NAME = 'transita' THEN
        v_id := OLD.id_recorrido;
    ELSE
        v_id := NEW.id_recorrido;
    END IF;
    IF EXISTS (SELECT 1
               FROM recorrido x
               JOIN sobre s ON s.id_recorrido = x.id_recorrido
               JOIN conforma c ON c.estado_ruta = s.nombre_estado
                              AND c.municipio_ruta = s.nombre_municipio
                              AND c.nombre_ruta = s.nombre_ruta
               WHERE x.id_recorrido = v_id
                 AND x.estado_recorrido = 'completado'
                 AND NOT EXISTS (SELECT 1 FROM transita t
                                 WHERE t.id_recorrido = x.id_recorrido
                                   AND t.nombre_estado = c.estado_hito AND t.nombre_municipio = c.municipio_hito
                                   AND t.nombre_parroquia = c.parroquia_hito AND t.nombre_hito = c.nombre_hito)) THEN
        RAISE EXCEPTION 'RR-115: el recorrido % está completado y le falta pasar por algún hito de su ruta.', v_id
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

CREATE CONSTRAINT TRIGGER tg_recorrido_completo
    AFTER INSERT OR UPDATE OF estado_recorrido ON recorrido
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_recorrido_completo();

CREATE CONSTRAINT TRIGGER tg_transita_completo
    AFTER DELETE OR UPDATE ON transita
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_recorrido_completo();

CREATE CONSTRAINT TRIGGER tg_sobre_completo
    AFTER UPDATE ON sobre
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_recorrido_completo();
