# Plan: patrimonio hitos

## 1. Objetivo

Implementar [la especificación](spec.md) (HU-01, HU-10.1, HU-10.2, HU-10.3, HU-10.4, HU-11.1, HU-11.2, HU-11.3, HU-11.4) sin añadir funcionalidades.

Sprint según la matriz de trazabilidad de la primera entrega (cap. 8): S4: HU-01; S2: HU-10.1, HU-10.2, HU-10.3, HU-10.4; S1: HU-11.1, HU-11.2, HU-11.3, HU-11.4.

## 2. Estrategia general

TDD empezando por la capa de datos: prueba SQL → RED → SQL mínimo → GREEN → refactorización. Después la capa de aplicación, la capa de presentación y la regresión.

## 3. Componentes por capa

### Capa de datos (PostgreSQL en Supabase, esquema `rutasvzla`)

- Tablas propias: `hito`, `categoria`, `clasifica`, `ubicacion_geografica`, `registra`, `horario`, `abre`, `se_ubica_en` en `database/01_tablas/patrimonio-hitos.sql` (clave primaria, `NOT NULL`, `UNIQUE` y `CHECK` simples).
- Claves foráneas en `database/02_claves/patrimonio-hitos.sql`.
- Reglas RR-1, RR-2, RR-13, RR-14, RR-74, RR-75, RR-76, RR-77, RR-78, RR-79 en `database/03_reglas/patrimonio-hitos.sql`: triggers, funciones y procedimientos en PL/pgSQL.
- Privilegios en `database/04_seguridad/patrimonio-hitos.sql`: `GRANT` sobre las rutinas a `rol_visitante`, `rol_administrador`.
- Datos de prueba en `database/05_datos/patrimonio-hitos.sql`.

### Capa de aplicación (Next.js, servidor)

- Server actions en `web/server/actions/patrimonio-hitos.ts` y acceso a datos en `web/server/db/`.
- Cada operación: leer la sesión, abrir la transacción, `SET LOCAL ROLE` con el rol de la sesión, llamar a la función o al procedimiento y devolver el resultado o el error del gestor.
- Sin reglas de negocio propias: solo validación de formato para la experiencia de usuario.

### Capa de presentación (Next.js)

- Vistas: V03 (Ficha del hito), V14 (Hitos y eventos), en `web/app/` y `web/components/`.
- Listados con búsqueda, ordenamiento por columna y paginación.

## 4. Dependencias con otras capacidades

- `parroquia` (PARROQUIA), de `territorio-catalogo` (Javier).
- `tramo` (TRAMO), de `movilidad-vias-y-tramos` (Sebastián).

## 5. Verificación

- Pruebas SQL de las reglas: [casos RR](../../../docs/testing/database-cases.csv).
- Criterios de aceptación: [casos de aceptación](../../../docs/testing/acceptance-cases.csv).
- Estados de las vistas: [casos de interfaz](../../../docs/testing/interface-cases.csv).
- Un rol sin privilegio recibe el rechazo del gestor.

## 6. Riesgos y decisiones pendientes

Ver la sección 7 de [la especificación](spec.md).

## 7. Fuera del plan

Modificaciones ajenas a la capacidad y despliegues no aprobados.
