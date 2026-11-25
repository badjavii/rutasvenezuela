# Plan: promociones experiencias

## 1. Objetivo

Implementar [la especificación](spec.md) (HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4) sin añadir funcionalidades.

Sprint según la matriz de trazabilidad de la primera entrega (cap. 8): S3: HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4.

## 2. Estrategia general

TDD empezando por la capa de datos: prueba SQL → RED → SQL mínimo → GREEN → refactorización. Después la capa de aplicación, la capa de presentación y la regresión.

## 3. Componentes por capa

### Capa de datos (PostgreSQL en Supabase, esquema `rutasvzla`)

- Tablas propias: `experiencia_turistica`, `promueve`, `dirige`, `transcurre`, `incluye`, `incluye_comercio` en `database/01_tablas/promociones-experiencias.sql` (clave primaria, `NOT NULL`, `UNIQUE` y `CHECK` simples).
- Claves foráneas en `database/02_claves/promociones-experiencias.sql`.
- Reglas RR-52, RR-53, RR-54, RR-69, RR-70, RR-71, RR-122, RR-123, RR-124, RR-125, RR-126 en `database/03_reglas/promociones-experiencias.sql`: triggers, funciones y procedimientos en PL/pgSQL.
- Privilegios en `database/04_seguridad/promociones-experiencias.sql`: `GRANT` sobre las rutinas a `rol_visitante`, `rol_guia`, `rol_comercio`.
- Datos de prueba en `database/05_datos/promociones-experiencias.sql`.

### Capa de aplicación (Next.js, servidor)

- Server actions en `web/server/actions/promociones-experiencias.ts` y acceso a datos en `web/server/db/`.
- Cada operación: leer la sesión, abrir la transacción, `SET LOCAL ROLE` con el rol de la sesión, llamar a la función o al procedimiento y devolver el resultado o el error del gestor.
- Sin reglas de negocio propias: solo validación de formato para la experiencia de usuario.

### Capa de presentación (Next.js)

- Vistas: V04 (Detalle de ruta), V11 (Mis experiencias), en `web/app/` y `web/components/`.
- Listados con búsqueda, ordenamiento por columna y paginación.

## 4. Dependencias con otras capacidades

- `comercio` (COMERCIO), de `actores-comercios` (Valeria).
- `guia` (GUIA), de `guias-contrataciones` (Sebastián).
- `ruta_turistica` (RUTA_TURISTICA), de `rutas-gestion` (Sebastián).
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
