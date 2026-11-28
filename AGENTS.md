# Instrucciones para agentes

RutasVenezuela es el proyecto del Equipo 2 de Sistemas de Bases de Datos (UCAB). Los documentos se redactan en español; código, ramas, commits y títulos PR se redactan en inglés.

## Orden de consulta

1. [Documentación](docs/README.md)
2. [Fuente académica](references/first-delivery.md)
3. [Constitución de trabajo](specs/constitution.md)
4. [Matriz de trazabilidad](docs/requirements/traceability-detailed.csv)
5. [SDD](docs/development/sdd-guide.md) y [TDD](docs/development/tdd-guide.md)
6. [Git workflow](docs/development/git-workflow.md)

## Reglas

- Se usan `specs/<dominio>/<capacidad>/spec.md`, `plan.md` y `tasks.md`. No se requiere OpenSpec.
- El modelo relacional de la primera entrega se conserva. PostgreSQL/Supabase contiene las reglas de negocio, triggers, procedimientos, funciones y restricciones.
- Arquitectura adoptada: Next.js para las capas de presentación y aplicación, y PostgreSQL en Supabase (solo como PostgreSQL) para la capa de datos. La autorización la hace el gestor con roles; no hay una API aparte. Ver [arquitectura](docs/architecture.md).
- Los objetos de la base de datos van en el esquema `rutasvzla`, con los nombres del modelo relacional en snake_case; ver [convenciones](docs/development/database-conventions.md).
- No inventar HU, RR, campos, endpoints, tablas ni supuestos; consultar los documentos originales antes de implementar.
- Antes de escribir código, revisar la especificación y crear pruebas: RED, GREEN, refactorización y regresión.
- `tasks.md` registra el progreso; `specs/memory.md` reúne decisiones y siguiente trabajo.
- No declarar pruebas ejecutadas cuando solo existen casos planificados.
- Las ramas de desarrollo nacen de `develop` y preservan su historial. Los PR de trabajo se dirigen a `develop`.
- No publicar README de trazabilidad del workflow de rama en un PR. Consultar las instrucciones de la constitución y del Git workflow para el procedimiento de limpieza.
- No modificar `main`, fusionar cambios, forzar refs o desplegar sin autorización.
- No subir secretos ni alterar fuentes académicas originales.

## Convenciones de código

Aplicar la [guía de TypeScript](docs/development/typescript-style-guide.md) al código propio y las pruebas: funciones nombradas, sin flechas ni any, tipos estrictos, control de flujo explícito y separación de capas. Configurar lint y typecheck al inicializar web/; no afirmar que se ejecutaron si aún no existen.

## README de trazabilidad y registro de ramas

- Crear ramas desde `origin/develop` con `bash scripts/new-work-branch.sh`.
- Antes del PR, restaurar README estable con `bash scripts/prepare-pr.sh`; no integrar el README de trazabilidad de la rama.
- Usar [el registro de ramas](docs/project/branch-ledger.csv) para fechas y estado, sin inventar PR o ejecución de pruebas.
- La rama de demostración del README no es base de desarrollo.
