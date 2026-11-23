# Guía para agentes — RutasVenezuela

Proyecto académico del **equipo 2** de Sistemas de Bases de Datos (UCAB). Profesora: **Marlene Goncalves Da Silva**.

## Orden de consulta

1. [Arquitectura y decisiones](docs/arquitectura.md)
2. [Mapa de trazabilidad HU/RR/interfaces](docs/trazabilidad.md)
3. [Especificaciones y flujo OpenSpec](docs/sdd-openspec.md)
4. [Estrategia TDD](docs/pruebas-tdd.md)
5. [Convención de ramas y PR](docs/flujo-git.md)
6. [Fuentes y correcciones pendientes](docs/fuentes.md)

## Reglas

- **PostgreSQL es la fuente de verdad** de invariantes y lógica del negocio; los triggers/procedimientos/funciones pertenecen al gestor.
- FastAPI y React son la **propuesta provisional** para las capas de aplicación e interfaz; una alternativa Node.js está pendiente de evaluar.
- Mantener un único OpenSpec bajo `openspec/`. Hay **3 cambios de dominio** con **23 capacidades**, derivados de las **103 historias** y **324 criterios** del informe. No duplicar reglas por capa.
- Los escenarios planificados requieren revisión humana antes de implementar; consultar `docs/pruebas/casos-criterios.csv`, `docs/pruebas/casos-rr.csv` y `docs/pruebas/casos-interfaces.csv`.
- SDD: especificar comportamientos observables; TDD: derivar pruebas por capa desde escenarios aprobados.
- Conservar identificadores académicos solamente en el mapa; usar lenguaje de dominio en specs y pruebas.
- La corrección académica fue aclarada: **el modelo relacional entregado no requiere cambios**. Las observaciones corresponden al ERE y sus decisiones de modelado; ver [observaciones](docs/observaciones-ere.md). No atribuir reglas adicionales a la profesora.
- No inventar tablas, atributos, historias, RR, mockups o estados. Marcar toda propuesta.
- Cada miembro trabaja en su dominio **a través de base de datos, API e interfaz**.
- Ramas: `<author>(<kind>/<layer>)-<description>`, en inglés y entrecomilladas al usar Bash; los dos puntos (`:`) están prohibidos en refs.
- No desplegar, mezclar PR ni ejecutar migraciones contra producción sin revisión.
- No incluir secretos, credenciales ni documentos académicos con identificadores personales sin consentimiento.
