-- 02_claves/territorio-catalogo.sql · Responsable: Javier Otero
-- Tablas: estado, municipio, parroquia
-- Spec: specs/territory-heritage/territorio-catalogo/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
