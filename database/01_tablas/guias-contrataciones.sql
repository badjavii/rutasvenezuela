-- 01_tablas/guias-contrataciones.sql · Responsable: Sebastián Armas
-- Tablas: guia, cuenta_guia, guia_idioma, guia_especialidad, trabaja, sirve, contratacion, contrata_visitante, contrata_guia, contrata_ruta
-- Spec: specs/mobility-routes/guias-contrataciones/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- Capítulo 6.2. El guía se identifica por su RTN y su código de licencia
-- (HU-29.1, criterios 1 y 2).
CREATE TABLE guia (
    rtn VARCHAR(30) NOT NULL,
    codigo_licencia VARCHAR(30) NOT NULL,
    acreditacion VARCHAR(100) NOT NULL,
    anios_trayectoria INTEGER NOT NULL,
    tarifa_horaria NUMERIC(12,2) NOT NULL,
    CONSTRAINT pk_guia PRIMARY KEY (rtn, codigo_licencia),
    -- RR-116
    CONSTRAINT ck_guia_trayectoria CHECK (anios_trayectoria >= 0),
    -- RR-116
    CONSTRAINT ck_guia_tarifa CHECK (tarifa_horaria > 0)
);

-- Cuenta del guía: una por guía. RR-37 está en 03_reglas.
CREATE TABLE cuenta_guia (
    rtn VARCHAR(30) NOT NULL,
    codigo_licencia VARCHAR(30) NOT NULL,
    -- RR-23
    id_cuenta INTEGER NOT NULL,
    CONSTRAINT pk_cuenta_guia PRIMARY KEY (rtn, codigo_licencia),
    -- RR-23
    CONSTRAINT uq_cuenta_guia_cuenta UNIQUE (id_cuenta)
);

-- Idiomas del guía. RR-38 está en 03_reglas.
CREATE TABLE guia_idioma (
    rtn VARCHAR(30) NOT NULL,
    codigo_licencia VARCHAR(30) NOT NULL,
    idioma VARCHAR(100) NOT NULL,
    CONSTRAINT pk_guia_idioma PRIMARY KEY (rtn, codigo_licencia, idioma)
);

-- Especialidades del guía. RR-39 está en 03_reglas.
CREATE TABLE guia_especialidad (
    rtn VARCHAR(30) NOT NULL,
    codigo_licencia VARCHAR(30) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    CONSTRAINT pk_guia_especialidad PRIMARY KEY (rtn, codigo_licencia, especialidad)
);

-- Zonas (municipios) del guía. RR-40 está en 03_reglas.
CREATE TABLE trabaja (
    rtn VARCHAR(30) NOT NULL,
    codigo_licencia VARCHAR(30) NOT NULL,
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    CONSTRAINT pk_trabaja PRIMARY KEY (rtn, codigo_licencia, nombre_estado, nombre_municipio)
);

-- Guías adscritos a cada ruta fija (HU-28, criterio 1). RR-117 está en 03_reglas.
CREATE TABLE sirve (
    rtn VARCHAR(30) NOT NULL,
    codigo_licencia VARCHAR(30) NOT NULL,
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    nombre_ruta VARCHAR(100) NOT NULL,
    CONSTRAINT pk_sirve PRIMARY KEY (rtn, codigo_licencia, nombre_estado, nombre_municipio, nombre_ruta)
);

-- Contratación de un guía (VA-3, criterio 3). El número lo genera el gestor;
-- la fecha es el día del recorrido acompañado (sección 8 de la spec).
-- RR-41 a RR-43 y RR-118 están en 03_reglas.
CREATE TABLE contratacion (
    nro_contratacion INTEGER GENERATED ALWAYS AS IDENTITY,
    fecha_contratacion DATE NOT NULL,
    CONSTRAINT pk_contratacion PRIMARY KEY (nro_contratacion)
);

-- Visitante que contrata: uno por contratación.
CREATE TABLE contrata_visitante (
    nro_contratacion INTEGER NOT NULL,
    -- RR-24
    cedula_pasaporte VARCHAR(30) NOT NULL,
    CONSTRAINT pk_contrata_visitante PRIMARY KEY (nro_contratacion)
);

-- Guía contratado: uno por contratación.
CREATE TABLE contrata_guia (
    nro_contratacion INTEGER NOT NULL,
    -- RR-25
    rtn VARCHAR(30) NOT NULL,
    codigo_licencia VARCHAR(30) NOT NULL,
    CONSTRAINT pk_contrata_guia PRIMARY KEY (nro_contratacion)
);

-- Ruta fija contratada: una por contratación.
CREATE TABLE contrata_ruta (
    nro_contratacion INTEGER NOT NULL,
    -- RR-26
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    nombre_ruta VARCHAR(100) NOT NULL,
    CONSTRAINT pk_contrata_ruta PRIMARY KEY (nro_contratacion)
);
