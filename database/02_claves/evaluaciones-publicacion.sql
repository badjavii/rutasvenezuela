-- 02_claves/evaluaciones-publicacion.sql · Responsable: Javier Otero
-- Tablas: evaluacion_experiencia, respaldada_por, evalua_hito, evalua_ruta
-- Spec: specs/territory-heritage/evaluaciones-publicacion/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
