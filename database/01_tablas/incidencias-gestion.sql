-- 01_tablas/incidencias-gestion.sql · Responsable: Javier Otero
-- Tablas: incidencia, genera, afecta_hito, afecta_tramo, verifica, prorroga, cierra
-- Spec: specs/territory-heritage/incidencias-gestion/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
