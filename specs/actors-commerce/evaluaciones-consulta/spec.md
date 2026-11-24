# Especificación: evaluaciones consulta

## 1. Objetivo

Documentar el comportamiento verificable de evaluaciones consulta a partir del informe académico.

## 2. Requisitos funcionales

- Valoraciones de una ruta: «Como visitante quiero ver las valoraciones, las observaciones de seguridad y los comentarios de una ruta, para saber si me conviene.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). No se incorporan nuevas reglas por inferencia.

## 4. Criterios de aceptación

### Valoraciones de una ruta

- Criterio 1: El visitante elige una ruta y el sistema lista sus evaluaciones con la calificación, la seguridad percibida, la fecha y la opinión.
  - Dado: Se cumplen las precondiciones del comportamiento «Valoraciones de una ruta»
  - Cuando: el actor solicita «Valoraciones de una ruta» en esas circunstancias
  - Entonces: El visitante elige una ruta y el sistema lista sus evaluaciones con la calificación, la seguridad percibida, la fecha y la opinión.
- Criterio 2: Cada evaluación indica si tiene la marca de recorrido verificado. En las evaluaciones de una ruta la marca siempre es sí, porque exigen un recorrido completado.
  - Dado: Se cumplen las precondiciones del comportamiento «Valoraciones de una ruta»
  - Cuando: el actor solicita «Valoraciones de una ruta» en esas circunstancias
  - Entonces: Cada evaluación indica si tiene la marca de recorrido verificado. En las evaluaciones de una ruta la marca siempre es sí, porque exigen un recorrido completado.
- Criterio 3: el sistema lo indica.
  - Dado: Se cumple la condición «la ruta no tiene evaluaciones»
  - Cuando: el actor solicita «Valoraciones de una ruta» en esas circunstancias
  - Entonces: el sistema lo indica.
- Criterio 4: Un mismo visitante puede aparecer varias veces en la lista, porque publica una evaluación por cada recorrido.
  - Dado: Se cumplen las precondiciones del comportamiento «Valoraciones de una ruta»
  - Cuando: el actor solicita «Valoraciones de una ruta» en esas circunstancias
  - Entonces: Un mismo visitante puede aparecer varias veces en la lista, porque publica una evaluación por cada recorrido.

## 5. Restricciones técnicas

PostgreSQL aloja reglas y transacciones. Aplicación web de tres capas con backend/frontend de referencia provisional.

## 6. Fuera de alcance

Alterar el relacional aprobado o añadir funcionalidades ajenas a la capacidad.

## 7. Decisiones abiertas

Validación humana del contrato y elección definitiva del stack.
