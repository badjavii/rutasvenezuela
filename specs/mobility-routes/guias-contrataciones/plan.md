# Plan: guias contrataciones

## 1. Objetivo

Implementar [la especificación](spec.md) (HU-29.1, HU-29.2, HU-29.3, HU-29.4, HU-28, VA-3) sin añadir funcionalidades.

## 2. Estrategia general

TDD empezando por la capa de datos: prueba SQL → RED → SQL mínimo → GREEN → refactorización. Después la capa de aplicación, la capa de presentación y la regresión.

## 3. Componentes por capa

### Capa de datos (PostgreSQL en Supabase, esquema `rutasvzla`)

- Tablas propias: `guia`, `guia_idioma`, `guia_especialidad`, `trabaja`, `sirve`, `contratacion`, `contrata_visitante`, `contrata_guia`, `contrata_ruta` en `database/01_tablas/guias-contrataciones.sql` (clave primaria, `NOT NULL`, `UNIQUE` y `CHECK` simples).
- Claves foráneas en `database/02_claves/guias-contrataciones.sql`.
- Reglas RR-23, RR-24, RR-25, RR-26, RR-37, RR-38, RR-39, RR-40, RR-41, RR-42, RR-43, RR-116, RR-117, RR-118 en `database/03_reglas/guias-contrataciones.sql`: triggers, funciones y procedimientos en PL/pgSQL.
- Privilegios en `database/04_seguridad/guias-contrataciones.sql`: `GRANT` sobre las rutinas a `rol_visitante`, `rol_administrador`.
- Datos de prueba en `database/05_datos/guias-contrataciones.sql`.

### Capa de aplicación (Next.js, servidor)

- Server actions en `web/server/actions/guias-contrataciones.ts` y acceso a datos en `web/server/db/`.
- Cada operación: leer la sesión, abrir la transacción, `SET LOCAL ROLE` con el rol de la sesión, llamar a la función o al procedimiento y devolver el resultado o el error del gestor.
- Sin reglas de negocio propias: solo validación de formato para la experiencia de usuario.

### Capa de presentación (Next.js)

- Vistas: V18 (Actores), V17 (Rutas), V04 (Detalle de ruta), en `web/app/` y `web/components/`.
- Listados con búsqueda, ordenamiento por columna y paginación.

## 4. Dependencias con otras capacidades

- `cuenta` (CUENTA), de `actores-identidades` (Valeria).
- `municipio` (MUNICIPIO), de `territorio-catalogo` (Javier).
- `ruta_fija` (RUTA_FIJA), de `rutas-gestion` (Sebastián).
- `visitante` (VISITANTE), de `actores-identidades` (Valeria).

## 5. Verificación

- Pruebas SQL de las reglas: [casos RR](../../../docs/testing/database-cases.csv).
- Criterios de aceptación: [casos de aceptación](../../../docs/testing/acceptance-cases.csv).
- Estados de las vistas: [casos de interfaz](../../../docs/testing/interface-cases.csv).
- Un rol sin privilegio recibe el rechazo del gestor.

## 6. Riesgos y decisiones pendientes

Ver la sección 7 de [la especificación](spec.md).

## 7. Fuera del plan

Modificaciones ajenas a la capacidad y despliegues no aprobados.
