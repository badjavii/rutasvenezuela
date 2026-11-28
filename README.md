<!-- BRANCH_TRACE_README -->
<div align="center">

<img src="assets/rutasvenezuela-logo.svg" alt="RutasVenezuela" width="620">

*RutasVenezuela: trazabilidad del workflow de la rama*

Documento de seguimiento exclusivo de esta rama. El README institucional se conserva en `develop` y `main`.

</div>

## Identificación de la rama

| Campo | Valor |
|---|---|
| Rama | `sebastian(feat/database)-guias-contrataciones` |
| Responsable | Sebastián Armas |
| Tipo de cambio | `feat` |
| Capa | `database` |
| Fecha de creación | 2026-11-28 |
| Rama de origen | `develop` |
| Destino de integración | `develop` |
| Pull request | Pendiente de apertura |
| Estado | En preparación |

## Propósito y alcance

Tablas, claves y reglas de guías y contrataciones

## Cambios contemplados

- Especificaciones y criterios de aceptación asociados a este trabajo.
- Cambios necesarios de la capa o módulo, sin alterar funcionalidades ajenas.
- Pruebas y documentación que correspondan al alcance de la rama.

## Verificación

- Casos TDD: pendientes de concretar según las especificaciones aplicables.
- Pruebas ejecutadas: ninguna declarada sin evidencia.
- GitHub Actions: se revisará al abrir el PR.

## Integración y referencias

[Constitución SDD](specs/constitution.md) · [Git workflow](docs/development/git-workflow.md)

Antes de abrir un PR, ejecutar `bash scripts/prepare-pr.sh`. El README institucional debe restaurarse para que el PR no incluya este documento; su historial de commits permanece en la rama. La matriz central se encuentra en `docs/project/branch-ledger.csv`.
