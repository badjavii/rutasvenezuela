# Plan: actores comercios

## 1. Objetivo

Implementar [la especificación](spec.md) (HU-30.1, HU-30.2, HU-30.3, HU-30.4) sin añadir funcionalidades.

Sprint según la matriz de trazabilidad de la primera entrega (cap. 8): S1: HU-30.1, HU-30.2, HU-30.3, HU-30.4.

## 2. Estrategia general

TDD empezando por la capa de datos: prueba SQL → RED → SQL mínimo → GREEN → refactorización. Después la capa de aplicación, la capa de presentación y la regresión.

## 3. Componentes por capa

### Capa de datos (PostgreSQL en Supabase, esquema `rutasvzla`)

- Tablas propias: `comercio`, `cuenta_comercio`, `ubicado`, `disponible` en `database/01_tablas/actores-comercios.sql` (clave primaria, `NOT NULL`, `UNIQUE` y `CHECK` simples).
- Claves foráneas en `database/02_claves/actores-comercios.sql`.
- Reglas RR-47, RR-48, RR-60, RR-63, RR-66, RR-67, RR-119, RR-121 en `database/03_reglas/actores-comercios.sql`: triggers, funciones y procedimientos en PL/pgSQL.
- Privilegios en `database/04_seguridad/actores-comercios.sql`: `GRANT` sobre las rutinas a `rol_administrador`.
- Datos de prueba en `database/05_datos/actores-comercios.sql`.

### Capa de aplicación (Next.js, servidor)

- Server actions en `web/server/actions/actores-comercios.ts` y acceso a datos en `web/server/db/`.
- Cada operación: leer la sesión, abrir la transacción, `SET LOCAL ROLE` con el rol de la sesión, llamar a la función o al procedimiento y devolver el resultado o el error del gestor.
- Sin reglas de negocio propias: solo validación de formato para la experiencia de usuario.

### Capa de presentación (Next.js)

- Vistas: V18 (Actores), en `web/app/` y `web/components/`.
- Listados con búsqueda, ordenamiento por columna y paginación.

## 4. Dependencias con otras capacidades

- `cuenta` (CUENTA), de `actores-identidades` (Valeria).
- `ubicacion_geografica` (UBICACION_GEOGRAFICA), de `patrimonio-hitos` (Javier).
- `horario` (HORARIO), de `patrimonio-hitos` (Javier).

## 5. Verificación

- Pruebas SQL de las reglas: [casos RR](../../../docs/testing/database-cases.csv).
- Criterios de aceptación: [casos de aceptación](../../../docs/testing/acceptance-cases.csv).
- Estados de las vistas: [casos de interfaz](../../../docs/testing/interface-cases.csv).
- Un rol sin privilegio recibe el rechazo del gestor.

## 6. Riesgos y decisiones pendientes

Ver la sección 7 de [la especificación](spec.md).

## 7. Fuera del plan

Modificaciones ajenas a la capacidad y despliegues no aprobados.
