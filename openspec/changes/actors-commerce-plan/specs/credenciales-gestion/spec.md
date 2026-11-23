# credenciales gestion

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/trazabilidad-detallada.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Validar credencial

El sistema SHALL cumplir el siguiente objetivo funcional: «Como comercio o guía quiero validar la autenticidad de una credencial digital, para saber si puedo darle acceso al visitante.».

#### Scenario: Validar credencial - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Validar credencial»
- **WHEN** el actor solicita «Validar credencial» en esas circunstancias
- **THEN** Al ingresar un código de credencial, el sistema indica si existe y en qué estado está: emitido, canjeado, cancelado o vencido.

#### Scenario: Validar credencial - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Validar credencial»
- **WHEN** el actor solicita «Validar credencial» en esas circunstancias
- **THEN** La credencial solo se considera válida si está emitida y la fecha y hora programadas corresponden al horario autorizado.

#### Scenario: Validar credencial - criterio 3

- **GIVEN** Se cumple la condición «el código no existe»
- **WHEN** el actor solicita «Validar credencial» en esas circunstancias
- **THEN** el sistema indica que la credencial no es auténtica.

### Requirement: Adquirir credencial digital

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero adquirir una credencial digital, para entrar a un recinto pagado o reservar un servicio.».

#### Scenario: Adquirir credencial digital - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Adquirir credencial digital»
- **WHEN** el actor solicita «Adquirir credencial digital» en esas circunstancias
- **THEN** El sistema genera un código alfanumérico de verificación único.

#### Scenario: Adquirir credencial digital - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Adquirir credencial digital»
- **WHEN** el actor solicita «Adquirir credencial digital» en esas circunstancias
- **THEN** La credencial tiene fecha y hora programadas para la visita, monto abonado y cantidad de beneficiarios.

#### Scenario: Adquirir credencial digital - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Adquirir credencial digital»
- **WHEN** el actor solicita «Adquirir credencial digital» en esas circunstancias
- **THEN** Se vincula al visitante que la adquiere, al hito o comercio (servicio) reservado y al aliado comercial o guía que validará la entrada.

#### Scenario: Adquirir credencial digital - criterio 4

- **GIVEN** Se cumple la condición «la credencial se adquiere bajo una experiencia promocional»
- **WHEN** el actor solicita «Adquirir credencial digital» en esas circunstancias
- **THEN** queda vinculada a ella; si no, queda sin experiencia.

#### Scenario: Adquirir credencial digital - criterio 5

- **GIVEN** Se cumplen las precondiciones del comportamiento «Adquirir credencial digital»
- **WHEN** el actor solicita «Adquirir credencial digital» en esas circunstancias
- **THEN** Al emitirse queda en estado emitido.

### Requirement: Consultar credencial digital

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero consultar mis credenciales digitales, para saber cuáles tengo y en qué estado están.».

#### Scenario: Consultar credencial digital - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Consultar credencial digital»
- **WHEN** el actor solicita «Consultar credencial digital» en esas circunstancias
- **THEN** Veo la lista de mis credenciales con su estado.

#### Scenario: Consultar credencial digital - criterio 2

- **GIVEN** Se cumple la condición «pasa la fecha programada sin canjearse»
- **WHEN** el actor solicita «Consultar credencial digital» en esas circunstancias
- **THEN** la credencial aparece como vencida.

### Requirement: Cancelar credencial digital

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero cancelar una credencial digital, para no usar una reserva que ya no necesito. Este es el borrado del CRUD: la credencial no se modifica ni se elimina, se cancela.».

#### Scenario: Cancelar credencial digital - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Cancelar credencial digital»
- **WHEN** el actor solicita «Cancelar credencial digital» en esas circunstancias
- **THEN** Puedo cancelar una credencial emitida; pasa a estado cancelado y ya no se puede canjear.

#### Scenario: Cancelar credencial digital - criterio 2

- **GIVEN** Se cumple la condición «la credencial ya fue canjeada»
- **WHEN** el actor solicita «Cancelar credencial digital» en esas circunstancias
- **THEN** está vencida o ya está cancelada, el sistema no me deja cancelarla.

### Requirement: Canjear credencial

El sistema SHALL cumplir el siguiente objetivo funcional: «Como comercio o guía quiero canjear la credencial de un visitante, para darle acceso.».

#### Scenario: Canjear credencial - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Canjear credencial»
- **WHEN** el actor solicita «Canjear credencial» en esas circunstancias
- **THEN** Solo puede canjearla el aliado comercial o el guía asociado a esa credencial.

#### Scenario: Canjear credencial - criterio 2

- **GIVEN** Se cumple la condición «la credencial ya fue canjeada»
- **WHEN** el actor solicita «Canjear credencial» en esas circunstancias
- **THEN** está cancelada o está vencida, el sistema rechaza el canje.

#### Scenario: Canjear credencial - criterio 3

- **GIVEN** Se cumple la condición «se intenta canjear fuera del horario operativo autorizado para su fecha»
- **WHEN** el actor solicita «Canjear credencial» en esas circunstancias
- **THEN** el sistema lo rechaza.

#### Scenario: Canjear credencial - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Canjear credencial»
- **WHEN** el actor solicita «Canjear credencial» en esas circunstancias
- **THEN** Al canjearse, la credencial pasa a estado canjeado.

