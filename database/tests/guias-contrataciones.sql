-- Pruebas de guias-contrataciones.
-- Primera transacción: tablas, claves, CHECK de RR-116, NOT NULL y UNIQUE de RR-23,
-- NOT NULL de RR-24, RR-25 y RR-26, y acciones referenciales (sección 8 de la spec).
-- Segunda transacción: RR-37 a RR-43, RR-117 y RR-118.
-- Las claves foráneas hacia cuenta y visitante (actores-identidades, Valeria), y
-- desde dirige (Valeria), se prueban cuando existan esas tablas.

BEGIN;
SET LOCAL ROLE rv_owner;
SET LOCAL search_path TO rutasvzla, pg_catalog;

DO $$
DECLARE
    v_nro integer;
BEGIN
    INSERT INTO estado VALUES ('Test GC');
    INSERT INTO municipio VALUES ('Test GC', 'Municipio A'), ('Test GC', 'Municipio B');
    INSERT INTO ruta_turistica VALUES ('Test GC', 'Municipio A', 'Fija', 60, '08:00', 'baja'),
                                      ('Test GC', 'Municipio A', 'Dinámica', NULL, NULL, NULL),
                                      ('Test GC', 'Municipio A', 'Sin contratos', 60, '08:00', 'baja');
    INSERT INTO ruta_fija VALUES ('Test GC', 'Municipio A', 'Fija'), ('Test GC', 'Municipio A', 'Sin contratos');
    INSERT INTO ruta_dinamica VALUES ('Test GC', 'Municipio A', 'Dinámica', 'pública', 'a pie');

    -- HU-29.1, criterios 1 y 2: el guía, identificado por RTN y código de licencia.
    INSERT INTO guia (rtn, codigo_licencia, acreditacion, anios_trayectoria, tarifa_horaria)
        VALUES ('RTN-1', 'LIC-1', 'Acreditación oficial', 5, 20.00);
    BEGIN
        INSERT INTO guia VALUES ('RTN-1', 'LIC-1', 'Otra', 1, 10);
        RAISE EXCEPTION 'Se aceptó un guía con RTN y licencia repetidos';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    -- El mismo RTN con otra licencia es otro guía.
    INSERT INTO guia VALUES ('RTN-1', 'LIC-2', 'Acreditación oficial', 0, 15);
    BEGIN
        INSERT INTO guia VALUES ('RTN-2', 'LIC-1', NULL, 1, 10);
        RAISE EXCEPTION 'Se aceptó un guía sin acreditación';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;

    -- RR-116: años de trayectoria no negativos y tarifa horaria positiva.
    BEGIN
        INSERT INTO guia VALUES ('RTN-2', 'LIC-1', 'Acreditación', -1, 10);
        RAISE EXCEPTION 'Se aceptaron años de trayectoria negativos (RR-116)';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO guia VALUES ('RTN-2', 'LIC-1', 'Acreditación', 1, 0);
        RAISE EXCEPTION 'Se aceptó una tarifa horaria no positiva (RR-116)';
    EXCEPTION WHEN check_violation THEN NULL;
    END;

    -- HU-29.1, criterio 3, y RR-23: la cuenta del guía no falta y es de un solo guía.
    INSERT INTO cuenta_guia VALUES ('RTN-1', 'LIC-1', 1001);
    BEGIN
        INSERT INTO cuenta_guia VALUES ('RTN-1', 'LIC-2', 1001);
        RAISE EXCEPTION 'Se aceptó la misma cuenta para dos guías (RR-23)';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO cuenta_guia VALUES ('RTN-1', 'LIC-2', NULL);
        RAISE EXCEPTION 'Se aceptó un guía sin cuenta (RR-23)';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO cuenta_guia VALUES ('RTN-1', 'LIC-1', 1002);
        RAISE EXCEPTION 'Se aceptó una segunda cuenta para el mismo guía';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;

    -- HU-29.1, criterio 2: idiomas, especialidades y zonas, sin repetir.
    INSERT INTO guia_idioma VALUES ('RTN-1', 'LIC-1', 'español'), ('RTN-1', 'LIC-1', 'inglés');
    INSERT INTO guia_especialidad VALUES ('RTN-1', 'LIC-1', 'historia');
    INSERT INTO trabaja VALUES ('RTN-1', 'LIC-1', 'Test GC', 'Municipio A');
    BEGIN
        INSERT INTO guia_idioma VALUES ('RTN-1', 'LIC-1', 'inglés');
        RAISE EXCEPTION 'Se aceptó un idioma repetido';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO guia_especialidad VALUES ('RTN-1', 'LIC-1', 'historia');
        RAISE EXCEPTION 'Se aceptó una especialidad repetida';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO guia_idioma VALUES ('RTN-9', 'LIC-9', 'español');
        RAISE EXCEPTION 'Se aceptó el idioma de un guía inexistente';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO trabaja VALUES ('RTN-1', 'LIC-1', 'Test GC', 'Inexistente');
        RAISE EXCEPTION 'Se aceptó una zona en un municipio inexistente';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    -- HU-28, criterios 1 y 2: guías registrados adscritos a rutas fijas.
    INSERT INTO sirve VALUES ('RTN-1', 'LIC-1', 'Test GC', 'Municipio A', 'Fija'),
                             ('RTN-1', 'LIC-1', 'Test GC', 'Municipio A', 'Sin contratos');
    BEGIN
        INSERT INTO sirve VALUES ('RTN-1', 'LIC-1', 'Test GC', 'Municipio A', 'Dinámica');
        RAISE EXCEPTION 'Se adscribió un guía a una ruta que no es fija';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO sirve VALUES ('RTN-9', 'LIC-9', 'Test GC', 'Municipio A', 'Fija');
        RAISE EXCEPTION 'Se adscribió un guía no registrado';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    -- VA-3, criterio 3: la contratación, con número del gestor, fecha, visitante, guía y ruta.
    INSERT INTO contratacion (fecha_contratacion) VALUES ('2026-12-05') RETURNING nro_contratacion INTO v_nro;
    INSERT INTO contrata_visitante VALUES (v_nro, 'V-1');
    INSERT INTO contrata_guia VALUES (v_nro, 'RTN-1', 'LIC-1');
    INSERT INTO contrata_ruta VALUES (v_nro, 'Test GC', 'Municipio A', 'Fija');
    BEGIN
        INSERT INTO contratacion (nro_contratacion, fecha_contratacion) VALUES (999999, '2026-12-05');
        RAISE EXCEPTION 'Se aceptó un número de contratación escrito a mano';
    EXCEPTION WHEN generated_always THEN NULL;
    END;
    BEGIN
        INSERT INTO contratacion (fecha_contratacion) VALUES (NULL);
        RAISE EXCEPTION 'Se aceptó una contratación sin fecha';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;
    -- RR-24, RR-25 y RR-26: visitante, guía y ruta no faltan, y son uno por contratación.
    BEGIN
        INSERT INTO contrata_visitante VALUES (v_nro, NULL);
        RAISE EXCEPTION 'Se aceptó una contratación sin visitante (RR-24)';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO contrata_guia VALUES (v_nro, 'RTN-1', NULL);
        RAISE EXCEPTION 'Se aceptó una contratación sin guía (RR-25)';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO contrata_ruta VALUES (v_nro, 'Test GC', 'Municipio A', NULL);
        RAISE EXCEPTION 'Se aceptó una contratación sin ruta (RR-26)';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO contrata_guia VALUES (v_nro, 'RTN-1', 'LIC-2');
        RAISE EXCEPTION 'Se aceptó un segundo guía en la misma contratación';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO contratacion (fecha_contratacion) VALUES ('2026-12-05') RETURNING nro_contratacion INTO v_nro;
        INSERT INTO contrata_ruta VALUES (v_nro, 'Test GC', 'Municipio A', 'Dinámica');
        RAISE EXCEPTION 'Se aceptó contratar una ruta que no es fija';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    -- HU-29.3, criterio 2: cambiar el RTN o la licencia llega a todos sus datos.
    UPDATE guia SET codigo_licencia = 'LIC-1B' WHERE rtn = 'RTN-1' AND codigo_licencia = 'LIC-1';
    IF NOT EXISTS (SELECT 1 FROM cuenta_guia WHERE codigo_licencia = 'LIC-1B')
       OR (SELECT count(*) FROM guia_idioma WHERE codigo_licencia = 'LIC-1B') <> 2
       OR NOT EXISTS (SELECT 1 FROM guia_especialidad WHERE codigo_licencia = 'LIC-1B')
       OR NOT EXISTS (SELECT 1 FROM trabaja WHERE codigo_licencia = 'LIC-1B')
       OR (SELECT count(*) FROM sirve WHERE codigo_licencia = 'LIC-1B') <> 2
       OR NOT EXISTS (SELECT 1 FROM contrata_guia WHERE codigo_licencia = 'LIC-1B') THEN
        RAISE EXCEPTION 'El cambio de licencia no se propagó a los datos del guía';
    END IF;

    -- HU-29.4, criterio 2: un guía adscrito o con contrataciones no se elimina.
    -- PostgreSQL 18 lo reporta como restrict_violation; las versiones anteriores, como foreign_key_violation.
    BEGIN
        DELETE FROM guia WHERE rtn = 'RTN-1' AND codigo_licencia = 'LIC-1B';
        RAISE EXCEPTION 'Se eliminó un guía adscrito y con contrataciones';
    EXCEPTION WHEN foreign_key_violation OR restrict_violation THEN NULL;
    END;
    -- HU-17.4, criterio 2: una ruta fija con contrataciones no se elimina...
    BEGIN
        DELETE FROM ruta_turistica WHERE nombre_estado = 'Test GC' AND nombre_ruta = 'Fija';
        RAISE EXCEPTION 'Se eliminó una ruta fija con contrataciones';
    EXCEPTION WHEN foreign_key_violation OR restrict_violation THEN NULL;
    END;
    -- ...y una sin contrataciones se elimina con sus adscripciones.
    DELETE FROM ruta_turistica WHERE nombre_estado = 'Test GC' AND nombre_ruta = 'Sin contratos';
    IF EXISTS (SELECT 1 FROM sirve WHERE nombre_ruta = 'Sin contratos') THEN
        RAISE EXCEPTION 'Eliminar una ruta fija no eliminó sus adscripciones';
    END IF;
    -- Un municipio con zonas de guías no se elimina.
    BEGIN
        INSERT INTO trabaja VALUES ('RTN-1', 'LIC-2', 'Test GC', 'Municipio B');
        DELETE FROM municipio WHERE nombre_estado = 'Test GC' AND nombre_municipio = 'Municipio B';
        RAISE EXCEPTION 'Se eliminó un municipio con zonas de guías';
    EXCEPTION WHEN foreign_key_violation OR restrict_violation THEN NULL;
    END;

    -- HU-29.4, criterio 2: basta con estar adscrito, aunque no tenga contrataciones.
    BEGIN
        INSERT INTO ruta_turistica VALUES ('Test GC', 'Municipio A', 'Fija 2', 60, '08:00', 'baja');
        INSERT INTO ruta_fija VALUES ('Test GC', 'Municipio A', 'Fija 2');
        INSERT INTO sirve VALUES ('RTN-1', 'LIC-2', 'Test GC', 'Municipio A', 'Fija 2');
        DELETE FROM guia WHERE rtn = 'RTN-1' AND codigo_licencia = 'LIC-2';
        RAISE EXCEPTION 'Se eliminó un guía adscrito a una ruta';
    EXCEPTION WHEN foreign_key_violation OR restrict_violation THEN NULL;
    END;
    -- ...o con tener contrataciones, aunque ya no esté adscrito (HU-28, criterio 3).
    BEGIN
        INSERT INTO contratacion (fecha_contratacion) VALUES ('2026-12-05') RETURNING nro_contratacion INTO v_nro;
        INSERT INTO contrata_guia VALUES (v_nro, 'RTN-1', 'LIC-2');
        DELETE FROM guia WHERE rtn = 'RTN-1' AND codigo_licencia = 'LIC-2';
        RAISE EXCEPTION 'Se eliminó un guía con contrataciones';
    EXCEPTION WHEN foreign_key_violation OR restrict_violation THEN NULL;
    END;

    -- HU-29.4, criterio 1: un guía sin adscripciones ni contrataciones se elimina con sus datos.
    INSERT INTO cuenta_guia VALUES ('RTN-1', 'LIC-2', 1002);
    INSERT INTO guia_idioma VALUES ('RTN-1', 'LIC-2', 'español');
    INSERT INTO guia_especialidad VALUES ('RTN-1', 'LIC-2', 'arte');
    INSERT INTO trabaja VALUES ('RTN-1', 'LIC-2', 'Test GC', 'Municipio A');
    DELETE FROM guia WHERE rtn = 'RTN-1' AND codigo_licencia = 'LIC-2';
    IF EXISTS (SELECT 1 FROM cuenta_guia WHERE codigo_licencia = 'LIC-2')
       OR EXISTS (SELECT 1 FROM guia_idioma WHERE codigo_licencia = 'LIC-2')
       OR EXISTS (SELECT 1 FROM guia_especialidad WHERE codigo_licencia = 'LIC-2')
       OR EXISTS (SELECT 1 FROM trabaja WHERE codigo_licencia = 'LIC-2') THEN
        RAISE EXCEPTION 'Eliminar un guía no eliminó sus datos';
    END IF;
END
$$;

ROLLBACK;
\echo 'OK: guias-contrataciones (estructuras y claves)'

-- RR-37 a RR-43 se verifican al confirmar (sección 8 de la spec): registrar un guía
-- envía su cuenta, idiomas, especialidades y zonas juntos, y contratar envía la
-- contratación con su visitante, su guía y su ruta. RR-117 se verifica al adscribir
-- y RR-118 al contratar.

BEGIN;
SET LOCAL ROLE rv_owner;
SET LOCAL search_path TO rutasvzla, pg_catalog;

DO $$
DECLARE
    v_nro integer;
BEGIN
    INSERT INTO estado VALUES ('Test GR');
    INSERT INTO municipio VALUES ('Test GR', 'Municipio A'), ('Test GR', 'Municipio B');
    INSERT INTO ruta_turistica VALUES ('Test GR', 'Municipio A', 'Fija A', 60, '08:00', 'baja'),
                                      ('Test GR', 'Municipio B', 'Fija B', 60, '08:00', 'baja');
    INSERT INTO ruta_fija VALUES ('Test GR', 'Municipio A', 'Fija A'), ('Test GR', 'Municipio B', 'Fija B');
    INSERT INTO conforma VALUES ('Test GR', 'Municipio A', 'Fija A', 'Test GR', 'Municipio A', 'Parroquia A', 'Hito 1', 1),
                                ('Test GR', 'Municipio A', 'Fija A', 'Test GR', 'Municipio A', 'Parroquia A', 'Hito 2', 2),
                                ('Test GR', 'Municipio B', 'Fija B', 'Test GR', 'Municipio B', 'Parroquia B', 'Hito 3', 1),
                                ('Test GR', 'Municipio B', 'Fija B', 'Test GR', 'Municipio B', 'Parroquia B', 'Hito 4', 2);

    -- HU-29.1: el guía con su cuenta, idiomas, especialidades y zonas, en la misma transacción.
    INSERT INTO guia VALUES ('RTN-1', 'LIC-1', 'Acreditación', 5, 20);
    INSERT INTO cuenta_guia VALUES ('RTN-1', 'LIC-1', 2001);
    INSERT INTO guia_idioma VALUES ('RTN-1', 'LIC-1', 'español'), ('RTN-1', 'LIC-1', 'inglés');
    INSERT INTO guia_especialidad VALUES ('RTN-1', 'LIC-1', 'historia'), ('RTN-1', 'LIC-1', 'arte');
    INSERT INTO trabaja VALUES ('RTN-1', 'LIC-1', 'Test GR', 'Municipio A'),
                               ('RTN-1', 'LIC-1', 'Test GR', 'Municipio B');
    -- HU-28: adscrito a una ruta fija de una de sus zonas.
    INSERT INTO sirve VALUES ('RTN-1', 'LIC-1', 'Test GR', 'Municipio A', 'Fija A');
    -- VA-3: contratado para esa ruta.
    INSERT INTO contratacion (fecha_contratacion) VALUES ('2026-12-05') RETURNING nro_contratacion INTO v_nro;
    INSERT INTO contrata_visitante VALUES (v_nro, 'V-1');
    INSERT INTO contrata_guia VALUES (v_nro, 'RTN-1', 'LIC-1');
    INSERT INTO contrata_ruta VALUES (v_nro, 'Test GR', 'Municipio A', 'Fija A');
    SET CONSTRAINTS ALL IMMEDIATE;
    SET CONSTRAINTS ALL DEFERRED;

    -- RR-37 a RR-40: un guía sin cuenta, idioma, especialidad o zona se rechaza.
    BEGIN
        INSERT INTO guia VALUES ('RTN-2', 'LIC-2', 'Acreditación', 1, 10);
        INSERT INTO guia_idioma VALUES ('RTN-2', 'LIC-2', 'español');
        INSERT INTO guia_especialidad VALUES ('RTN-2', 'LIC-2', 'historia');
        INSERT INTO trabaja VALUES ('RTN-2', 'LIC-2', 'Test GR', 'Municipio A');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó un guía sin cuenta (RR-37)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-37%' THEN RAISE; END IF;
    END;
    BEGIN
        INSERT INTO guia VALUES ('RTN-2', 'LIC-2', 'Acreditación', 1, 10);
        INSERT INTO cuenta_guia VALUES ('RTN-2', 'LIC-2', 2002);
        INSERT INTO guia_especialidad VALUES ('RTN-2', 'LIC-2', 'historia');
        INSERT INTO trabaja VALUES ('RTN-2', 'LIC-2', 'Test GR', 'Municipio A');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó un guía sin idiomas (RR-38)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-38%' THEN RAISE; END IF;
    END;
    BEGIN
        INSERT INTO guia VALUES ('RTN-2', 'LIC-2', 'Acreditación', 1, 10);
        INSERT INTO cuenta_guia VALUES ('RTN-2', 'LIC-2', 2002);
        INSERT INTO guia_idioma VALUES ('RTN-2', 'LIC-2', 'español');
        INSERT INTO trabaja VALUES ('RTN-2', 'LIC-2', 'Test GR', 'Municipio A');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó un guía sin especialidades (RR-39)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-39%' THEN RAISE; END IF;
    END;
    BEGIN
        INSERT INTO guia VALUES ('RTN-2', 'LIC-2', 'Acreditación', 1, 10);
        INSERT INTO cuenta_guia VALUES ('RTN-2', 'LIC-2', 2002);
        INSERT INTO guia_idioma VALUES ('RTN-2', 'LIC-2', 'español');
        INSERT INTO guia_especialidad VALUES ('RTN-2', 'LIC-2', 'historia');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó un guía sin zonas (RR-40)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-40%' THEN RAISE; END IF;
    END;

    -- RR-37 a RR-40: quitar la cuenta, o el último idioma, especialidad o zona, se rechaza.
    BEGIN
        DELETE FROM cuenta_guia WHERE rtn = 'RTN-1';
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se quitó la cuenta de un guía (RR-37)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-37%' THEN RAISE; END IF;
    END;
    BEGIN
        DELETE FROM guia_idioma WHERE rtn = 'RTN-1';
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se quitaron todos los idiomas de un guía (RR-38)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-38%' THEN RAISE; END IF;
    END;
    BEGIN
        DELETE FROM guia_especialidad WHERE rtn = 'RTN-1';
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se quitaron todas las especialidades de un guía (RR-39)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-39%' THEN RAISE; END IF;
    END;
    BEGIN
        DELETE FROM sirve WHERE rtn = 'RTN-1';
        DELETE FROM trabaja WHERE rtn = 'RTN-1';
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se quitaron todas las zonas de un guía (RR-40)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-40%' THEN RAISE; END IF;
    END;
    -- Quitar uno cuando quedan otros se acepta (HU-29.3, criterio 1).
    DELETE FROM guia_idioma WHERE rtn = 'RTN-1' AND idioma = 'inglés';
    DELETE FROM guia_especialidad WHERE rtn = 'RTN-1' AND especialidad = 'arte';
    SET CONSTRAINTS ALL IMMEDIATE;
    SET CONSTRAINTS ALL DEFERRED;

    -- RR-117: un guía solo se adscribe a rutas fijas de sus zonas...
    BEGIN
        INSERT INTO guia VALUES ('RTN-4', 'LIC-4', 'Acreditación', 1, 10);
        INSERT INTO cuenta_guia VALUES ('RTN-4', 'LIC-4', 2004);
        INSERT INTO guia_idioma VALUES ('RTN-4', 'LIC-4', 'español');
        INSERT INTO guia_especialidad VALUES ('RTN-4', 'LIC-4', 'historia');
        INSERT INTO trabaja VALUES ('RTN-4', 'LIC-4', 'Test GR', 'Municipio A');
        INSERT INTO sirve VALUES ('RTN-4', 'LIC-4', 'Test GR', 'Municipio B', 'Fija B');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se adscribió un guía a una ruta fuera de sus zonas (RR-117)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-117%' THEN RAISE; END IF;
    END;
    -- ...y no se le quita la zona de una ruta a la que está adscrito.
    BEGIN
        DELETE FROM trabaja WHERE rtn = 'RTN-1' AND nombre_municipio = 'Municipio A';
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se quitó la zona de una ruta a la que el guía está adscrito (RR-117)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-117%' THEN RAISE; END IF;
    END;

    -- RR-118 (VA-3, criterio 2): solo se contratan guías adscritos a esa ruta fija.
    BEGIN
        INSERT INTO contratacion (fecha_contratacion) VALUES ('2026-12-06') RETURNING nro_contratacion INTO v_nro;
        INSERT INTO contrata_visitante VALUES (v_nro, 'V-1');
        INSERT INTO contrata_guia VALUES (v_nro, 'RTN-1', 'LIC-1');
        INSERT INTO contrata_ruta VALUES (v_nro, 'Test GR', 'Municipio B', 'Fija B');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se contrató un guía no adscrito a la ruta (RR-118)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-118%' THEN RAISE; END IF;
    END;
    -- RR-118 también se revisa si se reemplaza el guía de una contratación.
    BEGIN
        INSERT INTO guia VALUES ('RTN-3', 'LIC-3', 'Acreditación', 1, 10);
        INSERT INTO cuenta_guia VALUES ('RTN-3', 'LIC-3', 2003);
        INSERT INTO guia_idioma VALUES ('RTN-3', 'LIC-3', 'español');
        INSERT INTO guia_especialidad VALUES ('RTN-3', 'LIC-3', 'historia');
        INSERT INTO trabaja VALUES ('RTN-3', 'LIC-3', 'Test GR', 'Municipio A');
        DELETE FROM contrata_guia WHERE nro_contratacion = (SELECT min(nro_contratacion) FROM contrata_ruta WHERE nombre_estado = 'Test GR');
        INSERT INTO contrata_guia
            SELECT min(nro_contratacion), 'RTN-3', 'LIC-3' FROM contrata_ruta WHERE nombre_estado = 'Test GR';
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó cambiar la contratación a un guía no adscrito (RR-118)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-118%' THEN RAISE; END IF;
    END;
    -- ...y si se reemplaza la ruta por una a la que el guía no está adscrito.
    BEGIN
        DELETE FROM contrata_ruta WHERE nombre_estado = 'Test GR';
        INSERT INTO contrata_ruta
            SELECT min(nro_contratacion), 'Test GR', 'Municipio B', 'Fija B' FROM contrata_guia WHERE rtn = 'RTN-1';
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó cambiar la contratación a una ruta sin el guía adscrito (RR-118)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-118%' THEN RAISE; END IF;
    END;

    -- RR-41 a RR-43: la contratación tiene visitante, guía y ruta.
    BEGIN
        INSERT INTO contratacion (fecha_contratacion) VALUES ('2026-12-06') RETURNING nro_contratacion INTO v_nro;
        INSERT INTO contrata_guia VALUES (v_nro, 'RTN-1', 'LIC-1');
        INSERT INTO contrata_ruta VALUES (v_nro, 'Test GR', 'Municipio A', 'Fija A');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó una contratación sin visitante (RR-41)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-41%' THEN RAISE; END IF;
    END;
    BEGIN
        INSERT INTO contratacion (fecha_contratacion) VALUES ('2026-12-06') RETURNING nro_contratacion INTO v_nro;
        INSERT INTO contrata_visitante VALUES (v_nro, 'V-1');
        INSERT INTO contrata_ruta VALUES (v_nro, 'Test GR', 'Municipio A', 'Fija A');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó una contratación sin guía (RR-42)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-42%' THEN RAISE; END IF;
    END;
    BEGIN
        INSERT INTO contratacion (fecha_contratacion) VALUES ('2026-12-06') RETURNING nro_contratacion INTO v_nro;
        INSERT INTO contrata_visitante VALUES (v_nro, 'V-1');
        INSERT INTO contrata_guia VALUES (v_nro, 'RTN-1', 'LIC-1');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó una contratación sin ruta (RR-43)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-43%' THEN RAISE; END IF;
    END;
    BEGIN
        DELETE FROM contrata_visitante WHERE nro_contratacion IN (SELECT nro_contratacion FROM contrata_ruta WHERE nombre_estado = 'Test GR');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se quitó el visitante de una contratación (RR-41)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-41%' THEN RAISE; END IF;
    END;
    BEGIN
        DELETE FROM contrata_guia WHERE nro_contratacion IN (SELECT nro_contratacion FROM contrata_ruta WHERE nombre_estado = 'Test GR');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se quitó el guía de una contratación (RR-42)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-42%' THEN RAISE; END IF;
    END;
    BEGIN
        DELETE FROM contrata_ruta WHERE nombre_estado = 'Test GR';
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se quitó la ruta de una contratación (RR-43)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-43%' THEN RAISE; END IF;
    END;

    -- HU-28, criterio 3: quitar la adscripción se acepta, y la contratación ya hecha
    -- se conserva: RR-118 se verifica al contratar (sección 8 de la spec).
    DELETE FROM sirve WHERE rtn = 'RTN-1' AND nombre_ruta = 'Fija A';
    SET CONSTRAINTS ALL IMMEDIATE;
    SET CONSTRAINTS ALL DEFERRED;

    -- Renombrar el municipio llega a las zonas y a las rutas, y se acepta. Las
    -- cascadas cambian trabaja y sirve en pasos distintos; RR-117 lo ve consistente
    -- al confirmar. (El municipio del hito lo hace a mano, como en rutas-gestion.)
    INSERT INTO sirve VALUES ('RTN-1', 'LIC-1', 'Test GR', 'Municipio A', 'Fija A');
    UPDATE municipio SET nombre_municipio = 'Municipio A2'
        WHERE nombre_estado = 'Test GR' AND nombre_municipio = 'Municipio A';
    UPDATE conforma SET municipio_hito = 'Municipio A2'
        WHERE estado_hito = 'Test GR' AND municipio_hito = 'Municipio A';
    SET CONSTRAINTS ALL IMMEDIATE;
END
$$;

ROLLBACK;
\echo 'OK: guias-contrataciones (RR-37 a RR-43, RR-117 y RR-118)'
