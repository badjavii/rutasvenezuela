-- 01_tablas/credenciales-gestion.sql · Responsable: Valeria Loreto
-- Tablas: credencial_digital, adquiere, ampara, reserva_hito, reserva_comercio, valida
-- Spec: specs/actors-commerce/credenciales-gestion/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
