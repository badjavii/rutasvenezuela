-- 02_claves/movilidad-vias-y-tramos.sql · Responsable: Sebastián Armas
-- Tablas: via, via_modo, tramo, conecta
-- Spec: specs/mobility-routes/movilidad-vias-y-tramos/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- HU-15.1, criterio 2: la vía está en un municipio registrado.
-- Un municipio con vías no se elimina.
ALTER TABLE via
    ADD CONSTRAINT fk_via_municipio
    FOREIGN KEY (nombre_estado, nombre_municipio)
    REFERENCES municipio (nombre_estado, nombre_municipio)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- HU-15.4, criterio 1: eliminar la vía elimina sus modos.
ALTER TABLE via_modo
    ADD CONSTRAINT fk_via_modo_via
    FOREIGN KEY (nombre_estado, nombre_municipio, nombre_via)
    REFERENCES via (nombre_estado, nombre_municipio, nombre_via)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- HU-15.4, criterio 1: eliminar la vía elimina sus tramos.
ALTER TABLE tramo
    ADD CONSTRAINT fk_tramo_via
    FOREIGN KEY (nombre_estado, nombre_municipio, nombre_via)
    REFERENCES via (nombre_estado, nombre_municipio, nombre_via)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- HU-35.4, criterio 1: eliminar un tramo elimina sus conexiones.
ALTER TABLE conecta
    ADD CONSTRAINT fk_conecta_tramo_origen
    FOREIGN KEY (estado_origen, municipio_origen, via_origen, tramo_origen)
    REFERENCES tramo (nombre_estado, nombre_municipio, nombre_via, numero_tramo)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE conecta
    ADD CONSTRAINT fk_conecta_tramo_destino
    FOREIGN KEY (estado_destino, municipio_destino, via_destino, tramo_destino)
    REFERENCES tramo (nombre_estado, nombre_municipio, nombre_via, numero_tramo)
    ON UPDATE CASCADE
    ON DELETE CASCADE;
