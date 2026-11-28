-- 02_claves/rutas-recorridos.sql · Responsable: Sebastián Armas
-- Tablas: recorrido, realiza, sobre, transita
-- Spec: specs/mobility-routes/rutas-recorridos/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- HU-28, criterios 5 y 6: los recorridos quedan en el historial y no hay rutinas
-- para eliminarlos. Sus datos usan la acción por defecto, ON DELETE RESTRICT.
ALTER TABLE realiza
    ADD CONSTRAINT fk_realiza_recorrido
    FOREIGN KEY (id_recorrido)
    REFERENCES recorrido (id_recorrido)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

ALTER TABLE sobre
    ADD CONSTRAINT fk_sobre_recorrido
    FOREIGN KEY (id_recorrido)
    REFERENCES recorrido (id_recorrido)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

ALTER TABLE transita
    ADD CONSTRAINT fk_transita_recorrido
    FOREIGN KEY (id_recorrido)
    REFERENCES recorrido (id_recorrido)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- HU-17.4, criterio 2, y HU-25.4, criterio 3: una ruta con recorridos no se
-- elimina, para conservar su historial.
ALTER TABLE sobre
    ADD CONSTRAINT fk_sobre_ruta_turistica
    FOREIGN KEY (nombre_estado, nombre_municipio, nombre_ruta)
    REFERENCES ruta_turistica (nombre_estado, nombre_municipio, nombre_ruta)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- Pendientes hasta que existan las tablas:
--   realiza (cedula_pasaporte) → visitante (actores-identidades, Valeria)
--   transita (nombre_estado, nombre_municipio, nombre_parroquia, nombre_hito) → hito (patrimonio-hitos, Javier)
