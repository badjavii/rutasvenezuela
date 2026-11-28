-- build.sql
-- Construye la base de RutasVenezuela desde cero:
--   psql "$DATABASE_URL" -f database/build.sql
-- Todo corre en una sola transacción: si algo falla, la base queda como estaba.

-- Los scripts están en UTF-8. Sin esta línea, psql en Windows puede leerlos con la
-- codificación de la consola y guardar mal las tildes de los CHECK ('caminería').
\encoding UTF8
\set ON_ERROR_STOP on

BEGIN;

-- Solo se muestran advertencias y errores, no los avisos de «ya existe».
SET LOCAL client_min_messages = warning;

\ir 00_esquema.sql

-- Desde aquí los objetos se crean como rv_owner, dentro de rutasvzla.
SET LOCAL ROLE rv_owner;
SET LOCAL search_path TO rutasvzla, public, extensions;

-- 1. Tablas, sin claves foráneas (el orden no importa).
\ir 01_tablas/actores-comercios.sql
\ir 01_tablas/actores-identidades.sql
\ir 01_tablas/credenciales-gestion.sql
\ir 01_tablas/evaluaciones-publicacion.sql
\ir 01_tablas/guias-contrataciones.sql
\ir 01_tablas/incidencias-gestion.sql
\ir 01_tablas/instituciones-entes.sql
\ir 01_tablas/movilidad-paradas.sql
\ir 01_tablas/movilidad-vias-y-tramos.sql
\ir 01_tablas/patrimonio-anclajes-3d.sql
\ir 01_tablas/patrimonio-eventos.sql
\ir 01_tablas/patrimonio-hitos.sql
\ir 01_tablas/promociones-experiencias.sql
\ir 01_tablas/rutas-gestion.sql
\ir 01_tablas/rutas-recorridos.sql
\ir 01_tablas/territorio-catalogo.sql

-- 2. Claves foráneas, cuando ya existen todas las tablas.
\ir 02_claves/actores-comercios.sql
\ir 02_claves/actores-identidades.sql
\ir 02_claves/credenciales-gestion.sql
\ir 02_claves/evaluaciones-publicacion.sql
\ir 02_claves/guias-contrataciones.sql
\ir 02_claves/incidencias-gestion.sql
\ir 02_claves/instituciones-entes.sql
\ir 02_claves/movilidad-paradas.sql
\ir 02_claves/movilidad-vias-y-tramos.sql
\ir 02_claves/patrimonio-anclajes-3d.sql
\ir 02_claves/patrimonio-eventos.sql
\ir 02_claves/patrimonio-hitos.sql
\ir 02_claves/promociones-experiencias.sql
\ir 02_claves/rutas-gestion.sql
\ir 02_claves/rutas-recorridos.sql
\ir 02_claves/territorio-catalogo.sql

-- 3. Reglas: triggers, funciones y procedimientos, cuando ya existen las claves.
\ir 03_reglas/actores-comercios.sql
\ir 03_reglas/actores-identidades.sql
\ir 03_reglas/credenciales-gestion.sql
\ir 03_reglas/evaluaciones-publicacion.sql
\ir 03_reglas/guias-contrataciones.sql
\ir 03_reglas/incidencias-gestion.sql
\ir 03_reglas/instituciones-entes.sql
\ir 03_reglas/movilidad-paradas.sql
\ir 03_reglas/movilidad-vias-y-tramos.sql
\ir 03_reglas/patrimonio-anclajes-3d.sql
\ir 03_reglas/patrimonio-eventos.sql
\ir 03_reglas/patrimonio-hitos.sql
\ir 03_reglas/promociones-experiencias.sql
\ir 03_reglas/rutas-gestion.sql
\ir 03_reglas/rutas-recorridos.sql
\ir 03_reglas/territorio-catalogo.sql

-- 4 y 5. Seguridad (04_seguridad) y datos de prueba (05_datos):
-- se agregan aquí en la fase 2, con el mismo patrón de un archivo por capacidad.

COMMIT;
