# Especificación: evaluaciones publicacion

## 1. Objetivo

Describir los comportamientos verificables de evaluaciones publicacion, derivados de la primera entrega.

## 2. Requisitos funcionales

- Publicar evaluación: «Como visitante quiero calificar una ruta o un hito que recorrí, para orientar a otros visitantes.».

## 3. Reglas de negocio

Consultar [reglas relacionales](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). No inferir nuevas invariantes.

## 4. Criterios de aceptación

### Publicar evaluación

- Criterio 1: Cada evaluación tiene un código de reseña único.
  - Dado: Se cumplen las precondiciones del comportamiento «Publicar evaluación»
  - Cuando: el actor solicita «Publicar evaluación» en esas circunstancias
  - Entonces: Cada evaluación tiene un código de reseña único.
- Criterio 2: La calificación y la seguridad percibida van de 1 a 5 estrellas; el sistema rechaza valores fuera de ese rango.
  - Dado: Se cumplen las precondiciones del comportamiento «Publicar evaluación»
  - Cuando: el actor solicita «Publicar evaluación» en esas circunstancias
  - Entonces: La calificación y la seguridad percibida van de 1 a 5 estrellas; el sistema rechaza valores fuera de ese rango.
- Criterio 3: Se guardan la fecha de emisión y la opinión textual. La marca de recorrido verificado no se escribe a mano: es sí cuando el recorrido que respalda la evaluación está completado, y no cuando está abandonado (solo posible al evaluar un hito).
  - Dado: Se cumplen las precondiciones del comportamiento «Publicar evaluación»
  - Cuando: el actor solicita «Publicar evaluación» en esas circunstancias
  - Entonces: Se guardan la fecha de emisión y la opinión textual. La marca de recorrido verificado no se escribe a mano: es sí cuando el recorrido que respalda la evaluación está completado, y no cuando está abandonado (solo posible al evaluar un hito).
- Criterio 4: La evaluación se liga a un visitante registrado y a una ruta o a un hito.
  - Dado: Se cumplen las precondiciones del comportamiento «Publicar evaluación»
  - Cuando: el actor solicita «Publicar evaluación» en esas circunstancias
  - Entonces: La evaluación se liga a un visitante registrado y a una ruta o a un hito.
- Criterio 5: Para evaluar una ruta, el visitante debe tener un recorrido completado de esa ruta; para evaluar un hito, un recorrido (completado o abandonado) que haya pasado por ese hito. Si no, el sistema rechaza la evaluación.
  - Dado: Se cumplen las precondiciones del comportamiento «Publicar evaluación»
  - Cuando: el actor solicita «Publicar evaluación» en esas circunstancias
  - Entonces: Para evaluar una ruta, el visitante debe tener un recorrido completado de esa ruta; para evaluar un hito, un recorrido (completado o abandonado) que haya pasado por ese hito. Si no, el sistema rechaza la evaluación.
- Criterio 6: Cada evaluación queda ligada al recorrido que la respalda.
  - Dado: Se cumplen las precondiciones del comportamiento «Publicar evaluación»
  - Cuando: el actor solicita «Publicar evaluación» en esas circunstancias
  - Entonces: Cada evaluación queda ligada al recorrido que la respalda.
- Criterio 7: El visitante publica una evaluación nueva por cada viaje y las anteriores se conservan: no se actualiza la anterior. Un recorrido respalda como máximo una evaluación de su ruta y una por cada hito que transitó.
  - Dado: Se cumplen las precondiciones del comportamiento «Publicar evaluación»
  - Cuando: el actor solicita «Publicar evaluación» en esas circunstancias
  - Entonces: El visitante publica una evaluación nueva por cada viaje y las anteriores se conservan: no se actualiza la anterior. Un recorrido respalda como máximo una evaluación de su ruta y una por cada hito que transitó.

## 5. Restricciones técnicas

PostgreSQL concentra integridad y transacciones. Aplicación web de tres capas; stack de aplicación provisional.

## 6. Fuera de alcance

Cambiar el modelo relacional validado o incorporar reglas ajenas al informe.

## 7. Decisiones abiertas

Revisión y aprobación humana del contrato y elección definitiva del backend.
