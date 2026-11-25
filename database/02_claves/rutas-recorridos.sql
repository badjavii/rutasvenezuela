-- 02_claves/rutas-recorridos.sql · Responsable: Sebastián Armas
-- Tablas: recorrido, realiza, sobre, transita
-- Spec: specs/mobility-routes/rutas-recorridos/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
