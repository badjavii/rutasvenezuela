-- 03_reglas/movilidad-paradas.sql · Responsable: Sebastián Armas
-- Spec: specs/mobility-routes/movilidad-paradas/spec.md
-- Triggers, funciones y procedimientos en PL/pgSQL de esta capacidad.
-- Cada objeto que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- RR-31, RR-32 y RR-33 se verifican al confirmar la transacción (sección 8 de la
-- spec): registrar una parada envía la parada, su ubicación, su tramo y sus
-- horarios juntos. Cada trigger revisa una parada: la insertada o con código nuevo,
-- o la que tenía la fila eliminada o movida. Si esa parada ya no existe, no hay
-- nada que exigir: sus datos se fueron con ella por las claves foráneas.

-- RR-31
CREATE FUNCTION tf_parada_transporte_con_ubicacion() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_codigo parada_transporte.codigo_terminal%TYPE;
BEGIN
    IF TG_TABLE_NAME = 'parada_transporte' THEN
        v_codigo := NEW.codigo_terminal;
    ELSE
        v_codigo := OLD.codigo_terminal;
    END IF;
    IF EXISTS (SELECT 1 FROM parada_transporte WHERE codigo_terminal = v_codigo)
       AND NOT EXISTS (SELECT 1 FROM se_localiza WHERE codigo_terminal = v_codigo) THEN
        RAISE EXCEPTION 'RR-31: la parada % debe tener su ubicación.', v_codigo
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

CREATE CONSTRAINT TRIGGER tg_parada_transporte_con_ubicacion
    AFTER INSERT OR UPDATE OF codigo_terminal ON parada_transporte
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_parada_transporte_con_ubicacion();

CREATE CONSTRAINT TRIGGER tg_se_localiza_con_ubicacion
    AFTER DELETE OR UPDATE OF codigo_terminal ON se_localiza
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_parada_transporte_con_ubicacion();

-- RR-32
CREATE FUNCTION tf_parada_transporte_con_tramo() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_codigo parada_transporte.codigo_terminal%TYPE;
BEGIN
    IF TG_TABLE_NAME = 'parada_transporte' THEN
        v_codigo := NEW.codigo_terminal;
    ELSE
        v_codigo := OLD.codigo_terminal;
    END IF;
    IF EXISTS (SELECT 1 FROM parada_transporte WHERE codigo_terminal = v_codigo)
       AND NOT EXISTS (SELECT 1 FROM esta_en WHERE codigo_terminal = v_codigo) THEN
        RAISE EXCEPTION 'RR-32: la parada % debe estar en un tramo.', v_codigo
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

CREATE CONSTRAINT TRIGGER tg_parada_transporte_con_tramo
    AFTER INSERT OR UPDATE OF codigo_terminal ON parada_transporte
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_parada_transporte_con_tramo();

CREATE CONSTRAINT TRIGGER tg_esta_en_con_tramo
    AFTER DELETE OR UPDATE OF codigo_terminal ON esta_en
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_parada_transporte_con_tramo();

-- RR-33
CREATE FUNCTION tf_parada_transporte_con_horario() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_codigo parada_transporte.codigo_terminal%TYPE;
BEGIN
    IF TG_TABLE_NAME = 'parada_transporte' THEN
        v_codigo := NEW.codigo_terminal;
    ELSE
        v_codigo := OLD.codigo_terminal;
    END IF;
    IF EXISTS (SELECT 1 FROM parada_transporte WHERE codigo_terminal = v_codigo)
       AND NOT EXISTS (SELECT 1 FROM funciona WHERE codigo_terminal = v_codigo) THEN
        RAISE EXCEPTION 'RR-33: la parada % debe tener al menos un horario.', v_codigo
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

CREATE CONSTRAINT TRIGGER tg_parada_transporte_con_horario
    AFTER INSERT OR UPDATE OF codigo_terminal ON parada_transporte
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_parada_transporte_con_horario();

CREATE CONSTRAINT TRIGGER tg_funciona_con_horario
    AFTER DELETE OR UPDATE OF codigo_terminal ON funciona
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_parada_transporte_con_horario();

-- RR-101: se verifica al escribir el horario. La RR permite que uno empiece justo
-- cuando el otro cierra (≤), así que dos horarios se cruzan si cada uno abre antes
-- de que el otro cierre. La fila escrita ya está en la tabla y se excluye por su clave.
CREATE FUNCTION tf_funciona_sin_cruce() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM funciona f
               WHERE f.codigo_terminal = NEW.codigo_terminal
                 AND f.dia_semana = NEW.dia_semana
                 AND (f.hora_apertura, f.hora_cierre) <> (NEW.hora_apertura, NEW.hora_cierre)
                 AND f.hora_apertura < NEW.hora_cierre
                 AND NEW.hora_apertura < f.hora_cierre) THEN
        RAISE EXCEPTION 'RR-101: el horario de % a % del % se cruza con otro de la parada %.',
            NEW.hora_apertura, NEW.hora_cierre, NEW.dia_semana, NEW.codigo_terminal
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

CREATE TRIGGER tg_funciona_sin_cruce
    AFTER INSERT OR UPDATE OF dia_semana, hora_apertura, hora_cierre ON funciona
    FOR EACH ROW EXECUTE FUNCTION tf_funciona_sin_cruce();

-- HU-16.1, criterio 6, y HU-16.3, criterio 3: la parada se registra, o se cambia
-- de tramo, en una vía habilitada. Si la vía se cierra después, la parada se
-- conserva (sección 8 de la spec). Cuando el UPDATE viene de renombrar la vía o el
-- tramo (ON UPDATE CASCADE), el tramo anterior ya no existe: la parada no se movió
-- y no se revisa, para que una vía cerrada se pueda renombrar.
CREATE FUNCTION tf_esta_en_via_habilitada() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
BEGIN
    IF TG_OP = 'UPDATE' AND NOT EXISTS (
        SELECT 1 FROM tramo
        WHERE nombre_estado = OLD.nombre_estado AND nombre_municipio = OLD.nombre_municipio
          AND nombre_via = OLD.nombre_via AND numero_tramo = OLD.numero_tramo) THEN
        RETURN NULL;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM via
                   WHERE nombre_estado = NEW.nombre_estado AND nombre_municipio = NEW.nombre_municipio
                     AND nombre_via = NEW.nombre_via AND estado_via = 'habilitada') THEN
        RAISE EXCEPTION 'La parada % debe estar en una vía habilitada, y la vía % no lo está.',
            NEW.codigo_terminal, NEW.nombre_via
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

CREATE TRIGGER tg_esta_en_via_habilitada
    AFTER INSERT OR UPDATE OF nombre_estado, nombre_municipio, nombre_via, numero_tramo ON esta_en
    FOR EACH ROW EXECUTE FUNCTION tf_esta_en_via_habilitada();
