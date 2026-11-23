# rutas tiempos y desvios

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/trazabilidad-detallada.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Tiempos reales de una ruta

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante quiero ver cuánto tardaron en promedio otros visitantes entre los hitos de una ruta y en qué hito suelen abandonarla, para planificar mi tiempo.».

#### Scenario: Tiempos reales de una ruta - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Tiempos reales de una ruta»
- **WHEN** el actor solicita «Tiempos reales de una ruta» en esas circunstancias
- **THEN** Al elegir una ruta, el sistema muestra su secuencia de hitos y, por cada hito, el porcentaje de recorridos que pasó por él.

#### Scenario: Tiempos reales de una ruta - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Tiempos reales de una ruta»
- **WHEN** el actor solicita «Tiempos reales de una ruta» en esas circunstancias
- **THEN** Indica el hito después del cual más recorridos se abandonan.

#### Scenario: Tiempos reales de una ruta - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Tiempos reales de una ruta»
- **WHEN** el actor solicita «Tiempos reales de una ruta» en esas circunstancias
- **THEN** Muestra el tiempo promedio entre hitos consecutivos, calculado con la fecha y hora en que cada recorrido pasó por cada hito.

#### Scenario: Tiempos reales de una ruta - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Tiempos reales de una ruta»
- **WHEN** el actor solicita «Tiempos reales de una ruta» en esas circunstancias
- **THEN** Se puede filtrar por rango de fechas.

#### Scenario: Tiempos reales de una ruta - criterio 5

- **GIVEN** Se cumple la condición «la ruta no tiene recorridos registrados»
- **WHEN** el actor solicita «Tiempos reales de una ruta» en esas circunstancias
- **THEN** el sistema lo indica. Por qué es propia: depende de que RECORRIDO sea una entidad con los hitos transitados y su fecha y hora, una corrección que este equipo hizo. No usa el módulo de recomendación del enunciado §1.

### Requirement: Desvío por incidencia

El sistema SHALL cumplir el siguiente objetivo funcional: «Como visitante o guía quiero que el sistema me proponga un desvío cuando un tramo de mi ruta tiene una incidencia, para poder seguir el recorrido.».

#### Scenario: Desvío por incidencia - criterio 1

- **GIVEN** Se cumple la condición «un tramo de la ruta tiene una incidencia en estado activa»
- **WHEN** el actor solicita «Desvío por incidencia» en esas circunstancias
- **THEN** el sistema avisa y propone el desvío al visitante o al guía; si está en estado preliminar, solo muestra un aviso informativo y no desvía.

#### Scenario: Desvío por incidencia - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Desvío por incidencia»
- **WHEN** el actor solicita «Desvío por incidencia» en esas circunstancias
- **THEN** El sistema muestra los tramos conectados al tramo afectado que no tienen incidencias activas y cuya vía permite el modo de transporte de quien recorre: en una ruta dinámica, su preferencia de transporte; en una ruta fija, el modo que elige el visitante o el guía.

#### Scenario: Desvío por incidencia - criterio 3

- **GIVEN** Se cumple la condición «ningún tramo conectado cumple las condiciones»
- **WHEN** el actor solicita «Desvío por incidencia» en esas circunstancias
- **THEN** el sistema lo indica.

