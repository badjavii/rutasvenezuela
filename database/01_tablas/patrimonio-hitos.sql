-- 01_tablas/patrimonio-hitos.sql · Responsable: Javier Otero
-- Tablas: hito, categoria, clasifica, ubicacion_geografica, registra, horario, abre, se_ubica_en
-- Spec: specs/territory-heritage/patrimonio-hitos/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
