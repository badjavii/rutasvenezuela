# Estrategia de desarrollo dirigido por pruebas (TDD)

**Estado:** plan completo de cobertura derivado del documento original. Ninguna prueba ejecutable ha sido implementada aún. Los registros CSV son casos planificados, no resultados de CI.

## Separación SDD y TDD

- SDD por plantillas determina comportamientos obligatorios y escenarios. La arquitectura es Next.js + PostgreSQL ([arquitectura](../architecture.md)).
- TDD transforma los criterios de aceptación y las invariantes de SQL en comprobaciones observables. Las fuentes se identifican mediante el [mapa académico](../requirements/traceability-detailed.csv).
- **Implementación posterior:** RED (probar y fallar), GREEN (mínimo código correcto), REFACTOR (mejora sin perder cobertura).

```text
Historia (documento académico)
  → mapa HU/RR/mockup
  → especificación y criterio de aceptación SDD (SDD)
  → caso de prueba planificado (TDD)
  → futura prueba RED → implementación GREEN → REFACTOR
  → evidencia de CI y revisión de PR
```

## Cobertura de planificación

| Registro | Cobertura | Archivo |
|---|---:|---|
| Historias y criterios | 103 historias / 324 criterios | [casos-criterios.csv](../testing/acceptance-cases.csv) |
| Restricciones relacionales | 134 RR / 268 casos (válido y violación) | [casos-rr.csv](../testing/database-cases.csv) |
| Mockups | 21 vistas / 70 estados | [casos-interfaces.csv](../testing/interface-cases.csv) |
| Flujos críticos y reportes | 12 recorridos E2E propuestos | [casos-e2e.csv](../testing/integration-cases.csv) |

Los 674 casos de planificación no equivalen a 674 pruebas ejecutadas. Antes de implementarlos, refinar los casos genéricos con fixtures, SQL exacto, precondiciones, errores esperados y transacciones. Pueden consolidarse cuando una misma prueba cubra varios criterios, conservando la matriz.

## Capas y herramientas candidatas

| Capa | Herramientas | Qué demuestra |
|---|---|---|
| PostgreSQL/Supabase | SQL reproducible y transacciones reversibles; pgTAP por evaluar | PK, FK, claves compuestas, CHECK, UNIQUE, relaciones, invariantes, triggers, funciones, procedimientos, privilegios y rollback |
| Aplicación (server actions) | Vitest contra una base de prueba | `SET LOCAL ROLE`, llamada a la rutina, rechazo de un rol sin privilegio y manejo de errores del gestor |
| Presentación | Vitest + Testing Library | Formularios, estados, listas vacías, filtros, paginación y orden |
| E2E | Playwright, si aporta valor | Interfaz → server action → rutina SQL → persistencia/rechazo → interfaz |

La prioridad es la capa de datos: las reglas y los permisos se prueban primero en PostgreSQL.

## Diseño de datos y ejecución

- Todas las pruebas DB se ejecutarán con datos aislados, sin secretos ni datos personales reales.
- Escribir casos positivos y negativos: la BD debe rechazar operaciones inválidas, aunque se eludan los validadores web.
- Para cada función o trigger comprobar valores resultantes, efectos colaterales y rollback.
- Para operaciones con estados (incidencias, recorridos, credenciales), comprobar transiciones permitidas y prohibidas.
- Probar privilegios efectivos con los roles de actor (`SET ROLE rol_…`) y comprobar que un rol sin `GRANT` recibe el rechazo del gestor.
- Las consultas y reportes deberán verificar filtros, exclusión de datos privados y resultados vacíos.
- Las vistas tabulares deben demostrar paginación, búsqueda y ordenamiento por columnas sobre datos reales.

## Ejemplo: gestión de incidencias

A partir del comportamiento original:

- Visitante/guía reporta → estado preliminar.
- Funcionario reporta → estado activa.
- Solo hito o tramos como objeto afectado (exclusividad).
- Verificación, prórroga y cierre deben respetar roles, fechas y competencias.

**TDD:** primero probar en PostgreSQL el rechazo de una incidencia que afecta simultáneamente un hito y un tramo; después implementar la restricción necesaria. Luego cubrir la server action y la interfaz. No inventar UUID, categorías de incidencia ni notificaciones.

## Evidencia de finalización

Para cada cambio: especificación revisada, caso TDD enlazado, prueba realmente ejecutada, salida del runner, commit individual y PR revisada. GitHub Actions actual solo comprueba documentación; los tests de producto se añadirán con la implementación.

[Catálogo académico original](../requirements/acceptance-criteria.md) · [RR](../requirements/relational-rules.md) · [contratos por capa](layer-contracts.md).
