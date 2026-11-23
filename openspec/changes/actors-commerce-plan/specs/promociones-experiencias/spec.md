# promociones experiencias

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/requirements/traceability-detailed.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Experiencias vigentes de un recorrido

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero ver las experiencias promocionales vigentes de una ruta, para aprovechar las promociones durante el recorrido.».

#### Scenario: Experiencias vigentes de un recorrido - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Experiencias vigentes de un recorrido»
- **WHEN** el actor solicita «Experiencias vigentes de un recorrido» en esas circunstancias
- **THEN** El visitante elige una ruta y el sistema lista sus experiencias vigentes: las que tienen la fecha actual entre su fecha de activación y su fecha de vencimiento.

#### Scenario: Experiencias vigentes de un recorrido - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Experiencias vigentes de un recorrido»
- **WHEN** el actor solicita «Experiencias vigentes de un recorrido» en esas circunstancias
- **THEN** Para cada experiencia muestra título, descripción, precio, porcentaje de descuento, cupo y código promocional si lo tiene.

#### Scenario: Experiencias vigentes de un recorrido - criterio 3

- **GIVEN** Se cumple la condición «la ruta no tiene experiencias vigentes»
- **WHEN** el actor solicita «Experiencias vigentes de un recorrido» en esas circunstancias
- **THEN** el sistema lo indica.

### Requirement: Registrar experiencia promocional

El sistema SHALL cumplir el siguiente objetivo funcional: «Como comercio o guía quiero registrar experiencias promocionales, para atraer visitantes a mis servicios.».

#### Scenario: Registrar experiencia promocional - criterio 1

- **GIVEN** Se cumple la condición «registro una experiencia con el mismo título y la misma fecha de activación que otra»
- **WHEN** el actor solicita «Registrar experiencia promocional» en esas circunstancias
- **THEN** el sistema la rechaza.

#### Scenario: Registrar experiencia promocional - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar experiencia promocional»
- **WHEN** el actor solicita «Registrar experiencia promocional» en esas circunstancias
- **THEN** Cada experiencia tiene descripción, precio total, cupo máximo por grupo, porcentaje de descuento y fecha de vencimiento; el código promocional es opcional.

#### Scenario: Registrar experiencia promocional - criterio 3

- **GIVEN** Se cumple la condición «la fecha de vencimiento no es posterior a la de activación»
- **WHEN** el actor solicita «Registrar experiencia promocional» en esas circunstancias
- **THEN** el sistema la rechaza.

#### Scenario: Registrar experiencia promocional - criterio 4

- **GIVEN** Se cumple la condición «el cupo es menor que una persona»
- **WHEN** el actor solicita «Registrar experiencia promocional» en esas circunstancias
- **THEN** el sistema la rechaza.

#### Scenario: Registrar experiencia promocional - criterio 5

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar experiencia promocional»
- **WHEN** el actor solicita «Registrar experiencia promocional» en esas circunstancias
- **THEN** La experiencia se vincula al comercio que la promueve, al guía certificado que la dirige, a la ruta del recorrido y a los hitos o comercios (servicios) que incluye.

### Requirement: Consultar experiencia promocional

El sistema SHALL cumplir el siguiente objetivo funcional: «Como comercio o guía quiero consultar mis experiencias promocionales, para saber cuáles tengo publicadas.».

#### Scenario: Consultar experiencia promocional - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar experiencia promocional»
- **WHEN** el actor solicita «Consultar experiencia promocional» en esas circunstancias
- **THEN** Veo la lista de mis experiencias.

#### Scenario: Consultar experiencia promocional - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar experiencia promocional»
- **WHEN** el actor solicita «Consultar experiencia promocional» en esas circunstancias
- **THEN** Puedo abrir una experiencia y ver sus datos y sus vínculos.

### Requirement: Modificar experiencia promocional

El sistema SHALL cumplir el siguiente objetivo funcional: «Como comercio o guía quiero modificar mis experiencias promocionales, para ajustar su oferta.».

#### Scenario: Modificar experiencia promocional - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Modificar experiencia promocional»
- **WHEN** el actor solicita «Modificar experiencia promocional» en esas circunstancias
- **THEN** Solo el comercio que promueve la experiencia o el guía que la dirige puede modificarla.

#### Scenario: Modificar experiencia promocional - criterio 2

- **GIVEN** Se cumple la condición «el título y la fecha de activación quedan iguales a los de otra experiencia»
- **WHEN** el actor solicita «Modificar experiencia promocional» en esas circunstancias
- **THEN** el sistema lo rechaza.

#### Scenario: Modificar experiencia promocional - criterio 3

- **GIVEN** Se cumple la condición «la fecha de vencimiento no es posterior a la de activación»
- **WHEN** el actor solicita «Modificar experiencia promocional» en esas circunstancias
- **THEN** el sistema lo rechaza.

#### Scenario: Modificar experiencia promocional - criterio 4

- **GIVEN** Se cumple la condición «el cupo queda menor que una persona»
- **WHEN** el actor solicita «Modificar experiencia promocional» en esas circunstancias
- **THEN** el sistema lo rechaza.

### Requirement: Eliminar experiencia promocional

El sistema SHALL cumplir el siguiente objetivo funcional: «Como comercio o guía quiero eliminar mis experiencias promocionales, para retirar las que ya no ofrezco.».

#### Scenario: Eliminar experiencia promocional - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Eliminar experiencia promocional»
- **WHEN** el actor solicita «Eliminar experiencia promocional» en esas circunstancias
- **THEN** Solo el comercio que promueve la experiencia o el guía que la dirige puede eliminarla.

#### Scenario: Eliminar experiencia promocional - criterio 2

- **GIVEN** Se cumple la condición «ninguna credencial se adquirió bajo la experiencia»
- **WHEN** el actor solicita «Eliminar experiencia promocional» en esas circunstancias
- **THEN** se elimina.

#### Scenario: Eliminar experiencia promocional - criterio 3

- **GIVEN** Se cumple la condición «hay credenciales adquiridas bajo la experiencia»
- **WHEN** el actor solicita «Eliminar experiencia promocional» en esas circunstancias
- **THEN** el sistema no la elimina y me indica qué lo impide.

