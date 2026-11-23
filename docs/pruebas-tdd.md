# Plan de pruebas TDD por capa

> **Estado:** plan de pruebas, **ninguna prueba ejecutada todavía**. Cada escenario parte de una especificación aprobada. Los códigos académicos se conservan en [el mapa](trazabilidad.md) y no se incrustan en los nombres funcionales del dominio.

## Flujo SDD → TDD

1. Se aprueba una capacidad en OpenSpec (`proposal → specs + design → tasks`).
2. Cada `Requirement` contiene escenarios observables (`GIVEN/WHEN/THEN`).
3. El responsable deriva **casos positivos, negativos, límites y seguridad** para cada capa afectada.
4. En implementación: **RED** (fallar por comportamiento ausente), **GREEN** (código mínimo), **REFACTOR** (mejora con pruebas verdes).
5. La PR enlaza capacidad, prueba, evidencia y HU/RR/V por medio del mapa; no se declara cobertura sin ejecución.

## Contratos de prueba

| Capa | Herramienta propuesta | Qué verifica | Qué NO verifica |
|---|---|---|---|
| PostgreSQL | SQL transaccional/pgTAP (por decidir) | PK/FK/CHECK, integridad explícita, funciones, triggers, transacciones, privilegios, concurrencia | Mensajes de la interfaz |
| Backend | pytest + httpx si se confirma FastAPI | Contratos, validaciones de entrada, manejo de errores y acceso autorizado | Invariantes que solo protege PostgreSQL |
| Frontend | Vitest + Testing Library si se confirma React | Formularios, errores, estados, búsqueda, ordenamiento y paginación | Persistencia real por sí sola |
| E2E | Evaluar Playwright | Operación desde UI hasta commit en BD y respuesta | Todas las combinaciones posibles |

**Decisión abierta:** si se aprueba Node.js, cambiar exclusivamente herramientas/contratos de API; las pruebas de negocio en PostgreSQL deben permanecer.

## Especificación de un caso

| Campo | Propósito |
|---|---|
| ID | `DB-INC-001`, `API-INC-001`, `UI-INC-001` o `E2E-INC-001` |
| Capacidad / escenario | Ruta OpenSpec + nombre de Scenario |
| Tipo / responsable | Positivo, negativo, límite, transaccional, seguridad; quién lo desarrolla |
| Precondición y datos | Fixtures/semillas disponibles, sin datos reales personales |
| Acción y resultado observable | Comportamiento esperado de forma verificable |
| Estado / evidencia | Planificado → RED → GREEN → REFACTOR, log de ejecución en CI cuando exista |

### Piloto: reportar incidencias (capacidad `incidencias/gestion`)

| Prueba planificada | Capa | Comportamiento esperado | Referencia académica |
|---|---|---|---|
| `DB-INC-001` | BD | Un reporte válido guarda número correlativo, fecha, severidad y entidad afectada | HU-19, RR-83 |
| `DB-INC-002` | BD | Rechaza incidencia vinculada simultáneamente a hito y tramos | RR-84 |
| `DB-INC-003` | BD | Registro de visitante/guía nace preliminar y sin verificación | HU-19, RR-87 |
| `DB-INC-004` | BD | Registro de funcionario nace activo y no requiere VERIFICA | HU-19, RR-88 |
| `DB-INC-005` | BD | Una transacción inválida no deja registro parcial | Integridad transaccional |
| `API-INC-001` | API | Solicitud válida delega al gestor y expone resultado, sin duplicar invariantes | Propuesta de contrato |
| `API-INC-002` | API | Entrada inválida se rechaza y no se escribe en la BD | Validación de seguridad |
| `UI-INC-001` | UI | Permite elegir hito o tramos y muestra estado preliminar/activo | V09 |
| `E2E-INC-001` | Integración | Formulario → API → función de BD → dato persistido | HU-19, V09 |

No suponer UUID, catálogo de categorías de incidencias, duplicidad por categoría ni notificaciones; ninguna de esas reglas fue acreditada por el informe de la primera entrega.

## Reglas de cierre de un cambio

- Spec aprobada y trazabilidad vigente.
- Cada escenario tiene prueba asignada a su capa, incluyendo casos negativos de integridad.
- Pruebas automatizadas y ejecutadas en la rama cuando exista implementación.
- Seeds mínimas sin datos reales sensibles.
- Evidencia en PR; README actualizado si hay cambios de ejecución.
- La profesora exige tablas **paginadas, buscables y ordenables por columnas**; la capa web debe demostrarlo con datos persistidos.

Consulta [arquitectura](arquitectura.md) y [flujo Git](flujo-git.md).
