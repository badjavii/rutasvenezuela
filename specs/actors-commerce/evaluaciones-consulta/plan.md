# Plan: evaluaciones consulta

## 1. Objetivo

Implementar [la especificación](spec.md) (HU-06) sin añadir funcionalidades.

Sprint según la matriz de trazabilidad de la primera entrega (cap. 8): S3: HU-06.

## 2. Estrategia general

TDD empezando por la capa de datos: prueba SQL → RED → SQL mínimo → GREEN → refactorización. Después la capa de aplicación, la capa de presentación y la regresión.

## 3. Componentes por capa

### Capa de datos (PostgreSQL en Supabase, esquema `rutasvzla`)

- Sin tablas propias: funciones o vistas de solo lectura sobre tablas de otras capacidades.
- Reglas (ninguna asociada) en `database/03_reglas/evaluaciones-consulta.sql`: triggers, funciones y procedimientos en PL/pgSQL.
- Privilegios en `database/04_seguridad/evaluaciones-consulta.sql`: `GRANT` sobre las rutinas a `rol_visitante`.
- Datos de prueba en `database/05_datos/evaluaciones-consulta.sql`.

### Capa de aplicación (Next.js, servidor)

- Server actions en `web/server/actions/evaluaciones-consulta.ts` y acceso a datos en `web/server/db/`.
- Cada operación: leer la sesión, abrir la transacción, `SET LOCAL ROLE` con el rol de la sesión, llamar a la función o al procedimiento y devolver el resultado o el error del gestor.
- Sin reglas de negocio propias: solo validación de formato para la experiencia de usuario.

### Capa de presentación (Next.js)

- Vistas: V04 (Detalle de ruta), en `web/app/` y `web/components/`.
- Listados con búsqueda, ordenamiento por columna y paginación.

## 4. Dependencias con otras capacidades

- Ninguna clave foránea hacia otras capacidades.

## 5. Verificación

- Pruebas SQL de las reglas: [casos RR](../../../docs/testing/database-cases.csv).
- Criterios de aceptación: [casos de aceptación](../../../docs/testing/acceptance-cases.csv).
- Estados de las vistas: [casos de interfaz](../../../docs/testing/interface-cases.csv).
- Un rol sin privilegio recibe el rechazo del gestor.

## 6. Riesgos y decisiones pendientes

Ver la sección 7 de [la especificación](spec.md).

## 7. Fuera del plan

Modificaciones ajenas a la capacidad y despliegues no aprobados.
