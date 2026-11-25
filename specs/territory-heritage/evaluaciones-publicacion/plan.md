# Plan: evaluaciones publicacion

## 1. Objetivo

Implementar [la especificación](spec.md) (HU-22) sin añadir funcionalidades.

Sprint según la matriz de trazabilidad de la primera entrega (cap. 8): S3: HU-22.

## 2. Estrategia general

TDD empezando por la capa de datos: prueba SQL → RED → SQL mínimo → GREEN → refactorización. Después la capa de aplicación, la capa de presentación y la regresión.

## 3. Componentes por capa

### Capa de datos (PostgreSQL en Supabase, esquema `rutasvzla`)

- Tablas propias: `evaluacion_experiencia`, `respaldada_por`, `evalua_hito`, `evalua_ruta` en `database/01_tablas/evaluaciones-publicacion.sql` (clave primaria, `NOT NULL`, `UNIQUE` y `CHECK` simples).
- Claves foráneas en `database/02_claves/evaluaciones-publicacion.sql`.
- Reglas RR-9, RR-10, RR-11, RR-19, RR-94, RR-95, RR-96, RR-97, RR-98, RR-99, RR-100 en `database/03_reglas/evaluaciones-publicacion.sql`: triggers, funciones y procedimientos en PL/pgSQL.
- Privilegios en `database/04_seguridad/evaluaciones-publicacion.sql`: `GRANT` sobre las rutinas a `rol_visitante`.
- Datos de prueba en `database/05_datos/evaluaciones-publicacion.sql`.

### Capa de aplicación (Next.js, servidor)

- Server actions en `web/server/actions/evaluaciones-publicacion.ts` y acceso a datos en `web/server/db/`.
- Cada operación: leer la sesión, abrir la transacción, `SET LOCAL ROLE` con el rol de la sesión, llamar a la función o al procedimiento y devolver el resultado o el error del gestor.
- Sin reglas de negocio propias: solo validación de formato para la experiencia de usuario.

### Capa de presentación (Next.js)

- Vistas: V06 (Recorrido en curso, historial y evaluar), en `web/app/` y `web/components/`.
- Listados con búsqueda, ordenamiento por columna y paginación.

## 4. Dependencias con otras capacidades

- `recorrido` (RECORRIDO), de `rutas-recorridos` (Sebastián).
- `hito` (HITO), de `patrimonio-hitos` (Javier).
- `ruta_turistica` (RUTA_TURISTICA), de `rutas-gestion` (Sebastián).

## 5. Verificación

- Pruebas SQL de las reglas: [casos RR](../../../docs/testing/database-cases.csv).
- Criterios de aceptación: [casos de aceptación](../../../docs/testing/acceptance-cases.csv).
- Estados de las vistas: [casos de interfaz](../../../docs/testing/interface-cases.csv).
- Un rol sin privilegio recibe el rechazo del gestor.

## 6. Riesgos y decisiones pendientes

Ver la sección 7 de [la especificación](spec.md).

## 7. Fuera del plan

Modificaciones ajenas a la capacidad y despliegues no aprobados.
