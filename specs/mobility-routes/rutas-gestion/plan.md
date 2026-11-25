# Plan: rutas gestion

## 1. Objetivo

Implementar [la especificación](spec.md) (HU-03, HU-17.1, HU-17.2, HU-17.3, HU-17.4, HU-25.1, HU-25.2, HU-25.3, HU-25.4) sin añadir funcionalidades.

## 2. Estrategia general

TDD empezando por la capa de datos: prueba SQL → RED → SQL mínimo → GREEN → refactorización. Después la capa de aplicación, la capa de presentación y la regresión.

## 3. Componentes por capa

### Capa de datos (PostgreSQL en Supabase, esquema `rutasvzla`)

- Tablas propias: `ruta_turistica`, `ruta_fija`, `ruta_dinamica`, `conforma`, `usa`, `crea` en `database/01_tablas/rutas-gestion.sql` (clave primaria, `NOT NULL`, `UNIQUE` y `CHECK` simples).
- Claves foráneas en `database/02_claves/rutas-gestion.sql`.
- Reglas RR-22, RR-34, RR-35, RR-36, RR-106, RR-107, RR-108, RR-109, RR-110, RR-111, RR-112 en `database/03_reglas/rutas-gestion.sql`: triggers, funciones y procedimientos en PL/pgSQL.
- Privilegios en `database/04_seguridad/rutas-gestion.sql`: `GRANT` sobre las rutinas a `rol_visitante`, `rol_administrador`.
- Datos de prueba en `database/05_datos/rutas-gestion.sql`.

### Capa de aplicación (Next.js, servidor)

- Server actions en `web/server/actions/rutas-gestion.ts` y acceso a datos en `web/server/db/`.
- Cada operación: leer la sesión, abrir la transacción, `SET LOCAL ROLE` con el rol de la sesión, llamar a la función o al procedimiento y devolver el resultado o el error del gestor.
- Sin reglas de negocio propias: solo validación de formato para la experiencia de usuario.

### Capa de presentación (Next.js)

- Vistas: V02 (Explorar rutas), V17 (Rutas), V07 (Mis rutas), en `web/app/` y `web/components/`.
- Listados con búsqueda, ordenamiento por columna y paginación.

## 4. Dependencias con otras capacidades

- `municipio` (MUNICIPIO), de `territorio-catalogo` (Javier).
- `hito` (HITO), de `patrimonio-hitos` (Javier).
- `parada_transporte` (PARADA_TRANSPORTE), de `movilidad-paradas` (Sebastián).
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
