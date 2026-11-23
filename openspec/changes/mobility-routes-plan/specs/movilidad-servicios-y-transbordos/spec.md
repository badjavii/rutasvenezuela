# movilidad servicios y transbordos

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/requirements/traceability-detailed.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Servicios en un recorrido

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero ver los servicios de una tipología disponibles a lo largo de una ruta y el tiempo estimado para llegar a cada uno, para planificar mis paradas.».

#### Scenario: Servicios en un recorrido - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Servicios en un recorrido»
- **WHEN** el actor solicita «Servicios en un recorrido» en esas circunstancias
- **THEN** El visitante elige una ruta y una tipología de servicio, que es la categoría comercial del comercio: gastronómico, sanitario o alquiler de equipos.

#### Scenario: Servicios en un recorrido - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Servicios en un recorrido»
- **WHEN** el actor solicita «Servicios en un recorrido» en esas circunstancias
- **THEN** El sistema lista los comercios de esa tipología que están a 500 m o menos de algún hito o parada de la ruta.

#### Scenario: Servicios en un recorrido - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Servicios en un recorrido»
- **WHEN** el actor solicita «Servicios en un recorrido» en esas circunstancias
- **THEN** Para cada comercio muestra el tiempo estimado de llegada, calculado desde el inicio de la ruta o desde la posición actual del visitante, según elija.

#### Scenario: Servicios en un recorrido - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Servicios en un recorrido»
- **WHEN** el actor solicita «Servicios en un recorrido» en esas circunstancias
- **THEN** Desde el inicio, la distancia es la suma de las distancias entre los hitos y paradas consecutivos de la secuencia hasta el hito o parada más cercano al comercio, más la distancia de ese punto al comercio; desde la posición actual, es la distancia en línea recta.

#### Scenario: Servicios en un recorrido - criterio 5

- **GIVEN** Se cumplen las precondiciones del comportamiento «Servicios en un recorrido»
- **WHEN** el actor solicita «Servicios en un recorrido» en esas circunstancias
- **THEN** El tiempo es la distancia dividida entre la velocidad fija del modo de transporte del visitante: a pie 5 km/h, bicicleta 15 km/h, transporte público 20 km/h y vehículo adaptado 20 km/h.

#### Scenario: Servicios en un recorrido - criterio 6

- **GIVEN** Se cumplen las precondiciones del comportamiento «Servicios en un recorrido»
- **WHEN** el actor solicita «Servicios en un recorrido» en esas circunstancias
- **THEN** La distancia se calcula con latitud, longitud y elevación en decimales, con funciones trigonométricas y sin tipos espaciales.

#### Scenario: Servicios en un recorrido - criterio 7

- **GIVEN** Se cumple la condición «no hay comercios de esa tipología en la ruta»
- **WHEN** el actor solicita «Servicios en un recorrido» en esas circunstancias
- **THEN** el sistema lo indica.

### Requirement: Paradas de transbordo operativas

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero ver las paradas de transporte de una ruta y saber si sus vías adyacentes están operativas, para hacer transbordo con seguridad.».

#### Scenario: Paradas de transbordo operativas - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Paradas de transbordo operativas»
- **WHEN** el actor solicita «Paradas de transbordo operativas» en esas circunstancias
- **THEN** El visitante elige una ruta y el sistema lista las paradas que forman parte de su secuencia.

#### Scenario: Paradas de transbordo operativas - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Paradas de transbordo operativas»
- **WHEN** el actor solicita «Paradas de transbordo operativas» en esas circunstancias
- **THEN** Para cada parada muestra su estado (activa, en mantenimiento o fuera de servicio) y si el tramo de vía donde está, o los tramos conectados a él, tienen incidencias activas. Las incidencias preliminares (aún sin verificar) se muestran como aviso.

#### Scenario: Paradas de transbordo operativas - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Paradas de transbordo operativas»
- **WHEN** el actor solicita «Paradas de transbordo operativas» en esas circunstancias
- **THEN** Una parada cuya vía tiene cierre total por mantenimiento no se ofrece como opción de transbordo.

#### Scenario: Paradas de transbordo operativas - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Paradas de transbordo operativas»
- **WHEN** el actor solicita «Paradas de transbordo operativas» en esas circunstancias
- **THEN** Una incidencia que afecta solo un tramo no marca como afectada toda la vía.

