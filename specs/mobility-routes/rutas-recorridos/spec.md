# Especificación: rutas recorridos

## 1. Objetivo

Describir el comportamiento verificable de rutas recorridos, conforme a la primera entrega.

## 2. Requisitos funcionales

- Registrar recorrido: «Como visitante quiero que se registre cada recorrido que hago de una ruta, para tener mi historial y poder evaluarla.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). No modificar las restricciones del modelo relacional validado.

## 4. Criterios de aceptación

### Registrar recorrido

- Criterio 1: Al iniciar, el sistema crea un recorrido nuevo con su identificador, el visitante, la ruta y la marca de tiempo de inicio.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar recorrido»
  - Cuando: el actor solicita «Registrar recorrido» en esas circunstancias
  - Entonces: Al iniciar, el sistema crea un recorrido nuevo con su identificador, el visitante, la ruta y la marca de tiempo de inicio.
- Criterio 2: Solo se pueden recorrer rutas fijas, rutas dinámicas públicas o las rutas propias del visitante.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar recorrido»
  - Cuando: el actor solicita «Registrar recorrido» en esas circunstancias
  - Entonces: Solo se pueden recorrer rutas fijas, rutas dinámicas públicas o las rutas propias del visitante.
- Criterio 3: Durante el recorrido se registran los hitos por los que el visitante pasa, cada uno con su fecha y hora.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar recorrido»
  - Cuando: el actor solicita «Registrar recorrido» en esas circunstancias
  - Entonces: Durante el recorrido se registran los hitos por los que el visitante pasa, cada uno con su fecha y hora.
- Criterio 4: Al terminar se guarda la marca de tiempo de fin, que debe ser posterior a la de inicio, y el estado: completado o abandonado.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar recorrido»
  - Cuando: el actor solicita «Registrar recorrido» en esas circunstancias
  - Entonces: Al terminar se guarda la marca de tiempo de fin, que debe ser posterior a la de inicio, y el estado: completado o abandonado.
- Criterio 5: se crea un registro nuevo y no se modifica el anterior.
  - Dado: Se cumple la condición «el visitante repite la ruta»
  - Cuando: el actor solicita «Registrar recorrido» en esas circunstancias
  - Entonces: se crea un registro nuevo y no se modifica el anterior.
- Criterio 6: Los recorridos quedan en el historial de la ruta.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar recorrido»
  - Cuando: el actor solicita «Registrar recorrido» en esas circunstancias
  - Entonces: Los recorridos quedan en el historial de la ruta.
- Criterio 7: El visitante puede ver la lista de sus recorridos, con su ruta, fechas y estado.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar recorrido»
  - Cuando: el actor solicita «Registrar recorrido» en esas circunstancias
  - Entonces: El visitante puede ver la lista de sus recorridos, con su ruta, fechas y estado.

## 5. Restricciones técnicas

PostgreSQL gestiona integridad y reglas. Aplicación web de tres capas; framework por confirmar.

## 6. Fuera de alcance

Cambios de modelo relacional, funcionalidades no documentadas o patrones anticipados.

## 7. Decisiones abiertas

Validar contratos entre capas y elección de stack de aplicación.
