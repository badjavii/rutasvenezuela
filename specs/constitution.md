# Constitución de trabajo

## 1. Desarrollo dirigido por especificaciones

Cada capacidad empieza con una necesidad documentada. No se implementa sin revisar y aprobar su especificación.

## 2. Trazabilidad

Necesidad → especificación → plan → tareas → pruebas → código → verificación. Las relaciones con HU, RR y mockups se consultan en las matrices de `docs/requirements/`.

## 3. Test-Driven Development

Para un comportamiento nuevo: escribir la prueba, confirmar RED, implementar el cambio mínimo, comprobar GREEN, refactorizar si aporta claridad y ejecutar regresión. No se exige RED/GREEN a cambios exclusivamente documentales.

## 4. Artefactos SDD

- `spec.md`: requisitos, reglas y criterios observables; no registra avances.
- `plan.md`: estrategia, componentes, pruebas y riesgos; no registra avances.
- `tasks.md`: único seguimiento del trabajo de la capacidad; marcar completado tras verificación.
- `specs/memory.md`: decisiones generales y siguiente prioridad. No duplica tareas.

Los artefactos viven en `specs/<dominio>/<capacidad>/`, no en directorios globales de agentes.

## 5. Revisión humana

Las decisiones arquitectónicas y de dominio pertenecen al equipo. Los agentes no cambian el modelo relacional validado, las reglas de negocio ni el alcance sin aprobación.

## 6. Seguridad y arquitectura

Tres capas y dos tecnologías ([arquitectura](../docs/architecture.md)):

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL, en el esquema `rutasvzla`. Conserva la integridad, las reglas de negocio (restricciones, triggers, funciones y procedimientos en PL/pgSQL) y la autorización, con un rol por actor y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions). En cada operación abre una transacción, fija el rol de la sesión con `SET LOCAL ROLE` y llama a la función o al procedimiento. No repite reglas del gestor ni decide permisos.
- Capa de presentación: Next.js (server components y client components). Presenta la información y los errores del gestor.

No versionar secretos ni enviar credenciales del gestor al navegador. El [contrato transversal de seguridad](../docs/development/security.md) establece identidad transaccional, autenticación inicial y autorización por registro. Su aprobación precede a la implementación de rutinas protegidas.

## 7. Lenguaje y documentación

Código de la aplicación, nombres Git y commits en inglés; documentación y especificaciones en español. Los objetos de la base de datos conservan los nombres en español del modelo relacional, en minúsculas y snake_case ([convenciones](../docs/development/database-conventions.md)). Evitar negritas ornamentales y rayas largas como separadores de títulos. El código TypeScript y sus pruebas cumplen la [guía de legibilidad](../docs/development/typescript-style-guide.md), con funciones declaradas, tipado estricto y control de flujo explícito.

## 8. Verificación y definición de terminado

No completar tareas sin pruebas relevantes y regresión correcta, revisión de cambios fuera de alcance, actualización de `tasks.md` y `specs/memory.md`. Los casos CSV son pruebas planificadas, no ejecutadas.

## 9. Flujo Git

Ramas de trabajo desde `develop`; PR revisadas hacia `develop`, sin borrar ramas de desarrollo. `main` se reserva para versiones estables con tags. El README de trazabilidad del workflow de una rama nunca debe integrarse al README principal mediante PR. Consultar `docs/development/git-workflow.md`.

## 10. Seguimiento de ramas

Las ramas nacen de `develop`, generan un README de trazabilidad desde [la plantilla](../templates/branch-readme.md) y registran su estado en [la matriz](../docs/project/branch-ledger.csv). Antes de abrir PR se restaura el README institucional, y el control automático rechaza el README de trazabilidad. La rama demostrativa no es base de nuevas funcionalidades.
