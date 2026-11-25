-- Prueba de 00_esquema.sql: esquema, roles, extensión y privilegios base.
-- Se ejecuta después de build.sql. Todo va dentro de BEGIN … ROLLBACK,
-- así que la prueba no deja nada en la base.

BEGIN;

DO $$
BEGIN
    -- El esquema existe y su dueño es rv_owner.
    ASSERT (SELECT nspowner::regrole::text FROM pg_namespace WHERE nspname = 'rutasvzla') = 'rv_owner',
        'El esquema rutasvzla no existe o su dueño no es rv_owner';

    -- Los seis roles de actor existen y no pueden iniciar sesión.
    ASSERT (SELECT count(*) FROM pg_roles
            WHERE rolname IN ('rol_visitante', 'rol_guia', 'rol_comercio',
                              'rol_ente', 'rol_funcionario', 'rol_administrador')
              AND NOT rolcanlogin) = 6,
        'Faltan roles de actor o alguno puede iniciar sesión';

    -- rv_owner existe y no puede iniciar sesión.
    ASSERT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'rv_owner' AND NOT rolcanlogin),
        'rv_owner no existe o puede iniciar sesión';

    -- app_rv inicia sesión y no hereda privilegios.
    ASSERT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'app_rv' AND rolcanlogin AND NOT rolinherit),
        'app_rv debe ser LOGIN NOINHERIT';

    -- app_rv es miembro de los seis roles de actor, y de ningún otro rol del proyecto.
    ASSERT (SELECT count(*) FROM pg_auth_members m
            JOIN pg_roles r ON r.oid = m.roleid
            JOIN pg_roles u ON u.oid = m.member
            WHERE u.rolname = 'app_rv' AND r.rolname LIKE 'rol\_%') = 6,
        'app_rv no es miembro de los seis roles de actor';
    ASSERT NOT pg_has_role('app_rv', 'rv_owner', 'MEMBER'),
        'app_rv no debe ser miembro de rv_owner';

    -- Sin SET ROLE, app_rv no puede ni entrar al esquema.
    ASSERT NOT has_schema_privilege('app_rv', 'rutasvzla', 'USAGE'),
        'app_rv no debe tener privilegios propios sobre rutasvzla';

    -- Cada rol de actor sí puede entrar al esquema.
    ASSERT has_schema_privilege('rol_visitante', 'rutasvzla', 'USAGE')
       AND has_schema_privilege('rol_administrador', 'rutasvzla', 'USAGE'),
        'Los roles de actor deben poder usar rutasvzla';

    -- Ningún otro usuario de la base entra al esquema.
    ASSERT NOT has_schema_privilege('public', 'rutasvzla', 'USAGE'),
        'PUBLIC no debe poder usar rutasvzla';

    -- pgcrypto está instalada.
    ASSERT EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'pgcrypto'),
        'Falta la extensión pgcrypto';

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

ROLLBACK;

\echo 'OK: 00_esquema'
