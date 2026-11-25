-- 00_esquema.sql
-- Lo que comparten todas las capacidades: roles, extensión y esquema rutasvzla.
-- Lo ejecuta build.sql al principio, conectado como el administrador de la base
-- (postgres en local o en Supabase). No crea tablas: cada integrante crea las
-- suyas en 01_tablas/<capacidad>.sql.
--
-- Borra y vuelve a crear el esquema rutasvzla: la base se construye siempre
-- desde los scripts del repositorio.

-- 1. Roles
-- Los roles son de todo el servidor, no de una base: se crean solo si no existen,
-- para poder ejecutar el script muchas veces.
DO $$
DECLARE
    nombre text;
BEGIN
    FOREACH nombre IN ARRAY ARRAY['rv_owner', 'rol_visitante', 'rol_guia', 'rol_comercio',
                                  'rol_ente', 'rol_funcionario', 'rol_administrador', 'app_rv']
    LOOP
        IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = nombre) THEN
            EXECUTE format('CREATE ROLE %I', nombre);
        END IF;
    END LOOP;
END
$$;

-- rv_owner y los roles de actor no inician sesión.
ALTER ROLE rv_owner NOLOGIN;
ALTER ROLE rol_visitante NOLOGIN;
ALTER ROLE rol_guia NOLOGIN;
ALTER ROLE rol_comercio NOLOGIN;
ALTER ROLE rol_ente NOLOGIN;
ALTER ROLE rol_funcionario NOLOGIN;
ALTER ROLE rol_administrador NOLOGIN;

-- app_rv es el usuario con el que se conecta Next.js. NOINHERIT: no recibe los
-- privilegios de sus roles hasta que la aplicación hace SET LOCAL ROLE.
-- La contraseña no va en el repositorio (ver database/README.md).
ALTER ROLE app_rv LOGIN NOINHERIT;
ALTER ROLE app_rv SET TimeZone = 'America/Caracas';
GRANT rol_visitante, rol_guia, rol_comercio, rol_ente, rol_funcionario, rol_administrador
    TO app_rv;

-- Quien ejecuta el build necesita poder actuar como rv_owner para crear sus objetos.
GRANT rv_owner TO CURRENT_USER;

-- 2. Extensión para guardar contraseñas con hash (crypt y gen_salt).
-- En Supabase ya está instalada, en el esquema extensions.
CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;

-- 3. Esquema
DROP SCHEMA IF EXISTS rutasvzla CASCADE;
CREATE SCHEMA rutasvzla AUTHORIZATION rv_owner;

-- Nadie entra al esquema salvo su dueño y los roles de actor.
REVOKE ALL ON SCHEMA rutasvzla FROM PUBLIC;
GRANT USAGE ON SCHEMA rutasvzla
    TO rol_visitante, rol_guia, rol_comercio, rol_ente, rol_funcionario, rol_administrador;

-- PostgreSQL deja ejecutar a PUBLIC toda función nueva. Para las de rv_owner se
-- quita: cada rutina recibe su GRANT EXECUTE en 04_seguridad/<capacidad>.sql.
ALTER DEFAULT PRIVILEGES FOR ROLE rv_owner REVOKE EXECUTE ON FUNCTIONS FROM PUBLIC;
