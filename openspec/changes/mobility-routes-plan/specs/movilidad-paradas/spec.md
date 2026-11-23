# movilidad paradas

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/trazabilidad-detallada.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Registrar parada de transporte

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar paradas de transporte, para que los visitantes sepan dónde hacer transbordo.».

#### Scenario: Registrar parada de transporte - criterio 1

- **GIVEN** Se cumple la condición «registro una parada con un código oficial de terminal que ya existe»
- **WHEN** el actor solicita «Registrar parada de transporte» en esas circunstancias
- **THEN** el sistema la rechaza.

#### Scenario: Registrar parada de transporte - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar parada de transporte»
- **WHEN** el actor solicita «Registrar parada de transporte» en esas circunstancias
- **THEN** Cada parada tiene nombre, modalidad, tarifa básica en moneda nacional, nivel de adecuación para discapacidad, horario de apertura y cierre, frecuencia de paso en minutos y aforo máximo.

#### Scenario: Registrar parada de transporte - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar parada de transporte»
- **WHEN** el actor solicita «Registrar parada de transporte» en esas circunstancias
- **THEN** Su estado es uno de estos: activa, en mantenimiento o fuera de servicio.

#### Scenario: Registrar parada de transporte - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar parada de transporte»
- **WHEN** el actor solicita «Registrar parada de transporte» en esas circunstancias
- **THEN** Se indica si tiene techo, iluminación nocturna, taquilla, vigilancia y estacionamiento o resguardo de bicicletas.

#### Scenario: Registrar parada de transporte - criterio 5

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar parada de transporte»
- **WHEN** el actor solicita «Registrar parada de transporte» en esas circunstancias
- **THEN** La ubicación se guarda como latitud, longitud y elevación en decimales.

#### Scenario: Registrar parada de transporte - criterio 6

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar parada de transporte»
- **WHEN** el actor solicita «Registrar parada de transporte» en esas circunstancias
- **THEN** No se puede registrar una parada sin asociarla a una vía habilitada, indicando el tramo de esa vía donde está.

#### Scenario: Registrar parada de transporte - criterio 7

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar parada de transporte»
- **WHEN** el actor solicita «Registrar parada de transporte» en esas circunstancias
- **THEN** Se puede asociar la parada con los hitos cercanos y con las rutas que usan su modalidad.

### Requirement: Consultar parada de transporte

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar las paradas de transporte, para revisar dónde están y en qué estado.».

#### Scenario: Consultar parada de transporte - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar parada de transporte»
- **WHEN** el actor solicita «Consultar parada de transporte» en esas circunstancias
- **THEN** Puedo ver las paradas de una vía con su estado.

#### Scenario: Consultar parada de transporte - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar parada de transporte»
- **WHEN** el actor solicita «Consultar parada de transporte» en esas circunstancias
- **THEN** Puedo abrir una parada y ver todos sus datos, su tramo, los hitos cercanos y las rutas asociadas.

### Requirement: Modificar parada de transporte

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar los datos y el estado de una parada, para mantenerla al día.».

#### Scenario: Modificar parada de transporte - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar parada de transporte»
- **WHEN** el actor solicita «Modificar parada de transporte» en esas circunstancias
- **THEN** Puedo cambiar sus datos y su estado: activa, en mantenimiento o fuera de servicio.

#### Scenario: Modificar parada de transporte - criterio 2

- **GIVEN** Se cumple la condición «cambio el código oficial de terminal por uno que ya existe»
- **WHEN** el actor solicita «Modificar parada de transporte» en esas circunstancias
- **THEN** el sistema lo rechaza.

#### Scenario: Modificar parada de transporte - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar parada de transporte»
- **WHEN** el actor solicita «Modificar parada de transporte» en esas circunstancias
- **THEN** La parada sigue asociada a una vía habilitada, con el tramo donde está; si la cambio de vía, también indico el tramo.

#### Scenario: Modificar parada de transporte - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar parada de transporte»
- **WHEN** el actor solicita «Modificar parada de transporte» en esas circunstancias
- **THEN** Puedo cambiar los hitos cercanos y las rutas asociadas.

### Requirement: Eliminar parada de transporte

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar paradas de transporte, para quitar las que ya no existen.».

#### Scenario: Eliminar parada de transporte - criterio 1

- **GIVEN** Se cumple la condición «la parada no forma parte de ninguna ruta»
- **WHEN** el actor solicita «Eliminar parada de transporte» en esas circunstancias
- **THEN** se elimina.

#### Scenario: Eliminar parada de transporte - criterio 2

- **GIVEN** Se cumple la condición «forma parte de una ruta»
- **WHEN** el actor solicita «Eliminar parada de transporte» en esas circunstancias
- **THEN** el sistema no la elimina.

