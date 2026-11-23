# rutas gestion

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/requirements/traceability-detailed.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Rutas por categoría y territorio

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero listar las rutas urbanas de una categoría en un municipio o en un estado, para elegir qué recorrer en esa zona.».

#### Scenario: Rutas por categoría y territorio - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Rutas por categoría y territorio»
- **WHEN** el actor solicita «Rutas por categoría y territorio» en esas circunstancias
- **THEN** El visitante elige una categoría y un municipio o un estado.

#### Scenario: Rutas por categoría y territorio - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Rutas por categoría y territorio»
- **WHEN** el actor solicita «Rutas por categoría y territorio» en esas circunstancias
- **THEN** El sistema lista las rutas que incluyen al menos un hito de esa categoría y cuyo origen está en el municipio o el estado elegido.

#### Scenario: Rutas por categoría y territorio - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Rutas por categoría y territorio»
- **WHEN** el actor solicita «Rutas por categoría y territorio» en esas circunstancias
- **THEN** Aparecen las rutas fijas y las rutas dinámicas públicas; las dinámicas privadas no aparecen.

#### Scenario: Rutas por categoría y territorio - criterio 4

- **GIVEN** Se cumple la condición «no hay rutas que cumplan el filtro»
- **WHEN** el actor solicita «Rutas por categoría y territorio» en esas circunstancias
- **THEN** el sistema lo indica.

### Requirement: Registrar ruta fija

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar rutas fijas, para ofrecer recorridos prediseñados por expertos.».

#### Scenario: Registrar ruta fija - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar ruta fija»
- **WHEN** el actor solicita «Registrar ruta fija» en esas circunstancias
- **THEN** La ruta es una secuencia ordenada de hitos y paradas con número de orden; el primero es el origen y el último el destino.

#### Scenario: Registrar ruta fija - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar ruta fija»
- **WHEN** el actor solicita «Registrar ruta fija» en esas circunstancias
- **THEN** La ruta tiene al menos un hito de origen y uno de destino.

#### Scenario: Registrar ruta fija - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar ruta fija»
- **WHEN** el actor solicita «Registrar ruta fija» en esas circunstancias
- **THEN** No hay dos elementos con el mismo número de orden en la ruta.

#### Scenario: Registrar ruta fija - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar ruta fija»
- **WHEN** el actor solicita «Registrar ruta fija» en esas circunstancias
- **THEN** La ruta tiene duración estimada, mejor horario de inicio y nivel de dificultad.

#### Scenario: Registrar ruta fija - criterio 5

- **GIVEN** Se cumple la condición «registro una ruta con el mismo nombre en el mismo municipio y estado de origen que otra»
- **WHEN** el actor solicita «Registrar ruta fija» en esas circunstancias
- **THEN** el sistema la rechaza. El mismo nombre sí se acepta en otro municipio o estado.

### Requirement: Consultar ruta fija

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar las rutas fijas, para revisar qué recorridos se ofrecen.».

#### Scenario: Consultar ruta fija - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar ruta fija»
- **WHEN** el actor solicita «Consultar ruta fija» en esas circunstancias
- **THEN** Puedo ver el listado de las rutas fijas.

#### Scenario: Consultar ruta fija - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar ruta fija»
- **WHEN** el actor solicita «Consultar ruta fija» en esas circunstancias
- **THEN** Puedo abrir una ruta y ver su secuencia, su duración, su horario, su dificultad y sus guías.

### Requirement: Modificar ruta fija

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar una ruta fija, para corregir sus datos o su secuencia.».

#### Scenario: Modificar ruta fija - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar ruta fija»
- **WHEN** el actor solicita «Modificar ruta fija» en esas circunstancias
- **THEN** Puedo cambiar sus datos y su secuencia de hitos y paradas.

#### Scenario: Modificar ruta fija - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar ruta fija»
- **WHEN** el actor solicita «Modificar ruta fija» en esas circunstancias
- **THEN** La ruta sigue teniendo al menos un hito de origen y uno de destino.

#### Scenario: Modificar ruta fija - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar ruta fija»
- **WHEN** el actor solicita «Modificar ruta fija» en esas circunstancias
- **THEN** No puede haber dos elementos con el mismo número de orden.

#### Scenario: Modificar ruta fija - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar ruta fija»
- **WHEN** el actor solicita «Modificar ruta fija» en esas circunstancias
- **THEN** La ruta sigue teniendo duración estimada, mejor horario de inicio y nivel de dificultad.

#### Scenario: Modificar ruta fija - criterio 5

- **GIVEN** Se cumple la condición «el nombre queda igual al de otra ruta del mismo municipio y estado de origen»
- **WHEN** el actor solicita «Modificar ruta fija» en esas circunstancias
- **THEN** el sistema lo rechaza; en otro municipio o estado se acepta.

### Requirement: Eliminar ruta fija

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar rutas fijas, para quitar las que se cargaron por error.».

#### Scenario: Eliminar ruta fija - criterio 1

- **GIVEN** Se cumple la condición «la ruta no tiene recorridos»
- **WHEN** el actor solicita «Eliminar ruta fija» en esas circunstancias
- **THEN** experiencias ni contrataciones de guía, se elimina.

#### Scenario: Eliminar ruta fija - criterio 2

- **GIVEN** Se cumple la condición «tiene recorridos»
- **WHEN** el actor solicita «Eliminar ruta fija» en esas circunstancias
- **THEN** experiencias o contrataciones de guía, no se borra, porque se conserva su historial.

### Requirement: Registrar ruta dinámica

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero registrar mis propias rutas, eligiendo hitos, orden de visita y transporte, para recorrer lo que me interesa.».

#### Scenario: Registrar ruta dinámica - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar ruta dinámica»
- **WHEN** el actor solicita «Registrar ruta dinámica» en esas circunstancias
- **THEN** El visitante elige los hitos, el orden de visita y su preferencia de transporte.

#### Scenario: Registrar ruta dinámica - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar ruta dinámica»
- **WHEN** el actor solicita «Registrar ruta dinámica» en esas circunstancias
- **THEN** La ruta tiene al menos un hito de origen y uno de destino.

#### Scenario: Registrar ruta dinámica - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar ruta dinámica»
- **WHEN** el actor solicita «Registrar ruta dinámica» en esas circunstancias
- **THEN** El visitante marca la ruta como privada o pública; la privada solo la ve él y la pública aparece en el catálogo.

#### Scenario: Registrar ruta dinámica - criterio 4

- **GIVEN** Se cumple la condición «registro una ruta con el mismo nombre en el mismo municipio y estado de origen que otra»
- **WHEN** el actor solicita «Registrar ruta dinámica» en esas circunstancias
- **THEN** el sistema la rechaza.

#### Scenario: Registrar ruta dinámica - criterio 5

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar ruta dinámica»
- **WHEN** el actor solicita «Registrar ruta dinámica» en esas circunstancias
- **THEN** La ruta tiene duración estimada, mejor horario de inicio y nivel de dificultad, como toda ruta; el visitante puede dejarlos en blanco.

### Requirement: Consultar ruta dinámica

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero consultar mis rutas, para reutilizarlas cuando quiera.».

#### Scenario: Consultar ruta dinámica - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar ruta dinámica»
- **WHEN** el actor solicita «Consultar ruta dinámica» en esas circunstancias
- **THEN** Veo la lista de mis rutas, privadas y públicas.

#### Scenario: Consultar ruta dinámica - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar ruta dinámica»
- **WHEN** el actor solicita «Consultar ruta dinámica» en esas circunstancias
- **THEN** Puedo abrir una ruta y ver sus hitos, su orden y mi preferencia de transporte.

### Requirement: Modificar ruta dinámica

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero modificar mis rutas, para ajustarlas a lo que quiero recorrer.».

#### Scenario: Modificar ruta dinámica - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar ruta dinámica»
- **WHEN** el actor solicita «Modificar ruta dinámica» en esas circunstancias
- **THEN** Solo el visitante que creó la ruta puede modificarla.

#### Scenario: Modificar ruta dinámica - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar ruta dinámica»
- **WHEN** el actor solicita «Modificar ruta dinámica» en esas circunstancias
- **THEN** Puedo cambiar los hitos, el orden de visita y la preferencia de transporte.

#### Scenario: Modificar ruta dinámica - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar ruta dinámica»
- **WHEN** el actor solicita «Modificar ruta dinámica» en esas circunstancias
- **THEN** Puedo pasar la ruta de privada a pública o al revés.

#### Scenario: Modificar ruta dinámica - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar ruta dinámica»
- **WHEN** el actor solicita «Modificar ruta dinámica» en esas circunstancias
- **THEN** La ruta sigue teniendo al menos un hito de origen y uno de destino.

#### Scenario: Modificar ruta dinámica - criterio 5

- **GIVEN** Se cumple la condición «el nombre queda igual al de otra ruta del mismo municipio y estado de origen»
- **WHEN** el actor solicita «Modificar ruta dinámica» en esas circunstancias
- **THEN** el sistema lo rechaza.

### Requirement: Eliminar ruta dinámica

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero eliminar mis rutas, para quitar las que ya no uso.».

#### Scenario: Eliminar ruta dinámica - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Eliminar ruta dinámica»
- **WHEN** el actor solicita «Eliminar ruta dinámica» en esas circunstancias
- **THEN** Solo el visitante que creó la ruta puede eliminarla.

#### Scenario: Eliminar ruta dinámica - criterio 2

- **GIVEN** Se cumple la condición «la ruta no tiene recorridos ni experiencias»
- **WHEN** el actor solicita «Eliminar ruta dinámica» en esas circunstancias
- **THEN** se elimina.

#### Scenario: Eliminar ruta dinámica - criterio 3

- **GIVEN** Se cumple la condición «la ruta ya tiene recorridos o una experiencia transcurre sobre ella»
- **WHEN** el actor solicita «Eliminar ruta dinámica» en esas circunstancias
- **THEN** no se borra, porque se conserva su historial.

