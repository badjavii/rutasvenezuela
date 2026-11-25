-- Corre todas las pruebas SQL. Se ejecuta después de build.sql:
--   psql "$DATABASE_URL" -f database/test.sql
-- Se detiene en la primera prueba que falla.

\set ON_ERROR_STOP on

\ir tests/00_esquema.sql
\ir tests/territorio-catalogo.sql
