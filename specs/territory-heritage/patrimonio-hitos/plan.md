# Plan: patrimonio hitos

## 1. Objetivo

Implementar la [especificación](spec.md) sin ampliar su alcance.

## 2. Estrategia general

Definir prueba, confirmar RED, implementar mínimo, confirmar GREEN, refactorizar y verificar regresión.

## 3. Componentes afectados

- Datos: `database/schema.sql` y rutinas/triggers relevantes conforme al relacional.
- API: controles de formato, permisos y adaptación a rutinas SQL.
- Interfaz: mockups, estados de consulta y paginación/orden/búsqueda.
- Pruebas: [aceptación](../../../docs/testing/acceptance-cases.csv), [integridad](../../../docs/testing/database-cases.csv) e [interfaz](../../../docs/testing/interface-cases.csv).

## 4. Verificación

Casos positivos, negativos, seguridad, transacciones y pruebas de integración, con evidencia.

## 5. Riesgos y decisiones pendientes

Dependencias entre dominios y elección tecnológica final.

## 6. Fuera del plan

Cambios al modelo relacional validado o despliegues no aprobados.
