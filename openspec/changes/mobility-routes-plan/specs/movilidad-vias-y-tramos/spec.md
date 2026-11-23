# movilidad vias y tramos

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/trazabilidad-detallada.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Registrar vía

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar vías, para tener la red física sobre la que pasan las rutas.».

#### Scenario: Registrar vía - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar vía»
- **WHEN** el actor solicita «Registrar vía» en esas circunstancias
- **THEN** Cada vía tiene nombre, tipo (calle, avenida, bulevar, caminería, sendero, puente u otro), modos de recorrido permitidos (a pie, bicicleta, transporte público o vehículo adaptado) y condiciones del terreno.

#### Scenario: Registrar vía - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar vía»
- **WHEN** el actor solicita «Registrar vía» en esas circunstancias
- **THEN** La vía se ubica en un municipio y un estado.

#### Scenario: Registrar vía - criterio 3

- **GIVEN** Se cumple la condición «registro una vía con el mismo nombre en el mismo municipio y estado que otra»
- **WHEN** el actor solicita «Registrar vía» en esas circunstancias
- **THEN** el sistema la rechaza.

#### Scenario: Registrar vía - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar vía»
- **WHEN** el actor solicita «Registrar vía» en esas circunstancias
- **THEN** La vía tiene un estado que indica si está habilitada o tiene cierre total por mantenimiento.

### Requirement: Consultar vía

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar las vías registradas, para revisar la red física y su estado.».

#### Scenario: Consultar vía - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar vía»
- **WHEN** el actor solicita «Consultar vía» en esas circunstancias
- **THEN** Puedo ver las vías de un municipio con su estado.

#### Scenario: Consultar vía - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar vía»
- **WHEN** el actor solicita «Consultar vía» en esas circunstancias
- **THEN** Puedo abrir una vía y ver su tipo, sus modos de recorrido permitidos y las condiciones del terreno.

### Requirement: Modificar vía

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar los datos y el estado de una vía, para mantener la red al día.».

#### Scenario: Modificar vía - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar vía»
- **WHEN** el actor solicita «Modificar vía» en esas circunstancias
- **THEN** Puedo cambiar sus datos y su estado (habilitada o con cierre total por mantenimiento).

#### Scenario: Modificar vía - criterio 2

- **GIVEN** Se cumple la condición «cambio el nombre»
- **WHEN** el actor solicita «Modificar vía» en esas circunstancias
- **THEN** el municipio o el estado y la vía queda con el mismo nombre que otra del mismo municipio y estado, el sistema lo rechaza.

#### Scenario: Modificar vía - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar vía»
- **WHEN** el actor solicita «Modificar vía» en esas circunstancias
- **THEN** El tipo y los modos de recorrido siguen siendo de los valores permitidos.

### Requirement: Eliminar vía

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar vías, para quitar las que se cargaron por error.».

#### Scenario: Eliminar vía - criterio 1

- **GIVEN** Se cumple la condición «la vía no tiene paradas asociadas»
- **WHEN** el actor solicita «Eliminar vía» en esas circunstancias
- **THEN** se elimina junto con sus tramos, siempre que ningún tramo tenga incidencias o hitos.

#### Scenario: Eliminar vía - criterio 2

- **GIVEN** Se cumple la condición «la vía tiene paradas asociadas»
- **WHEN** el actor solicita «Eliminar vía» en esas circunstancias
- **THEN** el sistema no la elimina.

### Requirement: Registrar tramo

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar los tramos de cada vía y cómo se conectan entre sí, para poder calcular desplazamientos y desvíos.».

#### Scenario: Registrar tramo - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar tramo»
- **WHEN** el actor solicita «Registrar tramo» en esas circunstancias
- **THEN** Cada tramo pertenece a una vía, y una vía tiene uno o más tramos.

#### Scenario: Registrar tramo - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar tramo»
- **WHEN** el actor solicita «Registrar tramo» en esas circunstancias
- **THEN** Para cada tramo se registra si tiene desniveles o escalinatas.

#### Scenario: Registrar tramo - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar tramo»
- **WHEN** el actor solicita «Registrar tramo» en esas circunstancias
- **THEN** Se registra con qué otros tramos se conecta, también de vías distintas.

#### Scenario: Registrar tramo - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar tramo»
- **WHEN** el actor solicita «Registrar tramo» en esas circunstancias
- **THEN** Un tramo no se puede conectar consigo mismo.

### Requirement: Consultar tramo

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar los tramos de una vía y sus conexiones, para revisar la topología de la red.».

#### Scenario: Consultar tramo - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar tramo»
- **WHEN** el actor solicita «Consultar tramo» en esas circunstancias
- **THEN** Puedo ver los tramos de una vía y sus conexiones.

### Requirement: Modificar tramo

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar un tramo y sus conexiones, para mantener la topología al día.».

#### Scenario: Modificar tramo - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar tramo»
- **WHEN** el actor solicita «Modificar tramo» en esas circunstancias
- **THEN** Puedo cambiar los datos del tramo: si tiene desniveles o escalinatas.

#### Scenario: Modificar tramo - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar tramo»
- **WHEN** el actor solicita «Modificar tramo» en esas circunstancias
- **THEN** Puedo agregar o quitar conexiones con otros tramos.

#### Scenario: Modificar tramo - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar tramo»
- **WHEN** el actor solicita «Modificar tramo» en esas circunstancias
- **THEN** Un tramo no se puede conectar consigo mismo.

### Requirement: Eliminar tramo

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar tramos, para quitar los que se cargaron por error.».

#### Scenario: Eliminar tramo - criterio 1

- **GIVEN** Se cumple la condición «el tramo no tiene incidencias»
- **WHEN** el actor solicita «Eliminar tramo» en esas circunstancias
- **THEN** paradas ni hitos, se elimina.

#### Scenario: Eliminar tramo - criterio 2

- **GIVEN** Se cumple la condición «tiene incidencias»
- **WHEN** el actor solicita «Eliminar tramo» en esas circunstancias
- **THEN** paradas o hitos, el sistema no lo elimina.

