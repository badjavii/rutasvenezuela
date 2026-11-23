# territorio catalogo

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/trazabilidad-detallada.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Registrar estado

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar los estados del país, para ubicar en el territorio los hitos, las rutas y las vías.».

#### Scenario: Registrar estado - criterio 1

- **GIVEN** Se cumple la condición «registro un estado con un nombre que ya existe»
- **WHEN** el actor solicita «Registrar estado» en esas circunstancias
- **THEN** el sistema lo rechaza.

### Requirement: Consultar estado

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar los estados registrados, para ver qué territorio está cargado.».

#### Scenario: Consultar estado - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar estado»
- **WHEN** el actor solicita «Consultar estado» en esas circunstancias
- **THEN** Puedo ver el listado de los estados.

### Requirement: Modificar estado

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar un estado, para corregir su nombre.».

#### Scenario: Modificar estado - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar estado»
- **WHEN** el actor solicita «Modificar estado» en esas circunstancias
- **THEN** Puedo cambiar el nombre del estado.

#### Scenario: Modificar estado - criterio 2

- **GIVEN** Se cumple la condición «cambio el nombre por uno que ya existe»
- **WHEN** el actor solicita «Modificar estado» en esas circunstancias
- **THEN** el sistema lo rechaza.

### Requirement: Eliminar estado

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar estados, para quitar los que se cargaron por error.».

#### Scenario: Eliminar estado - criterio 1

- **GIVEN** Se cumple la condición «el estado no tiene municipios»
- **WHEN** el actor solicita «Eliminar estado» en esas circunstancias
- **THEN** se elimina.

#### Scenario: Eliminar estado - criterio 2

- **GIVEN** Se cumple la condición «tiene municipios»
- **WHEN** el actor solicita «Eliminar estado» en esas circunstancias
- **THEN** el sistema no lo elimina.

### Requirement: Registrar municipio

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar los municipios de cada estado, para ubicar en el territorio los hitos, las rutas y las vías.».

#### Scenario: Registrar municipio - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar municipio»
- **WHEN** el actor solicita «Registrar municipio» en esas circunstancias
- **THEN** Cada municipio pertenece a un estado.

#### Scenario: Registrar municipio - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar municipio»
- **WHEN** el actor solicita «Registrar municipio» en esas circunstancias
- **THEN** Se acepta el mismo nombre de municipio en estados distintos (por ejemplo, Sucre o Libertador).

#### Scenario: Registrar municipio - criterio 3

- **GIVEN** Se cumple la condición «registro un municipio con un nombre que ya existe en el mismo estado»
- **WHEN** el actor solicita «Registrar municipio» en esas circunstancias
- **THEN** el sistema lo rechaza.

### Requirement: Consultar municipio

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar los municipios, para ver qué territorio está cargado en cada estado.».

#### Scenario: Consultar municipio - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar municipio»
- **WHEN** el actor solicita «Consultar municipio» en esas circunstancias
- **THEN** Puedo ver los municipios de un estado.

### Requirement: Modificar municipio

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar un municipio, para corregir su nombre o su estado.».

#### Scenario: Modificar municipio - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar municipio»
- **WHEN** el actor solicita «Modificar municipio» en esas circunstancias
- **THEN** Puedo cambiar el nombre o el estado del municipio.

#### Scenario: Modificar municipio - criterio 2

- **GIVEN** Se cumple la condición «el municipio queda con el mismo nombre que otro del mismo estado»
- **WHEN** el actor solicita «Modificar municipio» en esas circunstancias
- **THEN** el sistema lo rechaza.

#### Scenario: Modificar municipio - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar municipio»
- **WHEN** el actor solicita «Modificar municipio» en esas circunstancias
- **THEN** Se acepta el mismo nombre en estados distintos.

### Requirement: Eliminar municipio

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar municipios, para quitar los que se cargaron por error.».

#### Scenario: Eliminar municipio - criterio 1

- **GIVEN** Se cumple la condición «el municipio no tiene parroquias»
- **WHEN** el actor solicita «Eliminar municipio» en esas circunstancias
- **THEN** rutas, vías, instituciones con competencia sobre él ni guías asignados, se elimina.

#### Scenario: Eliminar municipio - criterio 2

- **GIVEN** Se cumple la condición «tiene alguna de esas»
- **WHEN** el actor solicita «Eliminar municipio» en esas circunstancias
- **THEN** el sistema no lo elimina.

### Requirement: Registrar parroquia

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar las parroquias de cada municipio, para ubicar los hitos en el territorio.».

#### Scenario: Registrar parroquia - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar parroquia»
- **WHEN** el actor solicita «Registrar parroquia» en esas circunstancias
- **THEN** Cada parroquia pertenece a un municipio.

#### Scenario: Registrar parroquia - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar parroquia»
- **WHEN** el actor solicita «Registrar parroquia» en esas circunstancias
- **THEN** Se acepta el mismo nombre de parroquia en municipios distintos (por ejemplo, San José).

#### Scenario: Registrar parroquia - criterio 3

- **GIVEN** Se cumple la condición «registro una parroquia con un nombre que ya existe en el mismo municipio»
- **WHEN** el actor solicita «Registrar parroquia» en esas circunstancias
- **THEN** el sistema la rechaza.

### Requirement: Consultar parroquia

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar las parroquias, para ver qué territorio está cargado en cada municipio.».

#### Scenario: Consultar parroquia - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar parroquia»
- **WHEN** el actor solicita «Consultar parroquia» en esas circunstancias
- **THEN** Puedo ver las parroquias de un municipio.

### Requirement: Modificar parroquia

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar una parroquia, para corregir su nombre o su municipio.».

#### Scenario: Modificar parroquia - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar parroquia»
- **WHEN** el actor solicita «Modificar parroquia» en esas circunstancias
- **THEN** Puedo cambiar el nombre o el municipio de la parroquia.

#### Scenario: Modificar parroquia - criterio 2

- **GIVEN** Se cumple la condición «la parroquia queda con el mismo nombre que otra del mismo municipio»
- **WHEN** el actor solicita «Modificar parroquia» en esas circunstancias
- **THEN** el sistema lo rechaza.

#### Scenario: Modificar parroquia - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar parroquia»
- **WHEN** el actor solicita «Modificar parroquia» en esas circunstancias
- **THEN** Se acepta el mismo nombre en municipios distintos.

### Requirement: Eliminar parroquia

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar parroquias, para quitar las que se cargaron por error.».

#### Scenario: Eliminar parroquia - criterio 1

- **GIVEN** Se cumple la condición «la parroquia no tiene hitos»
- **WHEN** el actor solicita «Eliminar parroquia» en esas circunstancias
- **THEN** se elimina.

#### Scenario: Eliminar parroquia - criterio 2

- **GIVEN** Se cumple la condición «tiene hitos»
- **WHEN** el actor solicita «Eliminar parroquia» en esas circunstancias
- **THEN** el sistema no la elimina.

