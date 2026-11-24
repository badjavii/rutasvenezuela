# Especificación: incidencias gestion

## 1. Objetivo

Describir los comportamientos verificables de incidencias gestion, derivados de la primera entrega.

## 2. Requisitos funcionales

- Reportar incidencia: «Como visitante, guía o funcionario quiero reportar una incidencia en un hito o en un tramo de vía, para avisar a los demás usuarios.».
- Verificar incidencia: «Como funcionario quiero verificar las incidencias preliminares, para que solo se publiquen hechos confirmados.».
- Prorrogar incidencia: «Como funcionario quiero prorrogar la fecha estimada de resolución de una incidencia, para que siga activa mientras se resuelve.».
- Cerrar incidencia: «Como funcionario de la institución responsable quiero cerrar una incidencia resuelta, para que deje de afectar al hito o al tramo.».

## 3. Reglas de negocio

Consultar [reglas relacionales](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). No inferir nuevas invariantes.

## 4. Criterios de aceptación

### Reportar incidencia

- Criterio 1: El sistema asigna un número de reporte correlativo.
  - Dado: Se cumplen las precondiciones del comportamiento «Reportar incidencia»
  - Cuando: el actor solicita «Reportar incidencia» en esas circunstancias
  - Entonces: El sistema asigna un número de reporte correlativo.
- Criterio 2: Se registran la fecha y hora de detección, la fecha estimada de resolución, la narrativa y la severidad: bajo, medio o crítico.
  - Dado: Se cumplen las precondiciones del comportamiento «Reportar incidencia»
  - Cuando: el actor solicita «Reportar incidencia» en esas circunstancias
  - Entonces: Se registran la fecha y hora de detección, la fecha estimada de resolución, la narrativa y la severidad: bajo, medio o crítico.
- Criterio 3: La incidencia se asocia a un hito o a un tramo de vía, o a una secuencia de tramos.
  - Dado: Se cumplen las precondiciones del comportamiento «Reportar incidencia»
  - Cuando: el actor solicita «Reportar incidencia» en esas circunstancias
  - Entonces: La incidencia se asocia a un hito o a un tramo de vía, o a una secuencia de tramos.
- Criterio 4: Se guarda el usuario que la reporta: visitante, guía o funcionario.
  - Dado: Se cumplen las precondiciones del comportamiento «Reportar incidencia»
  - Cuando: el actor solicita «Reportar incidencia» en esas circunstancias
  - Entonces: Se guarda el usuario que la reporta: visitante, guía o funcionario.
- Criterio 5: queda en estado preliminar hasta que un funcionario la verifique.
  - Dado: Se cumple la condición «la reporta un visitante o un guía»
  - Cuando: el actor solicita «Reportar incidencia» en esas circunstancias
  - Entonces: queda en estado preliminar hasta que un funcionario la verifique.
- Criterio 6: queda activa sin pasar por verificación.
  - Dado: Se cumple la condición «la reporta un funcionario»
  - Cuando: el actor solicita «Reportar incidencia» en esas circunstancias
  - Entonces: queda activa sin pasar por verificación.

### Verificar incidencia

- Criterio 1: Solo un funcionario o autoridad competente puede verificar una incidencia.
  - Dado: Se cumplen las precondiciones del comportamiento «Verificar incidencia»
  - Cuando: el actor solicita «Verificar incidencia» en esas circunstancias
  - Entonces: Solo un funcionario o autoridad competente puede verificar una incidencia.
- Criterio 2: El funcionario ve la lista de incidencias en estado preliminar.
  - Dado: Se cumplen las precondiciones del comportamiento «Verificar incidencia»
  - Cuando: el actor solicita «Verificar incidencia» en esas circunstancias
  - Entonces: El funcionario ve la lista de incidencias en estado preliminar.
- Criterio 3: la confirma: queda activa y el funcionario ratifica o cambia su severidad.
  - Dado: Se cumple la condición «el hecho es veraz»
  - Cuando: el actor solicita «Verificar incidencia» en esas circunstancias
  - Entonces: la confirma: queda activa y el funcionario ratifica o cambia su severidad.
- Criterio 4: la descarta: la incidencia pasa a estado descartada y no afecta al hito ni al tramo.
  - Dado: Se cumple la condición «el hecho no es veraz»
  - Cuando: el actor solicita «Verificar incidencia» en esas circunstancias
  - Entonces: la descarta: la incidencia pasa a estado descartada y no afecta al hito ni al tramo.

### Prorrogar incidencia

- Criterio 1: Solo un funcionario o autoridad competente puede prorrogar una incidencia.
  - Dado: Se cumplen las precondiciones del comportamiento «Prorrogar incidencia»
  - Cuando: el actor solicita «Prorrogar incidencia» en esas circunstancias
  - Entonces: Solo un funcionario o autoridad competente puede prorrogar una incidencia.
- Criterio 2: La prórroga exige una justificación; sin ella, el sistema la rechaza.
  - Dado: Se cumplen las precondiciones del comportamiento «Prorrogar incidencia»
  - Cuando: el actor solicita «Prorrogar incidencia» en esas circunstancias
  - Entonces: La prórroga exige una justificación; sin ella, el sistema la rechaza.
- Criterio 3: La nueva fecha estimada debe ser posterior a la anterior.
  - Dado: Se cumplen las precondiciones del comportamiento «Prorrogar incidencia»
  - Cuando: el actor solicita «Prorrogar incidencia» en esas circunstancias
  - Entonces: La nueva fecha estimada debe ser posterior a la anterior.
- Criterio 4: Se guarda la prórroga con su nueva fecha y su justificación.
  - Dado: Se cumplen las precondiciones del comportamiento «Prorrogar incidencia»
  - Cuando: el actor solicita «Prorrogar incidencia» en esas circunstancias
  - Entonces: Se guarda la prórroga con su nueva fecha y su justificación.
- Criterio 5: Una incidencia activa pasa a estado vencida si se supera su fecha estimada de resolución sin una prórroga justificada, y deja de afectar al hito o al tramo.
  - Dado: Se cumplen las precondiciones del comportamiento «Prorrogar incidencia»
  - Cuando: el actor solicita «Prorrogar incidencia» en esas circunstancias
  - Entonces: Una incidencia activa pasa a estado vencida si se supera su fecha estimada de resolución sin una prórroga justificada, y deja de afectar al hito o al tramo.

### Cerrar incidencia

- Criterio 1: Solo la autoridad institucional responsable puede cerrar la incidencia: un funcionario de una institución con competencia sobre el municipio del hito o del tramo afectado.
  - Dado: Se cumplen las precondiciones del comportamiento «Cerrar incidencia»
  - Cuando: el actor solicita «Cerrar incidencia» en esas circunstancias
  - Entonces: Solo la autoridad institucional responsable puede cerrar la incidencia: un funcionario de una institución con competencia sobre el municipio del hito o del tramo afectado.
- Criterio 2: Solo se cierran incidencias en estado activa: una preliminar primero se verifica, y las descartadas o vencidas no se cierran.
  - Dado: Se cumplen las precondiciones del comportamiento «Cerrar incidencia»
  - Cuando: el actor solicita «Cerrar incidencia» en esas circunstancias
  - Entonces: Solo se cierran incidencias en estado activa: una preliminar primero se verifica, y las descartadas o vencidas no se cierran.
- Criterio 3: Al cerrarse, la incidencia pasa a estado resuelta y se guarda la fecha de cierre.
  - Dado: Se cumplen las precondiciones del comportamiento «Cerrar incidencia»
  - Cuando: el actor solicita «Cerrar incidencia» en esas circunstancias
  - Entonces: Al cerrarse, la incidencia pasa a estado resuelta y se guarda la fecha de cierre.

## 5. Restricciones técnicas

PostgreSQL concentra integridad y transacciones. Aplicación web de tres capas; stack de aplicación provisional.

## 6. Fuera de alcance

Cambiar el modelo relacional validado o incorporar reglas ajenas al informe.

## 7. Decisiones abiertas

Revisión y aprobación humana del contrato y elección definitiva del backend.
