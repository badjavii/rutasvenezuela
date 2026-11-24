# Especificación: reportes promociones

## 1. Objetivo

Documentar el comportamiento verificable de reportes promociones a partir del informe académico.

## 2. Requisitos funcionales

- Desempeño de experiencias y credenciales: «Como comercio o guía quiero ver los cupos usados, las credenciales canjeadas y el monto de cada experiencia, para medir mis ventas.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). No se incorporan nuevas reglas por inferencia.

## 4. Criterios de aceptación

### Desempeño de experiencias y credenciales

- Criterio 1: Cada comercio o guía ve solo sus propias experiencias.
  - Dado: Se cumplen las precondiciones del comportamiento «Desempeño de experiencias y credenciales»
  - Cuando: el actor solicita «Desempeño de experiencias y credenciales» en esas circunstancias
  - Entonces: Cada comercio o guía ve solo sus propias experiencias.
- Criterio 2: Para cada experiencia muestra su cupo máximo y los días que faltan para su vencimiento.
  - Dado: Se cumplen las precondiciones del comportamiento «Desempeño de experiencias y credenciales»
  - Cuando: el actor solicita «Desempeño de experiencias y credenciales» en esas circunstancias
  - Entonces: Para cada experiencia muestra su cupo máximo y los días que faltan para su vencimiento.
- Criterio 3: Muestra cuántas credenciales amparadas por la experiencia se emitieron, canjearon, cancelaron y vencieron, y el monto total abonado, sin contar las credenciales canceladas.
  - Dado: Se cumplen las precondiciones del comportamiento «Desempeño de experiencias y credenciales»
  - Cuando: el actor solicita «Desempeño de experiencias y credenciales» en esas circunstancias
  - Entonces: Muestra cuántas credenciales amparadas por la experiencia se emitieron, canjearon, cancelaron y vencieron, y el monto total abonado, sin contar las credenciales canceladas.

## 5. Restricciones técnicas

PostgreSQL aloja reglas y transacciones. Aplicación web de tres capas con backend/frontend de referencia provisional.

## 6. Fuera de alcance

Alterar el relacional aprobado o añadir funcionalidades ajenas a la capacidad.

## 7. Decisiones abiertas

Validación humana del contrato y elección definitiva del stack.
