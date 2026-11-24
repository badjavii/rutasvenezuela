# Especificación: promociones experiencias

## 1. Objetivo

Documentar el comportamiento verificable de promociones experiencias a partir del informe académico.

## 2. Requisitos funcionales

- Experiencias vigentes de un recorrido: «Como visitante quiero ver las experiencias promocionales vigentes de una ruta, para aprovechar las promociones durante el recorrido.».
- Registrar experiencia promocional: «Como comercio o guía quiero registrar experiencias promocionales, para atraer visitantes a mis servicios.».
- Consultar experiencia promocional: «Como comercio o guía quiero consultar mis experiencias promocionales, para saber cuáles tengo publicadas.».
- Modificar experiencia promocional: «Como comercio o guía quiero modificar mis experiencias promocionales, para ajustar su oferta.».
- Eliminar experiencia promocional: «Como comercio o guía quiero eliminar mis experiencias promocionales, para retirar las que ya no ofrezco.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). No se incorporan nuevas reglas por inferencia.

## 4. Criterios de aceptación

### Experiencias vigentes de un recorrido

- Criterio 1: El visitante elige una ruta y el sistema lista sus experiencias vigentes: las que tienen la fecha actual entre su fecha de activación y su fecha de vencimiento.
  - Dado: Se cumplen las precondiciones del comportamiento «Experiencias vigentes de un recorrido»
  - Cuando: el actor solicita «Experiencias vigentes de un recorrido» en esas circunstancias
  - Entonces: El visitante elige una ruta y el sistema lista sus experiencias vigentes: las que tienen la fecha actual entre su fecha de activación y su fecha de vencimiento.
- Criterio 2: Para cada experiencia muestra título, descripción, precio, porcentaje de descuento, cupo y código promocional si lo tiene.
  - Dado: Se cumplen las precondiciones del comportamiento «Experiencias vigentes de un recorrido»
  - Cuando: el actor solicita «Experiencias vigentes de un recorrido» en esas circunstancias
  - Entonces: Para cada experiencia muestra título, descripción, precio, porcentaje de descuento, cupo y código promocional si lo tiene.
- Criterio 3: el sistema lo indica.
  - Dado: Se cumple la condición «la ruta no tiene experiencias vigentes»
  - Cuando: el actor solicita «Experiencias vigentes de un recorrido» en esas circunstancias
  - Entonces: el sistema lo indica.

### Registrar experiencia promocional

- Criterio 1: el sistema la rechaza.
  - Dado: Se cumple la condición «registro una experiencia con el mismo título y la misma fecha de activación que otra»
  - Cuando: el actor solicita «Registrar experiencia promocional» en esas circunstancias
  - Entonces: el sistema la rechaza.
- Criterio 2: Cada experiencia tiene descripción, precio total, cupo máximo por grupo, porcentaje de descuento y fecha de vencimiento; el código promocional es opcional.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar experiencia promocional»
  - Cuando: el actor solicita «Registrar experiencia promocional» en esas circunstancias
  - Entonces: Cada experiencia tiene descripción, precio total, cupo máximo por grupo, porcentaje de descuento y fecha de vencimiento; el código promocional es opcional.
- Criterio 3: el sistema la rechaza.
  - Dado: Se cumple la condición «la fecha de vencimiento no es posterior a la de activación»
  - Cuando: el actor solicita «Registrar experiencia promocional» en esas circunstancias
  - Entonces: el sistema la rechaza.
- Criterio 4: el sistema la rechaza.
  - Dado: Se cumple la condición «el cupo es menor que una persona»
  - Cuando: el actor solicita «Registrar experiencia promocional» en esas circunstancias
  - Entonces: el sistema la rechaza.
- Criterio 5: La experiencia se vincula al comercio que la promueve, al guía certificado que la dirige, a la ruta del recorrido y a los hitos o comercios (servicios) que incluye.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar experiencia promocional»
  - Cuando: el actor solicita «Registrar experiencia promocional» en esas circunstancias
  - Entonces: La experiencia se vincula al comercio que la promueve, al guía certificado que la dirige, a la ruta del recorrido y a los hitos o comercios (servicios) que incluye.

### Consultar experiencia promocional

- Criterio 1: Veo la lista de mis experiencias.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar experiencia promocional»
  - Cuando: el actor solicita «Consultar experiencia promocional» en esas circunstancias
  - Entonces: Veo la lista de mis experiencias.
- Criterio 2: Puedo abrir una experiencia y ver sus datos y sus vínculos.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar experiencia promocional»
  - Cuando: el actor solicita «Consultar experiencia promocional» en esas circunstancias
  - Entonces: Puedo abrir una experiencia y ver sus datos y sus vínculos.

### Modificar experiencia promocional

- Criterio 1: Solo el comercio que promueve la experiencia o el guía que la dirige puede modificarla.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar experiencia promocional»
  - Cuando: el actor solicita «Modificar experiencia promocional» en esas circunstancias
  - Entonces: Solo el comercio que promueve la experiencia o el guía que la dirige puede modificarla.
- Criterio 2: el sistema lo rechaza.
  - Dado: Se cumple la condición «el título y la fecha de activación quedan iguales a los de otra experiencia»
  - Cuando: el actor solicita «Modificar experiencia promocional» en esas circunstancias
  - Entonces: el sistema lo rechaza.
- Criterio 3: el sistema lo rechaza.
  - Dado: Se cumple la condición «la fecha de vencimiento no es posterior a la de activación»
  - Cuando: el actor solicita «Modificar experiencia promocional» en esas circunstancias
  - Entonces: el sistema lo rechaza.
- Criterio 4: el sistema lo rechaza.
  - Dado: Se cumple la condición «el cupo queda menor que una persona»
  - Cuando: el actor solicita «Modificar experiencia promocional» en esas circunstancias
  - Entonces: el sistema lo rechaza.

### Eliminar experiencia promocional

- Criterio 1: Solo el comercio que promueve la experiencia o el guía que la dirige puede eliminarla.
  - Dado: Se cumplen las precondiciones del comportamiento «Eliminar experiencia promocional»
  - Cuando: el actor solicita «Eliminar experiencia promocional» en esas circunstancias
  - Entonces: Solo el comercio que promueve la experiencia o el guía que la dirige puede eliminarla.
- Criterio 2: se elimina.
  - Dado: Se cumple la condición «ninguna credencial se adquirió bajo la experiencia»
  - Cuando: el actor solicita «Eliminar experiencia promocional» en esas circunstancias
  - Entonces: se elimina.
- Criterio 3: el sistema no la elimina y me indica qué lo impide.
  - Dado: Se cumple la condición «hay credenciales adquiridas bajo la experiencia»
  - Cuando: el actor solicita «Eliminar experiencia promocional» en esas circunstancias
  - Entonces: el sistema no la elimina y me indica qué lo impide.

## 5. Restricciones técnicas

PostgreSQL aloja reglas y transacciones. Aplicación web de tres capas con backend/frontend de referencia provisional.

## 6. Fuera de alcance

Alterar el relacional aprobado o añadir funcionalidades ajenas a la capacidad.

## 7. Decisiones abiertas

Validación humana del contrato y elección definitiva del stack.
