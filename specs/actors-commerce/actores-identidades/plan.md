# Plan: actores identidades

## 1. Objetivo

Implementar la [especificación](spec.md) con alcance controlado.

## 2. Estrategia general

Escribir pruebas y observar RED; implementar lo mínimo, GREEN, refactor y regresión.

## 3. Componentes afectados

- Datos: estructuras, rutinas, triggers y permisos del dominio.
- API: validación, permisos y contrato neutral al framework pendiente.
- Interfaz: formularios, listados con búsqueda, ordenamiento y paginación.
- Pruebas: [aceptación](../../../docs/testing/acceptance-cases.csv), [RR](../../../docs/testing/database-cases.csv) e [interfaz](../../../docs/testing/interface-cases.csv).

## 4. Verificación

Casos positivos/negativos, rollback, seguridad, regresión y E2E con evidencia.

## 5. Riesgos y decisiones pendientes

Dependencias con módulos de otros integrantes y stack aún provisional.

## 6. Fuera del plan

Rediseño del relacional y cambios ajenos a la capacidad.
