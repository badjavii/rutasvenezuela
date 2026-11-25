<!-- BRANCH_TRACE_README -->
<div align="center">

<img src="assets/rutasvenezuela-logo.svg" alt="RutasVenezuela" width="620">

*RutasVenezuela: trazabilidad del workflow de la rama*

Documento de seguimiento exclusivo de esta rama. El README institucional se conserva en `develop` y `main`.

</div>

## Identificación de la rama

| Campo | Valor |
|---|---|
| Rama | `sebastian(feat/database)-schema-and-build` |
| Responsable | Sebastián Armas |
| Tipo de cambio | `feat` |
| Capa | `database` |
| Fecha de creación | 2026-11-24 |
| Rama de origen | `develop` |
| Destino de integración | `develop` |
| Pull request | [PR #6](https://github.com/badjavii/rutasvenezuela/pull/6) |
| Estado | Integrado en `develop` |

## Propósito y alcance

Preparar la infraestructura común de PostgreSQL para la construcción de las tablas por capacidad.

## Cambios realizados

- Crear el esquema `rutasvzla`, roles y privilegios base.
- Incorporar scripts de construcción y pruebas SQL.
- Definir convenciones y tipos comunes pendientes de acuerdo del equipo.

## Verificación

CI documental y PostgreSQL aprobados en el PR #6. Las pruebas verifican la infraestructura, no las reglas de negocio todavía.

## Integración y referencias

[Constitución SDD](specs/constitution.md) · [Git workflow](docs/development/git-workflow.md)

El trabajo se integró mediante el PR indicado. Este README registra el historial de la rama y no debe fusionarse con el README institucional.
