# Especificación: patrimonio eventos

## 1. Objetivo

Describir los comportamientos verificables de patrimonio eventos, derivados de la primera entrega.

## 2. Requisitos funcionales

- Registrar evento cultural: «Como administrador quiero registrar los eventos culturales de un hito, para que los visitantes conozcan su cronograma.».
- Consultar evento cultural: «Como administrador quiero consultar los eventos culturales de un hito, para revisar su cronograma.».
- Modificar evento cultural: «Como administrador quiero modificar un evento cultural, para corregir su nombre o su fecha de inicio.».
- Eliminar evento cultural: «Como administrador quiero eliminar eventos culturales, para quitar los que ya no se realizan.».

## 3. Reglas de negocio

Consultar [reglas relacionales](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). No inferir nuevas invariantes.

## 4. Criterios de aceptación

### Registrar evento cultural

- Criterio 1: Cada evento pertenece a un hito y tiene nombre y fecha de inicio, y nada más: no lleva fecha de fin ni horario.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar evento cultural»
  - Cuando: el actor solicita «Registrar evento cultural» en esas circunstancias
  - Entonces: Cada evento pertenece a un hito y tiene nombre y fecha de inicio, y nada más: no lleva fecha de fin ni horario.
- Criterio 2: el sistema lo rechaza.
  - Dado: Se cumple la condición «registro en el mismo hito un evento con el mismo nombre y la misma fecha de inicio que otro»
  - Cuando: el actor solicita «Registrar evento cultural» en esas circunstancias
  - Entonces: el sistema lo rechaza.
- Criterio 3: Se acepta el mismo nombre de evento en otra fecha o en otro hito.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar evento cultural»
  - Cuando: el actor solicita «Registrar evento cultural» en esas circunstancias
  - Entonces: Se acepta el mismo nombre de evento en otra fecha o en otro hito.

### Consultar evento cultural

- Criterio 1: Puedo ver los eventos de un hito, que forman su cronograma.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar evento cultural»
  - Cuando: el actor solicita «Consultar evento cultural» en esas circunstancias
  - Entonces: Puedo ver los eventos de un hito, que forman su cronograma.

### Modificar evento cultural

- Criterio 1: Puedo cambiar el nombre o la fecha de inicio del evento.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar evento cultural»
  - Cuando: el actor solicita «Modificar evento cultural» en esas circunstancias
  - Entonces: Puedo cambiar el nombre o la fecha de inicio del evento.
- Criterio 2: el sistema lo rechaza.
  - Dado: Se cumple la condición «el evento queda con el mismo nombre y la misma fecha de inicio que otro del mismo hito»
  - Cuando: el actor solicita «Modificar evento cultural» en esas circunstancias
  - Entonces: el sistema lo rechaza.
- Criterio 3: El evento sigue sin fecha de fin ni horario.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar evento cultural»
  - Cuando: el actor solicita «Modificar evento cultural» en esas circunstancias
  - Entonces: El evento sigue sin fecha de fin ni horario.

### Eliminar evento cultural

- Criterio 1: Puedo eliminar un evento sin afectar al hito.
  - Dado: Se cumplen las precondiciones del comportamiento «Eliminar evento cultural»
  - Cuando: el actor solicita «Eliminar evento cultural» en esas circunstancias
  - Entonces: Puedo eliminar un evento sin afectar al hito.

## 5. Restricciones técnicas

PostgreSQL concentra integridad y transacciones. Aplicación web de tres capas; stack de aplicación provisional.

## 6. Fuera de alcance

Cambiar el modelo relacional validado o incorporar reglas ajenas al informe.

## 7. Decisiones abiertas

Revisión y aprobación humana del contrato y elección definitiva del backend.
