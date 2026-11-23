# patrimonio hitos

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/requirements/traceability-detailed.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Ficha del hito y sus rutas

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero ver la ficha integral de un hito y en qué rutas está incluido, para decidir cuál recorrer.».

#### Scenario: Ficha del hito y sus rutas - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Ficha del hito y sus rutas»
- **WHEN** el actor solicita «Ficha del hito y sus rutas» en esas circunstancias
- **THEN** El visitante elige un hito y el sistema muestra su ficha: nombre, categorías, estado operativo, horario de visita o libre acceso, ubicación (latitud, longitud y elevación), estado, municipio y parroquia, y sus eventos culturales.

#### Scenario: Ficha del hito y sus rutas - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Ficha del hito y sus rutas»
- **WHEN** el actor solicita «Ficha del hito y sus rutas» en esas circunstancias
- **THEN** El sistema lista las rutas fijas y dinámicas que incluyen ese hito.

#### Scenario: Ficha del hito y sus rutas - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Ficha del hito y sus rutas»
- **WHEN** el actor solicita «Ficha del hito y sus rutas» en esas circunstancias
- **THEN** Las rutas dinámicas privadas de otros visitantes no aparecen.

#### Scenario: Ficha del hito y sus rutas - criterio 4

- **GIVEN** Se cumple la condición «el hito no está en ninguna ruta»
- **WHEN** el actor solicita «Ficha del hito y sus rutas» en esas circunstancias
- **THEN** el sistema lo indica.

### Requirement: Registrar hito

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar hitos, para que los visitantes encuentren los puntos de interés.».

#### Scenario: Registrar hito - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar hito»
- **WHEN** el actor solicita «Registrar hito» en esas circunstancias
- **THEN** Cada hito tiene nombre, al menos una categoría, estado operativo y horario de visita o la marca de libre acceso.

#### Scenario: Registrar hito - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar hito»
- **WHEN** el actor solicita «Registrar hito» en esas circunstancias
- **THEN** El estado operativo es uno de estos: disponible, en restauración, clausurado temporalmente o cerrado permanentemente.

#### Scenario: Registrar hito - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar hito»
- **WHEN** el actor solicita «Registrar hito» en esas circunstancias
- **THEN** La ubicación se guarda como latitud, longitud y elevación en decimales; si el hito está dentro de una estructura (por ejemplo, un piso de un edificio), también su altura dentro de ella.

#### Scenario: Registrar hito - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar hito»
- **WHEN** el actor solicita «Registrar hito» en esas circunstancias
- **THEN** El hito se ubica en una parroquia, con su municipio y su estado.

#### Scenario: Registrar hito - criterio 5

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar hito»
- **WHEN** el actor solicita «Registrar hito» en esas circunstancias
- **THEN** El hito puede ubicarse sobre un tramo de vía (es opcional: un hito en un sendero sin registrar queda sin tramo).

#### Scenario: Registrar hito - criterio 6

- **GIVEN** Se cumple la condición «registro un hito con un nombre que ya existe en la misma parroquia»
- **WHEN** el actor solicita «Registrar hito» en esas circunstancias
- **THEN** el mismo municipio y el mismo estado, el sistema lo rechaza.

#### Scenario: Registrar hito - criterio 7

- **GIVEN** Se cumple la condición «registro un hito con la misma latitud»
- **WHEN** el actor solicita «Registrar hito» en esas circunstancias
- **THEN** longitud y elevación que otro, el sistema lo acepta.

### Requirement: Consultar hito

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar los hitos registrados, para revisar qué hay cargado y con qué datos.».

#### Scenario: Consultar hito - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar hito»
- **WHEN** el actor solicita «Consultar hito» en esas circunstancias
- **THEN** Puedo ver el listado de todos los hitos.

#### Scenario: Consultar hito - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar hito»
- **WHEN** el actor solicita «Consultar hito» en esas circunstancias
- **THEN** Puedo abrir un hito y ver todos sus datos: nombre, categorías, estado operativo, horario o libre acceso, ubicación, parroquia, municipio, estado y tramo si lo tiene.

### Requirement: Modificar hito

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar los datos de un hito, para mantener la información al día, por ejemplo cuando cambia su estado operativo.».

#### Scenario: Modificar hito - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar hito»
- **WHEN** el actor solicita «Modificar hito» en esas circunstancias
- **THEN** Puedo cambiar cualquier dato del hito: nombre, categorías, estado operativo, horario o libre acceso, ubicación, parroquia y tramo.

#### Scenario: Modificar hito - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar hito»
- **WHEN** el actor solicita «Modificar hito» en esas circunstancias
- **THEN** El nuevo estado operativo es uno de los cuatro permitidos: disponible, en restauración, clausurado temporalmente o cerrado permanentemente.

#### Scenario: Modificar hito - criterio 3

- **GIVEN** Se cumple la condición «dejo el hito sin ninguna categoría»
- **WHEN** el actor solicita «Modificar hito» en esas circunstancias
- **THEN** el sistema lo rechaza.

#### Scenario: Modificar hito - criterio 4

- **GIVEN** Se cumple la condición «cambio el nombre o la parroquia y el hito queda con el mismo nombre que otro de la misma parroquia»
- **WHEN** el actor solicita «Modificar hito» en esas circunstancias
- **THEN** municipio y estado, el sistema lo rechaza.

#### Scenario: Modificar hito - criterio 5

- **GIVEN** Se cumple la condición «cambio la ubicación a la misma latitud»
- **WHEN** el actor solicita «Modificar hito» en esas circunstancias
- **THEN** longitud y elevación que otro hito, el sistema lo acepta.

### Requirement: Eliminar hito

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar hitos, para quitar los que se cargaron por error.».

#### Scenario: Eliminar hito - criterio 1

- **GIVEN** Se cumple la condición «el hito no forma parte de ninguna ruta y no tiene anclajes»
- **WHEN** el actor solicita «Eliminar hito» en esas circunstancias
- **THEN** eventos, evaluaciones ni incidencias, se elimina.

#### Scenario: Eliminar hito - criterio 2

- **GIVEN** Se cumple la condición «el hito forma parte de una ruta o tiene anclajes»
- **WHEN** el actor solicita «Eliminar hito» en esas circunstancias
- **THEN** eventos, evaluaciones o incidencias, el sistema no lo elimina y me indica qué lo impide.

#### Scenario: Eliminar hito - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Eliminar hito»
- **WHEN** el actor solicita «Eliminar hito» en esas circunstancias
- **THEN** En ese caso puedo marcar el hito como cerrado permanentemente.

### Requirement: Registrar categoría de hito

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar categorías de hito, para clasificar los puntos de interés.».

#### Scenario: Registrar categoría de hito - criterio 1

- **GIVEN** Se cumple la condición «registro una categoría con una denominación que ya existe»
- **WHEN** el actor solicita «Registrar categoría de hito» en esas circunstancias
- **THEN** el sistema la rechaza.

#### Scenario: Registrar categoría de hito - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar categoría de hito»
- **WHEN** el actor solicita «Registrar categoría de hito» en esas circunstancias
- **THEN** Un hito se puede asociar a una o varias categorías.

### Requirement: Consultar categoría de hito

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar las categorías de hito, para saber con cuáles se clasifican los puntos de interés.».

#### Scenario: Consultar categoría de hito - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar categoría de hito»
- **WHEN** el actor solicita «Consultar categoría de hito» en esas circunstancias
- **THEN** Puedo ver el listado de las categorías.

### Requirement: Modificar categoría de hito

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar una categoría de hito, para corregir su denominación.».

#### Scenario: Modificar categoría de hito - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar categoría de hito»
- **WHEN** el actor solicita «Modificar categoría de hito» en esas circunstancias
- **THEN** Puedo cambiar la denominación de la categoría.

#### Scenario: Modificar categoría de hito - criterio 2

- **GIVEN** Se cumple la condición «cambio la denominación por una que ya existe»
- **WHEN** el actor solicita «Modificar categoría de hito» en esas circunstancias
- **THEN** el sistema lo rechaza.

### Requirement: Eliminar categoría de hito

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar categorías de hito, para quitar las que ya no se usan.».

#### Scenario: Eliminar categoría de hito - criterio 1

- **GIVEN** Se cumple la condición «la categoría no es la única de ningún hito»
- **WHEN** el actor solicita «Eliminar categoría de hito» en esas circunstancias
- **THEN** se elimina y deja de aparecer en los hitos que la tenían.

#### Scenario: Eliminar categoría de hito - criterio 2

- **GIVEN** Se cumple la condición «la categoría es la única de algún hito»
- **WHEN** el actor solicita «Eliminar categoría de hito» en esas circunstancias
- **THEN** el sistema no la elimina.

