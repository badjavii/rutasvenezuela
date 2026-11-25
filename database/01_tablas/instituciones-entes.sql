-- 01_tablas/instituciones-entes.sql · Responsable: Javier Otero
-- Tablas: ente_publico, cuenta_ente_publico, competencia
-- Spec: specs/territory-heritage/instituciones-entes/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
