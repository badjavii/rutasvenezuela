-- Prueba de 00_esquema.sql: esquema, roles, extensión y privilegios base.
-- Se ejecuta después de build.sql. Todo va dentro de BEGIN … ROLLBACK,
-- así que la prueba no deja nada en la base.

BEGIN;

DO $$
BEGIN
    -- El esquema existe y su dueño es rv_owner.
    ASSERT (SELECT nspowner::regrole::text FROM pg_namespace WHERE nspname = 'rutasvzla') = 'rv_owner',
        'El esquema rutasvzla no existe o su dueño no es rv_owner';

    -- Los seis roles de actor y rol_autenticacion existen y no pueden iniciar sesión.
    ASSERT (SELECT count(*) FROM pg_roles
            WHERE rolname IN ('rol_visitante', 'rol_guia', 'rol_comercio',
                              'rol_ente', 'rol_funcionario', 'rol_administrador',
                              'rol_autenticacion')
              AND NOT rolcanlogin) = 7,
        'Faltan roles de actor o rol_autenticacion, o alguno puede iniciar sesión';

    -- rv_owner existe y no puede iniciar sesión.
    ASSERT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'rv_owner' AND NOT rolcanlogin),
        'rv_owner no existe o puede iniciar sesión';

    -- app_rv inicia sesión y no hereda privilegios.
    ASSERT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'app_rv' AND rolcanlogin AND NOT rolinherit),
        'app_rv debe ser LOGIN NOINHERIT';

    -- app_rv es miembro de los seis roles de actor y de rol_autenticacion. Se cuentan
    -- roles distintos: desde PostgreSQL 16 cada administrador que otorga deja su fila.
    ASSERT (SELECT count(DISTINCT r.rolname) FROM pg_auth_members m
            JOIN pg_roles r ON r.oid = m.roleid
            JOIN pg_roles u ON u.oid = m.member
            WHERE u.rolname = 'app_rv' AND r.rolname LIKE 'rol\_%') = 7,
        'app_rv no es miembro de los seis roles de actor y de rol_autenticacion';

    -- Cada membresía de app_rv solo permite SET ROLE: no hereda privilegios ni
    -- puede dar el rol a otros (INHERIT FALSE, SET TRUE, ADMIN FALSE).
    ASSERT NOT EXISTS (SELECT 1 FROM pg_auth_members m
                       JOIN pg_roles u ON u.oid = m.member
                       WHERE u.rolname = 'app_rv'
                         AND (m.inherit_option OR NOT m.set_option OR m.admin_option)),
        'Las membresías de app_rv deben ser INHERIT FALSE, SET TRUE y ADMIN FALSE';
    ASSERT NOT pg_has_role('app_rv', 'rv_owner', 'MEMBER'),
        'app_rv no debe ser miembro de rv_owner';

    -- Sin SET ROLE, app_rv no puede ni entrar al esquema.
    ASSERT NOT has_schema_privilege('app_rv', 'rutasvzla', 'USAGE'),
        'app_rv no debe tener privilegios propios sobre rutasvzla';

    -- rol_autenticacion entra al esquema para llamar a la rutina de inicio de sesión.
    ASSERT has_schema_privilege('rol_autenticacion', 'rutasvzla', 'USAGE'),
        'rol_autenticacion debe poder usar rutasvzla';

    -- Cada rol de actor sí puede entrar al esquema.
    ASSERT has_schema_privilege('rol_visitante', 'rutasvzla', 'USAGE')
       AND has_schema_privilege('rol_administrador', 'rutasvzla', 'USAGE'),
        'Los roles de actor deben poder usar rutasvzla';

    -- Ningún otro usuario de la base entra al esquema.
    ASSERT NOT has_schema_privilege('public', 'rutasvzla', 'USAGE'),
        'PUBLIC no debe poder usar rutasvzla';

    -- pgcrypto está instalada en el esquema extensions, en local y en Supabase.
    ASSERT (SELECT extnamespace::regnamespace::text FROM pg_extension WHERE extname = 'pgcrypto') = 'extensions',
        'pgcrypto debe estar instalada en el esquema extensions';

    -- rv_owner, dueño de las rutinas, puede usar pgcrypto.
    ASSERT has_schema_privilege('rv_owner', 'extensions', 'USAGE')
       AND has_function_privilege('rv_owner', 'extensions.crypt(text, text)', 'EXECUTE'),
        'rv_owner debe poder usar extensions.crypt';

    -- app_rv trabaja con la hora de Venezuela.
    ASSERT EXISTS (SELECT 1 FROM pg_db_role_setting s JOIN pg_roles r ON r.oid = s.setrole
                   WHERE r.rolname = 'app_rv' AND 'TimeZone=America/Caracas' = ANY (s.setconfig)),
        'app_rv debe usar la zona horaria America/Caracas';
END
$$;

-- Una función nueva de rv_owner no la puede ejecutar cualquiera: hace falta un GRANT.
SET LOCAL ROLE rv_owner;
CREATE FUNCTION rutasvzla.fn_prueba_privilegios() RETURNS integer LANGUAGE sql AS 'SELECT 1';
RESET ROLE;

DO $$
BEGIN
    ASSERT NOT has_function_privilege('public', 'rutasvzla.fn_prueba_privilegios()', 'EXECUTE'),
        'PUBLIC no debe poder ejecutar las funciones de rv_owner sin GRANT';
END
$$;

-- El patrón del inicio de sesión: una rutina SECURITY DEFINER de rv_owner, con
-- search_path fijo, que usa extensions.crypt y solo puede ejecutar rol_autenticacion.
SET LOCAL ROLE rv_owner;
-- Guarda el hash de 'clave' y compara la contraseña recibida contra él, como hará
-- fn_iniciar_sesion con la contraseña de CUENTA.
CREATE FUNCTION rutasvzla.fn_prueba_hash(p_clave text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER SET search_path = rutasvzla, pg_temp
    AS $$
DECLARE
    v_hash text := extensions.crypt('clave', extensions.gen_salt('bf'));
BEGIN
    RETURN extensions.crypt(p_clave, v_hash) = v_hash;
END
$$;
GRANT EXECUTE ON FUNCTION rutasvzla.fn_prueba_hash(text) TO rol_autenticacion;
RESET ROLE;

SET LOCAL ROLE rol_autenticacion;
DO $$
BEGIN
    ASSERT rutasvzla.fn_prueba_hash('clave'),
        'rol_autenticacion debe poder ejecutar una rutina que usa extensions.crypt';
    ASSERT NOT rutasvzla.fn_prueba_hash('otra'),
        'Una contraseña distinta no debe coincidir con el hash';
    ASSERT NOT has_function_privilege('rutasvzla.fn_prueba_privilegios()', 'EXECUTE'),
        'rol_autenticacion solo debe ejecutar las rutinas que se le otorgan';
END
$$;
RESET ROLE;

ROLLBACK;

\echo 'OK: 00_esquema'
