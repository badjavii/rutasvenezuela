# rutas recorridos

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/trazabilidad-detallada.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Registrar recorrido

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero que se registre cada recorrido que hago de una ruta, para tener mi historial y poder evaluarla.».

#### Scenario: Registrar recorrido - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar recorrido»
- **WHEN** el actor solicita «Registrar recorrido» en esas circunstancias
- **THEN** Al iniciar, el sistema crea un recorrido nuevo con su identificador, el visitante, la ruta y la marca de tiempo de inicio.

#### Scenario: Registrar recorrido - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar recorrido»
- **WHEN** el actor solicita «Registrar recorrido» en esas circunstancias
- **THEN** Solo se pueden recorrer rutas fijas, rutas dinámicas públicas o las rutas propias del visitante.

#### Scenario: Registrar recorrido - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar recorrido»
- **WHEN** el actor solicita «Registrar recorrido» en esas circunstancias
- **THEN** Durante el recorrido se registran los hitos por los que el visitante pasa, cada uno con su fecha y hora.

#### Scenario: Registrar recorrido - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar recorrido»
- **WHEN** el actor solicita «Registrar recorrido» en esas circunstancias
- **THEN** Al terminar se guarda la marca de tiempo de fin, que debe ser posterior a la de inicio, y el estado: completado o abandonado.

#### Scenario: Registrar recorrido - criterio 5

- **GIVEN** Se cumple la condición «el visitante repite la ruta»
- **WHEN** el actor solicita «Registrar recorrido» en esas circunstancias
- **THEN** se crea un registro nuevo y no se modifica el anterior.

#### Scenario: Registrar recorrido - criterio 6

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar recorrido»
- **WHEN** el actor solicita «Registrar recorrido» en esas circunstancias
- **THEN** Los recorridos quedan en el historial de la ruta.

#### Scenario: Registrar recorrido - criterio 7

- **GIVEN** Se cumplen las precondiciones del comportamiento «Registrar recorrido»
- **WHEN** el actor solicita «Registrar recorrido» en esas circunstancias
- **THEN** El visitante puede ver la lista de sus recorridos, con su ruta, fechas y estado.

