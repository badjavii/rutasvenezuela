-- 02_claves/patrimonio-hitos.sql · Responsable: Javier Otero
-- Tablas: hito, categoria, clasifica, ubicacion_geografica, registra, horario, abre, se_ubica_en
-- Spec: specs/territory-heritage/patrimonio-hitos/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
