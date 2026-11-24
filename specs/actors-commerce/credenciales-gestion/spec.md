# Especificación: credenciales gestion

## 1. Objetivo

Describir el comportamiento verificable de credenciales gestion, conforme a la primera entrega.

## 2. Requisitos funcionales

- Validar credencial: «Como comercio o guía quiero validar la autenticidad de una credencial digital, para saber si puedo darle acceso al visitante.».
- Adquirir credencial digital: «Como visitante quiero adquirir una credencial digital, para entrar a un recinto pagado o reservar un servicio.».
- Consultar credencial digital: «Como visitante quiero consultar mis credenciales digitales, para saber cuáles tengo y en qué estado están.».
- Cancelar credencial digital: «Como visitante quiero cancelar una credencial digital, para no usar una reserva que ya no necesito. Este es el borrado del CRUD: la credencial no se modifica ni se elimina, se cancela.».
- Canjear credencial: «Como comercio o guía quiero canjear la credencial de un visitante, para darle acceso.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). No modificar las restricciones del modelo relacional validado.

## 4. Criterios de aceptación

### Validar credencial

- Criterio 1: Al ingresar un código de credencial, el sistema indica si existe y en qué estado está: emitido, canjeado, cancelado o vencido.
  - Dado: Se cumplen las precondiciones del comportamiento «Validar credencial»
  - Cuando: el actor solicita «Validar credencial» en esas circunstancias
  - Entonces: Al ingresar un código de credencial, el sistema indica si existe y en qué estado está: emitido, canjeado, cancelado o vencido.
- Criterio 2: La credencial solo se considera válida si está emitida y la fecha y hora programadas corresponden al horario autorizado.
  - Dado: Se cumplen las precondiciones del comportamiento «Validar credencial»
  - Cuando: el actor solicita «Validar credencial» en esas circunstancias
  - Entonces: La credencial solo se considera válida si está emitida y la fecha y hora programadas corresponden al horario autorizado.
- Criterio 3: el sistema indica que la credencial no es auténtica.
  - Dado: Se cumple la condición «el código no existe»
  - Cuando: el actor solicita «Validar credencial» en esas circunstancias
  - Entonces: el sistema indica que la credencial no es auténtica.

### Adquirir credencial digital

- Criterio 1: El sistema genera un código alfanumérico de verificación único.
  - Dado: Se cumplen las precondiciones del comportamiento «Adquirir credencial digital»
  - Cuando: el actor solicita «Adquirir credencial digital» en esas circunstancias
  - Entonces: El sistema genera un código alfanumérico de verificación único.
- Criterio 2: La credencial tiene fecha y hora programadas para la visita, monto abonado y cantidad de beneficiarios.
  - Dado: Se cumplen las precondiciones del comportamiento «Adquirir credencial digital»
  - Cuando: el actor solicita «Adquirir credencial digital» en esas circunstancias
  - Entonces: La credencial tiene fecha y hora programadas para la visita, monto abonado y cantidad de beneficiarios.
- Criterio 3: Se vincula al visitante que la adquiere, al hito o comercio (servicio) reservado y al aliado comercial o guía que validará la entrada.
  - Dado: Se cumplen las precondiciones del comportamiento «Adquirir credencial digital»
  - Cuando: el actor solicita «Adquirir credencial digital» en esas circunstancias
  - Entonces: Se vincula al visitante que la adquiere, al hito o comercio (servicio) reservado y al aliado comercial o guía que validará la entrada.
- Criterio 4: queda vinculada a ella; si no, queda sin experiencia.
  - Dado: Se cumple la condición «la credencial se adquiere bajo una experiencia promocional»
  - Cuando: el actor solicita «Adquirir credencial digital» en esas circunstancias
  - Entonces: queda vinculada a ella; si no, queda sin experiencia.
- Criterio 5: Al emitirse queda en estado emitido.
  - Dado: Se cumplen las precondiciones del comportamiento «Adquirir credencial digital»
  - Cuando: el actor solicita «Adquirir credencial digital» en esas circunstancias
  - Entonces: Al emitirse queda en estado emitido.

### Consultar credencial digital

- Criterio 1: Veo la lista de mis credenciales con su estado.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar credencial digital»
  - Cuando: el actor solicita «Consultar credencial digital» en esas circunstancias
  - Entonces: Veo la lista de mis credenciales con su estado.
- Criterio 2: la credencial aparece como vencida.
  - Dado: Se cumple la condición «pasa la fecha programada sin canjearse»
  - Cuando: el actor solicita «Consultar credencial digital» en esas circunstancias
  - Entonces: la credencial aparece como vencida.

### Cancelar credencial digital

- Criterio 1: Puedo cancelar una credencial emitida; pasa a estado cancelado y ya no se puede canjear.
  - Dado: Se cumplen las precondiciones del comportamiento «Cancelar credencial digital»
  - Cuando: el actor solicita «Cancelar credencial digital» en esas circunstancias
  - Entonces: Puedo cancelar una credencial emitida; pasa a estado cancelado y ya no se puede canjear.
- Criterio 2: está vencida o ya está cancelada, el sistema no me deja cancelarla.
  - Dado: Se cumple la condición «la credencial ya fue canjeada»
  - Cuando: el actor solicita «Cancelar credencial digital» en esas circunstancias
  - Entonces: está vencida o ya está cancelada, el sistema no me deja cancelarla.

### Canjear credencial

- Criterio 1: Solo puede canjearla el aliado comercial o el guía asociado a esa credencial.
  - Dado: Se cumplen las precondiciones del comportamiento «Canjear credencial»
  - Cuando: el actor solicita «Canjear credencial» en esas circunstancias
  - Entonces: Solo puede canjearla el aliado comercial o el guía asociado a esa credencial.
- Criterio 2: está cancelada o está vencida, el sistema rechaza el canje.
  - Dado: Se cumple la condición «la credencial ya fue canjeada»
  - Cuando: el actor solicita «Canjear credencial» en esas circunstancias
  - Entonces: está cancelada o está vencida, el sistema rechaza el canje.
- Criterio 3: el sistema lo rechaza.
  - Dado: Se cumple la condición «se intenta canjear fuera del horario operativo autorizado para su fecha»
  - Cuando: el actor solicita «Canjear credencial» en esas circunstancias
  - Entonces: el sistema lo rechaza.
- Criterio 4: Al canjearse, la credencial pasa a estado canjeado.
  - Dado: Se cumplen las precondiciones del comportamiento «Canjear credencial»
  - Cuando: el actor solicita «Canjear credencial» en esas circunstancias
  - Entonces: Al canjearse, la credencial pasa a estado canjeado.

## 5. Restricciones técnicas

PostgreSQL gestiona integridad y reglas. Aplicación web de tres capas; framework por confirmar.

## 6. Fuera de alcance

Cambios de modelo relacional, funcionalidades no documentadas o patrones anticipados.

## 7. Decisiones abiertas

Validar contratos entre capas y elección de stack de aplicación.
