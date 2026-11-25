<!-- BRANCH_TRACE_README -->
<div align="center">

<img src="assets/rutasvenezuela-logo.svg" alt="RutasVenezuela" width="620">

*RutasVenezuela: trazabilidad del workflow de la rama*

Registro de una rama de planificación histórica. El README institucional vigente se encuentra en `develop` y `main`.

</div>

## Identificación de la rama

| Campo | Valor |
|---|---|
| Rama | `javier(docs/spec)-sdd-tdd-traceability` |
| Responsable | Javier Otero |
| Tipo de cambio | `docs` |
| Capa | `spec` |
| Rama de origen y destino original | `main` |
| Pull request | [PR #2](https://github.com/badjavii/rutasvenezuela/pull/2) |
| Estado | PR cerrado sin merge; aportes conservados en la evolución posterior |

## Propósito y alcance

Organizar inicialmente la trazabilidad entre historias de usuario, restricciones relacionales, interfaces y casos de prueba, junto con la planificación SDD/TDD de RutasVenezuela para la segunda entrega.

## Cambios contemplados en la rama

- Preparación de las matrices de trazabilidad por responsable y capacidad.
- Derivación de criterios de aceptación y casos TDD planificados.
- Propuestas iniciales de documentación y automatización de validaciones.
- Uso histórico de OpenSpec, sustituido posteriormente por las plantillas SDD de la clase.

## Historial de integración

El [PR #2](https://github.com/badjavii/rutasvenezuela/pull/2) se cerró sin merge. Su trabajo de planificación se conservó y evolucionó en la rama `javier(docs/spec)-consolidate-planning`, integrada mediante los [PR #3](https://github.com/badjavii/rutasvenezuela/pull/3) y [PR #4](https://github.com/badjavii/rutasvenezuela/pull/4).

La metodología vigente debe consultarse en el [SDD de develop](https://github.com/badjavii/rutasvenezuela/tree/develop/specs). Esta rama no constituye la base actual para nuevas implementaciones.

## Verificación y observaciones

Las comprobaciones de esta etapa eran documentales. No representan ejecución de pruebas funcionales de PostgreSQL, API o interfaz.

Este README se conserva solo para la trazabilidad histórica de la rama; no debe fusionarse con el README institucional.
