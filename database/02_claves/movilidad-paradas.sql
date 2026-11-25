-- 02_claves/movilidad-paradas.sql · Responsable: Sebastián Armas
-- Tablas: parada_transporte, equipamiento_urbano, se_localiza, esta_en, funciona, cercana
-- Spec: specs/mobility-routes/movilidad-paradas/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
