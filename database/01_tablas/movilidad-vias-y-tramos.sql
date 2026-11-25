-- 01_tablas/movilidad-vias-y-tramos.sql · Responsable: Sebastián Armas
-- Tablas: via, via_modo, tramo, conecta
-- Spec: specs/mobility-routes/movilidad-vias-y-tramos/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
