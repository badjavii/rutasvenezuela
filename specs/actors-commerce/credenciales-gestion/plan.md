# Plan: credenciales gestion

## 1. Objetivo

Implementar [la especificación](spec.md) (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27) sin añadir funcionalidades.

## 2. Estrategia general

TDD empezando por la capa de datos: prueba SQL → RED → SQL mínimo → GREEN → refactorización. Después la capa de aplicación, la capa de presentación y la regresión.

## 3. Componentes por capa

### Capa de datos (PostgreSQL en Supabase, esquema `rutasvzla`)

- Tablas propias: `credencial_digital`, `adquiere`, `ampara`, `reserva_hito`, `reserva_comercio`, `valida` en `database/01_tablas/credenciales-gestion.sql` (clave primaria, `NOT NULL`, `UNIQUE` y `CHECK` simples).
- Claves foráneas en `database/02_claves/credenciales-gestion.sql`.
- Reglas RR-55, RR-56, RR-57, RR-58, RR-59, RR-72, RR-73, RR-127, RR-128, RR-129, RR-130, RR-131, RR-132, RR-133, RR-134 en `database/03_reglas/credenciales-gestion.sql`: triggers, funciones y procedimientos en PL/pgSQL.
- Privilegios en `database/04_seguridad/credenciales-gestion.sql`: `GRANT` sobre las rutinas a `rol_visitante`, `rol_guia`, `rol_comercio`.
- Datos de prueba en `database/05_datos/credenciales-gestion.sql`.

### Capa de aplicación (Next.js, servidor)

- Server actions en `web/server/actions/credenciales-gestion.ts` y acceso a datos en `web/server/db/`.
- Cada operación: leer la sesión, abrir la transacción, `SET LOCAL ROLE` con el rol de la sesión, llamar a la función o al procedimiento y devolver el resultado o el error del gestor.
- Sin reglas de negocio propias: solo validación de formato para la experiencia de usuario.

### Capa de presentación (Next.js)

- Vistas: V10 (Validar y canjear credencial), V08 (Mis credenciales), en `web/app/` y `web/components/`.
- Listados con búsqueda, ordenamiento por columna y paginación.

## 4. Dependencias con otras capacidades

- `visitante` (VISITANTE), de `actores-identidades` (Valeria).
- `experiencia_turistica` (EXPERIENCIA_TURISTICA), de `promociones-experiencias` (Valeria).
- `hito` (HITO), de `patrimonio-hitos` (Javier).
- `comercio` (COMERCIO), de `actores-comercios` (Valeria).
- `cuenta` (CUENTA), de `actores-identidades` (Valeria).

## 5. Verificación

- Pruebas SQL de las reglas: [casos RR](../../../docs/testing/database-cases.csv).
- Criterios de aceptación: [casos de aceptación](../../../docs/testing/acceptance-cases.csv).
- Estados de las vistas: [casos de interfaz](../../../docs/testing/interface-cases.csv).
- Un rol sin privilegio recibe el rechazo del gestor.

## 6. Riesgos y decisiones pendientes

Ver la sección 7 de [la especificación](spec.md).

## 7. Fuera del plan

Modificaciones ajenas a la capacidad y despliegues no aprobados.
