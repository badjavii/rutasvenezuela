<!-- BRANCH_STATUS_README -->
<div align="center">

<img src="assets/rutasvenezuela-logo.svg" alt="RutasVenezuela" width="620">

# RutasVenezuela: estado de la rama

Documento temporal de trabajo. No reemplaza el README institucional ni debe aparecer en el PR final.

</div>

## Identificación

| Campo | Valor |
|---|---|
| Rama | `javier(docs/spec)-branch-readme-preview` |
| Responsable | Javier Otero |
| Tipo | `docs` |
| Capa | `spec` |
| Fecha de creación | 2026-11-23 |
| Rama de origen / destino | `develop` |
| Pull request | No creado: rama de demostración |
| Estado | Vista previa para revisión |

## Funcionalidad

Presentar un ejemplo de README temporal para las ramas de desarrollo. Esta rama sirve únicamente como demostración: no contiene implementación funcional, pruebas ejecutadas ni un pull request asociado.

## Cambios previstos

- Especificación y pruebas vinculadas al alcance.
- Cambios de implementación en la capa correspondiente.
- Validaciones de integración antes de abrir PR.

## Verificación

- Casos TDD: por vincular.
- Pruebas ejecutadas: ninguna sin evidencia.
- GitHub Actions: se evaluará durante el PR.

## Integración

[Constitución SDD](specs/constitution.md) · [Flujo Git](docs/development/git-workflow.md)

Antes de abrir el PR: `bash scripts/prepare-pr.sh`. La trazabilidad se conserva en `docs/project/branch-ledger.csv`.
