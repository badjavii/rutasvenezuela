-- 01_tablas/rutas-recorridos.sql · Responsable: Sebastián Armas
-- Tablas: recorrido, realiza, sobre, transita
-- Spec: specs/mobility-routes/rutas-recorridos/spec.md (sección 5)
-- CREATE TABLE con clave primaria, NOT NULL, UNIQUE y CHECK simples, sin claves foráneas.
-- Cada restricción que implementa una RR lleva su comentario -- RR-n.

SET search_path TO rutasvzla, public, extensions;

-- Capítulo 6.2; HU-28. El identificador lo genera el gestor (criterio 1).
-- Un recorrido en curso no tiene fin ni estado; uno terminado tiene los dos.
CREATE TABLE recorrido (
    id_recorrido INTEGER GENERATED ALWAYS AS IDENTITY,
    fecha_hora_inicio TIMESTAMP NOT NULL,
    fecha_hora_fin TIMESTAMP,
    estado_recorrido VARCHAR(30),
    CONSTRAINT pk_recorrido PRIMARY KEY (id_recorrido),
    -- RR-113
    CONSTRAINT ck_recorrido_terminado CHECK ((fecha_hora_fin IS NULL) = (estado_recorrido IS NULL)),
    -- RR-113
    CONSTRAINT ck_recorrido_estado CHECK (estado_recorrido IN ('completado', 'abandonado')),
    -- RR-113
    CONSTRAINT ck_recorrido_fin_posterior CHECK (fecha_hora_fin > fecha_hora_inicio)
);

-- Visitante que hace el recorrido: uno por recorrido. RR-44 está en 03_reglas.
CREATE TABLE realiza (
    id_recorrido INTEGER NOT NULL,
    -- RR-27
    cedula_pasaporte VARCHAR(30) NOT NULL,
    CONSTRAINT pk_realiza PRIMARY KEY (id_recorrido)
);

-- Ruta del recorrido: una por recorrido. RR-45 y RR-112 están en 03_reglas.
CREATE TABLE sobre (
    id_recorrido INTEGER NOT NULL,
    -- RR-28
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    nombre_ruta VARCHAR(100) NOT NULL,
    CONSTRAINT pk_sobre PRIMARY KEY (id_recorrido)
);

-- Pasos por los hitos, con su fecha y hora (HU-28, criterio 3). RR-114 y RR-115
-- están en 03_reglas.
CREATE TABLE transita (
    id_recorrido INTEGER NOT NULL,
    nombre_estado VARCHAR(100) NOT NULL,
    nombre_municipio VARCHAR(100) NOT NULL,
    nombre_parroquia VARCHAR(100) NOT NULL,
    nombre_hito VARCHAR(100) NOT NULL,
    fecha_hora_paso TIMESTAMP NOT NULL,
    CONSTRAINT pk_transita PRIMARY KEY (
        id_recorrido, nombre_estado, nombre_municipio, nombre_parroquia, nombre_hito
    )
);
