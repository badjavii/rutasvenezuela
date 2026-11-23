# instituciones entes

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/requirements/traceability-detailed.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Registrar institución

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar instituciones y entes públicos patrimoniales, para que participen en la verificación de incidencias y el mantenimiento.».

#### Scenario: Registrar institución - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar institución»
- **WHEN** el actor solicita «Registrar institución» en esas circunstancias
- **THEN** Se identifica por su RIF institucional; si ya existe, el sistema la rechaza.

#### Scenario: Registrar institución - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar institución»
- **WHEN** el actor solicita «Registrar institución» en esas circunstancias
- **THEN** Tiene denominación oficial, nivel territorial de competencia, nombre del funcionario enlace y decreto oficial de adscripción patrimonial.

#### Scenario: Registrar institución - criterio 3

- **GIVEN** Se cumple la condición «la denominación oficial ya existe»
- **WHEN** el actor solicita «Registrar institución» en esas circunstancias
- **THEN** el sistema la rechaza.

#### Scenario: Registrar institución - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar institución»
- **WHEN** el actor solicita «Registrar institución» en esas circunstancias
- **THEN** Tiene una contraseña para entrar con su RIF.

#### Scenario: Registrar institución - criterio 5

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar institución»
- **WHEN** el actor solicita «Registrar institución» en esas circunstancias
- **THEN** Se registran los municipios sobre los que tiene competencia, uno o varios.

### Requirement: Consultar institución

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar las instituciones registradas, para saber qué entes participan.».

#### Scenario: Consultar institución - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar institución»
- **WHEN** el actor solicita «Consultar institución» en esas circunstancias
- **THEN** Puedo ver el listado de las instituciones.

#### Scenario: Consultar institución - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar institución»
- **WHEN** el actor solicita «Consultar institución» en esas circunstancias
- **THEN** Puedo abrir una institución y ver todos sus datos y los municipios sobre los que tiene competencia.

### Requirement: Modificar institución

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar los datos de una institución, para mantenerlos al día.».

#### Scenario: Modificar institución - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar institución»
- **WHEN** el actor solicita «Modificar institución» en esas circunstancias
- **THEN** Puedo cambiar cualquier dato de la institución y sus municipios de competencia.

#### Scenario: Modificar institución - criterio 2

- **GIVEN** Se cumple la condición «cambio el RIF por uno que ya existe»
- **WHEN** el actor solicita «Modificar institución» en esas circunstancias
- **THEN** el sistema lo rechaza.

#### Scenario: Modificar institución - criterio 3

- **GIVEN** Se cumple la condición «cambio la denominación oficial por una que ya existe»
- **WHEN** el actor solicita «Modificar institución» en esas circunstancias
- **THEN** el sistema lo rechaza.

### Requirement: Eliminar institución

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar instituciones, para quitar las que ya no participan.».

#### Scenario: Eliminar institución - criterio 1

- **GIVEN** Se cumple la condición «la institución no tiene funcionarios asociados»
- **WHEN** el actor solicita «Eliminar institución» en esas circunstancias
- **THEN** se elimina.

#### Scenario: Eliminar institución - criterio 2

- **GIVEN** Se cumple la condición «tiene funcionarios asociados»
- **WHEN** el actor solicita «Eliminar institución» en esas circunstancias
- **THEN** el sistema no la elimina.

