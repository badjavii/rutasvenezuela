-- Pruebas de movilidad-paradas.
-- Primera transacción: tablas, claves, CHECK de RR-104 y RR-105, NOT NULL de RR-20
-- y RR-21, y acciones referenciales (sección 8 de la spec).
-- Segunda transacción: RR-31, RR-32 y RR-33 (triggers diferidos), RR-101 y la vía
-- habilitada (HU-16.1, criterio 6; HU-16.3, criterio 3).
-- Las claves foráneas hacia ubicacion_geografica, horario e hito (patrimonio-hitos,
-- Javier) y desde usa (rutas-gestion) se prueban cuando existan esas tablas.

BEGIN;
SET LOCAL ROLE rv_owner;
SET LOCAL search_path TO rutasvzla, pg_catalog;

DO $$
DECLARE
    v_valor text;
    v_codigo integer := 0;
BEGIN
    INSERT INTO estado VALUES ('Test PT');
    INSERT INTO municipio VALUES ('Test PT', 'Municipio A');
    INSERT INTO via VALUES ('Test PT', 'Municipio A', 'Calle P', 'calle', 'asfalto', 'habilitada');
    INSERT INTO via_modo VALUES ('Test PT', 'Municipio A', 'Calle P', 'transporte público');
    INSERT INTO tramo VALUES ('Test PT', 'Municipio A', 'Calle P', 1, false, false),
                             ('Test PT', 'Municipio A', 'Calle P', 2, false, false);

    -- HU-16.1, criterios 2 y 3: una parada con todos sus datos.
    INSERT INTO parada_transporte (codigo_terminal, nombre_parada, modalidad, tarifa_basica,
                                   nivel_adecuacion, estado_parada, frecuencia_paso, aforo_maximo)
        VALUES ('PT-001', 'Parada Uno', 'autobús', 10.50, 'alto', 'activa', 15, 40);

    -- HU-16.1, criterio 1: un código de terminal repetido se rechaza.
    BEGIN
        INSERT INTO parada_transporte VALUES ('PT-001', 'Otra', 'metro', 1, 'alto', 'activa', 5, 10);
        RAISE EXCEPTION 'Se aceptó un código de terminal repetido';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;

    -- HU-16.1, criterio 2: los datos de la parada son obligatorios.
    BEGIN
        INSERT INTO parada_transporte VALUES ('PT-X', NULL, 'metro', 1, 'alto', 'activa', 5, 10);
        RAISE EXCEPTION 'Se aceptó una parada sin nombre';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO parada_transporte VALUES ('PT-X', 'Sin nivel', 'metro', 1, NULL, 'activa', 5, 10);
        RAISE EXCEPTION 'Se aceptó una parada sin nivel de adecuación';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;

    -- RR-104: los tres estados y las cuatro modalidades se aceptan, con sus tildes.
    FOREACH v_valor IN ARRAY ARRAY['activa', 'en mantenimiento', 'fuera de servicio'] LOOP
        v_codigo := v_codigo + 1;
        INSERT INTO parada_transporte VALUES ('PT-E' || v_codigo, 'Estado', 'metro', 0, 'alto', v_valor, 5, 10);
    END LOOP;
    FOREACH v_valor IN ARRAY ARRAY['metro', 'autobús', 'embarcadero', 'transporte por cable'] LOOP
        v_codigo := v_codigo + 1;
        INSERT INTO parada_transporte VALUES ('PT-M' || v_codigo, 'Modalidad', v_valor, 0, 'alto', 'activa', 5, 10);
    END LOOP;

    -- RR-104: otro estado, otra modalidad, tarifa negativa, frecuencia o aforo no positivos.
    BEGIN
        INSERT INTO parada_transporte VALUES ('PT-X', 'X', 'metro', 1, 'alto', 'cerrada', 5, 10);
        RAISE EXCEPTION 'Se aceptó un estado de parada fuera de RR-104';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO parada_transporte VALUES ('PT-X', 'X', 'tren', 1, 'alto', 'activa', 5, 10);
        RAISE EXCEPTION 'Se aceptó una modalidad fuera de RR-104';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO parada_transporte VALUES ('PT-X', 'X', 'metro', -0.01, 'alto', 'activa', 5, 10);
        RAISE EXCEPTION 'Se aceptó una tarifa negativa (RR-104)';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO parada_transporte VALUES ('PT-X', 'X', 'metro', 1, 'alto', 'activa', 0, 10);
        RAISE EXCEPTION 'Se aceptó una frecuencia de paso no positiva (RR-104)';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO parada_transporte VALUES ('PT-X', 'X', 'metro', 1, 'alto', 'activa', 5, 0);
        RAISE EXCEPTION 'Se aceptó un aforo no positivo (RR-104)';
    EXCEPTION WHEN check_violation THEN NULL;
    END;

    -- RR-105 (HU-16.1, criterio 4): los seis equipamientos se aceptan, una vez cada uno.
    FOREACH v_valor IN ARRAY ARRAY['techo o marquesina', 'iluminación nocturna', 'taquilla', 'vigilancia',
                                   'estacionamiento de transferencia', 'resguardo de bicicletas'] LOOP
        INSERT INTO equipamiento_urbano VALUES ('PT-001', v_valor);
    END LOOP;
    BEGIN
        INSERT INTO equipamiento_urbano VALUES ('PT-001', 'taquilla');
        RAISE EXCEPTION 'Se aceptó un equipamiento repetido en la misma parada';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO equipamiento_urbano VALUES ('PT-001', 'ascensor');
        RAISE EXCEPTION 'Se aceptó un equipamiento fuera de RR-105';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO equipamiento_urbano VALUES ('No existe', 'taquilla');
        RAISE EXCEPTION 'Se aceptó un equipamiento de una parada inexistente';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    -- HU-16.1, criterio 5: una ubicación por parada, con sus tres valores (RR-20).
    INSERT INTO se_localiza VALUES ('PT-001', 10.491016, -66.902061, 900.50);
    BEGIN
        INSERT INTO se_localiza VALUES ('PT-001', 10.5, -66.9, 900);
        RAISE EXCEPTION 'Se aceptó una segunda ubicación para la misma parada';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO se_localiza VALUES ('PT-E1', 10.5, -66.9, NULL);
        RAISE EXCEPTION 'Se aceptó una ubicación sin elevación (RR-20)';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO se_localiza VALUES ('No existe', 10.5, -66.9, 900);
        RAISE EXCEPTION 'Se aceptó la ubicación de una parada inexistente';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    -- HU-16.1, criterio 6: la parada está en un tramo que existe, uno solo (RR-21).
    INSERT INTO esta_en VALUES ('PT-001', 'Test PT', 'Municipio A', 'Calle P', 1);
    BEGIN
        INSERT INTO esta_en VALUES ('PT-001', 'Test PT', 'Municipio A', 'Calle P', 2);
        RAISE EXCEPTION 'Se aceptó un segundo tramo para la misma parada';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO esta_en VALUES ('PT-E1', 'Test PT', 'Municipio A', 'Calle P', NULL);
        RAISE EXCEPTION 'Se aceptó una parada sin número de tramo (RR-21)';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO esta_en VALUES ('PT-E1', 'Test PT', 'Municipio A', 'Calle P', 9);
        RAISE EXCEPTION 'Se aceptó una parada en un tramo inexistente';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    -- HU-16.1, criterio 2: horarios de la parada, y criterio 7: hitos cercanos.
    INSERT INTO funciona VALUES ('PT-001', 'lunes', '06:00', '12:00'),
                                ('PT-001', 'lunes', '14:00', '22:00');
    BEGIN
        INSERT INTO funciona VALUES ('PT-001', 'lunes', '06:00', '12:00');
        RAISE EXCEPTION 'Se aceptó un horario repetido en la misma parada';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    INSERT INTO cercana VALUES ('PT-001', 'Test PT', 'Municipio A', 'Parroquia A', 'Hito A');
    BEGIN
        INSERT INTO cercana VALUES ('PT-001', 'Test PT', 'Municipio A', 'Parroquia A', 'Hito A');
        RAISE EXCEPTION 'Se aceptó un hito cercano repetido';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;

    -- HU-16.3, criterio 2: cambiar el código de terminal llega a todos sus datos.
    UPDATE parada_transporte SET codigo_terminal = 'PT-001A' WHERE codigo_terminal = 'PT-001';
    IF (SELECT count(*) FROM equipamiento_urbano WHERE codigo_terminal = 'PT-001A') <> 6
       OR NOT EXISTS (SELECT 1 FROM se_localiza WHERE codigo_terminal = 'PT-001A')
       OR NOT EXISTS (SELECT 1 FROM esta_en WHERE codigo_terminal = 'PT-001A')
       OR (SELECT count(*) FROM funciona WHERE codigo_terminal = 'PT-001A') <> 2
       OR NOT EXISTS (SELECT 1 FROM cercana WHERE codigo_terminal = 'PT-001A') THEN
        RAISE EXCEPTION 'El cambio de código de terminal no se propagó a los datos de la parada';
    END IF;

    -- Renombrar la vía llega al tramo de la parada (ON UPDATE CASCADE en cadena).
    UPDATE via SET nombre_via = 'Calle P corregida' WHERE nombre_via = 'Calle P';
    IF NOT EXISTS (SELECT 1 FROM esta_en WHERE codigo_terminal = 'PT-001A' AND nombre_via = 'Calle P corregida') THEN
        RAISE EXCEPTION 'El cambio de nombre de la vía no llegó a esta_en';
    END IF;

    -- HU-35.4 y HU-15.4, criterio 2: un tramo o una vía con paradas no se eliminan.
    -- PostgreSQL 18 lo reporta como restrict_violation; las versiones anteriores, como foreign_key_violation.
    BEGIN
        DELETE FROM tramo WHERE nombre_via = 'Calle P corregida' AND numero_tramo = 1;
        RAISE EXCEPTION 'Se eliminó un tramo con paradas';
    EXCEPTION WHEN foreign_key_violation OR restrict_violation THEN NULL;
    END;
    BEGIN
        DELETE FROM via WHERE nombre_via = 'Calle P corregida';
        RAISE EXCEPTION 'Se eliminó una vía con paradas';
    EXCEPTION WHEN foreign_key_violation OR restrict_violation THEN NULL;
    END;

    -- HU-16.4, criterio 1: eliminar la parada elimina sus datos.
    DELETE FROM parada_transporte WHERE codigo_terminal = 'PT-001A';
    IF EXISTS (SELECT 1 FROM equipamiento_urbano WHERE codigo_terminal = 'PT-001A')
       OR EXISTS (SELECT 1 FROM se_localiza WHERE codigo_terminal = 'PT-001A')
       OR EXISTS (SELECT 1 FROM esta_en WHERE codigo_terminal = 'PT-001A')
       OR EXISTS (SELECT 1 FROM funciona WHERE codigo_terminal = 'PT-001A')
       OR EXISTS (SELECT 1 FROM cercana WHERE codigo_terminal = 'PT-001A') THEN
        RAISE EXCEPTION 'Eliminar una parada no eliminó sus datos';
    END IF;
END
$$;

ROLLBACK;
\echo 'OK: movilidad-paradas (estructuras y claves)'

-- RR-31, RR-32 y RR-33 se verifican al confirmar la transacción (sección 8 de la
-- spec); la prueba lo adelanta con SET CONSTRAINTS ALL IMMEDIATE, como en
-- movilidad-vias-y-tramos. RR-101 y la vía habilitada se verifican al escribir.

BEGIN;
SET LOCAL ROLE rv_owner;
SET LOCAL search_path TO rutasvzla, pg_catalog;

DO $$
BEGIN
    INSERT INTO estado VALUES ('Test PR');
    INSERT INTO municipio VALUES ('Test PR', 'Municipio A');
    INSERT INTO via VALUES ('Test PR', 'Municipio A', 'Abierta', 'calle', 'asfalto', 'habilitada'),
                           ('Test PR', 'Municipio A', 'Cerrada', 'calle', 'asfalto', 'cierre total por mantenimiento');
    INSERT INTO via_modo VALUES ('Test PR', 'Municipio A', 'Abierta', 'a pie'),
                                ('Test PR', 'Municipio A', 'Cerrada', 'a pie');
    INSERT INTO tramo VALUES ('Test PR', 'Municipio A', 'Abierta', 1, false, false),
                             ('Test PR', 'Municipio A', 'Abierta', 2, false, false),
                             ('Test PR', 'Municipio A', 'Cerrada', 1, false, false);

    -- HU-16.1: la parada, su ubicación, su tramo y sus horarios van en la misma transacción.
    INSERT INTO parada_transporte VALUES ('PR-1', 'Completa', 'metro', 1, 'alto', 'activa', 5, 10);
    INSERT INTO se_localiza VALUES ('PR-1', 10.5, -66.9, 900);
    INSERT INTO esta_en VALUES ('PR-1', 'Test PR', 'Municipio A', 'Abierta', 1);
    INSERT INTO funciona VALUES ('PR-1', 'lunes', '08:00', '12:00'),
                                ('PR-1', 'martes', '08:00', '12:00');
    SET CONSTRAINTS ALL IMMEDIATE;
    SET CONSTRAINTS ALL DEFERRED;

    -- RR-31: una parada sin ubicación se rechaza.
    BEGIN
        INSERT INTO parada_transporte VALUES ('PR-2', 'Sin ubicación', 'metro', 1, 'alto', 'activa', 5, 10);
        INSERT INTO esta_en VALUES ('PR-2', 'Test PR', 'Municipio A', 'Abierta', 1);
        INSERT INTO funciona VALUES ('PR-2', 'lunes', '08:00', '12:00');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó una parada sin ubicación (RR-31)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-31%' THEN RAISE; END IF;
    END;

    -- RR-32: una parada sin tramo se rechaza.
    BEGIN
        INSERT INTO parada_transporte VALUES ('PR-2', 'Sin tramo', 'metro', 1, 'alto', 'activa', 5, 10);
        INSERT INTO se_localiza VALUES ('PR-2', 10.5, -66.9, 900);
        INSERT INTO funciona VALUES ('PR-2', 'lunes', '08:00', '12:00');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó una parada sin tramo (RR-32)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-32%' THEN RAISE; END IF;
    END;

    -- RR-33: una parada sin horarios se rechaza.
    BEGIN
        INSERT INTO parada_transporte VALUES ('PR-2', 'Sin horario', 'metro', 1, 'alto', 'activa', 5, 10);
        INSERT INTO se_localiza VALUES ('PR-2', 10.5, -66.9, 900);
        INSERT INTO esta_en VALUES ('PR-2', 'Test PR', 'Municipio A', 'Abierta', 1);
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó una parada sin horarios (RR-33)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-33%' THEN RAISE; END IF;
    END;

    -- RR-31, RR-32 y RR-33: quitar la ubicación, el tramo o el último horario se rechaza.
    BEGIN
        DELETE FROM se_localiza WHERE codigo_terminal = 'PR-1';
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se quitó la ubicación de una parada (RR-31)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-31%' THEN RAISE; END IF;
    END;
    BEGIN
        DELETE FROM esta_en WHERE codigo_terminal = 'PR-1';
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se quitó el tramo de una parada (RR-32)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-32%' THEN RAISE; END IF;
    END;
    BEGIN
        DELETE FROM funciona WHERE codigo_terminal = 'PR-1';
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se quitaron todos los horarios de una parada (RR-33)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-33%' THEN RAISE; END IF;
    END;

    -- Quitar un horario cuando quedan otros sí se acepta.
    DELETE FROM funciona WHERE codigo_terminal = 'PR-1' AND dia_semana = 'martes';
    SET CONSTRAINTS ALL IMMEDIATE;
    SET CONSTRAINTS ALL DEFERRED;

    -- RR-101: dos horarios del mismo día que se cruzan se rechazan.
    BEGIN
        INSERT INTO funciona VALUES ('PR-1', 'lunes', '11:00', '14:00');
        RAISE EXCEPTION 'Se aceptaron dos horarios que se cruzan (RR-101)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-101%' THEN RAISE; END IF;
    END;
    BEGIN
        INSERT INTO funciona VALUES ('PR-1', 'lunes', '09:00', '10:00');
        RAISE EXCEPTION 'Se aceptó un horario dentro de otro (RR-101)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-101%' THEN RAISE; END IF;
    END;
    -- Que uno empiece cuando el otro cierra no es cruzarse (≤ en la RR), y otro día tampoco.
    INSERT INTO funciona VALUES ('PR-1', 'lunes', '12:00', '14:00'),
                                ('PR-1', 'martes', '11:00', '14:00');
    -- Modificar un horario para que se cruce también se rechaza.
    BEGIN
        UPDATE funciona SET hora_apertura = '07:00'
            WHERE codigo_terminal = 'PR-1' AND dia_semana = 'lunes' AND hora_apertura = '12:00';
        RAISE EXCEPTION 'Se aceptó modificar un horario para que se cruce (RR-101)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-101%' THEN RAISE; END IF;
    END;

    -- HU-16.1, criterio 6, y HU-16.3, criterio 3: la parada está en una vía habilitada.
    BEGIN
        INSERT INTO parada_transporte VALUES ('PR-3', 'En vía cerrada', 'metro', 1, 'alto', 'activa', 5, 10);
        INSERT INTO esta_en VALUES ('PR-3', 'Test PR', 'Municipio A', 'Cerrada', 1);
        RAISE EXCEPTION 'Se aceptó una parada en una vía cerrada';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE '%habilitada%' THEN RAISE; END IF;
    END;
    BEGIN
        UPDATE esta_en SET nombre_via = 'Cerrada' WHERE codigo_terminal = 'PR-1';
        RAISE EXCEPTION 'Se aceptó mover una parada a una vía cerrada';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE '%habilitada%' THEN RAISE; END IF;
    END;
    -- Cambiar de tramo dentro de una vía habilitada se acepta.
    UPDATE esta_en SET numero_tramo = 2 WHERE codigo_terminal = 'PR-1';
    -- Si la vía se cierra después, la parada se conserva (sección 8 de la spec).
    UPDATE via SET estado_via = 'cierre total por mantenimiento' WHERE nombre_via = 'Abierta';

    -- HU-16.4, criterio 1: eliminar la parada con todos sus datos se acepta.
    DELETE FROM parada_transporte WHERE codigo_terminal = 'PR-1';
    SET CONSTRAINTS ALL IMMEDIATE;
END
$$;

ROLLBACK;
\echo 'OK: movilidad-paradas (RR-31, RR-32, RR-33, RR-101 y vía habilitada)'
