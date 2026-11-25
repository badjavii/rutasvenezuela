# Plan: movilidad paradas

## 1. Objetivo

Implementar [la especificación](spec.md) (HU-16.1, HU-16.2, HU-16.3, HU-16.4) sin añadir funcionalidades.

## 2. Estrategia general

TDD empezando por la capa de datos: prueba SQL → RED → SQL mínimo → GREEN → refactorización. Después la capa de aplicación, la capa de presentación y la regresión.

## 3. Componentes por capa

### Capa de datos (PostgreSQL en Supabase, esquema `rutasvzla`)

- Tablas propias: `parada_transporte`, `equipamiento_urbano`, `se_localiza`, `esta_en`, `funciona`, `cercana` en `database/01_tablas/movilidad-paradas.sql` (clave primaria, `NOT NULL`, `UNIQUE` y `CHECK` simples).
- Claves foráneas en `database/02_claves/movilidad-paradas.sql`.
- Reglas RR-20, RR-21, RR-31, RR-32, RR-33, RR-101, RR-104, RR-105 en `database/03_reglas/movilidad-paradas.sql`: triggers, funciones y procedimientos en PL/pgSQL.
- Privilegios en `database/04_seguridad/movilidad-paradas.sql`: `GRANT` sobre las rutinas a `rol_administrador`.
- Datos de prueba en `database/05_datos/movilidad-paradas.sql`.

### Capa de aplicación (Next.js, servidor)

- Server actions en `web/server/actions/movilidad-paradas.ts` y acceso a datos en `web/server/db/`.
- Cada operación: leer la sesión, abrir la transacción, `SET LOCAL ROLE` con el rol de la sesión, llamar a la función o al procedimiento y devolver el resultado o el error del gestor.
- Sin reglas de negocio propias: solo validación de formato para la experiencia de usuario.

### Capa de presentación (Next.js)

- Vistas: V16 (Vías y paradas), en `web/app/` y `web/components/`.
- Listados con búsqueda, ordenamiento por columna y paginación.

## 4. Dependencias con otras capacidades

- `ubicacion_geografica` (UBICACION_GEOGRAFICA), de `patrimonio-hitos` (Javier).
- `tramo` (TRAMO), de `movilidad-vias-y-tramos` (Sebastián).
- `horario` (HORARIO), de `patrimonio-hitos` (Javier).
- `hito` (HITO), de `patrimonio-hitos` (Javier).

## 5. Verificación

- Pruebas SQL de las reglas: [casos RR](../../../docs/testing/database-cases.csv).
- Criterios de aceptación: [casos de aceptación](../../../docs/testing/acceptance-cases.csv).
- Estados de las vistas: [casos de interfaz](../../../docs/testing/interface-cases.csv).
- Un rol sin privilegio recibe el rechazo del gestor.

## 6. Riesgos y decisiones pendientes

Ver la sección 7 de [la especificación](spec.md).

## 7. Fuera del plan

Modificaciones ajenas a la capacidad y despliegues no aprobados.
