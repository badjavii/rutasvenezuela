# Plan: movilidad vias y tramos

## 1. Objetivo

Implementar [la especificación](spec.md) (HU-15.1, HU-15.2, HU-15.3, HU-15.4, HU-35.1, HU-35.2, HU-35.3, HU-35.4) sin añadir funcionalidades.

## 2. Estrategia general

TDD empezando por la capa de datos: prueba SQL → RED → SQL mínimo → GREEN → refactorización. Después la capa de aplicación, la capa de presentación y la regresión.

## 3. Componentes por capa

### Capa de datos (PostgreSQL en Supabase, esquema `rutasvzla`)

- Tablas propias: `via`, `via_modo`, `tramo`, `conecta` en `database/01_tablas/movilidad-vias-y-tramos.sql` (clave primaria, `NOT NULL`, `UNIQUE` y `CHECK` simples).
- Claves foráneas en `database/02_claves/movilidad-vias-y-tramos.sql`.
- Reglas RR-29, RR-30, RR-102, RR-103 en `database/03_reglas/movilidad-vias-y-tramos.sql`: triggers, funciones y procedimientos en PL/pgSQL.
- Privilegios en `database/04_seguridad/movilidad-vias-y-tramos.sql`: `GRANT` sobre las rutinas a `rol_administrador`.
- Datos de prueba en `database/05_datos/movilidad-vias-y-tramos.sql`.

### Capa de aplicación (Next.js, servidor)

- Server actions en `web/server/actions/movilidad-vias-y-tramos.ts` y acceso a datos en `web/server/db/`.
- Cada operación: leer la sesión, abrir la transacción, `SET LOCAL ROLE` con el rol de la sesión, llamar a la función o al procedimiento y devolver el resultado o el error del gestor.
- Sin reglas de negocio propias: solo validación de formato para la experiencia de usuario.

### Capa de presentación (Next.js)

- Vistas: V16 (Vías y paradas), en `web/app/` y `web/components/`.
- Listados con búsqueda, ordenamiento por columna y paginación.

## 4. Dependencias con otras capacidades

- `municipio` (MUNICIPIO), de `territorio-catalogo` (Javier).

## 5. Verificación

- Pruebas SQL de las reglas: [casos RR](../../../docs/testing/database-cases.csv).
- Criterios de aceptación: [casos de aceptación](../../../docs/testing/acceptance-cases.csv).
- Estados de las vistas: [casos de interfaz](../../../docs/testing/interface-cases.csv).
- Un rol sin privilegio recibe el rechazo del gestor.

## 6. Riesgos y decisiones pendientes

Ver la sección 7 de [la especificación](spec.md).

## 7. Fuera del plan

Modificaciones ajenas a la capacidad y despliegues no aprobados.
