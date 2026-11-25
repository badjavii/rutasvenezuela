-- 01_tablas/evaluaciones-publicacion.sql · Responsable: Javier Otero
-- Tablas: evaluacion_experiencia, respaldada_por, evalua_hito, evalua_ruta
-- Spec: specs/territory-heritage/evaluaciones-publicacion/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
