# Plan: evaluaciones publicacion

## 1. Objetivo

Implementar la [especificación](spec.md) de evaluaciones publicacion sin ampliar el alcance.

## 2. Estrategia general

Pruebas primero: preparar casos y observar RED, implementar el mínimo SQL, verificar GREEN, refactorizar y continuar con API/UI.

## 3. Componentes afectados

- Datos: `database/schema.sql`, `database/routines/`, `database/triggers/`, `database/security/` según la RR aplicable.
- API: validación de entrada, autorización y ejecución de operaciones del gestor.
- Interfaz: vistas del módulo, estados y listados con paginación, búsqueda y ordenamiento.
- Pruebas: [criterios](../../../docs/testing/acceptance-cases.csv), [RR](../../../docs/testing/database-cases.csv), [UI](../../../docs/testing/interface-cases.csv).

## 4. Verificación

Ejecución de casos positivos y negativos, rollback, autorización, regresión y evidencia en PR.

## 5. Riesgos y decisiones pendientes

Dependencias con otros dominios y framework de API aún por confirmar.

## 6. Fuera del plan

Rediseñar el relacional, anticipar módulos o desplegar en producción.
