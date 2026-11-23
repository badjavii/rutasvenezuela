# Instrucciones de agentes — RutasVenezuela

Proyecto del **Equipo 2** de Sistemas de Bases de Datos (UCAB). Documentos en español, nombres técnicos de ramas/commits/PR en inglés.

## Orden de consulta

1. [Inicio de documentación](docs/README.md)
2. [Fuentes académicas originales](references/README.md)
3. [Mapa de trazabilidad](docs/requirements/traceability.md)
4. [Guía SDD / OpenSpec](docs/development/sdd-guide.md)
5. [Guía TDD](docs/development/tdd-guide.md)
6. [Arquitectura](docs/architecture.md)
7. [Git workflow](docs/development/git-workflow.md)

## Reglas de trabajo

- **PostgreSQL/Supabase** mantiene reglas del negocio, invariantes, procedimientos, funciones, triggers y restricciones. No suplir estas garantías únicamente en API/UI.
- **FastAPI/React son tecnologías de referencia provisionales** para la aplicación. No congelar APIs, librerías o herramientas sin aprobación.
- El modelo relacional de la primera entrega **se conserva**. Las observaciones de la profesora sobre el ERE no autorizan rediseñarlo.
- Los requisitos y criterios de aceptación provienen de `references/first-delivery.md`; los identificadores académicos se localizan mediante la matriz de trazabilidad. No inventar HU, RR, nombres de tablas ni estados.
- OpenSpec en `openspec/` mantiene capacidades y escenarios; los CSV de TDD son planes, **no pruebas ejecutadas**.
- Cada integrante desarrolla funcionalidades del dominio asignado en las capas necesarias.
- Implementación futura: escenario aprobado → prueba RED → implementación GREEN → REFACTOR → revisión.
- Todas las PR de trabajo van hacia `develop`; solo `develop` puede promocionarse a `main` mediante PR de release revisada y Git tag.
- Ramas según `<author>(<kind>/<layer>)-<description>`, en inglés, sin dos puntos; **conservar las ramas tras el merge**.
- No hacer merges, force pushes, cambios directos a `main` o despliegues de producción por cuenta propia.
- No introducir credenciales o secretos en archivos versionados. Revisar la exposición de datos personales del informe original antes de redistribuirlo.
