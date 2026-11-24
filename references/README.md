# Fuentes originales y contexto

Se conservan dos referencias de trabajo independientes de las especificaciones SDD/TDD.

## 1. Informe de la primera entrega

[**RutasVenezuela — Primera entrega (Markdown íntegro sin imágenes)**](first-delivery.md).

Documento exportado de Google Docs y limpiado exclusivamente para retirar **26 imágenes incrustadas** y sus declaraciones Base64. El texto académico, las tablas, fórmulas, capítulos, historias y restricciones se mantienen sin reescritura. Es la **fuente de verdad principal** del modelo relacional entregado, las HU, las RR y los criterios de aceptación.

**Aviso de publicación:** el informe incluye nombres y números de identificación de integrantes, presentes en el original. Este repositorio es público; el equipo debe confirmar que su publicación es apropiada. Cualquier futura edición de esos datos debe acordarse explícitamente, nunca hacerla pasar por una copia íntegra.

## 2. Repositorio de contexto de Sebastián

[**Sebasarmas19/BaseDeDatos_logica**](https://github.com/Sebasarmas19/BaseDeDatos_logica)

Este repositorio es la **segunda referencia** de contexto. Al preparar esta integración, GitHub respondió `404 Not Found` a la consulta de ese repositorio con la conexión disponible. **Por ello todavía no se añadió como submódulo**: crear un gitlink sin comprobar un commit accesible dejaría la clonación rota.

Cuando se habilite el acceso (repositorio público o permisos suficientes para la cuenta/herramientas), integrar desde `develop` con un commit verificable:

```bash
git switch develop
git pull --ff-only origin develop
git switch -c 'javier(docs/spec)-add-context-submodule'
git submodule add https://github.com/Sebasarmas19/BaseDeDatos_logica.git references/context
git add .gitmodules references/context
git commit -m "docs(references): add context repository as submodule"
git push -u origin 'javier(docs/spec)-add-context-submodule'
```

Abrir PR hacia `develop`, revisar los permisos de acceso y el SHA del submódulo. **No añadirlo como upstream remoto**: no queremos mezclar la historia del proyecto de contexto con la de RutasVenezuela.

## Relación con el desarrollo

La [trazabilidad](../docs/requirements/traceability.md) asocia los identificadores académicos con las capacidades de [las especificaciones SDD](../specs/README.md) y los casos [TDD](../docs/development/tdd-guide.md). Las especificaciones no sustituyen estas fuentes.
