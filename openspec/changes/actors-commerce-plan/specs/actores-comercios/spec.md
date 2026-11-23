# actores comercios

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/trazabilidad-detallada.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Registrar comercio

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar comercios y aliados de servicio, para que puedan ofrecer sus servicios en las rutas.».

#### Scenario: Registrar comercio - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar comercio»
- **WHEN** el actor solicita «Registrar comercio» en esas circunstancias
- **THEN** Se identifica por su RIF jurídico; si ya existe, el sistema lo rechaza.

#### Scenario: Registrar comercio - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar comercio»
- **WHEN** el actor solicita «Registrar comercio» en esas circunstancias
- **THEN** Tiene razón social, categoría comercial (gastronómico, sanitario o alquiler de equipos), aforo, número de permiso sanitario, horario de atención y cuenta bancaria.

#### Scenario: Registrar comercio - criterio 3

- **GIVEN** Se cumple la condición «la razón social ya existe»
- **WHEN** el actor solicita «Registrar comercio» en esas circunstancias
- **THEN** el sistema lo rechaza.

#### Scenario: Registrar comercio - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar comercio»
- **WHEN** el actor solicita «Registrar comercio» en esas circunstancias
- **THEN** Tiene una contraseña para entrar con su RIF.

#### Scenario: Registrar comercio - criterio 5

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar comercio»
- **WHEN** el actor solicita «Registrar comercio» en esas circunstancias
- **THEN** La ubicación del comercio se guarda como latitud, longitud y elevación en decimales.

### Requirement: Consultar comercio

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar los comercios registrados, para saber quiénes ofrecen servicios.».

#### Scenario: Consultar comercio - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar comercio»
- **WHEN** el actor solicita «Consultar comercio» en esas circunstancias
- **THEN** Puedo ver el listado de los comercios.

#### Scenario: Consultar comercio - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar comercio»
- **WHEN** el actor solicita «Consultar comercio» en esas circunstancias
- **THEN** Puedo abrir un comercio y ver todos sus datos.

### Requirement: Modificar comercio

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar los datos de un comercio, para mantenerlos al día.».

#### Scenario: Modificar comercio - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar comercio»
- **WHEN** el actor solicita «Modificar comercio» en esas circunstancias
- **THEN** Puedo cambiar cualquier dato del comercio.

#### Scenario: Modificar comercio - criterio 2

- **GIVEN** Se cumple la condición «cambio el RIF por uno que ya existe»
- **WHEN** el actor solicita «Modificar comercio» en esas circunstancias
- **THEN** el sistema lo rechaza.

#### Scenario: Modificar comercio - criterio 3

- **GIVEN** Se cumple la condición «cambio la razón social por una que ya existe»
- **WHEN** el actor solicita «Modificar comercio» en esas circunstancias
- **THEN** el sistema lo rechaza.

#### Scenario: Modificar comercio - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar comercio»
- **WHEN** el actor solicita «Modificar comercio» en esas circunstancias
- **THEN** La ubicación sigue guardándose como latitud, longitud y elevación en decimales.

### Requirement: Eliminar comercio

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar comercios, para quitar los que ya no participan.».

#### Scenario: Eliminar comercio - criterio 1

- **GIVEN** Se cumple la condición «el comercio no tiene experiencias ni credenciales asociadas»
- **WHEN** el actor solicita «Eliminar comercio» en esas circunstancias
- **THEN** se elimina.

#### Scenario: Eliminar comercio - criterio 2

- **GIVEN** Se cumple la condición «tiene experiencias o credenciales asociadas»
- **WHEN** el actor solicita «Eliminar comercio» en esas circunstancias
- **THEN** el sistema no lo elimina.

