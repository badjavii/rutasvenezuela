-- 02_claves/territorio-catalogo.sql · Responsable: Javier Otero
-- Tablas: estado, municipio, parroquia
-- Spec: specs/territory-heritage/territorio-catalogo/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- HU-33.1/3/4: cada municipio pertenece a un estado existente.
-- Las modificaciones de claves naturales conservan las relaciones;
-- las eliminaciones con dependientes quedan prohibidas.
ALTER TABLE municipio
    ADD CONSTRAINT fk_municipio_estado
    FOREIGN KEY (nombre_estado)
    REFERENCES estado (nombre_estado)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- HU-34.1/3/4: cada parroquia pertenece al municipio del estado indicado.
ALTER TABLE parroquia
    ADD CONSTRAINT fk_parroquia_municipio
    FOREIGN KEY (nombre_estado, nombre_municipio)
    REFERENCES municipio (nombre_estado, nombre_municipio)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;
