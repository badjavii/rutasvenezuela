-- 01_tablas/movilidad-vias-y-tramos.sql · Responsable: Sebastián Armas
-- Tablas: via, via_modo, tramo, conecta
-- Spec: specs/mobility-routes/movilidad-vias-y-tramos/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- Capítulo 6.2: claves naturales; HU-15.1 y HU-35.1.
-- La vía se identifica por su nombre dentro del municipio (HU-15.1, criterio 3).
CREATE TABLE via (
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    nombre_via VARCHAR(100) NOT NULL,
    tipo_via VARCHAR(30) NOT NULL,
    condicion_terreno VARCHAR(100) NOT NULL,
    estado_via VARCHAR(30) NOT NULL,
    CONSTRAINT pk_via PRIMARY KEY (nombre_estado, nombre_municipio, nombre_via),
    -- RR-102
    CONSTRAINT ck_via_tipo CHECK (
        tipo_via IN ('calle', 'avenida', 'bulevar', 'caminería', 'sendero', 'puente', 'otro')
    ),
    -- RR-102
    CONSTRAINT ck_via_estado CHECK (
        estado_via IN ('habilitada', 'cierre total por mantenimiento')
    )
);

-- Atributo multivaluado de la vía: un modo por fila.
-- RR-30 (al menos un modo) es un trigger diferido en 03_reglas.
CREATE TABLE via_modo (
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    nombre_via VARCHAR(100) NOT NULL,
    modo VARCHAR(30) NOT NULL,
    CONSTRAINT pk_via_modo PRIMARY KEY (nombre_estado, nombre_municipio, nombre_via, modo),
    -- RR-102
    CONSTRAINT ck_via_modo_modo CHECK (
        modo IN ('a pie', 'bicicleta', 'transporte público', 'vehículo adaptado')
    )
);

-- Entidad débil de la vía: el número de tramo se repite entre vías, no dentro de una.
-- RR-29 (al menos un tramo) es un trigger diferido en 03_reglas.
CREATE TABLE tramo (
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    nombre_via VARCHAR(100) NOT NULL,
    numero_tramo INTEGER NOT NULL,
    tiene_escalinata BOOLEAN NOT NULL,
    tiene_desnivel BOOLEAN NOT NULL,
    CONSTRAINT pk_tramo PRIMARY KEY (nombre_estado, nombre_municipio, nombre_via, numero_tramo)
);

-- Interrelación recursiva de tramo. Cada conexión se guarda una vez y se lee
-- en los dos sentidos (sección 8 de la spec).
CREATE TABLE conecta (
    estado_origen VARCHAR(100) NOT NULL,
    municipio_origen VARCHAR(100) NOT NULL,
    via_origen VARCHAR(100) NOT NULL,
    tramo_origen INTEGER NOT NULL,
    estado_destino VARCHAR(100) NOT NULL,
    municipio_destino VARCHAR(100) NOT NULL,
    via_destino VARCHAR(100) NOT NULL,
    tramo_destino INTEGER NOT NULL,
    CONSTRAINT pk_conecta PRIMARY KEY (
        estado_origen, municipio_origen, via_origen, tramo_origen,
        estado_destino, municipio_destino, via_destino, tramo_destino
    ),
    -- RR-103
    CONSTRAINT ck_conecta_distintos CHECK (
        (estado_origen, municipio_origen, via_origen, tramo_origen)
        <> (estado_destino, municipio_destino, via_destino, tramo_destino)
    )
);
