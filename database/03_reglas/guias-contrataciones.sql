-- 03_reglas/guias-contrataciones.sql · Responsable: Sebastián Armas
-- Spec: specs/mobility-routes/guias-contrataciones/spec.md
-- Triggers, funciones y procedimientos en PL/pgSQL de esta capacidad.
-- Cada objeto que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- Sección 8 de la spec: registrar un guía escribe el guía, su cuenta, sus idiomas,
-- sus especialidades y sus zonas en la misma transacción, y contratar escribe la
-- contratación con su visitante, su guía y su ruta: RR-37 a RR-43 se verifican al
-- confirmar. RR-117 se verifica al adscribir (y al quitar la zona de una ruta
-- adscrita, que dejaría la adscripción sin zona). RR-118 se verifica al contratar:
-- quitar después la adscripción (HU-28, criterio 3) no invalida las contrataciones
-- ya hechas. Las cascadas de ON UPDATE CASCADE (renombrar un guía, un municipio o
-- una ruta) cambian las tablas en pasos distintos; como estas reglas se verifican
-- al confirmar, ven el resultado final.

-- RR-37, RR-38, RR-39 y RR-40
CREATE FUNCTION fn_verificar_guia(p_rtn guia.rtn%TYPE, p_codigo_licencia guia.codigo_licencia%TYPE)
RETURNS void
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM guia WHERE rtn = p_rtn AND codigo_licencia = p_codigo_licencia) THEN
        RETURN;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM cuenta_guia WHERE rtn = p_rtn AND codigo_licencia = p_codigo_licencia) THEN
        RAISE EXCEPTION 'RR-37: el guía % % debe tener su cuenta.', p_rtn, p_codigo_licencia
            USING ERRCODE = 'check_violation';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM guia_idioma WHERE rtn = p_rtn AND codigo_licencia = p_codigo_licencia) THEN
        RAISE EXCEPTION 'RR-38: el guía % % debe hablar al menos un idioma.', p_rtn, p_codigo_licencia
            USING ERRCODE = 'check_violation';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM guia_especialidad WHERE rtn = p_rtn AND codigo_licencia = p_codigo_licencia) THEN
        RAISE EXCEPTION 'RR-39: el guía % % debe tener al menos una especialidad.', p_rtn, p_codigo_licencia
            USING ERRCODE = 'check_violation';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM trabaja WHERE rtn = p_rtn AND codigo_licencia = p_codigo_licencia) THEN
        RAISE EXCEPTION 'RR-40: el guía % % debe tener al menos una zona asignada.', p_rtn, p_codigo_licencia
            USING ERRCODE = 'check_violation';
    END IF;
END;
$$;

-- RR-37, RR-38, RR-39 y RR-40: el guía nuevo o renombrado (NEW) y el guía del que se
-- quita una cuenta, idioma, especialidad o zona (OLD).
CREATE FUNCTION tf_guia_completo() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
BEGIN
    IF TG_TABLE_NAME = 'guia' THEN
        PERFORM fn_verificar_guia(NEW.rtn, NEW.codigo_licencia);
    ELSE
        PERFORM fn_verificar_guia(OLD.rtn, OLD.codigo_licencia);
    END IF;
    RETURN NULL;
END;
$$;

CREATE CONSTRAINT TRIGGER tg_guia_completo
    AFTER INSERT OR UPDATE OF rtn, codigo_licencia ON guia
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_guia_completo();

CREATE CONSTRAINT TRIGGER tg_cuenta_guia_completo
    AFTER DELETE OR UPDATE OF rtn, codigo_licencia ON cuenta_guia
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_guia_completo();

CREATE CONSTRAINT TRIGGER tg_guia_idioma_completo
    AFTER DELETE OR UPDATE OF rtn, codigo_licencia ON guia_idioma
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_guia_completo();

CREATE CONSTRAINT TRIGGER tg_guia_especialidad_completo
    AFTER DELETE OR UPDATE OF rtn, codigo_licencia ON guia_especialidad
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_guia_completo();

CREATE CONSTRAINT TRIGGER tg_trabaja_completo
    AFTER DELETE OR UPDATE OF rtn, codigo_licencia ON trabaja
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_guia_completo();

-- RR-41, RR-42 y RR-43
CREATE FUNCTION fn_verificar_contratacion(p_nro contratacion.nro_contratacion%TYPE)
RETURNS void
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM contratacion WHERE nro_contratacion = p_nro) THEN
        RETURN;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM contrata_visitante WHERE nro_contratacion = p_nro) THEN
        RAISE EXCEPTION 'RR-41: la contratación % debe tener el visitante que la hace.', p_nro
            USING ERRCODE = 'check_violation';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM contrata_guia WHERE nro_contratacion = p_nro) THEN
        RAISE EXCEPTION 'RR-42: la contratación % debe ser de un guía.', p_nro
            USING ERRCODE = 'check_violation';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM contrata_ruta WHERE nro_contratacion = p_nro) THEN
        RAISE EXCEPTION 'RR-43: la contratación % debe ser para una ruta fija.', p_nro
            USING ERRCODE = 'check_violation';
    END IF;
END;
$$;

-- RR-41, RR-42 y RR-43: la contratación nueva (NEW) y la contratación de la que se
-- quita el visitante, el guía o la ruta (OLD).
CREATE FUNCTION tf_contratacion_completa() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
BEGIN
    IF TG_TABLE_NAME = 'contratacion' THEN
        PERFORM fn_verificar_contratacion(NEW.nro_contratacion);
    ELSE
        PERFORM fn_verificar_contratacion(OLD.nro_contratacion);
    END IF;
    RETURN NULL;
END;
$$;

CREATE CONSTRAINT TRIGGER tg_contratacion_completa
    AFTER INSERT ON contratacion
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_contratacion_completa();

CREATE CONSTRAINT TRIGGER tg_contrata_visitante_completa
    AFTER DELETE OR UPDATE OF nro_contratacion ON contrata_visitante
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_contratacion_completa();

CREATE CONSTRAINT TRIGGER tg_contrata_guia_completa
    AFTER DELETE OR UPDATE OF nro_contratacion ON contrata_guia
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_contratacion_completa();

CREATE CONSTRAINT TRIGGER tg_contrata_ruta_completa
    AFTER DELETE OR UPDATE OF nro_contratacion ON contrata_ruta
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_contratacion_completa();

-- RR-117: la adscripción nueva o cambiada (NEW en sirve) y la zona que se quita o
-- cambia (OLD en trabaja). Se rechaza si queda una adscripción del guía en ese
-- municipio sin su zona.
CREATE FUNCTION tf_sirve_en_zona() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
DECLARE
    v_rtn guia.rtn%TYPE;
    v_codigo_licencia guia.codigo_licencia%TYPE;
    v_estado trabaja.nombre_estado%TYPE;
    v_municipio trabaja.nombre_municipio%TYPE;
BEGIN
    IF TG_TABLE_NAME = 'sirve' THEN
        v_rtn := NEW.rtn;
        v_codigo_licencia := NEW.codigo_licencia;
        v_estado := NEW.nombre_estado;
        v_municipio := NEW.nombre_municipio;
    ELSE
        v_rtn := OLD.rtn;
        v_codigo_licencia := OLD.codigo_licencia;
        v_estado := OLD.nombre_estado;
        v_municipio := OLD.nombre_municipio;
    END IF;
    IF EXISTS (
           SELECT 1 FROM sirve
            WHERE rtn = v_rtn AND codigo_licencia = v_codigo_licencia
              AND nombre_estado = v_estado AND nombre_municipio = v_municipio
       )
       AND NOT EXISTS (
           SELECT 1 FROM trabaja
            WHERE rtn = v_rtn AND codigo_licencia = v_codigo_licencia
              AND nombre_estado = v_estado AND nombre_municipio = v_municipio
       ) THEN
        RAISE EXCEPTION 'RR-117: el guía % % está adscrito a una ruta de %, %, que no es una de sus zonas.',
            v_rtn, v_codigo_licencia, v_municipio, v_estado
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

CREATE CONSTRAINT TRIGGER tg_sirve_en_zona
    AFTER INSERT OR UPDATE ON sirve
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_sirve_en_zona();

CREATE CONSTRAINT TRIGGER tg_trabaja_en_zona
    AFTER DELETE OR UPDATE ON trabaja
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_sirve_en_zona();

-- RR-118: al contratar, el guía está adscrito a la ruta fija contratada. Solo se
-- revisa al escribir el guía o la ruta de la contratación (INSERT); los UPDATE
-- llegan por ON UPDATE CASCADE al renombrar.
CREATE FUNCTION tf_contratacion_guia_adscrito() RETURNS trigger
LANGUAGE plpgsql
SET search_path = rutasvzla, pg_temp
AS $$
BEGIN
    IF EXISTS (
           SELECT 1
             FROM contrata_guia g
             JOIN contrata_ruta r ON r.nro_contratacion = g.nro_contratacion
            WHERE g.nro_contratacion = NEW.nro_contratacion
              AND NOT EXISTS (
                  SELECT 1 FROM sirve s
                   WHERE s.rtn = g.rtn AND s.codigo_licencia = g.codigo_licencia
                     AND s.nombre_estado = r.nombre_estado
                     AND s.nombre_municipio = r.nombre_municipio
                     AND s.nombre_ruta = r.nombre_ruta
              )
       ) THEN
        RAISE EXCEPTION 'RR-118: en la contratación %, el guía no está adscrito a la ruta fija contratada.',
            NEW.nro_contratacion
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NULL;
END;
$$;

CREATE CONSTRAINT TRIGGER tg_contrata_guia_adscrito
    AFTER INSERT ON contrata_guia
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_contratacion_guia_adscrito();

CREATE CONSTRAINT TRIGGER tg_contrata_ruta_adscrito
    AFTER INSERT ON contrata_ruta
    DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE FUNCTION tf_contratacion_guia_adscrito();
