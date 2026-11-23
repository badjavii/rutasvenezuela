# guias contrataciones

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/requirements/traceability-detailed.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Registrar guía

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar guías y baquianos comunitarios, para que puedan acompañar las rutas.».

#### Scenario: Registrar guía - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar guía»
- **WHEN** el actor solicita «Registrar guía» en esas circunstancias
- **THEN** Se identifica por su número de Registro Turístico Nacional junto con su código de licencia; si esa combinación ya existe, el sistema lo rechaza.

#### Scenario: Registrar guía - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar guía»
- **WHEN** el actor solicita «Registrar guía» en esas circunstancias
- **THEN** Tiene acreditación oficial, años de trayectoria, especialidades temáticas, idiomas, tarifa horaria y zona geográfica asignada.

#### Scenario: Registrar guía - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar guía»
- **WHEN** el actor solicita «Registrar guía» en esas circunstancias
- **THEN** Tiene una contraseña para entrar con su identificador.

#### Scenario: Registrar guía - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar guía»
- **WHEN** el actor solicita «Registrar guía» en esas circunstancias
- **THEN** Una misma persona puede ser guía y también visitante.

### Requirement: Consultar guía

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar los guías registrados, para saber quiénes pueden acompañar las rutas.».

#### Scenario: Consultar guía - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar guía»
- **WHEN** el actor solicita «Consultar guía» en esas circunstancias
- **THEN** Puedo ver el listado de los guías.

#### Scenario: Consultar guía - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar guía»
- **WHEN** el actor solicita «Consultar guía» en esas circunstancias
- **THEN** Puedo abrir un guía y ver todos sus datos.

### Requirement: Modificar guía

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar los datos de un guía, para mantenerlos al día.».

#### Scenario: Modificar guía - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar guía»
- **WHEN** el actor solicita «Modificar guía» en esas circunstancias
- **THEN** Puedo cambiar cualquier dato del guía.

#### Scenario: Modificar guía - criterio 2

- **GIVEN** Se cumple la condición «cambio el número de Registro Turístico Nacional o el código de licencia y esa combinación ya existe»
- **WHEN** el actor solicita «Modificar guía» en esas circunstancias
- **THEN** el sistema lo rechaza.

### Requirement: Eliminar guía

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar guías, para quitar los registros que ya no corresponden.».

#### Scenario: Eliminar guía - criterio 1

- **GIVEN** Se cumple la condición «el guía no está adscrito a ninguna ruta»
- **WHEN** el actor solicita «Eliminar guía» en esas circunstancias
- **THEN** no dirige experiencias, no tiene contrataciones y no valida credenciales, se elimina.

#### Scenario: Eliminar guía - criterio 2

- **GIVEN** Se cumple la condición «tiene alguna de esas»
- **WHEN** el actor solicita «Eliminar guía» en esas circunstancias
- **THEN** el sistema no lo elimina.

### Requirement: Asignar guías a una ruta fija

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero adscribir guías locales a una ruta fija, para ofrecer acompañamiento y narración histórica.».

#### Scenario: Asignar guías a una ruta fija - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Asignar guías a una ruta fija»
- **WHEN** el actor solicita «Asignar guías a una ruta fija» en esas circunstancias
- **THEN** A una ruta fija se le pueden adscribir uno o más guías.

#### Scenario: Asignar guías a una ruta fija - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Asignar guías a una ruta fija»
- **WHEN** el actor solicita «Asignar guías a una ruta fija» en esas circunstancias
- **THEN** Solo se pueden adscribir guías que ya están registrados en el sistema.

#### Scenario: Asignar guías a una ruta fija - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Asignar guías a una ruta fija»
- **WHEN** el actor solicita «Asignar guías a una ruta fija» en esas circunstancias
- **THEN** Se puede quitar la adscripción de un guía.

#### Scenario: Asignar guías a una ruta fija - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Asignar guías a una ruta fija»
- **WHEN** el actor solicita «Asignar guías a una ruta fija» en esas circunstancias
- **THEN** La ficha de la ruta fija muestra sus guías adscritos.

### Requirement: Contratación de guía

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero contratar un guía local para una ruta fija, para recorrerla acompañado y con narración histórica.».

#### Scenario: Contratación de guía - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Contratación de guía»
- **WHEN** el actor solicita «Contratación de guía» en esas circunstancias
- **THEN** Al elegir una ruta fija, el visitante ve los guías adscritos a ella con sus idiomas, especialidades y tarifa horaria.

#### Scenario: Contratación de guía - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Contratación de guía»
- **WHEN** el actor solicita «Contratación de guía» en esas circunstancias
- **THEN** Solo se pueden contratar guías adscritos a esa ruta fija.

#### Scenario: Contratación de guía - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Contratación de guía»
- **WHEN** el actor solicita «Contratación de guía» en esas circunstancias
- **THEN** La contratación queda registrada con el visitante, el guía, la ruta y la fecha.

