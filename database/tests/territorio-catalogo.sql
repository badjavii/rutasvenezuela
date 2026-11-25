-- Pruebas estructurales de territorio-catalogo.
-- HU-12.1/3/4, HU-33.1/3/4 y HU-34.1/3/4: alcance de tablas y claves.
-- No se prueban todavía rutinas de autorización ni las referencias de otros módulos.

BEGIN;
SET LOCAL ROLE rv_owner;
SET LOCAL search_path TO rutasvzla, pg_catalog;

DO $$
BEGIN
    INSERT INTO estado (nombre_estado) VALUES ('Test A'), ('Test B');

    BEGIN
        INSERT INTO estado VALUES ('Test A');
        RAISE EXCEPTION 'Se aceptó un estado duplicado';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;

    BEGIN
        INSERT INTO estado VALUES (NULL);
        RAISE EXCEPTION 'Se aceptó un nombre de estado nulo';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;

    INSERT INTO municipio (nombre_estado, nombre_municipio)
        VALUES ('Test A', 'Libertador'), ('Test B', 'Libertador'),
               ('Test A', 'Sucre');

    BEGIN
        INSERT INTO municipio VALUES ('Test A', 'Libertador');
        RAISE EXCEPTION 'Se aceptó un municipio duplicado en el mismo estado';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;

    BEGIN
        INSERT INTO municipio VALUES ('Inexistente', 'Libertador');
        RAISE EXCEPTION 'Se aceptó un municipio sin estado';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    BEGIN
        INSERT INTO municipio VALUES ('Test A', NULL);
        RAISE EXCEPTION 'Se aceptó un municipio sin nombre';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;

    INSERT INTO parroquia (nombre_estado, nombre_municipio, nombre_parroquia)
        VALUES ('Test A', 'Libertador', 'San José'),
               ('Test B', 'Libertador', 'San José'),
               ('Test A', 'Sucre', 'San José');

    BEGIN
        INSERT INTO parroquia VALUES ('Test A', 'Libertador', 'San José');
        RAISE EXCEPTION 'Se aceptó una parroquia duplicada en el mismo municipio';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;

    BEGIN
        INSERT INTO parroquia VALUES ('Test B', 'Sucre', 'San José');
        RAISE EXCEPTION 'Se aceptó una parroquia con municipio inexistente en ese estado';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    BEGIN
        INSERT INTO parroquia VALUES ('Test A', 'Sucre', NULL);
        RAISE EXCEPTION 'Se aceptó una parroquia sin nombre';
    EXCEPTION WHEN not_null_violation THEN NULL;
    END;

    BEGIN
        DELETE FROM estado WHERE nombre_estado = 'Test A';
        RAISE EXCEPTION 'Se eliminó un estado con municipios';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    BEGIN
        DELETE FROM municipio WHERE nombre_estado = 'Test A'
            AND nombre_municipio = 'Libertador';
        RAISE EXCEPTION 'Se eliminó un municipio con parroquias';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;

    -- Modificar nombres naturales conserva la integridad de las relaciones.
    UPDATE estado SET nombre_estado = 'Test A corregido'
        WHERE nombre_estado = 'Test A';
    IF NOT EXISTS (SELECT 1 FROM parroquia
        WHERE nombre_estado = 'Test A corregido' AND nombre_municipio = 'Libertador'
          AND nombre_parroquia = 'San José') THEN
        RAISE EXCEPTION 'El cambio de estado no se propagó a su parroquia';
    END IF;

    UPDATE municipio SET nombre_municipio = 'Libertador corregido'
        WHERE nombre_estado = 'Test A corregido' AND nombre_municipio = 'Libertador';
    IF NOT EXISTS (SELECT 1 FROM parroquia
        WHERE nombre_estado = 'Test A corregido' AND nombre_municipio = 'Libertador corregido'
          AND nombre_parroquia = 'San José') THEN
        RAISE EXCEPTION 'El cambio de municipio no se propagó a su parroquia';
    END IF;

    BEGIN
        UPDATE estado SET nombre_estado = 'Test B' WHERE nombre_estado = 'Test A corregido';
        RAISE EXCEPTION 'Se aceptó renombrar un estado a un nombre existente';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;

    INSERT INTO estado VALUES ('Test sin hijos');
    INSERT INTO municipio VALUES ('Test sin hijos', 'Municipio libre');
    INSERT INTO parroquia VALUES ('Test sin hijos', 'Municipio libre', 'Parroquia libre');

    DELETE FROM parroquia WHERE nombre_estado = 'Test sin hijos';
    DELETE FROM municipio WHERE nombre_estado = 'Test sin hijos';
    DELETE FROM estado WHERE nombre_estado = 'Test sin hijos';

    IF EXISTS (SELECT 1 FROM estado WHERE nombre_estado = 'Test sin hijos')
       OR EXISTS (SELECT 1 FROM municipio WHERE nombre_estado = 'Test sin hijos')
       OR EXISTS (SELECT 1 FROM parroquia WHERE nombre_estado = 'Test sin hijos') THEN
        RAISE EXCEPTION 'No se eliminaron los registros sin dependientes';
    END IF;
END
$$;

ROLLBACK;
\echo 'OK: territorio-catalogo (estructuras y claves)'
