-- 00_esquema.sql
-- Lo que comparten todas las capacidades: roles, extensión y esquema rutasvzla.
-- Requiere PostgreSQL 16 o posterior (opciones INHERIT y SET de GRANT).
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
                                  'rol_ente', 'rol_funcionario', 'rol_administrador',
                                  'rol_autenticacion', 'app_rv']
    LOOP
        IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = nombre) THEN
            EXECUTE format('CREATE ROLE %I', nombre);
        END IF;
    END LOOP;
END
$$;

-- rv_owner, los roles de actor y rol_autenticacion no inician sesión.
-- rol_autenticacion solo puede ejecutar la rutina de inicio de sesión: la usa
-- app_rv antes de que exista una sesión, sin recibir privilegios de un actor.
ALTER ROLE rv_owner NOLOGIN;
ALTER ROLE rol_visitante NOLOGIN;
ALTER ROLE rol_guia NOLOGIN;
ALTER ROLE rol_comercio NOLOGIN;
ALTER ROLE rol_ente NOLOGIN;
ALTER ROLE rol_funcionario NOLOGIN;
ALTER ROLE rol_administrador NOLOGIN;
ALTER ROLE rol_autenticacion NOLOGIN;

-- app_rv es el usuario con el que se conecta Next.js. NOINHERIT: no recibe los
-- privilegios de sus roles hasta que la aplicación hace SET LOCAL ROLE.
-- La contraseña no va en el repositorio (ver database/README.md).
ALTER ROLE app_rv LOGIN NOINHERIT;
ALTER ROLE app_rv SET TimeZone = 'America/Caracas';
-- Cada membresía solo sirve para SET ROLE: INHERIT FALSE (no hereda privilegios)
-- y SET TRUE. Se escribe explícito para que repetir el build corrija una
-- membresía que hubiera quedado distinta.
GRANT rol_visitante, rol_guia, rol_comercio, rol_ente, rol_funcionario, rol_administrador,
      rol_autenticacion
    TO app_rv WITH INHERIT FALSE, SET TRUE;

-- Quien ejecuta el build necesita poder actuar como rv_owner para crear sus objetos,
-- y como cada rol de actor para que las pruebas SQL hagan SET LOCAL ROLE.
GRANT rv_owner TO CURRENT_USER;
GRANT rol_visitante, rol_guia, rol_comercio, rol_ente, rol_funcionario, rol_administrador,
      rol_autenticacion
    TO CURRENT_USER WITH INHERIT FALSE, SET TRUE;

-- 2. Extensión para guardar contraseñas con hash (crypt y gen_salt).
-- Va siempre en el esquema extensions, como en Supabase, para que las rutinas la
-- llamen igual en local y en Supabase: extensions.crypt(...), extensions.gen_salt(...).
CREATE SCHEMA IF NOT EXISTS extensions;
CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;

-- Si un build anterior la instaló en public, se mueve.
DO $$
BEGIN
    IF (SELECT extnamespace::regnamespace::text FROM pg_extension WHERE extname = 'pgcrypto')
       <> 'extensions' THEN
        ALTER EXTENSION pgcrypto SET SCHEMA extensions;
    END IF;
END
$$;

-- rv_owner es el dueño de las rutinas SECURITY DEFINER: necesita usar pgcrypto.
GRANT USAGE ON SCHEMA extensions TO rv_owner;

-- 3. Esquema
DROP SCHEMA IF EXISTS rutasvzla CASCADE;
CREATE SCHEMA rutasvzla AUTHORIZATION rv_owner;

-- Nadie entra al esquema salvo su dueño, los roles de actor y rol_autenticacion.
REVOKE ALL ON SCHEMA rutasvzla FROM PUBLIC;
GRANT USAGE ON SCHEMA rutasvzla
    TO rol_visitante, rol_guia, rol_comercio, rol_ente, rol_funcionario, rol_administrador,
       rol_autenticacion;

-- PostgreSQL deja ejecutar a PUBLIC toda función nueva. Para las de rv_owner se
-- quita: cada rutina recibe su GRANT EXECUTE en 04_seguridad/<capacidad>.sql.
ALTER DEFAULT PRIVILEGES FOR ROLE rv_owner REVOKE EXECUTE ON FUNCTIONS FROM PUBLIC;
