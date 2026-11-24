# Plan: promociones experiencias

## 1. Objetivo

Implementar [la especificación](spec.md) sin ampliar alcance.

## 2. Estrategia general

Escribir pruebas, verificar RED, implementar lo mínimo, confirmar GREEN, refactorizar y ejecutar regresión.

## 3. Componentes afectados

- Datos: relaciones, rutinas y restricciones pertinentes.
- API: validación y autorización de operaciones del SGBDR.
- Interfaz: formularios y reportes vinculados.
- Pruebas: [criterios](../../../docs/testing/acceptance-cases.csv), [integridad](../../../docs/testing/database-cases.csv) e [interfaz](../../../docs/testing/interface-cases.csv).

## 4. Verificación

Pruebas de reglas, seguridad, rollback y flujos completos con evidencia.

## 5. Riesgos y decisiones pendientes

Dependencia de identidades, rutas y contratos aún provisionales.

## 6. Fuera del plan

Cambios estructurales sin justificación académica.
