-- 02_claves/actores-identidades.sql · Responsable: Valeria Loreto
-- Tablas: cuenta, visitante, cuenta_visitante, funcionario, cuenta_funcionario, pertenece_a, administrador, cuenta_administrador
-- Spec: specs/actors-commerce/actores-identidades/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;
