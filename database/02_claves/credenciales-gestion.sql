-- 02_claves/credenciales-gestion.sql · Responsable: Valeria Loreto
-- Tablas: credencial_digital, adquiere, ampara, reserva_hito, reserva_comercio, valida
-- Spec: specs/actors-commerce/credenciales-gestion/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
