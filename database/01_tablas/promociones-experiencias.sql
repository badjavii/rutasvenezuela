-- 01_tablas/promociones-experiencias.sql · Responsable: Valeria Loreto
-- Tablas: experiencia_turistica, promueve, dirige, transcurre, incluye, incluye_comercio
-- Spec: specs/actors-commerce/promociones-experiencias/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
