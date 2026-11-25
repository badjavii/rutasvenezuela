-- 02_claves/patrimonio-anclajes-3d.sql · Responsable: Javier Otero
-- Tablas: punto_geoespacial, punto_hipervinculo, recurso_3d, proyecta
-- Spec: specs/territory-heritage/patrimonio-anclajes-3d/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
