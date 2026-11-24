# Especificación: movilidad servicios y transbordos

## 1. Objetivo

Describir las capacidades verificables de movilidad servicios y transbordos, según los criterios de primera entrega.

## 2. Requisitos funcionales

- Servicios en un recorrido: «Como visitante quiero ver los servicios de una tipología disponibles a lo largo de una ruta y el tiempo estimado para llegar a cada uno, para planificar mis paradas.».
- Paradas de transbordo operativas: «Como visitante quiero ver las paradas de transporte de una ruta y saber si sus vías adyacentes están operativas, para hacer transbordo con seguridad.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). Conservar el relacional entregado.

## 4. Criterios de aceptación

### Servicios en un recorrido

- Criterio 1: El visitante elige una ruta y una tipología de servicio, que es la categoría comercial del comercio: gastronómico, sanitario o alquiler de equipos.
  - Dado: Se cumplen las precondiciones del comportamiento «Servicios en un recorrido»
  - Cuando: el actor solicita «Servicios en un recorrido» en esas circunstancias
  - Entonces: El visitante elige una ruta y una tipología de servicio, que es la categoría comercial del comercio: gastronómico, sanitario o alquiler de equipos.
- Criterio 2: El sistema lista los comercios de esa tipología que están a 500 m o menos de algún hito o parada de la ruta.
  - Dado: Se cumplen las precondiciones del comportamiento «Servicios en un recorrido»
  - Cuando: el actor solicita «Servicios en un recorrido» en esas circunstancias
  - Entonces: El sistema lista los comercios de esa tipología que están a 500 m o menos de algún hito o parada de la ruta.
- Criterio 3: Para cada comercio muestra el tiempo estimado de llegada, calculado desde el inicio de la ruta o desde la posición actual del visitante, según elija.
  - Dado: Se cumplen las precondiciones del comportamiento «Servicios en un recorrido»
  - Cuando: el actor solicita «Servicios en un recorrido» en esas circunstancias
  - Entonces: Para cada comercio muestra el tiempo estimado de llegada, calculado desde el inicio de la ruta o desde la posición actual del visitante, según elija.
- Criterio 4: Desde el inicio, la distancia es la suma de las distancias entre los hitos y paradas consecutivos de la secuencia hasta el hito o parada más cercano al comercio, más la distancia de ese punto al comercio; desde la posición actual, es la distancia en línea recta.
  - Dado: Se cumplen las precondiciones del comportamiento «Servicios en un recorrido»
  - Cuando: el actor solicita «Servicios en un recorrido» en esas circunstancias
  - Entonces: Desde el inicio, la distancia es la suma de las distancias entre los hitos y paradas consecutivos de la secuencia hasta el hito o parada más cercano al comercio, más la distancia de ese punto al comercio; desde la posición actual, es la distancia en línea recta.
- Criterio 5: El tiempo es la distancia dividida entre la velocidad fija del modo de transporte del visitante: a pie 5 km/h, bicicleta 15 km/h, transporte público 20 km/h y vehículo adaptado 20 km/h.
  - Dado: Se cumplen las precondiciones del comportamiento «Servicios en un recorrido»
  - Cuando: el actor solicita «Servicios en un recorrido» en esas circunstancias
  - Entonces: El tiempo es la distancia dividida entre la velocidad fija del modo de transporte del visitante: a pie 5 km/h, bicicleta 15 km/h, transporte público 20 km/h y vehículo adaptado 20 km/h.
- Criterio 6: La distancia se calcula con latitud, longitud y elevación en decimales, con funciones trigonométricas y sin tipos espaciales.
  - Dado: Se cumplen las precondiciones del comportamiento «Servicios en un recorrido»
  - Cuando: el actor solicita «Servicios en un recorrido» en esas circunstancias
  - Entonces: La distancia se calcula con latitud, longitud y elevación en decimales, con funciones trigonométricas y sin tipos espaciales.
- Criterio 7: el sistema lo indica.
  - Dado: Se cumple la condición «no hay comercios de esa tipología en la ruta»
  - Cuando: el actor solicita «Servicios en un recorrido» en esas circunstancias
  - Entonces: el sistema lo indica.

### Paradas de transbordo operativas

- Criterio 1: El visitante elige una ruta y el sistema lista las paradas que forman parte de su secuencia.
  - Dado: Se cumplen las precondiciones del comportamiento «Paradas de transbordo operativas»
  - Cuando: el actor solicita «Paradas de transbordo operativas» en esas circunstancias
  - Entonces: El visitante elige una ruta y el sistema lista las paradas que forman parte de su secuencia.
- Criterio 2: Para cada parada muestra su estado (activa, en mantenimiento o fuera de servicio) y si el tramo de vía donde está, o los tramos conectados a él, tienen incidencias activas. Las incidencias preliminares (aún sin verificar) se muestran como aviso.
  - Dado: Se cumplen las precondiciones del comportamiento «Paradas de transbordo operativas»
  - Cuando: el actor solicita «Paradas de transbordo operativas» en esas circunstancias
  - Entonces: Para cada parada muestra su estado (activa, en mantenimiento o fuera de servicio) y si el tramo de vía donde está, o los tramos conectados a él, tienen incidencias activas. Las incidencias preliminares (aún sin verificar) se muestran como aviso.
- Criterio 3: Una parada cuya vía tiene cierre total por mantenimiento no se ofrece como opción de transbordo.
  - Dado: Se cumplen las precondiciones del comportamiento «Paradas de transbordo operativas»
  - Cuando: el actor solicita «Paradas de transbordo operativas» en esas circunstancias
  - Entonces: Una parada cuya vía tiene cierre total por mantenimiento no se ofrece como opción de transbordo.
- Criterio 4: Una incidencia que afecta solo un tramo no marca como afectada toda la vía.
  - Dado: Se cumplen las precondiciones del comportamiento «Paradas de transbordo operativas»
  - Cuando: el actor solicita «Paradas de transbordo operativas» en esas circunstancias
  - Entonces: Una incidencia que afecta solo un tramo no marca como afectada toda la vía.

## 5. Restricciones técnicas

PostgreSQL contiene invariantes. Arquitectura web de tres capas; stack de referencia provisional.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar nuevas reglas sin fuente.

## 7. Decisiones abiertas

Revisar contratos entre capas y confirmar tecnología de API/UI.
