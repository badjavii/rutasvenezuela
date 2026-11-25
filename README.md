<!-- BRANCH_TRACE_README -->
<div align="center">

<img src="assets/rutasvenezuela-logo.svg" alt="RutasVenezuela" width="620">

*RutasVenezuela: trazabilidad del workflow de la rama*

Documento de seguimiento exclusivo de esta rama. El README institucional se conserva en `develop` y `main`.

</div>

## Identificación de la rama

| Campo | Valor |
|---|---|
| Rama | `sebastian(docs/spec)-align-specs-architecture` |
| Responsable | Sebastián Armas |
| Tipo de cambio | `docs` |
| Capa | `spec` |
| Fecha de creación | 2026-11-24 |
| Rama de origen | `develop` |
| Destino de integración | `develop` |
| Pull request | [PR #5](https://github.com/badjavii/rutasvenezuela/pull/5) |
| Estado | Integrado en `develop` |

## Propósito y alcance

Corrección de los criterios de aceptación y alineación de las 23 capacidades con la arquitectura Next.js y PostgreSQL.

## Cambios realizados

- Corregir criterios y dependencias entre capacidades.
- Adaptar las especificaciones, convenciones SQL y documentación de arquitectura.
- Sustituir `backend/` y `frontend/` por `web/`.

## Verificación

Validación documental aprobada en el PR #5. No se ejecutaron pruebas funcionales.

## Integración y referencias

[Constitución SDD](specs/constitution.md) · [Git workflow](docs/development/git-workflow.md)

El trabajo se integró mediante el PR indicado. Este README registra el historial de la rama y no debe fusionarse con el README institucional.
