-- 02_claves/incidencias-gestion.sql · Responsable: Javier Otero
-- Tablas: incidencia, genera, afecta_hito, afecta_tramo, verifica, prorroga, cierra
-- Spec: specs/territory-heritage/incidencias-gestion/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
