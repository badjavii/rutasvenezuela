-- 02_claves/movilidad-vias-y-tramos.sql · Responsable: Sebastián Armas
-- Tablas: via, via_modo, tramo, conecta
-- Spec: specs/mobility-routes/movilidad-vias-y-tramos/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
