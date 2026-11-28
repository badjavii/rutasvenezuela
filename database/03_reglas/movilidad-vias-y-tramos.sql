-- 03_reglas/movilidad-vias-y-tramos.sql · Responsable: Sebastián Armas
-- Spec: specs/mobility-routes/movilidad-vias-y-tramos/spec.md
-- Triggers, funciones y procedimientos en PL/pgSQL de esta capacidad.
-- Cada objeto que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- RR-29 y RR-30 se verifican al confirmar la transacción (sección 8 de la spec):
-- registrar una vía envía la vía, sus modos y sus tramos juntos, y la vía se
-- inserta antes que ellos. Por eso son triggers de restricción diferidos.
--
-- Cada trigger revisa una sola vía: la de la fila insertada o actualizada en `via`,
-- o la que tenía la fila eliminada o movida en `tramo` o `via_modo`. Si esa vía
-- ya no existe (se eliminó o se renombró), no hay nada que exigir: sus tramos y
-- modos se fueron con ella por las claves foráneas.

-- RR-29
CREATE FUNCTION tf_via_con_tramo() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_estado via.nombre_estado%TYPE;
    v_municipio via.nombre_municipio%TYPE;
    v_via via.nombre_via%TYPE;
BEGIN
    IF TG_TABLE_NAME = 'via' THEN
        v_estado := NEW.nombre_estado;
        v_municipio := NEW.nombre_municipio;
        v_via := NEW.nombre_via;
    ELSE
        v_estado := OLD.nombre_estado;
        v_municipio := OLD.nombre_municipio;
        v_via := OLD.nombre_via;
    END IF;

    IF EXISTS (SELECT 1 FROM via
               WHERE nombre_estado = v_estado AND nombre_municipio = v_municipio
                 AND nombre_via = v_via)
       AND NOT EXISTS (SELECT 1 FROM tramo
                       WHERE nombre_estado = v_estado AND nombre_municipio = v_municipio
                         AND nombre_via = v_via) THEN
        RAISE EXCEPTION 'RR-29: la vía % (%, %) debe tener al menos un tramo.',
            v_via, v_municipio, v_estado
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

-- RR-29: una vía nueva, o renombrada, sin tramos.
CREATE CONSTRAINT TRIGGER tg_via_con_tramo
    AFTER INSERT OR UPDATE OF nombre_estado, nombre_municipio, nombre_via ON via
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_via_con_tramo();

-- RR-29: el último tramo de una vía, eliminado o pasado a otra vía.
CREATE CONSTRAINT TRIGGER tg_tramo_via_con_tramo
    AFTER DELETE OR UPDATE OF nombre_estado, nombre_municipio, nombre_via ON tramo
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_via_con_tramo();

-- RR-30
CREATE FUNCTION tf_via_con_modo() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_estado via.nombre_estado%TYPE;
    v_municipio via.nombre_municipio%TYPE;
    v_via via.nombre_via%TYPE;
BEGIN
    IF TG_TABLE_NAME = 'via' THEN
        v_estado := NEW.nombre_estado;
        v_municipio := NEW.nombre_municipio;
        v_via := NEW.nombre_via;
    ELSE
        v_estado := OLD.nombre_estado;
        v_municipio := OLD.nombre_municipio;
        v_via := OLD.nombre_via;
    END IF;

    IF EXISTS (SELECT 1 FROM via
               WHERE nombre_estado = v_estado AND nombre_municipio = v_municipio
                 AND nombre_via = v_via)
       AND NOT EXISTS (SELECT 1 FROM via_modo
                       WHERE nombre_estado = v_estado AND nombre_municipio = v_municipio
                         AND nombre_via = v_via) THEN
        RAISE EXCEPTION 'RR-30: la vía % (%, %) debe tener al menos un modo permitido.',
            v_via, v_municipio, v_estado
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

-- RR-30: una vía nueva, o renombrada, sin modos.
CREATE CONSTRAINT TRIGGER tg_via_con_modo
    AFTER INSERT OR UPDATE OF nombre_estado, nombre_municipio, nombre_via ON via
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_via_con_modo();

-- RR-30: el último modo de una vía, quitado o pasado a otra vía.
CREATE CONSTRAINT TRIGGER tg_via_modo_via_con_modo
    AFTER DELETE OR UPDATE OF nombre_estado, nombre_municipio, nombre_via ON via_modo
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_via_con_modo();
