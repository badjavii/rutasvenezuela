# reportes conservacion

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/trazabilidad-detallada.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Estado de conservación e incidencias por territorio

El sistema SHALL cumplir el siguiente objetivo funcional: «Como institución quiero ver el estado de conservación de los hitos y sus incidencias por territorio, para tomar decisiones de mantenimiento.».

#### Scenario: Estado de conservación e incidencias por territorio - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Estado de conservación e incidencias por territorio»
- **WHEN** el actor solicita «Estado de conservación e incidencias por territorio» en esas circunstancias
- **THEN** Se puede filtrar por estado y por municipio.

#### Scenario: Estado de conservación e incidencias por territorio - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Estado de conservación e incidencias por territorio»
- **WHEN** el actor solicita «Estado de conservación e incidencias por territorio» en esas circunstancias
- **THEN** Muestra cuántos hitos hay en cada estado operativo: disponible, en restauración, clausurado temporalmente y cerrado permanentemente.

#### Scenario: Estado de conservación e incidencias por territorio - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Estado de conservación e incidencias por territorio»
- **WHEN** el actor solicita «Estado de conservación e incidencias por territorio» en esas circunstancias
- **THEN** Muestra cuántas incidencias en estado activa hay, sin contar las descartadas ni las vencidas, y cuántas son críticas.

#### Scenario: Estado de conservación e incidencias por territorio - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Estado de conservación e incidencias por territorio»
- **WHEN** el actor solicita «Estado de conservación e incidencias por territorio» en esas circunstancias
- **THEN** Muestra los días promedio de resolución, calculados entre la fecha de detección y la fecha de cierre, sobre las incidencias en estado resuelta del territorio filtrado.

