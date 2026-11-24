# Plan: movilidad vias y tramos

## 1. Objetivo

Implementar [la especificación](spec.md) sin añadir funcionalidades.

## 2. Estrategia general

Prueba → RED → SQL mínimo → GREEN → refactorización → API → interfaz → regresión.

## 3. Componentes afectados

- Datos: esquema, rutinas, triggers, semillas y roles aplicables.
- API: contratos, validación y autorización.
- Interfaz: componentes y tablas según mockups.
- Pruebas: [aceptación](../../../docs/testing/acceptance-cases.csv), [RR](../../../docs/testing/database-cases.csv) y [UI](../../../docs/testing/interface-cases.csv).

## 4. Verificación

Ejecutar pruebas positivas/negativas, transacciones, regresión y flujos integrados.

## 5. Riesgos y decisiones pendientes

Dependencias cruzadas con territorio, actores y credenciales; stack provisional.

## 6. Fuera del plan

Modificaciones ajenas a la capacidad y despliegues no aprobados.
