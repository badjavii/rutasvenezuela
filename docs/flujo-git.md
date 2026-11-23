# Flujo de trabajo Git y pull requests

Usaremos **main protegido por revisión humana de PR** como convención operativa (la protección automática de rama debe configurarse en GitHub por quienes administran el repositorio).

## Ramas

Git **no permite paréntesis ni dos puntos** en determinados nombres de referencia; en lugar de `feature(database):territories/table-creations`, emplearemos:

```
feature/<integrante>/<modulo>/<capa>-<tarea>
```

Ejemplos:

```text
feature/javier/territorio/database-estructuras
feature/javier/incidencias/database-rutinas
feature/javier/incidencias/backend-reportes
feature/javier/incidencias/frontend-formulario
feature/sebastian/movilidad/database-tramos
feature/valeria/credenciales/database-canjes
feature/valeria/actores/frontend-gestion
docs/javier/sdd-tdd-trazabilidad
```

Integrantes (segmentos normalizados): `javier`, `sebastian`, `valeria`. Capas: `database`, `backend`, `frontend`, `integracion`. Para cambios de documentación se permite `docs/<integrante>/<tema>`.

## Procedimiento

1. Actualizar `main` local; crear rama de un alcance pequeño.
2. Consultar la spec vigente y el [mapa](trazabilidad.md).
3. Documentar primero escenarios y pruebas previstas. En implementación: RED → GREEN → REFACTOR.
4. Commit progresivo y **desde la cuenta real del integrante**; no agrupar el trabajo de todos bajo un mismo autor.
5. Abrir PR a `main` con enlaces a capacidad OpenSpec, pruebas, evidencia y cambios de esquema.
6. Ejecutar Actions, obtener revisión de otro integrante y resolver observaciones.
7. Integrar mediante merge; no reescribir la historia de contribuciones ni simular commits.

## Plantilla corta de PR

```markdown
## Alcance
- Módulo / capa / responsable:

## Contrato
- Spec OpenSpec:
- Entrada del mapa de trazabilidad:
- Correcciones pendientes:

## Verificación
- Escenarios y pruebas automatizadas:
- Pruebas ejecutadas / no ejecutadas:
- Evidencia de la BD:

## Riesgos
- Dependencias y migraciones:
```

## Colaboración entre capas

Cada integrante implementa sus historias en **todas** las capas. Si una funcionalidad cruza módulos (p. ej. incidencias ↔ tramos), el dueño coordina dependencias con quien mantiene esas relaciones. Evitar commits directos en `main` y mantener la revisión humana de migraciones SQL.
