-- Pruebas de rutas-gestion.
-- Primera transacción: tablas, claves, CHECK de RR-106, RR-108 (orden positivo) y
-- RR-111, NOT NULL de RR-22 y acciones referenciales (sección 8 de la spec).
-- Segunda transacción: reglas que se verifican al confirmar (RR-34, RR-35, RR-36,
-- RR-108, RR-109, RR-110) y RR-107.
-- Las claves foráneas hacia hito (patrimonio-hitos, Javier) y visitante
-- (actores-identidades, Valeria), y las referencias entrantes de sobre, sirve,
-- contrata_ruta, transcurre y evalua_ruta, se prueban cuando existan esas tablas.

BEGIN;
SET LOCAL ROLE rv_owner;
SET LOCAL search_path TO rutasvzla, pg_catalog;

DO $$
DECLARE
    v_valor text;
BEGIN
    INSERT INTO estado VALUES ('Test RG');
    INSERT INTO municipio VALUES ('Test RG', 'Municipio A'), ('Test RG', 'Municipio B');
    INSERT INTO parada_transporte VALUES ('RG-P1', 'Parada', 'metro', 1, 'alto', 'activa', 5, 10);

    -- HU-17.1, criterio 4: una ruta con duración, mejor horario de inicio y dificultad.
    INSERT INTO ruta_turistica (nombre_estado, nombre_municipio, nombre_ruta,
                                duracion_estimada, mejor_horario_inicio, nivel_dificultad)
        VALUES ('Test RG', 'Municipio A', 'Ruta Uno', 120, '08:00', 'media');
    INSERT INTO ruta_fija VALUES ('Test RG', 'Municipio A', 'Ruta Uno');

    -- HU-17.1, criterio 5, y HU-25.1, criterio 4: mismo nombre en el mismo municipio se rechaza...
    BEGIN
        INSERT INTO ruta_turistica VALUES ('Test RG', 'Municipio A', 'Ruta Uno', 60, '09:00', 'baja');
        RAISE EXCEPTION 'Se aceptó una ruta repetida en el mismo municipio';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    -- ...y en otro municipio se acepta.
    INSERT INTO ruta_turistica VALUES ('Test RG', 'Municipio B', 'Ruta Uno', 60, '09:00', 'baja');

    BEGIN
        INSERT INTO ruta_turistica VALUES ('Test RG', 'Inexistente', 'Ruta Sola', 60, '09:00', 'baja');
        RAISE EXCEPTION 'Se aceptó una ruta en un municipio inexistente';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    -- HU-25.1, criterio 5: la dinámica puede dejar en blanco duración, horario y dificultad.
    INSERT INTO ruta_turistica VALUES ('Test RG', 'Municipio A', 'Mi ruta', NULL, NULL, NULL);
    INSERT INTO ruta_dinamica VALUES ('Test RG', 'Municipio A', 'Mi ruta', 'privada', 'a pie');

    -- RR-106: la duración, si la hay, es positiva.
    BEGIN
        INSERT INTO ruta_turistica VALUES ('Test RG', 'Municipio A', 'Duración cero', 0, '09:00', 'baja');
        RAISE EXCEPTION 'Se aceptó una duración estimada no positiva (RR-106)';
    EXCEPTION WHEN check_violation THEN NULL;
    END;

    -- RR-106 (HU-25.1, criterios 1 y 3): visibilidad y preferencia de transporte.
    FOREACH v_valor IN ARRAY ARRAY['privada', 'pública'] LOOP
        INSERT INTO ruta_turistica VALUES ('Test RG', 'Municipio B', 'Visible ' || v_valor, NULL, NULL, NULL);
        INSERT INTO ruta_dinamica VALUES ('Test RG', 'Municipio B', 'Visible ' || v_valor, v_valor, 'a pie');
    END LOOP;
    FOREACH v_valor IN ARRAY ARRAY['a pie', 'bicicleta', 'transporte público', 'vehículo adaptado'] LOOP
        INSERT INTO ruta_turistica VALUES ('Test RG', 'Municipio B', 'Prefiere ' || v_valor, NULL, NULL, NULL);
        INSERT INTO ruta_dinamica VALUES ('Test RG', 'Municipio B', 'Prefiere ' || v_valor, 'pública', v_valor);
    END LOOP;
    BEGIN
        INSERT INTO ruta_dinamica VALUES ('Test RG', 'Municipio B', 'Ruta Uno', 'oculta', 'a pie');
        RAISE EXCEPTION 'Se aceptó una visibilidad fuera de RR-106';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO ruta_dinamica VALUES ('Test RG', 'Municipio B', 'Ruta Uno', 'pública', 'avión');
        RAISE EXCEPTION 'Se aceptó una preferencia de transporte fuera de RR-106';
    EXCEPTION WHEN check_violation THEN NULL;
    END;

    -- RR-22: la ruta dinámica la crea un visitante, que no puede faltar.
    INSERT INTO crea VALUES ('Test RG', 'Municipio A', 'Mi ruta', 'V-1');
    BEGIN
        INSERT INTO crea VALUES ('Test RG', 'Municipio B', 'Visible privada', NULL);
        RAISE EXCEPTION 'Se aceptó una ruta dinámica sin creador (RR-22)';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO crea VALUES ('Test RG', 'Municipio A', 'Mi ruta', 'V-2');
        RAISE EXCEPTION 'Se aceptó un segundo creador para la misma ruta';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO crea VALUES ('Test RG', 'Municipio A', 'Ruta Uno', 'V-1');
        RAISE EXCEPTION 'Se aceptó el creador de una ruta que no es dinámica';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    -- HU-17.1, criterio 1: secuencia de hitos (conforma) y paradas (usa) con su orden.
    INSERT INTO conforma (estado_ruta, municipio_ruta, nombre_ruta,
                          estado_hito, municipio_hito, parroquia_hito, nombre_hito, orden)
        VALUES ('Test RG', 'Municipio A', 'Ruta Uno', 'Test RG', 'Municipio A', 'Parroquia A', 'Hito 1', 1),
               ('Test RG', 'Municipio A', 'Ruta Uno', 'Test RG', 'Municipio B', 'Parroquia B', 'Hito 3', 3);
    INSERT INTO usa (codigo_terminal, nombre_estado, nombre_municipio, nombre_ruta, orden)
        VALUES ('RG-P1', 'Test RG', 'Municipio A', 'Ruta Uno', 2);

    -- RR-108: todo orden es positivo.
    BEGIN
        INSERT INTO conforma VALUES ('Test RG', 'Municipio A', 'Ruta Uno',
                                     'Test RG', 'Municipio A', 'Parroquia A', 'Hito 0', 0);
        RAISE EXCEPTION 'Se aceptó un hito con orden 0 (RR-108)';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO usa VALUES ('RG-P1', 'Test RG', 'Municipio B', 'Ruta Uno', 0);
        RAISE EXCEPTION 'Se aceptó una parada con orden 0 (RR-108)';
    EXCEPTION WHEN check_violation THEN NULL;
    END;

    -- RR-111: el hito de orden 1 (origen) está en el municipio de la ruta.
    BEGIN
        INSERT INTO conforma VALUES ('Test RG', 'Municipio B', 'Ruta Uno',
                                     'Test RG', 'Municipio A', 'Parroquia A', 'Hito 1', 1);
        RAISE EXCEPTION 'Se aceptó un origen fuera del municipio de la ruta (RR-111)';
    EXCEPTION WHEN check_violation THEN NULL;
    END;

    BEGIN
        INSERT INTO usa VALUES ('No existe', 'Test RG', 'Municipio A', 'Ruta Uno', 4);
        RAISE EXCEPTION 'Se aceptó una parada inexistente en una ruta';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO conforma VALUES ('Test RG', 'Municipio A', 'No existe',
                                     'Test RG', 'Municipio A', 'Parroquia A', 'Hito 1', 1);
        RAISE EXCEPTION 'Se aceptó un hito en una ruta inexistente';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    -- HU-16.4, criterio 2: una parada que forma parte de una ruta no se elimina.
    -- PostgreSQL 18 lo reporta como restrict_violation; las versiones anteriores, como foreign_key_violation.
    BEGIN
        DELETE FROM parada_transporte WHERE codigo_terminal = 'RG-P1';
        RAISE EXCEPTION 'Se eliminó una parada que forma parte de una ruta';
    EXCEPTION WHEN foreign_key_violation OR restrict_violation THEN NULL;
    END;

    -- Un municipio con rutas no se elimina (ON DELETE RESTRICT).
    BEGIN
        DELETE FROM municipio WHERE nombre_estado = 'Test RG' AND nombre_municipio = 'Municipio B';
        RAISE EXCEPTION 'Se eliminó un municipio con rutas';
    EXCEPTION WHEN foreign_key_violation OR restrict_violation THEN NULL;
    END;

    -- HU-17.3, criterio 1: renombrar la ruta llega a su tipo y su secuencia.
    UPDATE ruta_turistica SET nombre_ruta = 'Ruta Uno corregida'
        WHERE nombre_municipio = 'Municipio A' AND nombre_ruta = 'Ruta Uno';
    IF NOT EXISTS (SELECT 1 FROM ruta_fija WHERE nombre_ruta = 'Ruta Uno corregida')
       OR (SELECT count(*) FROM conforma WHERE nombre_ruta = 'Ruta Uno corregida') <> 2
       OR NOT EXISTS (SELECT 1 FROM usa WHERE nombre_ruta = 'Ruta Uno corregida') THEN
        RAISE EXCEPTION 'El cambio de nombre de la ruta no se propagó';
    END IF;

    -- HU-17.4, criterio 1, y HU-25.4, criterio 2: eliminar la ruta elimina sus datos.
    DELETE FROM ruta_turistica WHERE nombre_municipio = 'Municipio A';
    IF EXISTS (SELECT 1 FROM ruta_fija WHERE nombre_municipio = 'Municipio A')
       OR EXISTS (SELECT 1 FROM ruta_dinamica WHERE nombre_municipio = 'Municipio A')
       OR EXISTS (SELECT 1 FROM conforma WHERE municipio_ruta = 'Municipio A')
       OR EXISTS (SELECT 1 FROM usa WHERE nombre_municipio = 'Municipio A')
       OR EXISTS (SELECT 1 FROM crea WHERE nombre_municipio = 'Municipio A') THEN
        RAISE EXCEPTION 'Eliminar una ruta no eliminó sus datos';
    END IF;
END
$$;

ROLLBACK;
\echo 'OK: rutas-gestion (estructuras y claves)'

-- Reglas que se verifican al confirmar (sección 8 de la spec). La prueba lo adelanta
-- con SET CONSTRAINTS ALL IMMEDIATE, como en movilidad-vias-y-tramos.

BEGIN;
SET LOCAL ROLE rv_owner;
SET LOCAL search_path TO rutasvzla, pg_catalog;

DO $$
BEGIN
    INSERT INTO estado VALUES ('Test RS');
    INSERT INTO municipio VALUES ('Test RS', 'Municipio A');
    INSERT INTO via VALUES ('Test RS', 'Municipio A', 'Calle R', 'calle', 'asfalto', 'habilitada');
    INSERT INTO via_modo VALUES ('Test RS', 'Municipio A', 'Calle R', 'a pie');
    INSERT INTO tramo VALUES ('Test RS', 'Municipio A', 'Calle R', 1, false, false);
    INSERT INTO parada_transporte VALUES ('RS-P1', 'Parada 1', 'metro', 1, 'alto', 'activa', 5, 10),
                                         ('RS-P2', 'Parada 2', 'metro', 1, 'alto', 'activa', 5, 10);
    INSERT INTO se_localiza VALUES ('RS-P1', 10.5, -66.9, 900), ('RS-P2', 10.6, -66.8, 900);
    INSERT INTO esta_en VALUES ('RS-P1', 'Test RS', 'Municipio A', 'Calle R', 1),
                               ('RS-P2', 'Test RS', 'Municipio A', 'Calle R', 1);
    INSERT INTO funciona VALUES ('RS-P1', 'lunes', '06:00', '22:00'), ('RS-P2', 'lunes', '06:00', '22:00');

    -- HU-17.1: una ruta fija completa: hito 1, parada 2, hito 3, parada 4, hito 5.
    INSERT INTO ruta_turistica VALUES ('Test RS', 'Municipio A', 'Fija', 90, '08:00', 'baja');
    INSERT INTO ruta_fija VALUES ('Test RS', 'Municipio A', 'Fija');
    INSERT INTO conforma VALUES ('Test RS', 'Municipio A', 'Fija', 'Test RS', 'Municipio A', 'Parroquia A', 'Hito 1', 1),
                                ('Test RS', 'Municipio A', 'Fija', 'Test RS', 'Municipio A', 'Parroquia A', 'Hito 3', 3),
                                ('Test RS', 'Municipio A', 'Fija', 'Test RS', 'Municipio A', 'Parroquia A', 'Hito 5', 5);
    INSERT INTO usa VALUES ('RS-P1', 'Test RS', 'Municipio A', 'Fija', 2),
                           ('RS-P2', 'Test RS', 'Municipio A', 'Fija', 4);
    -- HU-25.1: una ruta dinámica completa, con su creador y sin duración ni dificultad.
    INSERT INTO ruta_turistica VALUES ('Test RS', 'Municipio A', 'Dinámica', NULL, NULL, NULL);
    INSERT INTO ruta_dinamica VALUES ('Test RS', 'Municipio A', 'Dinámica', 'pública', 'a pie');
    INSERT INTO crea VALUES ('Test RS', 'Municipio A', 'Dinámica', 'V-1');
    INSERT INTO conforma VALUES ('Test RS', 'Municipio A', 'Dinámica', 'Test RS', 'Municipio A', 'Parroquia A', 'Hito 1', 1),
                                ('Test RS', 'Municipio A', 'Dinámica', 'Test RS', 'Municipio A', 'Parroquia A', 'Hito 2', 2);
    SET CONSTRAINTS ALL IMMEDIATE;
    SET CONSTRAINTS ALL DEFERRED;

    -- HU-17.3, criterio 1: cambiar la secuencia renumerando dentro de la transacción.
    -- Hito 5 → 6 y parada 4 → 5 deja un hueco en 4 hasta insertar el nuevo hito.
    UPDATE conforma SET orden = 6 WHERE nombre_ruta = 'Fija' AND orden = 5;
    UPDATE usa SET orden = 5 WHERE nombre_ruta = 'Fija' AND orden = 4;
    INSERT INTO conforma VALUES ('Test RS', 'Municipio A', 'Fija', 'Test RS', 'Municipio A', 'Parroquia A', 'Hito 4', 4);
    SET CONSTRAINTS ALL IMMEDIATE;
    SET CONSTRAINTS ALL DEFERRED;

    -- RR-35: una ruta que no es ni fija ni dinámica se rechaza.
    BEGIN
        INSERT INTO ruta_turistica VALUES ('Test RS', 'Municipio A', 'Sin tipo', 60, '08:00', 'baja');
        INSERT INTO conforma VALUES ('Test RS', 'Municipio A', 'Sin tipo', 'Test RS', 'Municipio A', 'Parroquia A', 'Hito 1', 1),
                                    ('Test RS', 'Municipio A', 'Sin tipo', 'Test RS', 'Municipio A', 'Parroquia A', 'Hito 2', 2);
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó una ruta que no es fija ni dinámica (RR-35)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-35%' THEN RAISE; END IF;
    END;
    -- RR-35: ni las dos a la vez.
    BEGIN
        INSERT INTO ruta_dinamica VALUES ('Test RS', 'Municipio A', 'Fija', 'pública', 'a pie');
        INSERT INTO crea VALUES ('Test RS', 'Municipio A', 'Fija', 'V-1');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó una ruta fija y dinámica a la vez (RR-35)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-35%' THEN RAISE; END IF;
    END;

    -- RR-36: una ruta dinámica sin creador se rechaza.
    BEGIN
        INSERT INTO ruta_turistica VALUES ('Test RS', 'Municipio A', 'Huérfana', NULL, NULL, NULL);
        INSERT INTO ruta_dinamica VALUES ('Test RS', 'Municipio A', 'Huérfana', 'privada', 'a pie');
        INSERT INTO conforma VALUES ('Test RS', 'Municipio A', 'Huérfana', 'Test RS', 'Municipio A', 'Parroquia A', 'Hito 1', 1),
                                    ('Test RS', 'Municipio A', 'Huérfana', 'Test RS', 'Municipio A', 'Parroquia A', 'Hito 2', 2);
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó una ruta dinámica sin creador (RR-36)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-36%' THEN RAISE; END IF;
    END;
    BEGIN
        DELETE FROM crea WHERE nombre_ruta = 'Dinámica';
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se quitó el creador de una ruta dinámica (RR-36)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-36%' THEN RAISE; END IF;
    END;

    -- RR-107 (HU-17.1 y HU-17.3, criterio 4): la ruta fija tiene duración, horario y dificultad.
    BEGIN
        UPDATE ruta_turistica SET mejor_horario_inicio = NULL WHERE nombre_ruta = 'Fija';
        RAISE EXCEPTION 'Se aceptó una ruta fija sin mejor horario de inicio (RR-107)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-107%' THEN RAISE; END IF;
    END;
    BEGIN
        INSERT INTO ruta_turistica VALUES ('Test RS', 'Municipio A', 'Fija incompleta', NULL, '08:00', 'baja');
        INSERT INTO ruta_fija VALUES ('Test RS', 'Municipio A', 'Fija incompleta');
        RAISE EXCEPTION 'Se aceptó una ruta fija sin duración (RR-107)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-107%' THEN RAISE; END IF;
    END;

    -- RR-34 (HU-17.1, criterio 2): una ruta con un solo hito se rechaza...
    BEGIN
        INSERT INTO ruta_turistica VALUES ('Test RS', 'Municipio A', 'Un hito', 60, '08:00', 'baja');
        INSERT INTO ruta_fija VALUES ('Test RS', 'Municipio A', 'Un hito');
        INSERT INTO conforma VALUES ('Test RS', 'Municipio A', 'Un hito', 'Test RS', 'Municipio A', 'Parroquia A', 'Hito 1', 1);
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó una ruta con un solo hito (RR-34)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-34%' THEN RAISE; END IF;
    END;
    -- ...y también quitarle hitos hasta dejarle uno (HU-25.3, criterio 4).
    BEGIN
        DELETE FROM conforma WHERE nombre_ruta = 'Dinámica' AND orden = 2;
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se dejó una ruta con un solo hito (RR-34)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-34%' THEN RAISE; END IF;
    END;

    -- RR-108 (HU-17.1, criterio 3): dos hitos con el mismo orden se rechazan...
    BEGIN
        INSERT INTO conforma VALUES ('Test RS', 'Municipio A', 'Dinámica', 'Test RS', 'Municipio A', 'Parroquia A', 'Hito 9', 2);
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptaron dos hitos con el mismo orden (RR-108)';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    -- ...dos paradas con el mismo orden...
    BEGIN
        UPDATE usa SET orden = 2 WHERE nombre_ruta = 'Fija' AND codigo_terminal = 'RS-P2';
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptaron dos paradas con el mismo orden (RR-108)';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    -- ...y un hito y una parada con el mismo orden.
    BEGIN
        UPDATE usa SET orden = 3 WHERE nombre_ruta = 'Fija' AND codigo_terminal = 'RS-P1';
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptaron un hito y una parada con el mismo orden (RR-108)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-108%' THEN RAISE; END IF;
    END;

    -- RR-109: la secuencia empieza en 1 con un hito...
    BEGIN
        INSERT INTO ruta_turistica VALUES ('Test RS', 'Municipio A', 'Empieza en parada', 60, '08:00', 'baja');
        INSERT INTO ruta_fija VALUES ('Test RS', 'Municipio A', 'Empieza en parada');
        INSERT INTO usa VALUES ('RS-P1', 'Test RS', 'Municipio A', 'Empieza en parada', 1);
        INSERT INTO conforma VALUES ('Test RS', 'Municipio A', 'Empieza en parada', 'Test RS', 'Municipio A', 'Parroquia A', 'Hito 1', 2),
                                    ('Test RS', 'Municipio A', 'Empieza en parada', 'Test RS', 'Municipio A', 'Parroquia A', 'Hito 2', 3);
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó una secuencia que empieza con una parada (RR-109)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-109%' THEN RAISE; END IF;
    END;
    -- ...y no deja huecos.
    BEGIN
        UPDATE conforma SET orden = 7 WHERE nombre_ruta = 'Fija' AND orden = 6;
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó una secuencia con un hueco (RR-109)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-109%' THEN RAISE; END IF;
    END;

    -- RR-110 (HU-17.1, criterio 1): una parada no puede ser el destino.
    BEGIN
        INSERT INTO usa VALUES ('RS-P1', 'Test RS', 'Municipio A', 'Dinámica', 3);
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó una parada sin hito después (RR-110)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-110%' THEN RAISE; END IF;
    END;

    -- Renombrar una ruta lleva consigo su tipo, su creador y su secuencia, y se acepta.
    UPDATE ruta_turistica SET nombre_ruta = 'Dinámica renombrada' WHERE nombre_ruta = 'Dinámica';
    SET CONSTRAINTS ALL IMMEDIATE;
    SET CONSTRAINTS ALL DEFERRED;

    -- HU-17.4, criterio 1, y HU-25.4, criterio 2: eliminar las rutas con sus datos se acepta.
    DELETE FROM ruta_turistica WHERE nombre_estado = 'Test RS';
    SET CONSTRAINTS ALL IMMEDIATE;
END
$$;

ROLLBACK;
\echo 'OK: rutas-gestion (RR-34, RR-35, RR-36, RR-107, RR-108, RR-109 y RR-110)'
