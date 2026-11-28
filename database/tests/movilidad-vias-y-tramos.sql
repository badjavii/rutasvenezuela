-- Pruebas estructurales de movilidad-vias-y-tramos.
-- HU-15.1/3/4 y HU-35.1/3/4: tablas, claves, CHECK de RR-102 y RR-103, y acciones
-- referenciales (sección 8 de la spec). RR-29 y RR-30 («al menos un tramo» y
-- «al menos un modo») se prueban con sus triggers diferidos en 03_reglas.
-- HU-15.4 y HU-35.4, criterio 2 (paradas, incidencias e hitos que bloquean) se
-- prueban cuando existan esta_en, afecta_tramo y se_ubica_en.

BEGIN;
SET LOCAL ROLE rv_owner;
SET LOCAL search_path TO rutasvzla, pg_catalog;

DO $$
DECLARE
    v_valor text;
BEGIN
    INSERT INTO estado VALUES ('Test VT');
    INSERT INTO municipio VALUES ('Test VT', 'Municipio A'), ('Test VT', 'Municipio B');

    -- HU-15.1, criterios 1, 2 y 4: una vía con nombre, tipo, terreno y estado.
    INSERT INTO via (nombre_estado, nombre_municipio, nombre_via, tipo_via, condicion_terreno, estado_via)
        VALUES ('Test VT', 'Municipio A', 'Avenida Uno', 'avenida', 'asfalto', 'habilitada');

    -- HU-15.1, criterio 3: mismo nombre en el mismo municipio y estado se rechaza.
    BEGIN
        INSERT INTO via VALUES ('Test VT', 'Municipio A', 'Avenida Uno', 'calle', 'tierra', 'habilitada');
        RAISE EXCEPTION 'Se aceptó una vía repetida en el mismo municipio';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;

    -- El mismo nombre sí se acepta en otro municipio.
    INSERT INTO via VALUES ('Test VT', 'Municipio B', 'Avenida Uno', 'avenida', 'asfalto', 'habilitada');

    -- HU-15.1, criterio 2: la vía se ubica en un municipio que existe.
    BEGIN
        INSERT INTO via VALUES ('Test VT', 'Inexistente', 'Calle Sola', 'calle', 'asfalto', 'habilitada');
        RAISE EXCEPTION 'Se aceptó una vía en un municipio inexistente';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    -- HU-15.1, criterio 1: tipo y condiciones del terreno son obligatorios.
    BEGIN
        INSERT INTO via VALUES ('Test VT', 'Municipio A', 'Sin Tipo', NULL, 'asfalto', 'habilitada');
        RAISE EXCEPTION 'Se aceptó una vía sin tipo';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO via VALUES ('Test VT', 'Municipio A', 'Sin Terreno', 'calle', NULL, 'habilitada');
        RAISE EXCEPTION 'Se aceptó una vía sin condiciones del terreno';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;

    -- RR-102: los siete tipos y los dos estados permitidos se aceptan, con sus tildes.
    FOREACH v_valor IN ARRAY ARRAY['calle', 'avenida', 'bulevar', 'caminería', 'sendero', 'puente', 'otro'] LOOP
        INSERT INTO via VALUES ('Test VT', 'Municipio B', 'Tipo ' || v_valor, v_valor, 'asfalto', 'habilitada');
    END LOOP;
    INSERT INTO via VALUES ('Test VT', 'Municipio B', 'Vía cerrada', 'calle', 'asfalto',
                            'cierre total por mantenimiento');

    -- RR-102: otro tipo u otro estado se rechazan.
    BEGIN
        INSERT INTO via VALUES ('Test VT', 'Municipio A', 'Autopista', 'autopista', 'asfalto', 'habilitada');
        RAISE EXCEPTION 'Se aceptó un tipo de vía fuera de RR-102';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO via VALUES ('Test VT', 'Municipio A', 'Cerrada', 'calle', 'asfalto', 'cerrada');
        RAISE EXCEPTION 'Se aceptó un estado de vía fuera de RR-102';
    EXCEPTION WHEN check_violation THEN NULL;
    END;

    -- RR-102: los cuatro modos permitidos se aceptan.
    FOREACH v_valor IN ARRAY ARRAY['a pie', 'bicicleta', 'transporte público', 'vehículo adaptado'] LOOP
        INSERT INTO via_modo VALUES ('Test VT', 'Municipio A', 'Avenida Uno', v_valor);
    END LOOP;

    BEGIN
        INSERT INTO via_modo VALUES ('Test VT', 'Municipio A', 'Avenida Uno', 'a pie');
        RAISE EXCEPTION 'Se aceptó un modo repetido en la misma vía';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO via_modo VALUES ('Test VT', 'Municipio B', 'Avenida Uno', 'helicóptero');
        RAISE EXCEPTION 'Se aceptó un modo fuera de RR-102';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO via_modo VALUES ('Test VT', 'Municipio A', 'No existe', 'a pie');
        RAISE EXCEPTION 'Se aceptó un modo de una vía inexistente';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    -- HU-35.1, criterios 1 y 2: tramos numerados de una vía, con desnivel y escalinata.
    INSERT INTO tramo (nombre_estado, nombre_municipio, nombre_via, numero_tramo, tiene_escalinata, tiene_desnivel)
        VALUES ('Test VT', 'Municipio A', 'Avenida Uno', 1, false, false),
               ('Test VT', 'Municipio A', 'Avenida Uno', 2, true, false),
               ('Test VT', 'Municipio B', 'Avenida Uno', 1, false, true);

    BEGIN
        INSERT INTO tramo VALUES ('Test VT', 'Municipio A', 'Avenida Uno', 1, false, false);
        RAISE EXCEPTION 'Se aceptó un número de tramo repetido en la misma vía';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO tramo VALUES ('Test VT', 'Municipio A', 'No existe', 1, false, false);
        RAISE EXCEPTION 'Se aceptó un tramo de una vía inexistente';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO tramo VALUES ('Test VT', 'Municipio A', 'Avenida Uno', 3, NULL, false);
        RAISE EXCEPTION 'Se aceptó un tramo sin indicar si tiene escalinata';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;

    -- HU-35.1, criterio 3: conexiones entre tramos, también de vías distintas.
    INSERT INTO conecta (estado_origen, municipio_origen, via_origen, tramo_origen,
                         estado_destino, municipio_destino, via_destino, tramo_destino)
        VALUES ('Test VT', 'Municipio A', 'Avenida Uno', 1, 'Test VT', 'Municipio A', 'Avenida Uno', 2),
               ('Test VT', 'Municipio A', 'Avenida Uno', 2, 'Test VT', 'Municipio B', 'Avenida Uno', 1);

    -- RR-103 (HU-35.1, criterio 4): un tramo no se conecta consigo mismo.
    BEGIN
        INSERT INTO conecta VALUES ('Test VT', 'Municipio A', 'Avenida Uno', 1,
                                    'Test VT', 'Municipio A', 'Avenida Uno', 1);
        RAISE EXCEPTION 'Se aceptó un tramo conectado consigo mismo (RR-103)';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO conecta VALUES ('Test VT', 'Municipio A', 'Avenida Uno', 1,
                                    'Test VT', 'Municipio A', 'Avenida Uno', 9);
        RAISE EXCEPTION 'Se aceptó una conexión con un tramo inexistente';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    -- ON UPDATE CASCADE: renombrar la vía llega a sus tramos, modos y conexiones.
    UPDATE via SET nombre_via = 'Avenida Uno corregida'
        WHERE nombre_estado = 'Test VT' AND nombre_municipio = 'Municipio A' AND nombre_via = 'Avenida Uno';
    IF (SELECT count(*) FROM tramo WHERE nombre_via = 'Avenida Uno corregida') <> 2
       OR (SELECT count(*) FROM via_modo WHERE nombre_via = 'Avenida Uno corregida') <> 4
       OR NOT EXISTS (SELECT 1 FROM conecta WHERE via_origen = 'Avenida Uno corregida'
                                             AND via_destino = 'Avenida Uno corregida') THEN
        RAISE EXCEPTION 'El cambio de nombre de la vía no se propagó a tramos, modos o conexiones';
    END IF;

    -- HU-35.4, criterio 1: eliminar un tramo elimina sus conexiones.
    DELETE FROM tramo WHERE nombre_municipio = 'Municipio B' AND nombre_via = 'Avenida Uno' AND numero_tramo = 1;
    IF EXISTS (SELECT 1 FROM conecta WHERE municipio_destino = 'Municipio B') THEN
        RAISE EXCEPTION 'Eliminar un tramo no eliminó sus conexiones';
    END IF;

    -- HU-15.4, criterio 1: eliminar una vía elimina sus tramos, modos y conexiones.
    DELETE FROM via WHERE nombre_municipio = 'Municipio A' AND nombre_via = 'Avenida Uno corregida';
    IF EXISTS (SELECT 1 FROM tramo WHERE nombre_via = 'Avenida Uno corregida')
       OR EXISTS (SELECT 1 FROM via_modo WHERE nombre_via = 'Avenida Uno corregida')
       OR EXISTS (SELECT 1 FROM conecta WHERE via_origen = 'Avenida Uno corregida') THEN
        RAISE EXCEPTION 'Eliminar una vía no eliminó sus tramos, modos o conexiones';
    END IF;

    -- Un municipio con vías no se elimina (ON DELETE RESTRICT).
    -- PostgreSQL 18 lo reporta como restrict_violation; las versiones anteriores, como foreign_key_violation.
    BEGIN
        DELETE FROM municipio WHERE nombre_estado = 'Test VT' AND nombre_municipio = 'Municipio B';
        RAISE EXCEPTION 'Se eliminó un municipio con vías';
    EXCEPTION WHEN foreign_key_violation OR restrict_violation THEN NULL;
    END;
END
$$;

ROLLBACK;
\echo 'OK: movilidad-vias-y-tramos (estructuras y claves)'
