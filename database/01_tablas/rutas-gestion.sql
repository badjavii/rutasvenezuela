-- 01_tablas/rutas-gestion.sql · Responsable: Sebastián Armas
-- Tablas: ruta_turistica, ruta_fija, ruta_dinamica, conforma, usa, crea
-- Spec: specs/mobility-routes/rutas-gestion/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- Capítulo 6.2. La ruta se identifica por su nombre dentro del municipio de origen
-- (HU-17.1, criterio 5; HU-25.1, criterio 4).
-- duracion_estimada, mejor_horario_inicio y nivel_dificultad admiten null porque la
-- ruta dinámica puede dejarlos en blanco (cap. 6, «Atributos opcionales»); en la
-- fija los exige RR-107 (03_reglas).
-- nivel_dificultad figura como lista cerrada en las convenciones, pero el informe no
-- define sus valores: queda sin CHECK hasta que el equipo los acuerde.
CREATE TABLE ruta_turistica (
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    nombre_ruta VARCHAR(100) NOT NULL,
    duracion_estimada INTEGER,
    mejor_horario_inicio TIME,
    nivel_dificultad VARCHAR(30),
    CONSTRAINT pk_ruta_turistica PRIMARY KEY (nombre_estado, nombre_municipio, nombre_ruta),
    -- RR-106
    CONSTRAINT ck_ruta_turistica_duracion CHECK (duracion_estimada IS NULL OR duracion_estimada > 0)
);

-- Subclase fija. RR-35 (fija o dinámica, exactamente una) y RR-107 están en 03_reglas.
CREATE TABLE ruta_fija (
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    nombre_ruta VARCHAR(100) NOT NULL,
    CONSTRAINT pk_ruta_fija PRIMARY KEY (nombre_estado, nombre_municipio, nombre_ruta)
);

-- Subclase dinámica (HU-25.1, criterios 1 y 3).
CREATE TABLE ruta_dinamica (
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    nombre_ruta VARCHAR(100) NOT NULL,
    visibilidad VARCHAR(30) NOT NULL,
    preferencia_transporte VARCHAR(30) NOT NULL,
    CONSTRAINT pk_ruta_dinamica PRIMARY KEY (nombre_estado, nombre_municipio, nombre_ruta),
    -- RR-106
    CONSTRAINT ck_ruta_dinamica_visibilidad CHECK (visibilidad IN ('privada', 'pública')),
    -- RR-106
    CONSTRAINT ck_ruta_dinamica_preferencia CHECK (
        preferencia_transporte IN ('a pie', 'bicicleta', 'transporte público', 'vehículo adaptado')
    )
);

-- Hitos de la ruta con su orden (HU-17.1, criterio 1). Hitos y paradas comparten
-- una sola numeración (sección 8 de la spec).
-- uq_conforma_orden es diferible: se verifica al confirmar, como el resto de la
-- secuencia, para poder renumerar sin choques intermedios.
-- RR-111 tampoco es un CHECK: al renombrar un municipio, ON UPDATE CASCADE cambia el
-- municipio de la ruta y el del hito en pasos distintos. Está en 03_reglas.
CREATE TABLE conforma (
    estado_ruta VARCHAR(100) NOT NULL,
    municipio_ruta VARCHAR(100) NOT NULL,
    nombre_ruta VARCHAR(100) NOT NULL,
    estado_hito VARCHAR(100) NOT NULL,
    municipio_hito VARCHAR(100) NOT NULL,
    parroquia_hito VARCHAR(100) NOT NULL,
    nombre_hito VARCHAR(100) NOT NULL,
    orden INTEGER NOT NULL,
    CONSTRAINT pk_conforma PRIMARY KEY (
        estado_ruta, municipio_ruta, nombre_ruta,
        estado_hito, municipio_hito, parroquia_hito, nombre_hito
    ),
    -- RR-108
    CONSTRAINT uq_conforma_orden UNIQUE (estado_ruta, municipio_ruta, nombre_ruta, orden)
        DEFERRABLE INITIALLY DEFERRED,
    -- RR-108
    CONSTRAINT ck_conforma_orden CHECK (orden >= 1)
);

-- Paradas de la ruta con su orden.
CREATE TABLE usa (
    codigo_terminal VARCHAR(30) NOT NULL,
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    nombre_ruta VARCHAR(100) NOT NULL,
    orden INTEGER NOT NULL,
    CONSTRAINT pk_usa PRIMARY KEY (codigo_terminal, nombre_estado, nombre_municipio, nombre_ruta),
    -- RR-108
    CONSTRAINT uq_usa_orden UNIQUE (nombre_estado, nombre_municipio, nombre_ruta, orden)
        DEFERRABLE INITIALLY DEFERRED,
    -- RR-108
    CONSTRAINT ck_usa_orden CHECK (orden >= 1)
);

-- Visitante que creó la ruta dinámica: uno por ruta. RR-36 está en 03_reglas.
CREATE TABLE crea (
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    nombre_ruta VARCHAR(100) NOT NULL,
    -- RR-22
    cedula_pasaporte VARCHAR(30) NOT NULL,
    CONSTRAINT pk_crea PRIMARY KEY (nombre_estado, nombre_municipio, nombre_ruta)
);
