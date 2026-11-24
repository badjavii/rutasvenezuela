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

PostgreSQL conserva integridad y reglas transaccionales. El backend valida, autoriza y accede al gestor; el frontend presenta la información. No versionar secretos ni usar credenciales privilegiadas en el navegador.

## 7. Lenguaje y documentación

Código, identificadores y nombres Git en inglés; documentación y especificaciones en español. Evitar negritas ornamentales y rayas largas como separadores de títulos.

## 8. Verificación y definición de terminado

No completar tareas sin pruebas relevantes y regresión correcta, revisión de cambios fuera de alcance, actualización de `tasks.md` y `specs/memory.md`. Los casos CSV son pruebas planificadas, no ejecutadas.

## 9. Flujo Git

Ramas de trabajo desde `develop`; PR revisadas hacia `develop`, sin borrar ramas de desarrollo. `main` se reserva para versiones estables con tags. El README de estado de una rama nunca debe integrarse al README principal mediante PR. Consultar `docs/development/git-workflow.md`.
