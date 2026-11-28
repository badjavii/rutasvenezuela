-- Pruebas de rutas-recorridos.
-- Primera transacción: tablas, claves, CHECK de RR-113, NOT NULL de RR-27 y RR-28,
-- y acciones referenciales.
-- Segunda transacción: RR-44, RR-45, RR-112 y RR-115 (al confirmar) y RR-114 (al
-- escribir el paso o terminar). Según la sección 8 de la spec, se verifican cuando
-- se escribe el recorrido, no cuando la ruta cambia después.
-- Las claves foráneas hacia visitante (actores-identidades, Valeria) y hito
-- (patrimonio-hitos, Javier), y desde respaldada_por (Javier), se prueban cuando
-- existan esas tablas.

BEGIN;
SET LOCAL ROLE rv_owner;
SET LOCAL search_path TO rutasvzla, pg_catalog;

DO $$
DECLARE
    v_id integer;
    v_otro integer;
BEGIN
    INSERT INTO estado VALUES ('Test RC');
    INSERT INTO municipio VALUES ('Test RC', 'Municipio A');
    INSERT INTO ruta_turistica VALUES ('Test RC', 'Municipio A', 'Ruta', 60, '08:00', 'baja');
    INSERT INTO ruta_fija VALUES ('Test RC', 'Municipio A', 'Ruta');
    INSERT INTO conforma VALUES ('Test RC', 'Municipio A', 'Ruta', 'Test RC', 'Municipio A', 'Parroquia A', 'Hito 1', 1),
                                ('Test RC', 'Municipio A', 'Ruta', 'Test RC', 'Municipio A', 'Parroquia A', 'Hito 2', 2);

    -- HU-28, criterio 1: el recorrido nuevo recibe su identificador del gestor.
    INSERT INTO recorrido (fecha_hora_inicio) VALUES ('2026-11-28 08:00') RETURNING id_recorrido INTO v_id;
    INSERT INTO realiza VALUES (v_id, 'V-1');
    INSERT INTO sobre VALUES (v_id, 'Test RC', 'Municipio A', 'Ruta');
    BEGIN
        INSERT INTO recorrido (id_recorrido, fecha_hora_inicio) VALUES (999999, '2026-11-28 08:00');
        RAISE EXCEPTION 'Se aceptó un identificador de recorrido escrito a mano';
    EXCEPTION WHEN generated_always THEN NULL;
    END;
    BEGIN
        INSERT INTO recorrido (fecha_hora_inicio) VALUES (NULL);
        RAISE EXCEPTION 'Se aceptó un recorrido sin inicio';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;

    -- HU-28, criterio 5: repetir la ruta crea otro recorrido.
    INSERT INTO recorrido (fecha_hora_inicio) VALUES ('2026-11-29 08:00') RETURNING id_recorrido INTO v_otro;
    INSERT INTO realiza VALUES (v_otro, 'V-1');
    INSERT INTO sobre VALUES (v_otro, 'Test RC', 'Municipio A', 'Ruta');

    -- RR-113 (HU-28, criterio 4): terminado tiene fin posterior al inicio y estado.
    UPDATE recorrido SET fecha_hora_fin = '2026-11-28 10:00', estado_recorrido = 'completado'
        WHERE id_recorrido = v_id;
    UPDATE recorrido SET fecha_hora_fin = '2026-11-29 09:00', estado_recorrido = 'abandonado'
        WHERE id_recorrido = v_otro;
    BEGIN
        INSERT INTO recorrido (fecha_hora_inicio, fecha_hora_fin) VALUES ('2026-11-28 08:00', '2026-11-28 09:00');
        RAISE EXCEPTION 'Se aceptó un recorrido con fin y sin estado (RR-113)';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO recorrido (fecha_hora_inicio, estado_recorrido) VALUES ('2026-11-28 08:00', 'abandonado');
        RAISE EXCEPTION 'Se aceptó un recorrido con estado y sin fin (RR-113)';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO recorrido (fecha_hora_inicio, fecha_hora_fin, estado_recorrido)
            VALUES ('2026-11-28 08:00', '2026-11-28 09:00', 'pausado');
        RAISE EXCEPTION 'Se aceptó un estado de recorrido fuera de RR-113';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO recorrido (fecha_hora_inicio, fecha_hora_fin, estado_recorrido)
            VALUES ('2026-11-28 08:00', '2026-11-28 08:00', 'completado');
        RAISE EXCEPTION 'Se aceptó un fin igual al inicio (RR-113)';
    EXCEPTION WHEN check_violation THEN NULL;
    END;

    -- RR-27 y RR-28: el visitante y la ruta del recorrido no faltan, y son uno.
    BEGIN
        INSERT INTO realiza VALUES (v_id, NULL);
        RAISE EXCEPTION 'Se aceptó un recorrido sin visitante (RR-27)';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO realiza VALUES (v_id, 'V-2');
        RAISE EXCEPTION 'Se aceptó un segundo visitante para el mismo recorrido';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO sobre VALUES (v_id, 'Test RC', 'Municipio A', NULL);
        RAISE EXCEPTION 'Se aceptó un recorrido sin ruta (RR-28)';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO sobre VALUES (v_id, 'Test RC', 'Municipio A', 'Ruta');
        RAISE EXCEPTION 'Se aceptó una segunda ruta para el mismo recorrido';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO recorrido (fecha_hora_inicio) VALUES ('2026-11-30 08:00') RETURNING id_recorrido INTO v_otro;
        INSERT INTO sobre VALUES (v_otro, 'Test RC', 'Municipio A', 'No existe');
        RAISE EXCEPTION 'Se aceptó un recorrido sobre una ruta inexistente';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO realiza VALUES (999999, 'V-1');
        RAISE EXCEPTION 'Se aceptó el visitante de un recorrido inexistente';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    -- HU-28, criterio 3: los pasos por los hitos, cada uno con su fecha y hora.
    INSERT INTO transita VALUES (v_id, 'Test RC', 'Municipio A', 'Parroquia A', 'Hito 1', '2026-11-28 08:30');
    BEGIN
        INSERT INTO transita VALUES (v_id, 'Test RC', 'Municipio A', 'Parroquia A', 'Hito 1', '2026-11-28 08:40');
        RAISE EXCEPTION 'Se aceptó el mismo hito dos veces en un recorrido';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO transita VALUES (v_id, 'Test RC', 'Municipio A', 'Parroquia A', 'Hito 2', NULL);
        RAISE EXCEPTION 'Se aceptó un paso sin fecha y hora';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;

    -- HU-17.4, criterio 2: una ruta con recorridos no se elimina (historial).
    -- PostgreSQL 18 lo reporta como restrict_violation; las versiones anteriores, como foreign_key_violation.
    BEGIN
        DELETE FROM ruta_turistica WHERE nombre_estado = 'Test RC' AND nombre_ruta = 'Ruta';
        RAISE EXCEPTION 'Se eliminó una ruta con recorridos';
    EXCEPTION WHEN foreign_key_violation OR restrict_violation THEN NULL;
    END;
    -- HU-28, criterio 6: el recorrido tampoco se elimina mientras tenga sus datos.
    BEGIN
        DELETE FROM recorrido WHERE id_recorrido = v_id;
        RAISE EXCEPTION 'Se eliminó un recorrido del historial';
    EXCEPTION WHEN foreign_key_violation OR restrict_violation THEN NULL;
    END;

    -- Renombrar la ruta llega a sus recorridos (ON UPDATE CASCADE).
    UPDATE ruta_turistica SET nombre_ruta = 'Ruta corregida' WHERE nombre_estado = 'Test RC';
    IF (SELECT count(*) FROM sobre WHERE nombre_ruta = 'Ruta corregida') <> 2 THEN
        RAISE EXCEPTION 'El cambio de nombre de la ruta no llegó a sus recorridos';
    END IF;
END
$$;

ROLLBACK;
\echo 'OK: rutas-recorridos (estructuras y claves)'

BEGIN;
SET LOCAL ROLE rv_owner;
SET LOCAL search_path TO rutasvzla, pg_catalog;

DO $$
DECLARE
    v_fija integer;
    v_publica integer;
    v_propia integer;
    v_ajena integer;
BEGIN
    INSERT INTO estado VALUES ('Test RD');
    INSERT INTO municipio VALUES ('Test RD', 'Municipio A');
    INSERT INTO ruta_turistica VALUES ('Test RD', 'Municipio A', 'Fija', 60, '08:00', 'baja'),
                                      ('Test RD', 'Municipio A', 'Privada', NULL, NULL, NULL),
                                      ('Test RD', 'Municipio A', 'Pública', NULL, NULL, NULL);
    INSERT INTO ruta_fija VALUES ('Test RD', 'Municipio A', 'Fija');
    INSERT INTO ruta_dinamica VALUES ('Test RD', 'Municipio A', 'Privada', 'privada', 'a pie'),
                                     ('Test RD', 'Municipio A', 'Pública', 'pública', 'a pie');
    INSERT INTO crea VALUES ('Test RD', 'Municipio A', 'Privada', 'V-1'),
                            ('Test RD', 'Municipio A', 'Pública', 'V-1');
    INSERT INTO conforma
        SELECT 'Test RD', 'Municipio A', r, 'Test RD', 'Municipio A', 'Parroquia A', h, o
        FROM unnest(ARRAY['Fija', 'Privada', 'Pública']) AS r,
             (VALUES ('Hito 1', 1), ('Hito 2', 2)) AS s(h, o);

    -- HU-28, criterios 1 y 2: rutas fijas, dinámicas públicas y las propias del visitante.
    INSERT INTO recorrido (fecha_hora_inicio) VALUES ('2026-11-28 08:00') RETURNING id_recorrido INTO v_fija;
    INSERT INTO realiza VALUES (v_fija, 'V-2');
    INSERT INTO sobre VALUES (v_fija, 'Test RD', 'Municipio A', 'Fija');
    INSERT INTO recorrido (fecha_hora_inicio) VALUES ('2026-11-28 08:00') RETURNING id_recorrido INTO v_publica;
    INSERT INTO sobre VALUES (v_publica, 'Test RD', 'Municipio A', 'Pública');
    INSERT INTO realiza VALUES (v_publica, 'V-2');
    INSERT INTO recorrido (fecha_hora_inicio) VALUES ('2026-11-28 08:00') RETURNING id_recorrido INTO v_propia;
    INSERT INTO realiza VALUES (v_propia, 'V-1');
    INSERT INTO sobre VALUES (v_propia, 'Test RD', 'Municipio A', 'Privada');
    SET CONSTRAINTS ALL IMMEDIATE;
    SET CONSTRAINTS ALL DEFERRED;

    -- RR-112: la ruta dinámica privada de otro visitante no se recorre.
    BEGIN
        INSERT INTO recorrido (fecha_hora_inicio) VALUES ('2026-11-28 08:00') RETURNING id_recorrido INTO v_ajena;
        INSERT INTO realiza VALUES (v_ajena, 'V-2');
        INSERT INTO sobre VALUES (v_ajena, 'Test RD', 'Municipio A', 'Privada');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó recorrer la ruta privada de otro visitante (RR-112)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-112%' THEN RAISE; END IF;
    END;
    -- RR-112: tampoco cambiando el visitante del recorrido.
    BEGIN
        UPDATE realiza SET cedula_pasaporte = 'V-2' WHERE id_recorrido = v_propia;
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó pasar a otro visitante un recorrido de ruta privada (RR-112)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-112%' THEN RAISE; END IF;
    END;

    -- RR-112: ni cambiando la ruta del recorrido por la privada de otro.
    BEGIN
        UPDATE sobre SET nombre_ruta = 'Privada' WHERE id_recorrido = v_fija;
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó cambiar un recorrido a la ruta privada de otro (RR-112)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-112%' THEN RAISE; END IF;
    END;

    -- RR-44 y RR-45: el recorrido tiene su visitante y su ruta.
    BEGIN
        INSERT INTO recorrido (fecha_hora_inicio) VALUES ('2026-11-28 08:00') RETURNING id_recorrido INTO v_ajena;
        INSERT INTO sobre VALUES (v_ajena, 'Test RD', 'Municipio A', 'Fija');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó un recorrido sin visitante (RR-44)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-44%' THEN RAISE; END IF;
    END;
    BEGIN
        INSERT INTO recorrido (fecha_hora_inicio) VALUES ('2026-11-28 08:00') RETURNING id_recorrido INTO v_ajena;
        INSERT INTO realiza VALUES (v_ajena, 'V-2');
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó un recorrido sin ruta (RR-45)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-45%' THEN RAISE; END IF;
    END;
    BEGIN
        DELETE FROM realiza WHERE id_recorrido = v_fija;
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se quitó el visitante de un recorrido (RR-44)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-44%' THEN RAISE; END IF;
    END;
    BEGIN
        DELETE FROM sobre WHERE id_recorrido = v_fija;
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se quitó la ruta de un recorrido (RR-45)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-45%' THEN RAISE; END IF;
    END;

    -- RR-114: el hito transitado es de la ruta y el paso ocurre después del inicio.
    INSERT INTO transita VALUES (v_fija, 'Test RD', 'Municipio A', 'Parroquia A', 'Hito 1', '2026-11-28 08:30');
    BEGIN
        INSERT INTO transita VALUES (v_fija, 'Test RD', 'Municipio A', 'Parroquia A', 'Hito 9', '2026-11-28 08:40');
        RAISE EXCEPTION 'Se aceptó un paso por un hito que no es de la ruta (RR-114)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-114%' THEN RAISE; END IF;
    END;
    BEGIN
        INSERT INTO transita VALUES (v_fija, 'Test RD', 'Municipio A', 'Parroquia A', 'Hito 2', '2026-11-28 07:59');
        RAISE EXCEPTION 'Se aceptó un paso antes del inicio (RR-114)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-114%' THEN RAISE; END IF;
    END;

    -- RR-115: no se completa un recorrido al que le falta un hito de su ruta...
    BEGIN
        UPDATE recorrido SET fecha_hora_fin = '2026-11-28 09:00', estado_recorrido = 'completado'
            WHERE id_recorrido = v_fija;
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se completó un recorrido sin pasar por todos los hitos (RR-115)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-115%' THEN RAISE; END IF;
    END;
    -- ...pero sí se abandona.
    UPDATE recorrido SET fecha_hora_fin = '2026-11-28 09:00', estado_recorrido = 'abandonado'
        WHERE id_recorrido = v_publica;

    -- RR-114: el fin no puede quedar antes de un paso ya registrado.
    BEGIN
        UPDATE recorrido SET fecha_hora_fin = '2026-11-28 08:15', estado_recorrido = 'abandonado'
            WHERE id_recorrido = v_fija;
        RAISE EXCEPTION 'Se aceptó un fin anterior a un paso registrado (RR-114)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-114%' THEN RAISE; END IF;
    END;

    -- Con todos los hitos transitados, el recorrido se completa.
    INSERT INTO transita VALUES (v_fija, 'Test RD', 'Municipio A', 'Parroquia A', 'Hito 2', '2026-11-28 08:50');
    UPDATE recorrido SET fecha_hora_fin = '2026-11-28 09:00', estado_recorrido = 'completado'
        WHERE id_recorrido = v_fija;
    SET CONSTRAINTS ALL IMMEDIATE;
    SET CONSTRAINTS ALL DEFERRED;

    -- RR-114: un paso después del fin tampoco se acepta.
    BEGIN
        INSERT INTO transita VALUES (v_publica, 'Test RD', 'Municipio A', 'Parroquia A', 'Hito 1', '2026-11-28 09:30');
        RAISE EXCEPTION 'Se aceptó un paso después del fin (RR-114)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-114%' THEN RAISE; END IF;
    END;
    -- RR-115: quitarle un paso a un recorrido completado se rechaza.
    BEGIN
        DELETE FROM transita WHERE id_recorrido = v_fija AND nombre_hito = 'Hito 2';
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se quitó un paso de un recorrido completado (RR-115)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-115%' THEN RAISE; END IF;
    END;

    -- RR-115: cambiar un recorrido completado a una ruta con otros hitos se rechaza.
    BEGIN
        INSERT INTO ruta_turistica VALUES ('Test RD', 'Municipio A', 'Otra', 60, '08:00', 'baja');
        INSERT INTO ruta_fija VALUES ('Test RD', 'Municipio A', 'Otra');
        INSERT INTO conforma VALUES ('Test RD', 'Municipio A', 'Otra', 'Test RD', 'Municipio A', 'Parroquia A', 'Hito 3', 1),
                                    ('Test RD', 'Municipio A', 'Otra', 'Test RD', 'Municipio A', 'Parroquia A', 'Hito 4', 2);
        UPDATE sobre SET nombre_ruta = 'Otra' WHERE id_recorrido = v_fija;
        SET CONSTRAINTS ALL IMMEDIATE;
        RAISE EXCEPTION 'Se aceptó cambiar la ruta de un recorrido completado (RR-115)';
    EXCEPTION WHEN check_violation THEN
        IF SQLERRM NOT LIKE 'RR-115%' THEN RAISE; END IF;
    END;

    -- Sección 8: cambiar la ruta después no invalida el historial. Agregar un hito a la
    -- ruta fija y hacer privada la ruta pública no afecta a los recorridos ya escritos.
    UPDATE conforma SET orden = 3 WHERE nombre_ruta = 'Fija' AND orden = 2;
    INSERT INTO conforma VALUES ('Test RD', 'Municipio A', 'Fija', 'Test RD', 'Municipio A', 'Parroquia A', 'Hito 5', 2);
    UPDATE ruta_dinamica SET visibilidad = 'privada' WHERE nombre_ruta = 'Pública';
    SET CONSTRAINTS ALL IMMEDIATE;
END
$$;

ROLLBACK;
\echo 'OK: rutas-recorridos (RR-44, RR-45, RR-112, RR-114 y RR-115)'
