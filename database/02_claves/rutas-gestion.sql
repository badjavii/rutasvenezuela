-- 02_claves/rutas-gestion.sql · Responsable: Sebastián Armas
-- Tablas: ruta_turistica, ruta_fija, ruta_dinamica, conforma, usa, crea
-- Spec: specs/mobility-routes/rutas-gestion/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- La ruta está en un municipio registrado; un municipio con rutas no se elimina.
ALTER TABLE ruta_turistica
    ADD CONSTRAINT fk_ruta_turistica_municipio
    FOREIGN KEY (nombre_estado, nombre_municipio)
    REFERENCES municipio (nombre_estado, nombre_municipio)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- HU-17.4, criterio 1, y HU-25.4, criterio 2: eliminar la ruta elimina su tipo,
-- su secuencia y su creador. Lo que la bloquea son sobre, contrata_ruta,
-- transcurre y evalua_ruta (ON DELETE RESTRICT, en sus capacidades).
ALTER TABLE ruta_fija
    ADD CONSTRAINT fk_ruta_fija_ruta_turistica
    FOREIGN KEY (nombre_estado, nombre_municipio, nombre_ruta)
    REFERENCES ruta_turistica (nombre_estado, nombre_municipio, nombre_ruta)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE ruta_dinamica
    ADD CONSTRAINT fk_ruta_dinamica_ruta_turistica
    FOREIGN KEY (nombre_estado, nombre_municipio, nombre_ruta)
    REFERENCES ruta_turistica (nombre_estado, nombre_municipio, nombre_ruta)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE conforma
    ADD CONSTRAINT fk_conforma_ruta_turistica
    FOREIGN KEY (estado_ruta, municipio_ruta, nombre_ruta)
    REFERENCES ruta_turistica (nombre_estado, nombre_municipio, nombre_ruta)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE usa
    ADD CONSTRAINT fk_usa_ruta_turistica
    FOREIGN KEY (nombre_estado, nombre_municipio, nombre_ruta)
    REFERENCES ruta_turistica (nombre_estado, nombre_municipio, nombre_ruta)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE crea
    ADD CONSTRAINT fk_crea_ruta_dinamica
    FOREIGN KEY (nombre_estado, nombre_municipio, nombre_ruta)
    REFERENCES ruta_dinamica (nombre_estado, nombre_municipio, nombre_ruta)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- HU-16.4, criterio 2: una parada que forma parte de una ruta no se elimina.
ALTER TABLE usa
    ADD CONSTRAINT fk_usa_parada_transporte
    FOREIGN KEY (codigo_terminal)
    REFERENCES parada_transporte (codigo_terminal)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- Pendientes hasta que existan las tablas:
--   conforma (estado_hito, municipio_hito, parroquia_hito, nombre_hito) → hito (patrimonio-hitos, Javier)
--   crea (cedula_pasaporte) → visitante (actores-identidades, Valeria)
