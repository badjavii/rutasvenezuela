-- 01_tablas/patrimonio-anclajes-3d.sql · Responsable: Javier Otero
-- Tablas: punto_geoespacial, punto_hipervinculo, recurso_3d, proyecta
-- Spec: specs/territory-heritage/patrimonio-anclajes-3d/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
