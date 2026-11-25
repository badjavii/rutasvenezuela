-- 01_tablas/territorio-catalogo.sql · Responsable: Javier Otero
-- Tablas: estado, municipio, parroquia
-- Spec: specs/territory-heritage/territorio-catalogo/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
