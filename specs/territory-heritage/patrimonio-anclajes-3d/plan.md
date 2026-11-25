# Plan: patrimonio anclajes 3d

## 1. Objetivo

Implementar [la especificación](spec.md) (HU-02, HU-13.1, HU-13.2, HU-13.3, HU-13.4, HU-14.1, HU-14.2, HU-14.3, HU-14.4) sin añadir funcionalidades.

## 2. Estrategia general

TDD empezando por la capa de datos: prueba SQL → RED → SQL mínimo → GREEN → refactorización. Después la capa de aplicación, la capa de presentación y la regresión.

## 3. Componentes por capa

### Capa de datos (PostgreSQL en Supabase, esquema `rutasvzla`)

- Tablas propias: `punto_geoespacial`, `punto_hipervinculo`, `recurso_3d`, `proyecta` en `database/01_tablas/patrimonio-anclajes-3d.sql` (clave primaria, `NOT NULL`, `UNIQUE` y `CHECK` simples).
- Claves foráneas en `database/02_claves/patrimonio-anclajes-3d.sql`.
- Reglas RR-3, RR-15, RR-78, RR-80, RR-81 en `database/03_reglas/patrimonio-anclajes-3d.sql`: triggers, funciones y procedimientos en PL/pgSQL.
- Privilegios en `database/04_seguridad/patrimonio-anclajes-3d.sql`: `GRANT` sobre las rutinas a `rol_visitante`, `rol_administrador`.
- Datos de prueba en `database/05_datos/patrimonio-anclajes-3d.sql`.

### Capa de aplicación (Next.js, servidor)

- Server actions en `web/server/actions/patrimonio-anclajes-3d.ts` y acceso a datos en `web/server/db/`.
- Cada operación: leer la sesión, abrir la transacción, `SET LOCAL ROLE` con el rol de la sesión, llamar a la función o al procedimiento y devolver el resultado o el error del gestor.
- Sin reglas de negocio propias: solo validación de formato para la experiencia de usuario.

### Capa de presentación (Next.js)

- Vistas: V05 (Realidad aumentada (móvil)), V15 (Realidad aumentada (admin)), en `web/app/` y `web/components/`.
- Listados con búsqueda, ordenamiento por columna y paginación.

## 4. Dependencias con otras capacidades

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
