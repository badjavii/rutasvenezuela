-- 01_tablas/actores-comercios.sql · Responsable: Valeria Loreto
-- Tablas: comercio, cuenta_comercio, ubicado, disponible
-- Spec: specs/actors-commerce/actores-comercios/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
