-- 01_tablas/territorio-catalogo.sql · Responsable: Javier Otero
-- Tablas: estado, municipio, parroquia
-- Spec: specs/territory-heritage/territorio-catalogo/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- Capítulo 6.1: claves naturales; HU-12.1, HU-33.1 y HU-34.1.
CREATE TABLE estado (
    nombre_estado VARCHAR(100) NOT NULL,
    CONSTRAINT pk_estado PRIMARY KEY (nombre_estado)
);

CREATE TABLE municipio (
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    CONSTRAINT pk_municipio PRIMARY KEY (nombre_estado, nombre_municipio)
);

CREATE TABLE parroquia (
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    nombre_parroquia VARCHAR(100) NOT NULL,
    CONSTRAINT pk_parroquia PRIMARY KEY (
        nombre_estado, nombre_municipio, nombre_parroquia
    )
);
