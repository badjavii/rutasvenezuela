# Especificación: rutas tiempos y desvios

## 1. Objetivo

Describir el comportamiento verificable de rutas tiempos y desvios, conforme a la primera entrega.

## 2. Requisitos funcionales

- Tiempos reales de una ruta: «Como visitante quiero ver cuánto tardaron en promedio otros visitantes entre los hitos de una ruta y en qué hito suelen abandonarla, para planificar mi tiempo.».
- Desvío por incidencia: «Como visitante o guía quiero que el sistema me proponga un desvío cuando un tramo de mi ruta tiene una incidencia, para poder seguir el recorrido.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). No modificar las restricciones del modelo relacional validado.

## 4. Criterios de aceptación

### Tiempos reales de una ruta

- Criterio 1: Al elegir una ruta, el sistema muestra su secuencia de hitos y, por cada hito, el porcentaje de recorridos que pasó por él.
  - Dado: Se cumplen las precondiciones del comportamiento «Tiempos reales de una ruta»
  - Cuando: el actor solicita «Tiempos reales de una ruta» en esas circunstancias
  - Entonces: Al elegir una ruta, el sistema muestra su secuencia de hitos y, por cada hito, el porcentaje de recorridos que pasó por él.
- Criterio 2: Indica el hito después del cual más recorridos se abandonan.
  - Dado: Se cumplen las precondiciones del comportamiento «Tiempos reales de una ruta»
  - Cuando: el actor solicita «Tiempos reales de una ruta» en esas circunstancias
  - Entonces: Indica el hito después del cual más recorridos se abandonan.
- Criterio 3: Muestra el tiempo promedio entre hitos consecutivos, calculado con la fecha y hora en que cada recorrido pasó por cada hito.
  - Dado: Se cumplen las precondiciones del comportamiento «Tiempos reales de una ruta»
  - Cuando: el actor solicita «Tiempos reales de una ruta» en esas circunstancias
  - Entonces: Muestra el tiempo promedio entre hitos consecutivos, calculado con la fecha y hora en que cada recorrido pasó por cada hito.
- Criterio 4: Se puede filtrar por rango de fechas.
  - Dado: Se cumplen las precondiciones del comportamiento «Tiempos reales de una ruta»
  - Cuando: el actor solicita «Tiempos reales de una ruta» en esas circunstancias
  - Entonces: Se puede filtrar por rango de fechas.
- Criterio 5: el sistema lo indica. Por qué es propia: depende de que RECORRIDO sea una entidad con los hitos transitados y su fecha y hora, una corrección que este equipo hizo. No usa el módulo de recomendación del enunciado §1.
  - Dado: Se cumple la condición «la ruta no tiene recorridos registrados»
  - Cuando: el actor solicita «Tiempos reales de una ruta» en esas circunstancias
  - Entonces: el sistema lo indica. Por qué es propia: depende de que RECORRIDO sea una entidad con los hitos transitados y su fecha y hora, una corrección que este equipo hizo. No usa el módulo de recomendación del enunciado §1.

### Desvío por incidencia

- Criterio 1: el sistema avisa y propone el desvío al visitante o al guía; si está en estado preliminar, solo muestra un aviso informativo y no desvía.
  - Dado: Se cumple la condición «un tramo de la ruta tiene una incidencia en estado activa»
  - Cuando: el actor solicita «Desvío por incidencia» en esas circunstancias
  - Entonces: el sistema avisa y propone el desvío al visitante o al guía; si está en estado preliminar, solo muestra un aviso informativo y no desvía.
- Criterio 2: El sistema muestra los tramos conectados al tramo afectado que no tienen incidencias activas y cuya vía permite el modo de transporte de quien recorre: en una ruta dinámica, su preferencia de transporte; en una ruta fija, el modo que elige el visitante o el guía.
  - Dado: Se cumplen las precondiciones del comportamiento «Desvío por incidencia»
  - Cuando: el actor solicita «Desvío por incidencia» en esas circunstancias
  - Entonces: El sistema muestra los tramos conectados al tramo afectado que no tienen incidencias activas y cuya vía permite el modo de transporte de quien recorre: en una ruta dinámica, su preferencia de transporte; en una ruta fija, el modo que elige el visitante o el guía.
- Criterio 3: el sistema lo indica.
  - Dado: Se cumple la condición «ningún tramo conectado cumple las condiciones»
  - Cuando: el actor solicita «Desvío por incidencia» en esas circunstancias
  - Entonces: el sistema lo indica.

## 5. Restricciones técnicas

PostgreSQL gestiona integridad y reglas. Aplicación web de tres capas; framework por confirmar.

## 6. Fuera de alcance

Cambios de modelo relacional, funcionalidades no documentadas o patrones anticipados.

## 7. Decisiones abiertas

Validar contratos entre capas y elección de stack de aplicación.
