-- Corre todas las pruebas SQL. Se ejecuta después de build.sql:
--   psql "$DATABASE_URL" -f database/test.sql
-- Se detiene en la primera prueba que falla.

-- Los scripts están en UTF-8. Sin esta línea, psql en Windows puede leerlos con la
-- codificación de la consola y guardar mal las tildes de los CHECK ('caminería').
\encoding UTF8
\set ON_ERROR_STOP on

\ir tests/00_esquema.sql
\ir tests/territorio-catalogo.sql
\ir tests/movilidad-vias-y-tramos.sql
\ir tests/movilidad-paradas.sql
