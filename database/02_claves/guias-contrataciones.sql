-- 02_claves/guias-contrataciones.sql · Responsable: Sebastián Armas
-- Tablas: guia, cuenta_guia, guia_idioma, guia_especialidad, trabaja, sirve, contratacion, contrata_visitante, contrata_guia, contrata_ruta
-- Spec: specs/mobility-routes/guias-contrataciones/spec.md (sección 5)
-- ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY de las tablas de esta capacidad.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- HU-29.4, criterio 1: eliminar un guía elimina su cuenta, idiomas, especialidades
-- y zonas (sección 8 de la spec).
ALTER TABLE cuenta_guia
    ADD CONSTRAINT fk_cuenta_guia_guia
    FOREIGN KEY (rtn, codigo_licencia)
    REFERENCES guia (rtn, codigo_licencia)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE guia_idioma
    ADD CONSTRAINT fk_guia_idioma_guia
    FOREIGN KEY (rtn, codigo_licencia)
    REFERENCES guia (rtn, codigo_licencia)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE guia_especialidad
    ADD CONSTRAINT fk_guia_especialidad_guia
    FOREIGN KEY (rtn, codigo_licencia)
    REFERENCES guia (rtn, codigo_licencia)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE trabaja
    ADD CONSTRAINT fk_trabaja_guia
    FOREIGN KEY (rtn, codigo_licencia)
    REFERENCES guia (rtn, codigo_licencia)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Un municipio con zonas de guías no se elimina: acción por defecto.
ALTER TABLE trabaja
    ADD CONSTRAINT fk_trabaja_municipio
    FOREIGN KEY (nombre_estado, nombre_municipio)
    REFERENCES municipio (nombre_estado, nombre_municipio)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- HU-29.4, criterio 2: un guía adscrito a una ruta no se elimina.
ALTER TABLE sirve
    ADD CONSTRAINT fk_sirve_guia
    FOREIGN KEY (rtn, codigo_licencia)
    REFERENCES guia (rtn, codigo_licencia)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- HU-17.4, criterio 1: eliminar una ruta fija elimina sus adscripciones de guías
-- (sección 8 de rutas-gestion). Solo se adscriben guías a rutas fijas (HU-28).
ALTER TABLE sirve
    ADD CONSTRAINT fk_sirve_ruta_fija
    FOREIGN KEY (nombre_estado, nombre_municipio, nombre_ruta)
    REFERENCES ruta_fija (nombre_estado, nombre_municipio, nombre_ruta)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- No hay rutinas para eliminar contrataciones: acción por defecto.
ALTER TABLE contrata_visitante
    ADD CONSTRAINT fk_contrata_visitante_contratacion
    FOREIGN KEY (nro_contratacion)
    REFERENCES contratacion (nro_contratacion)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

ALTER TABLE contrata_guia
    ADD CONSTRAINT fk_contrata_guia_contratacion
    FOREIGN KEY (nro_contratacion)
    REFERENCES contratacion (nro_contratacion)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

ALTER TABLE contrata_ruta
    ADD CONSTRAINT fk_contrata_ruta_contratacion
    FOREIGN KEY (nro_contratacion)
    REFERENCES contratacion (nro_contratacion)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- HU-29.4, criterio 2: un guía con contrataciones no se elimina.
ALTER TABLE contrata_guia
    ADD CONSTRAINT fk_contrata_guia_guia
    FOREIGN KEY (rtn, codigo_licencia)
    REFERENCES guia (rtn, codigo_licencia)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- HU-17.4, criterio 2: una ruta fija con contrataciones de guía no se elimina.
-- VA-3: solo se contratan guías para rutas fijas.
ALTER TABLE contrata_ruta
    ADD CONSTRAINT fk_contrata_ruta_ruta_fija
    FOREIGN KEY (nombre_estado, nombre_municipio, nombre_ruta)
    REFERENCES ruta_fija (nombre_estado, nombre_municipio, nombre_ruta)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- Pendientes hasta que existan las tablas:
--   cuenta_guia (id_cuenta) → cuenta (actores-identidades, Valeria)
--   contrata_visitante (cedula_pasaporte) → visitante (actores-identidades, Valeria)
