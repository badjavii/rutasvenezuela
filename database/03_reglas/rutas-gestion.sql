-- 03_reglas/rutas-gestion.sql · Responsable: Sebastián Armas
-- Spec: specs/mobility-routes/rutas-gestion/spec.md
-- Triggers, funciones y procedimientos en PL/pgSQL de esta capacidad.
-- Cada objeto que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- Registrar o modificar una ruta envía la ruta, su tipo, su creador y su secuencia
-- completa juntos (sección 8 de la spec). Por eso RR-34, RR-35, RR-36, RR-108,
-- RR-109 y RR-110 se verifican al confirmar, con triggers de restricción diferidos.
--
-- Cada regla se revisa por ruta con una función fn_verificar_*. Los triggers la
-- llaman con la ruta de la fila antes del cambio (OLD) y después (NEW): una fila
-- puede salir de una ruta y entrar en otra. Si la ruta ya no existe, no hay nada
-- que exigir. Como conforma nombra las columnas de la ruta distinto que usa, cada
-- trigger pasa sus nombres en TG_ARGV y la fila se lee como jsonb.

-- RR-35
CREATE FUNCTION fn_verificar_tipo_ruta(
    p_estado ruta_turistica.nombre_estado%TYPE,
    p_municipio ruta_turistica.nombre_municipio%TYPE,
    p_ruta ruta_turistica.nombre_ruta%TYPE
) RETURNS void
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_es_fija boolean;
    v_es_dinamica boolean;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM ruta_turistica
                   WHERE nombre_estado = p_estado AND nombre_municipio = p_municipio
                     AND nombre_ruta = p_ruta) THEN
        RETURN;
    END IF;
    v_es_fija := EXISTS (SELECT 1 FROM ruta_fija
                         WHERE nombre_estado = p_estado AND nombre_municipio = p_municipio
                           AND nombre_ruta = p_ruta);
    v_es_dinamica := EXISTS (SELECT 1 FROM ruta_dinamica
                             WHERE nombre_estado = p_estado AND nombre_municipio = p_municipio
                               AND nombre_ruta = p_ruta);
    IF v_es_fija = v_es_dinamica THEN
        RAISE EXCEPTION 'RR-35: la ruta % (%, %) debe ser fija o dinámica, exactamente una de las dos.',
            p_ruta, p_municipio, p_estado
            USING ERRCODE = 'check_violation';
    END IF;
END;
$$;

-- RR-36
CREATE FUNCTION fn_verificar_creador_ruta(
    p_estado ruta_turistica.nombre_estado%TYPE,
    p_municipio ruta_turistica.nombre_municipio%TYPE,
    p_ruta ruta_turistica.nombre_ruta%TYPE
) RETURNS void
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM ruta_dinamica
               WHERE nombre_estado = p_estado AND nombre_municipio = p_municipio
                 AND nombre_ruta = p_ruta)
       AND NOT EXISTS (SELECT 1 FROM crea
                       WHERE nombre_estado = p_estado AND nombre_municipio = p_municipio
                         AND nombre_ruta = p_ruta) THEN
        RAISE EXCEPTION 'RR-36: la ruta dinámica % (%, %) debe tener el visitante que la creó.',
            p_ruta, p_municipio, p_estado
            USING ERRCODE = 'check_violation';
    END IF;
END;
$$;

-- RR-34, RR-108, RR-109 y RR-110: la secuencia de hitos y paradas de una ruta.
CREATE FUNCTION fn_verificar_secuencia_ruta(
    p_estado ruta_turistica.nombre_estado%TYPE,
    p_municipio ruta_turistica.nombre_municipio%TYPE,
    p_ruta ruta_turistica.nombre_ruta%TYPE
) RETURNS void
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_elementos integer;
    v_ultimo integer;
    v_primer_hito integer;
    v_ultimo_hito integer;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM ruta_turistica
                   WHERE nombre_estado = p_estado AND nombre_municipio = p_municipio
                     AND nombre_ruta = p_ruta) THEN
        RETURN;
    END IF;

    SELECT count(*), min(orden), max(orden) INTO v_elementos, v_primer_hito, v_ultimo_hito
    FROM conforma
    WHERE estado_ruta = p_estado AND municipio_ruta = p_municipio AND nombre_ruta = p_ruta;

    -- RR-34
    IF v_elementos < 2 THEN
        RAISE EXCEPTION 'RR-34: la ruta % (%, %) debe tener al menos dos hitos: el de origen y el de destino.',
            p_ruta, p_municipio, p_estado
            USING ERRCODE = 'check_violation';
    END IF;

    -- RR-108: ningún número de orden se repite entre hitos y paradas. Dentro de cada
    -- tabla lo garantizan además uq_conforma_orden y uq_usa_orden.
    IF EXISTS (SELECT orden
               FROM (SELECT orden FROM conforma
                     WHERE estado_ruta = p_estado AND municipio_ruta = p_municipio AND nombre_ruta = p_ruta
                     UNION ALL
                     SELECT orden FROM usa
                     WHERE nombre_estado = p_estado AND nombre_municipio = p_municipio AND nombre_ruta = p_ruta) s
               GROUP BY orden
               HAVING count(*) > 1) THEN
        RAISE EXCEPTION 'RR-108: en la ruta % (%, %) dos elementos tienen el mismo número de orden.',
            p_ruta, p_municipio, p_estado
            USING ERRCODE = 'check_violation';
    END IF;

    -- RR-109: empieza en 1 con un hito y no deja huecos. Como los órdenes son
    -- distintos y positivos (RR-108), no hay huecos si el mayor es igual a la cantidad.
    IF v_primer_hito <> 1 THEN
        RAISE EXCEPTION 'RR-109: la secuencia de la ruta % (%, %) debe empezar en 1 con un hito.',
            p_ruta, p_municipio, p_estado
            USING ERRCODE = 'check_violation';
    END IF;
    SELECT v_elementos + count(*), greatest(v_ultimo_hito, max(orden)) INTO v_elementos, v_ultimo
    FROM usa
    WHERE nombre_estado = p_estado AND nombre_municipio = p_municipio AND nombre_ruta = p_ruta;
    IF v_ultimo <> v_elementos THEN
        RAISE EXCEPTION 'RR-109: la secuencia de la ruta % (%, %) no puede dejar huecos.',
            p_ruta, p_municipio, p_estado
            USING ERRCODE = 'check_violation';
    END IF;

    -- RR-110: toda parada tiene un hito antes y otro después.
    IF EXISTS (SELECT 1 FROM usa
               WHERE nombre_estado = p_estado AND nombre_municipio = p_municipio AND nombre_ruta = p_ruta
                 AND (orden < v_primer_hito OR orden > v_ultimo_hito)) THEN
        RAISE EXCEPTION 'RR-110: en la ruta % (%, %) cada parada debe tener un hito antes y otro después.',
            p_ruta, p_municipio, p_estado
            USING ERRCODE = 'check_violation';
    END IF;
END;
$$;

-- Funciones de trigger: leen la ruta de OLD y de NEW con los nombres de columna de
-- TG_ARGV y llaman a la verificación.
CREATE FUNCTION tf_ruta_turistica_tipo() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_fila jsonb;
BEGIN
    IF TG_OP <> 'INSERT' THEN
        v_fila := to_jsonb(OLD);
        PERFORM fn_verificar_tipo_ruta(v_fila ->> TG_ARGV[0], v_fila ->> TG_ARGV[1], v_fila ->> TG_ARGV[2]);
    END IF;
    IF TG_OP <> 'DELETE' THEN
        v_fila := to_jsonb(NEW);
        PERFORM fn_verificar_tipo_ruta(v_fila ->> TG_ARGV[0], v_fila ->> TG_ARGV[1], v_fila ->> TG_ARGV[2]);
    END IF;
    RETURN NULL;
END;
$$;

CREATE FUNCTION tf_ruta_dinamica_creador() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_fila jsonb;
BEGIN
    IF TG_OP <> 'INSERT' THEN
        v_fila := to_jsonb(OLD);
        PERFORM fn_verificar_creador_ruta(v_fila ->> TG_ARGV[0], v_fila ->> TG_ARGV[1], v_fila ->> TG_ARGV[2]);
    END IF;
    IF TG_OP <> 'DELETE' THEN
        v_fila := to_jsonb(NEW);
        PERFORM fn_verificar_creador_ruta(v_fila ->> TG_ARGV[0], v_fila ->> TG_ARGV[1], v_fila ->> TG_ARGV[2]);
    END IF;
    RETURN NULL;
END;
$$;

CREATE FUNCTION tf_ruta_turistica_secuencia() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_fila jsonb;
BEGIN
    IF TG_OP <> 'INSERT' THEN
        v_fila := to_jsonb(OLD);
        PERFORM fn_verificar_secuencia_ruta(v_fila ->> TG_ARGV[0], v_fila ->> TG_ARGV[1], v_fila ->> TG_ARGV[2]);
    END IF;
    IF TG_OP <> 'DELETE' THEN
        v_fila := to_jsonb(NEW);
        PERFORM fn_verificar_secuencia_ruta(v_fila ->> TG_ARGV[0], v_fila ->> TG_ARGV[1], v_fila ->> TG_ARGV[2]);
    END IF;
    RETURN NULL;
END;
$$;

-- RR-35: una ruta nueva o renombrada, y la fila de su subclase que entra, sale o se mueve.
CREATE CONSTRAINT TRIGGER tg_ruta_turistica_tipo
    AFTER INSERT OR UPDATE OF nombre_estado, nombre_municipio, nombre_ruta ON ruta_turistica
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_ruta_turistica_tipo('nombre_estado', 'nombre_municipio', 'nombre_ruta');

CREATE CONSTRAINT TRIGGER tg_ruta_fija_tipo
    AFTER INSERT OR UPDATE OR DELETE ON ruta_fija
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_ruta_turistica_tipo('nombre_estado', 'nombre_municipio', 'nombre_ruta');

CREATE CONSTRAINT TRIGGER tg_ruta_dinamica_tipo
    AFTER INSERT OR UPDATE OR DELETE ON ruta_dinamica
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_ruta_turistica_tipo('nombre_estado', 'nombre_municipio', 'nombre_ruta');

-- RR-36: una ruta dinámica nueva o renombrada, y su creador que sale o se mueve.
CREATE CONSTRAINT TRIGGER tg_ruta_dinamica_creador
    AFTER INSERT OR UPDATE OF nombre_estado, nombre_municipio, nombre_ruta ON ruta_dinamica
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_ruta_dinamica_creador('nombre_estado', 'nombre_municipio', 'nombre_ruta');

CREATE CONSTRAINT TRIGGER tg_crea_creador
    AFTER DELETE OR UPDATE OF nombre_estado, nombre_municipio, nombre_ruta ON crea
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_ruta_dinamica_creador('nombre_estado', 'nombre_municipio', 'nombre_ruta');

-- RR-34, RR-108, RR-109 y RR-110: una ruta nueva o renombrada, y cualquier cambio
-- en sus hitos o paradas.
CREATE CONSTRAINT TRIGGER tg_ruta_turistica_secuencia
    AFTER INSERT OR UPDATE OF nombre_estado, nombre_municipio, nombre_ruta ON ruta_turistica
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_ruta_turistica_secuencia('nombre_estado', 'nombre_municipio', 'nombre_ruta');

CREATE CONSTRAINT TRIGGER tg_conforma_secuencia
    AFTER INSERT OR UPDATE OR DELETE ON conforma
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_ruta_turistica_secuencia('estado_ruta', 'municipio_ruta', 'nombre_ruta');

CREATE CONSTRAINT TRIGGER tg_usa_secuencia
    AFTER INSERT OR UPDATE OR DELETE ON usa
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_ruta_turistica_secuencia('nombre_estado', 'nombre_municipio', 'nombre_ruta');

-- RR-107: se verifica al escribir la ruta fija o al cambiar los datos de su ruta.
CREATE FUNCTION tf_ruta_fija_datos() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
BEGIN
    IF EXISTS (SELECT 1
               FROM ruta_turistica r
               JOIN ruta_fija f ON f.nombre_estado = r.nombre_estado
                               AND f.nombre_municipio = r.nombre_municipio
                               AND f.nombre_ruta = r.nombre_ruta
               WHERE r.nombre_estado = NEW.nombre_estado AND r.nombre_municipio = NEW.nombre_municipio
                 AND r.nombre_ruta = NEW.nombre_ruta
                 AND (r.duracion_estimada IS NULL OR r.mejor_horario_inicio IS NULL
                      OR r.nivel_dificultad IS NULL)) THEN
        RAISE EXCEPTION 'RR-107: la ruta fija % (%, %) debe tener duración estimada, mejor horario de inicio y nivel de dificultad.',
            NEW.nombre_ruta, NEW.nombre_municipio, NEW.nombre_estado
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

CREATE TRIGGER tg_ruta_fija_datos
    AFTER INSERT OR UPDATE ON ruta_fija
    FOR EACH ROW EXECUTE FUNCTION tf_ruta_fija_datos();

CREATE TRIGGER tg_ruta_turistica_datos
    AFTER UPDATE OF duracion_estimada, mejor_horario_inicio, nivel_dificultad ON ruta_turistica
    FOR EACH ROW EXECUTE FUNCTION tf_ruta_fija_datos();
