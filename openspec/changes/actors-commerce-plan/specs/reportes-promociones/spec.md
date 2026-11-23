# reportes promociones

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/requirements/traceability-detailed.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Desempeño de experiencias y credenciales

El sistema SHALL cumplir el siguiente objetivo funcional: «Como comercio o guía quiero ver los cupos usados, las credenciales canjeadas y el monto de cada experiencia, para medir mis ventas.».

#### Scenario: Desempeño de experiencias y credenciales - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Desempeño de experiencias y credenciales»
- **WHEN** el actor solicita «Desempeño de experiencias y credenciales» en esas circunstancias
- **THEN** Cada comercio o guía ve solo sus propias experiencias.

#### Scenario: Desempeño de experiencias y credenciales - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Desempeño de experiencias y credenciales»
- **WHEN** el actor solicita «Desempeño de experiencias y credenciales» en esas circunstancias
- **THEN** Para cada experiencia muestra su cupo máximo y los días que faltan para su vencimiento.

#### Scenario: Desempeño de experiencias y credenciales - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Desempeño de experiencias y credenciales»
- **WHEN** el actor solicita «Desempeño de experiencias y credenciales» en esas circunstancias
- **THEN** Muestra cuántas credenciales amparadas por la experiencia se emitieron, canjearon, cancelaron y vencieron, y el monto total abonado, sin contar las credenciales canceladas.

