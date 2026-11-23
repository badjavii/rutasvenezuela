# patrimonio anclajes 3d

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/trazabilidad-detallada.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Recursos 3D cercanos

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero recuperar los recursos 3D de los hitos cercanos a mi posición, para ver los elementos virtuales en la cámara.».

#### Scenario: Recursos 3D cercanos - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Recursos 3D cercanos»
- **WHEN** el actor solicita «Recursos 3D cercanos» en esas circunstancias
- **THEN** La app envía la latitud, la longitud y la elevación de origen del visitante.

#### Scenario: Recursos 3D cercanos - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Recursos 3D cercanos»
- **WHEN** el actor solicita «Recursos 3D cercanos» en esas circunstancias
- **THEN** Un punto de anclaje se considera cercano si el origen está dentro de su radio efectivo de activación.

#### Scenario: Recursos 3D cercanos - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Recursos 3D cercanos»
- **WHEN** el actor solicita «Recursos 3D cercanos» en esas circunstancias
- **THEN** La distancia se calcula con funciones trigonométricas sobre los decimales, sin tipos espaciales.

#### Scenario: Recursos 3D cercanos - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Recursos 3D cercanos»
- **WHEN** el actor solicita «Recursos 3D cercanos» en esas circunstancias
- **THEN** Para cada anclaje cercano devuelve su recurso 3D y los parámetros para proyectarlo: altitud, azimut, inclinación, rotación y escala.

#### Scenario: Recursos 3D cercanos - criterio 5

- **GIVEN** Se cumplen las precondiciones del comportamiento «Recursos 3D cercanos»
- **WHEN** el actor solicita «Recursos 3D cercanos» en esas circunstancias
- **THEN** Para cada recurso devuelve su formato y su ruta de almacenamiento, para que la app lo descargue.

#### Scenario: Recursos 3D cercanos - criterio 6

- **GIVEN** Se cumplen las precondiciones del comportamiento «Recursos 3D cercanos»
- **WHEN** el actor solicita «Recursos 3D cercanos» en esas circunstancias
- **THEN** Para cada anclaje devuelve también sus hipervínculos informativos.

#### Scenario: Recursos 3D cercanos - criterio 7

- **GIVEN** Se cumple la condición «no hay anclajes cercanos»
- **WHEN** el actor solicita «Recursos 3D cercanos» en esas circunstancias
- **THEN** el sistema lo indica.

### Requirement: Registrar punto de anclaje

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar puntos de anclaje de un hito, para que la app sobreponga los elementos 3D cuando el usuario enfoca la cámara.».

#### Scenario: Registrar punto de anclaje - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar punto de anclaje»
- **WHEN** el actor solicita «Registrar punto de anclaje» en esas circunstancias
- **THEN** Cada anclaje tiene latitud, longitud, altitud respecto al suelo, azimut, inclinación, rotación, radio de activación en metros y escala, todos como decimales.

#### Scenario: Registrar punto de anclaje - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar punto de anclaje»
- **WHEN** el actor solicita «Registrar punto de anclaje» en esas circunstancias
- **THEN** El anclaje pertenece a un hito y se identifica dentro de ese hito.

#### Scenario: Registrar punto de anclaje - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar punto de anclaje»
- **WHEN** el actor solicita «Registrar punto de anclaje» en esas circunstancias
- **THEN** Cada anclaje usa exactamente un recurso 3D ya registrado.

#### Scenario: Registrar punto de anclaje - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar punto de anclaje»
- **WHEN** el actor solicita «Registrar punto de anclaje» en esas circunstancias
- **THEN** La altitud del anclaje se guarda aparte de la elevación del hito y no se calcula a partir de ella.

#### Scenario: Registrar punto de anclaje - criterio 5

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar punto de anclaje»
- **WHEN** el actor solicita «Registrar punto de anclaje» en esas circunstancias
- **THEN** Cada anclaje puede tener uno o varios hipervínculos informativos.

### Requirement: Consultar punto de anclaje

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar los puntos de anclaje de un hito, para revisar cómo se proyecta su contenido 3D.».

#### Scenario: Consultar punto de anclaje - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar punto de anclaje»
- **WHEN** el actor solicita «Consultar punto de anclaje» en esas circunstancias
- **THEN** Puedo ver los anclajes de un hito con su recurso 3D.

#### Scenario: Consultar punto de anclaje - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar punto de anclaje»
- **WHEN** el actor solicita «Consultar punto de anclaje» en esas circunstancias
- **THEN** Puedo abrir un anclaje y ver todos sus parámetros y sus hipervínculos.

### Requirement: Modificar punto de anclaje

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar un punto de anclaje, para ajustar su posición, sus parámetros o su recurso 3D.».

#### Scenario: Modificar punto de anclaje - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar punto de anclaje»
- **WHEN** el actor solicita «Modificar punto de anclaje» en esas circunstancias
- **THEN** Puedo cambiar sus parámetros (latitud, longitud, altitud respecto al suelo, azimut, inclinación, rotación, radio de activación y escala) y sus hipervínculos, siempre como decimales.

#### Scenario: Modificar punto de anclaje - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar punto de anclaje»
- **WHEN** el actor solicita «Modificar punto de anclaje» en esas circunstancias
- **THEN** Puedo cambiar su recurso 3D por otro ya registrado; el anclaje sigue usando exactamente uno.

#### Scenario: Modificar punto de anclaje - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar punto de anclaje»
- **WHEN** el actor solicita «Modificar punto de anclaje» en esas circunstancias
- **THEN** La altitud del anclaje sigue guardándose aparte de la elevación del hito.

### Requirement: Eliminar punto de anclaje

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar puntos de anclaje, para quitar los que ya no se usan.».

#### Scenario: Eliminar punto de anclaje - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Eliminar punto de anclaje»
- **WHEN** el actor solicita «Eliminar punto de anclaje» en esas circunstancias
- **THEN** Al eliminar un anclaje se eliminan también sus hipervínculos.

#### Scenario: Eliminar punto de anclaje - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Eliminar punto de anclaje»
- **WHEN** el actor solicita «Eliminar punto de anclaje» en esas circunstancias
- **THEN** Al eliminar un anclaje, su recurso 3D no se elimina.

### Requirement: Registrar recurso 3D

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar recursos tridimensionales, para proyectarlos en la realidad aumentada.».

#### Scenario: Registrar recurso 3D - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar recurso 3D»
- **WHEN** el actor solicita «Registrar recurso 3D» en esas circunstancias
- **THEN** Cada recurso tiene su identificador (el código del archivo digital), formato, versión, tamaño en MB, descripción y ruta de almacenamiento.

#### Scenario: Registrar recurso 3D - criterio 2

- **GIVEN** Se cumple la condición «registro un recurso con un identificador que ya existe»
- **WHEN** el actor solicita «Registrar recurso 3D» en esas circunstancias
- **THEN** el sistema lo rechaza.

### Requirement: Consultar recurso 3D

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar los recursos tridimensionales, para saber cuáles hay y dónde se usan.».

#### Scenario: Consultar recurso 3D - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar recurso 3D»
- **WHEN** el actor solicita «Consultar recurso 3D» en esas circunstancias
- **THEN** Puedo ver el listado de los recursos.

#### Scenario: Consultar recurso 3D - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar recurso 3D»
- **WHEN** el actor solicita «Consultar recurso 3D» en esas circunstancias
- **THEN** Puedo ver en qué anclajes se usa cada recurso.

### Requirement: Modificar recurso 3D

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar un recurso tridimensional, para actualizar su versión o su ruta de almacenamiento.».

#### Scenario: Modificar recurso 3D - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar recurso 3D»
- **WHEN** el actor solicita «Modificar recurso 3D» en esas circunstancias
- **THEN** Puedo cambiar sus datos, por ejemplo la versión o la ruta de almacenamiento.

#### Scenario: Modificar recurso 3D - criterio 2

- **GIVEN** Se cumple la condición «cambio el identificador por uno que ya existe»
- **WHEN** el actor solicita «Modificar recurso 3D» en esas circunstancias
- **THEN** el sistema lo rechaza.

### Requirement: Eliminar recurso 3D

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar recursos tridimensionales, para quitar los que ya no se usan.».

#### Scenario: Eliminar recurso 3D - criterio 1

- **GIVEN** Se cumple la condición «ningún anclaje usa el recurso»
- **WHEN** el actor solicita «Eliminar recurso 3D» en esas circunstancias
- **THEN** se elimina.

#### Scenario: Eliminar recurso 3D - criterio 2

- **GIVEN** Se cumple la condición «algún anclaje lo usa»
- **WHEN** el actor solicita «Eliminar recurso 3D» en esas circunstancias
- **THEN** el sistema no lo elimina.

