-- 01_tablas/movilidad-paradas.sql · Responsable: Sebastián Armas
-- Tablas: parada_transporte, equipamiento_urbano, se_localiza, esta_en, funciona, cercana
-- Spec: specs/mobility-routes/movilidad-paradas/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- Capítulo 6.2; HU-16.1. La parada se identifica por su código oficial de terminal
-- (HU-16.1, criterio 1).
-- nivel_adecuacion figura como lista cerrada en las convenciones, pero el informe no
-- define sus valores: queda sin CHECK hasta que el equipo los acuerde.
CREATE TABLE parada_transporte (
    codigo_terminal VARCHAR(30) NOT NULL,
    nombre_parada VARCHAR(100) NOT NULL,
    modalidad VARCHAR(30) NOT NULL,
    tarifa_basica NUMERIC(12,2) NOT NULL,
    nivel_adecuacion VARCHAR(30) NOT NULL,
    estado_parada VARCHAR(30) NOT NULL,
    frecuencia_paso INTEGER NOT NULL,
    aforo_maximo INTEGER NOT NULL,
    CONSTRAINT pk_parada_transporte PRIMARY KEY (codigo_terminal),
    -- RR-104
    CONSTRAINT ck_parada_transporte_estado CHECK (
        estado_parada IN ('activa', 'en mantenimiento', 'fuera de servicio')
    ),
    -- RR-104
    CONSTRAINT ck_parada_transporte_modalidad CHECK (
        modalidad IN ('metro', 'autobús', 'embarcadero', 'transporte por cable')
    ),
    -- RR-104
    CONSTRAINT ck_parada_transporte_tarifa CHECK (tarifa_basica >= 0),
    -- RR-104
    CONSTRAINT ck_parada_transporte_frecuencia CHECK (frecuencia_paso > 0),
    -- RR-104
    CONSTRAINT ck_parada_transporte_aforo CHECK (aforo_maximo > 0)
);

-- Atributo multivaluado de la parada (HU-16.1, criterio 4).
CREATE TABLE equipamiento_urbano (
    codigo_terminal VARCHAR(30) NOT NULL,
    tipo_equipamiento VARCHAR(100) NOT NULL,
    CONSTRAINT pk_equipamiento_urbano PRIMARY KEY (codigo_terminal, tipo_equipamiento),
    -- RR-105
    CONSTRAINT ck_equipamiento_urbano_tipo CHECK (
        tipo_equipamiento IN ('techo o marquesina', 'iluminación nocturna', 'taquilla', 'vigilancia',
                              'estacionamiento de transferencia', 'resguardo de bicicletas')
    )
);

-- Una ubicación por parada (HU-16.1, criterio 5). RR-31 es un trigger en 03_reglas.
CREATE TABLE se_localiza (
    codigo_terminal VARCHAR(30) NOT NULL,
    -- RR-20
    latitud NUMERIC(9,6) NOT NULL,
    longitud NUMERIC(9,6) NOT NULL,
    elevacion NUMERIC(10,2) NOT NULL,
    CONSTRAINT pk_se_localiza PRIMARY KEY (codigo_terminal)
);

-- Un tramo por parada (HU-16.1, criterio 6). RR-32 es un trigger en 03_reglas.
CREATE TABLE esta_en (
    codigo_terminal VARCHAR(30) NOT NULL,
    -- RR-21
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    nombre_via VARCHAR(100) NOT NULL,
    numero_tramo INTEGER NOT NULL,
    CONSTRAINT pk_esta_en PRIMARY KEY (codigo_terminal)
);

-- Horarios de la parada (HU-16.1, criterio 2). RR-33 y RR-101 son triggers en 03_reglas.
CREATE TABLE funciona (
    codigo_terminal VARCHAR(30) NOT NULL,
    dia_semana VARCHAR(30) NOT NULL,
    hora_apertura TIME NOT NULL,
    hora_cierre TIME NOT NULL,
    CONSTRAINT pk_funciona PRIMARY KEY (codigo_terminal, dia_semana, hora_apertura, hora_cierre)
);

-- Hitos cercanos a la parada (HU-16.1, criterio 7).
CREATE TABLE cercana (
    codigo_terminal VARCHAR(30) NOT NULL,
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    nombre_parroquia VARCHAR(100) NOT NULL,
    nombre_hito VARCHAR(100) NOT NULL,
    CONSTRAINT pk_cercana PRIMARY KEY (
        codigo_terminal, nombre_estado, nombre_municipio, nombre_parroquia, nombre_hito
    )
);
