# reportes seguridad rutas

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/requirements/traceability-detailed.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Semáforo de seguridad de una ruta

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero ver un nivel de seguridad de cada ruta antes de elegirla, combinando la seguridad que percibieron otros visitantes con las incidencias activas en sus hitos y tramos, para evitar rutas riesgosas.».

#### Scenario: Semáforo de seguridad de una ruta - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Semáforo de seguridad de una ruta»
- **WHEN** el actor solicita «Semáforo de seguridad de una ruta» en esas circunstancias
- **THEN** Al ver una ruta, el sistema muestra su nivel de seguridad: verde, amarillo o rojo.

#### Scenario: Semáforo de seguridad de una ruta - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Semáforo de seguridad de una ruta»
- **WHEN** el actor solicita «Semáforo de seguridad de una ruta» en esas circunstancias
- **THEN** El nivel sale del promedio de la seguridad percibida de las evaluaciones de la ruta y de las incidencias en estado activa en sus hitos y en los tramos donde están sus hitos y paradas.

#### Scenario: Semáforo de seguridad de una ruta - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Semáforo de seguridad de una ruta»
- **WHEN** el actor solicita «Semáforo de seguridad de una ruta» en esas circunstancias
- **THEN** Es verde si el promedio es 4 o más y no hay incidencias activas; rojo si el promedio es menor de 3 o hay alguna incidencia crítica activa; amarillo en los demás casos.

#### Scenario: Semáforo de seguridad de una ruta - criterio 4

- **GIVEN** Se cumple la condición «la ruta no tiene evaluaciones»
- **WHEN** el actor solicita «Semáforo de seguridad de una ruta» en esas circunstancias
- **THEN** el nivel se calcula solo con sus incidencias y el sistema indica que aún no hay valoraciones.

#### Scenario: Semáforo de seguridad de una ruta - criterio 5

- **GIVEN** Se cumplen las precondiciones del comportamiento «Semáforo de seguridad de una ruta»
- **WHEN** el actor solicita «Semáforo de seguridad de una ruta» en esas circunstancias
- **THEN** El visitante puede ver las incidencias activas que explican el nivel. Por qué es propia: el enunciado da la seguridad percibida como un dato más de la evaluación. Cruzarla con las incidencias para dar un nivel al visitante no está en ningún módulo de §1.

