# patrimonio eventos

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/trazabilidad-detallada.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Registrar evento cultural

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero registrar los eventos culturales de un hito, para que los visitantes conozcan su cronograma.».

#### Scenario: Registrar evento cultural - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar evento cultural»
- **WHEN** el actor solicita «Registrar evento cultural» en esas circunstancias
- **THEN** Cada evento pertenece a un hito y tiene nombre y fecha de inicio, y nada más: no lleva fecha de fin ni horario.

#### Scenario: Registrar evento cultural - criterio 2

- **GIVEN** Se cumple la condición «registro en el mismo hito un evento con el mismo nombre y la misma fecha de inicio que otro»
- **WHEN** el actor solicita «Registrar evento cultural» en esas circunstancias
- **THEN** el sistema lo rechaza.

#### Scenario: Registrar evento cultural - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar evento cultural»
- **WHEN** el actor solicita «Registrar evento cultural» en esas circunstancias
- **THEN** Se acepta el mismo nombre de evento en otra fecha o en otro hito.

### Requirement: Consultar evento cultural

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero consultar los eventos culturales de un hito, para revisar su cronograma.».

#### Scenario: Consultar evento cultural - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar evento cultural»
- **WHEN** el actor solicita «Consultar evento cultural» en esas circunstancias
- **THEN** Puedo ver los eventos de un hito, que forman su cronograma.

### Requirement: Modificar evento cultural

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero modificar un evento cultural, para corregir su nombre o su fecha de inicio.».

#### Scenario: Modificar evento cultural - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar evento cultural»
- **WHEN** el actor solicita «Modificar evento cultural» en esas circunstancias
- **THEN** Puedo cambiar el nombre o la fecha de inicio del evento.

#### Scenario: Modificar evento cultural - criterio 2

- **GIVEN** Se cumple la condición «el evento queda con el mismo nombre y la misma fecha de inicio que otro del mismo hito»
- **WHEN** el actor solicita «Modificar evento cultural» en esas circunstancias
- **THEN** el sistema lo rechaza.

#### Scenario: Modificar evento cultural - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar evento cultural»
- **WHEN** el actor solicita «Modificar evento cultural» en esas circunstancias
- **THEN** El evento sigue sin fecha de fin ni horario.

### Requirement: Eliminar evento cultural

El sistema SHALL cumplir el siguiente objetivo funcional: «Como administrador quiero eliminar eventos culturales, para quitar los que ya no se realizan.».

#### Scenario: Eliminar evento cultural - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Eliminar evento cultural»
- **WHEN** el actor solicita «Eliminar evento cultural» en esas circunstancias
- **THEN** Puedo eliminar un evento sin afectar al hito.

