# Diseño previsto — Incidencias

**Estado:** preliminar. Responsable: Javier.

## Base de datos

Usar relaciones, identificadores y claves del modelo relacional corregido; no introducir UUID ni catálogos adicionales por defecto. Registros y cambios de estado deben ser transacciones atómicas. Validar exclusividad de objeto afectado y competencias con mecanismos PostgreSQL nativos.

## API (contrato todavía abierto)

La capa de aplicación recibe solicitudes, valida tipos/autorización y llama a las rutinas del gestor. El framework FastAPI es provisional: se evaluará la alternativa Node.js de Sebastián. No duplicar reglas del gestor.

## Interfaz

Formulario de reporte y pantalla de gestión según mockups de la primera entrega. Cubrir errores de validación, autorizaciones y estados de carga/resultado.

## Pruebas

Consultar [TDD](../../../docs/pruebas-tdd.md). Priorizar validez del reporte, exclusividad, estado inicial por actor, rollback y cierre competente. No asumir notificaciones, categorías de incidencia, UUID o prohibiciones no especificadas.
