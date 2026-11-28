-- 02_claves/movilidad-paradas.sql · Responsable: Sebastián Armas
-- Tablas: parada_transporte, equipamiento_urbano, se_localiza, esta_en, funciona, cercana
-- Spec: specs/mobility-routes/movilidad-paradas/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- HU-16.4, criterio 1: eliminar la parada elimina sus datos (equipamiento,
-- ubicación, tramo, horarios e hitos cercanos). Lo que la bloquea es usa → parada
-- (rutas-gestion, ON DELETE RESTRICT; HU-16.4, criterio 2).
ALTER TABLE equipamiento_urbano
    ADD CONSTRAINT fk_equipamiento_urbano_parada_transporte
    FOREIGN KEY (codigo_terminal)
    REFERENCES parada_transporte (codigo_terminal)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE se_localiza
    ADD CONSTRAINT fk_se_localiza_parada_transporte
    FOREIGN KEY (codigo_terminal)
    REFERENCES parada_transporte (codigo_terminal)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE esta_en
    ADD CONSTRAINT fk_esta_en_parada_transporte
    FOREIGN KEY (codigo_terminal)
    REFERENCES parada_transporte (codigo_terminal)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE funciona
    ADD CONSTRAINT fk_funciona_parada_transporte
    FOREIGN KEY (codigo_terminal)
    REFERENCES parada_transporte (codigo_terminal)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE cercana
    ADD CONSTRAINT fk_cercana_parada_transporte
    FOREIGN KEY (codigo_terminal)
    REFERENCES parada_transporte (codigo_terminal)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- HU-15.4 y HU-35.4, criterio 2: un tramo con paradas no se elimina, y por eso
-- tampoco su vía.
ALTER TABLE esta_en
    ADD CONSTRAINT fk_esta_en_tramo
    FOREIGN KEY (nombre_estado, nombre_municipio, nombre_via, numero_tramo)
    REFERENCES tramo (nombre_estado, nombre_municipio, nombre_via, numero_tramo)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- Pendientes hasta que patrimonio-hitos (Javier) cree sus tablas:
--   se_localiza (latitud, longitud, elevacion) → ubicacion_geografica
--   funciona (dia_semana, hora_apertura, hora_cierre) → horario
--   cercana (nombre_estado, nombre_municipio, nombre_parroquia, nombre_hito) → hito
