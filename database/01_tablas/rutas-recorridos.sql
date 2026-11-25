-- 01_tablas/rutas-recorridos.sql · Responsable: Sebastián Armas
-- Tablas: recorrido, realiza, sobre, transita
-- Spec: specs/mobility-routes/rutas-recorridos/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
