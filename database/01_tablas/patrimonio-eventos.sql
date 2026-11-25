-- 01_tablas/patrimonio-eventos.sql · Responsable: Javier Otero
-- Tablas: evento
-- Spec: specs/territory-heritage/patrimonio-eventos/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
