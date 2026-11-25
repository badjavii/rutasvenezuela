-- 02_claves/rutas-gestion.sql · Responsable: Sebastián Armas
-- Tablas: ruta_turistica, ruta_fija, ruta_dinamica, conforma, usa, crea
-- Spec: specs/mobility-routes/rutas-gestion/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
