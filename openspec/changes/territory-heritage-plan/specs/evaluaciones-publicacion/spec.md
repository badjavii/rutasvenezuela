# evaluaciones publicacion

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/trazabilidad-detallada.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Publicar evaluación

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero calificar una ruta o un hito que recorrí, para orientar a otros visitantes.».

#### Scenario: Publicar evaluación - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Publicar evaluación»
- **WHEN** el actor solicita «Publicar evaluación» en esas circunstancias
- **THEN** Cada evaluación tiene un código de reseña único.

#### Scenario: Publicar evaluación - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Publicar evaluación»
- **WHEN** el actor solicita «Publicar evaluación» en esas circunstancias
- **THEN** La calificación y la seguridad percibida van de 1 a 5 estrellas; el sistema rechaza valores fuera de ese rango.

#### Scenario: Publicar evaluación - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Publicar evaluación»
- **WHEN** el actor solicita «Publicar evaluación» en esas circunstancias
- **THEN** Se guardan la fecha de emisión y la opinión textual. La marca de recorrido verificado no se escribe a mano: es sí cuando el recorrido que respalda la evaluación está completado, y no cuando está abandonado (solo posible al evaluar un hito).

#### Scenario: Publicar evaluación - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Publicar evaluación»
- **WHEN** el actor solicita «Publicar evaluación» en esas circunstancias
- **THEN** La evaluación se liga a un visitante registrado y a una ruta o a un hito.

#### Scenario: Publicar evaluación - criterio 5

- **GIVEN** Se cumplen las precondiciones del comportamiento «Publicar evaluación»
- **WHEN** el actor solicita «Publicar evaluación» en esas circunstancias
- **THEN** Para evaluar una ruta, el visitante debe tener un recorrido completado de esa ruta; para evaluar un hito, un recorrido (completado o abandonado) que haya pasado por ese hito. Si no, el sistema rechaza la evaluación.

#### Scenario: Publicar evaluación - criterio 6

- **GIVEN** Se cumplen las precondiciones del comportamiento «Publicar evaluación»
- **WHEN** el actor solicita «Publicar evaluación» en esas circunstancias
- **THEN** Cada evaluación queda ligada al recorrido que la respalda.

#### Scenario: Publicar evaluación - criterio 7

- **GIVEN** Se cumplen las precondiciones del comportamiento «Publicar evaluación»
- **WHEN** el actor solicita «Publicar evaluación» en esas circunstancias
- **THEN** El visitante publica una evaluación nueva por cada viaje y las anteriores se conservan: no se actualiza la anterior. Un recorrido respalda como máximo una evaluación de su ruta y una por cada hito que transitó.

