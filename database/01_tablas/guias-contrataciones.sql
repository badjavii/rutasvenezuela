-- 01_tablas/guias-contrataciones.sql · Responsable: Sebastián Armas
-- Tablas: guia, cuenta_guia, guia_idioma, guia_especialidad, trabaja, sirve, contratacion, contrata_visitante, contrata_guia, contrata_ruta
-- Spec: specs/mobility-routes/guias-contrataciones/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
