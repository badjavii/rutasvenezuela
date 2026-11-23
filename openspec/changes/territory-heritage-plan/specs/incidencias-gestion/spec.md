# incidencias gestion

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/trazabilidad-detallada.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Reportar incidencia

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante, guía o funcionario quiero reportar una incidencia en un hito o en un tramo de vía, para avisar a los demás usuarios.».

#### Scenario: Reportar incidencia - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Reportar incidencia»
- **WHEN** el actor solicita «Reportar incidencia» en esas circunstancias
- **THEN** El sistema asigna un número de reporte correlativo.

#### Scenario: Reportar incidencia - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Reportar incidencia»
- **WHEN** el actor solicita «Reportar incidencia» en esas circunstancias
- **THEN** Se registran la fecha y hora de detección, la fecha estimada de resolución, la narrativa y la severidad: bajo, medio o crítico.

#### Scenario: Reportar incidencia - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Reportar incidencia»
- **WHEN** el actor solicita «Reportar incidencia» en esas circunstancias
- **THEN** La incidencia se asocia a un hito o a un tramo de vía, o a una secuencia de tramos.

#### Scenario: Reportar incidencia - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Reportar incidencia»
- **WHEN** el actor solicita «Reportar incidencia» en esas circunstancias
- **THEN** Se guarda el usuario que la reporta: visitante, guía o funcionario.

#### Scenario: Reportar incidencia - criterio 5

- **GIVEN** Se cumple la condición «la reporta un visitante o un guía»
- **WHEN** el actor solicita «Reportar incidencia» en esas circunstancias
- **THEN** queda en estado preliminar hasta que un funcionario la verifique.

#### Scenario: Reportar incidencia - criterio 6

- **GIVEN** Se cumple la condición «la reporta un funcionario»
- **WHEN** el actor solicita «Reportar incidencia» en esas circunstancias
- **THEN** queda activa sin pasar por verificación.

### Requirement: Verificar incidencia

El sistema SHALL cumplir el siguiente objetivo funcional: «Como funcionario quiero verificar las incidencias preliminares, para que solo se publiquen hechos confirmados.».

#### Scenario: Verificar incidencia - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Verificar incidencia»
- **WHEN** el actor solicita «Verificar incidencia» en esas circunstancias
- **THEN** Solo un funcionario o autoridad competente puede verificar una incidencia.

#### Scenario: Verificar incidencia - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Verificar incidencia»
- **WHEN** el actor solicita «Verificar incidencia» en esas circunstancias
- **THEN** El funcionario ve la lista de incidencias en estado preliminar.

#### Scenario: Verificar incidencia - criterio 3

- **GIVEN** Se cumple la condición «el hecho es veraz»
- **WHEN** el actor solicita «Verificar incidencia» en esas circunstancias
- **THEN** la confirma: queda activa y el funcionario ratifica o cambia su severidad.

#### Scenario: Verificar incidencia - criterio 4

- **GIVEN** Se cumple la condición «el hecho no es veraz»
- **WHEN** el actor solicita «Verificar incidencia» en esas circunstancias
- **THEN** la descarta: la incidencia pasa a estado descartada y no afecta al hito ni al tramo.

### Requirement: Prorrogar incidencia

El sistema SHALL cumplir el siguiente objetivo funcional: «Como funcionario quiero prorrogar la fecha estimada de resolución de una incidencia, para que siga activa mientras se resuelve.».

#### Scenario: Prorrogar incidencia - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Prorrogar incidencia»
- **WHEN** el actor solicita «Prorrogar incidencia» en esas circunstancias
- **THEN** Solo un funcionario o autoridad competente puede prorrogar una incidencia.

#### Scenario: Prorrogar incidencia - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Prorrogar incidencia»
- **WHEN** el actor solicita «Prorrogar incidencia» en esas circunstancias
- **THEN** La prórroga exige una justificación; sin ella, el sistema la rechaza.

#### Scenario: Prorrogar incidencia - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Prorrogar incidencia»
- **WHEN** el actor solicita «Prorrogar incidencia» en esas circunstancias
- **THEN** La nueva fecha estimada debe ser posterior a la anterior.

#### Scenario: Prorrogar incidencia - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Prorrogar incidencia»
- **WHEN** el actor solicita «Prorrogar incidencia» en esas circunstancias
- **THEN** Se guarda la prórroga con su nueva fecha y su justificación.

#### Scenario: Prorrogar incidencia - criterio 5

- **GIVEN** Se cumplen las precondiciones del comportamiento «Prorrogar incidencia»
- **WHEN** el actor solicita «Prorrogar incidencia» en esas circunstancias
- **THEN** Una incidencia activa pasa a estado vencida si se supera su fecha estimada de resolución sin una prórroga justificada, y deja de afectar al hito o al tramo.

### Requirement: Cerrar incidencia

El sistema SHALL cumplir el siguiente objetivo funcional: «Como funcionario de la institución responsable quiero cerrar una incidencia resuelta, para que deje de afectar al hito o al tramo.».

#### Scenario: Cerrar incidencia - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Cerrar incidencia»
- **WHEN** el actor solicita «Cerrar incidencia» en esas circunstancias
- **THEN** Solo la autoridad institucional responsable puede cerrar la incidencia: un funcionario de una institución con competencia sobre el municipio del hito o del tramo afectado.

#### Scenario: Cerrar incidencia - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Cerrar incidencia»
- **WHEN** el actor solicita «Cerrar incidencia» en esas circunstancias
- **THEN** Solo se cierran incidencias en estado activa: una preliminar primero se verifica, y las descartadas o vencidas no se cierran.

#### Scenario: Cerrar incidencia - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Cerrar incidencia»
- **WHEN** el actor solicita «Cerrar incidencia» en esas circunstancias
- **THEN** Al cerrarse, la incidencia pasa a estado resuelta y se guarda la fecha de cierre.

