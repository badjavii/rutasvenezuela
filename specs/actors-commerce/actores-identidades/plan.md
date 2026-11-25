# Plan: actores identidades

## 1. Objetivo

Implementar [la especificación](spec.md) (HU-09.1, HU-09.2, HU-09.3, HU-09.4, HU-26.1, HU-26.2, HU-26.3, HU-26.4, HU-08) sin añadir funcionalidades.

Sprint según la matriz de trazabilidad de la primera entrega (cap. 8): S1: HU-09.1, HU-09.2, HU-09.3, HU-09.4, HU-08; S2: HU-26.1, HU-26.2, HU-26.3, HU-26.4.

## 2. Estrategia general

TDD empezando por la capa de datos: prueba SQL → RED → SQL mínimo → GREEN → refactorización. Después la capa de aplicación, la capa de presentación y la regresión.

## 3. Componentes por capa

### Capa de datos (PostgreSQL en Supabase, esquema `rutasvzla`)

- Tablas propias: `cuenta`, `visitante`, `cuenta_visitante`, `funcionario`, `cuenta_funcionario`, `pertenece_a`, `administrador`, `cuenta_administrador` en `database/01_tablas/actores-identidades.sql` (clave primaria, `NOT NULL`, `UNIQUE` y `CHECK` simples).
- Claves foráneas en `database/02_claves/actores-identidades.sql`.
- Reglas RR-46, RR-49, RR-50, RR-51, RR-61, RR-62, RR-64, RR-65, RR-68, RR-120 en `database/03_reglas/actores-identidades.sql`: triggers, funciones y procedimientos en PL/pgSQL.
- Privilegios en `database/04_seguridad/actores-identidades.sql`: `GRANT` sobre las rutinas a `rol_visitante`, `rol_guia`, `rol_comercio`, `rol_ente`, `rol_funcionario`, `rol_administrador`.
- Datos de prueba en `database/05_datos/actores-identidades.sql`.

### Capa de aplicación (Next.js, servidor)

- Server actions en `web/server/actions/actores-identidades.ts` y acceso a datos en `web/server/db/`.
- Cada operación: leer la sesión, abrir la transacción, `SET LOCAL ROLE` con el rol de la sesión, llamar a la función o al procedimiento y devolver el resultado o el error del gestor.
- Sin reglas de negocio propias: solo validación de formato para la experiencia de usuario.

### Capa de presentación (Next.js)

- Vistas: V18 (Actores), V01 (Iniciar sesión), en `web/app/` y `web/components/`.
- Listados con búsqueda, ordenamiento por columna y paginación.

## 4. Dependencias con otras capacidades

- `ente_publico` (ENTE_PUBLICO), de `instituciones-entes` (Javier).

## 5. Verificación

- Pruebas SQL de las reglas: [casos RR](../../../docs/testing/database-cases.csv).
- Criterios de aceptación: [casos de aceptación](../../../docs/testing/acceptance-cases.csv).
- Estados de las vistas: [casos de interfaz](../../../docs/testing/interface-cases.csv).
- Un rol sin privilegio recibe el rechazo del gestor.

## 6. Riesgos y decisiones pendientes

Ver la sección 7 de [la especificación](spec.md).

## 7. Fuera del plan

Modificaciones ajenas a la capacidad y despliegues no aprobados.
