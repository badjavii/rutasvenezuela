-- 02_claves/instituciones-entes.sql · Responsable: Javier Otero
-- Tablas: ente_publico, cuenta_ente_publico, competencia
-- Spec: specs/territory-heritage/instituciones-entes/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
