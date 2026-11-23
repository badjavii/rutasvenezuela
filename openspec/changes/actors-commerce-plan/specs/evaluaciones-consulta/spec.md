# evaluaciones consulta

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/requirements/traceability-detailed.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Valoraciones de una ruta

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero ver las valoraciones, las observaciones de seguridad y los comentarios de una ruta, para saber si me conviene.».

#### Scenario: Valoraciones de una ruta - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Valoraciones de una ruta»
- **WHEN** el actor solicita «Valoraciones de una ruta» en esas circunstancias
- **THEN** El visitante elige una ruta y el sistema lista sus evaluaciones con la calificación, la seguridad percibida, la fecha y la opinión.

#### Scenario: Valoraciones de una ruta - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Valoraciones de una ruta»
- **WHEN** el actor solicita «Valoraciones de una ruta» en esas circunstancias
- **THEN** Cada evaluación indica si tiene la marca de recorrido verificado. En las evaluaciones de una ruta la marca siempre es sí, porque exigen un recorrido completado.

#### Scenario: Valoraciones de una ruta - criterio 3

- **GIVEN** Se cumple la condición «la ruta no tiene evaluaciones»
- **WHEN** el actor solicita «Valoraciones de una ruta» en esas circunstancias
- **THEN** el sistema lo indica.

#### Scenario: Valoraciones de una ruta - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Valoraciones de una ruta»
- **WHEN** el actor solicita «Valoraciones de una ruta» en esas circunstancias
- **THEN** Un mismo visitante puede aparecer varias veces en la lista, porque publica una evaluación por cada recorrido.

