# actores identidades

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/trazabilidad-detallada.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Registrar visitante

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar visitantes, para que puedan usar la plataforma.».

#### Scenario: Registrar visitante - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar visitante»
- **WHEN** el actor solicita «Registrar visitante» en esas circunstancias
- **THEN** Se identifica por su cédula de identidad o pasaporte; si ya existe, el sistema lo rechaza.

#### Scenario: Registrar visitante - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar visitante»
- **WHEN** el actor solicita «Registrar visitante» en esas circunstancias
- **THEN** Tiene nombres, apellidos, país de origen, idioma nativo, teléfono de emergencia, grupo sanguíneo y especificaciones de accesibilidad física o sensorial.

#### Scenario: Registrar visitante - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar visitante»
- **WHEN** el actor solicita «Registrar visitante» en esas circunstancias
- **THEN** Tiene una contraseña para entrar con su identificador.

#### Scenario: Registrar visitante - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar visitante»
- **WHEN** el actor solicita «Registrar visitante» en esas circunstancias
- **THEN** Una misma persona puede ser visitante y también tener otro rol, por ejemplo guía.

### Requirement: Consultar visitante

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar los visitantes registrados, para revisar quiénes usan la plataforma.».

#### Scenario: Consultar visitante - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar visitante»
- **WHEN** el actor solicita «Consultar visitante» en esas circunstancias
- **THEN** Puedo ver el listado de todos los visitantes.

#### Scenario: Consultar visitante - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar visitante»
- **WHEN** el actor solicita «Consultar visitante» en esas circunstancias
- **THEN** Puedo abrir un visitante y ver todos sus datos.

### Requirement: Modificar visitante

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar los datos de un visitante, para mantenerlos al día.».

#### Scenario: Modificar visitante - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar visitante»
- **WHEN** el actor solicita «Modificar visitante» en esas circunstancias
- **THEN** Puedo cambiar cualquier dato del visitante.

#### Scenario: Modificar visitante - criterio 2

- **GIVEN** Se cumple la condición «cambio su cédula o pasaporte por uno que ya existe»
- **WHEN** el actor solicita «Modificar visitante» en esas circunstancias
- **THEN** el sistema lo rechaza.

### Requirement: Eliminar visitante

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar visitantes, para quitar los registros que ya no corresponden.».

#### Scenario: Eliminar visitante - criterio 1

- **GIVEN** Se cumple la condición «el visitante no tiene recorridos»
- **WHEN** el actor solicita «Eliminar visitante» en esas circunstancias
- **THEN** evaluaciones, credenciales, rutas propias ni contrataciones de guía, se elimina.

#### Scenario: Eliminar visitante - criterio 2

- **GIVEN** Se cumple la condición «tiene recorridos»
- **WHEN** el actor solicita «Eliminar visitante» en esas circunstancias
- **THEN** evaluaciones, credenciales, rutas propias o contrataciones de guía, el sistema no lo elimina y me indica qué lo impide.

### Requirement: Registrar funcionario

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar las cuentas de los funcionarios públicos, para que las autoridades puedan verificar y cerrar incidencias.».

#### Scenario: Registrar funcionario - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar funcionario»
- **WHEN** el actor solicita «Registrar funcionario» en esas circunstancias
- **THEN** Cada funcionario se identifica por su cédula y tiene nombre, cargo y una contraseña.

#### Scenario: Registrar funcionario - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar funcionario»
- **WHEN** el actor solicita «Registrar funcionario» en esas circunstancias
- **THEN** Cada funcionario queda asociado a la institución a la que pertenece.

### Requirement: Consultar funcionario

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar los funcionarios, para saber quiénes representan a cada institución.».

#### Scenario: Consultar funcionario - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar funcionario»
- **WHEN** el actor solicita «Consultar funcionario» en esas circunstancias
- **THEN** Puedo ver los funcionarios de una institución.

### Requirement: Modificar funcionario

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar las cuentas de los funcionarios, para mantener sus datos al día.».

#### Scenario: Modificar funcionario - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar funcionario»
- **WHEN** el actor solicita «Modificar funcionario» en esas circunstancias
- **THEN** Puedo cambiar los datos del funcionario y su institución.

#### Scenario: Modificar funcionario - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar funcionario»
- **WHEN** el actor solicita «Modificar funcionario» en esas circunstancias
- **THEN** El funcionario sigue asociado a una institución.

### Requirement: Eliminar funcionario

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar cuentas de funcionarios, para quitar las de quienes ya no participan.».

#### Scenario: Eliminar funcionario - criterio 1

- **GIVEN** Se cumple la condición «el funcionario no verificó ni cerró ninguna incidencia»
- **WHEN** el actor solicita «Eliminar funcionario» en esas circunstancias
- **THEN** se elimina su cuenta.

#### Scenario: Eliminar funcionario - criterio 2

- **GIVEN** Se cumple la condición «verificó o cerró alguna incidencia»
- **WHEN** el actor solicita «Eliminar funcionario» en esas circunstancias
- **THEN** el sistema no lo elimina y me indica qué lo impide.

### Requirement: Iniciar sesión

El sistema SHALL cumplir el siguiente objetivo funcional: «Como actor del sistema quiero entrar con mi identificador y mi contraseña, para usar la plataforma según mi rol.».

#### Scenario: Iniciar sesión - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Iniciar sesión»
- **WHEN** el actor solicita «Iniciar sesión» en esas circunstancias
- **THEN** El actor entra con su identificador (cédula o pasaporte del visitante, RIF del comercio o de la institución, registro del guía, o cédula del funcionario o del administrador) y su contraseña.

#### Scenario: Iniciar sesión - criterio 2

- **GIVEN** Se cumple la condición «el identificador o la contraseña no coinciden»
- **WHEN** el actor solicita «Iniciar sesión» en esas circunstancias
- **THEN** el sistema rechaza la entrada.

#### Scenario: Iniciar sesión - criterio 3

- **GIVEN** Se cumple la condición «la persona tiene varios roles»
- **WHEN** el actor solicita «Iniciar sesión» en esas circunstancias
- **THEN** usa la plataforma con el rol de la interacción que esté haciendo.

