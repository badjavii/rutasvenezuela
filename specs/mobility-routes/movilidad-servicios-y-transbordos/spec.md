# Especificación: movilidad servicios y transbordos

## 1. Objetivo

Describir el comportamiento verificable de movilidad servicios y transbordos: 2 historias de Sebastián Armas (HU-04, HU-05), conforme a la primera entrega.

## 2. Requisitos funcionales

- Servicios en un recorrido: «Como visitante quiero ver los servicios de una tipología disponibles a lo largo de una ruta y el tiempo estimado para llegar a cada uno, para planificar mis paradas.».
- Paradas de transbordo operativas: «Como visitante quiero ver las paradas de transporte de una ruta y saber si sus vías adyacentes están operativas, para hacer transbordo con seguridad.».

## 3. Reglas de negocio

No tiene RR propias: el capítulo 7 de la primera entrega escribe cada RR sobre una relación, y esta capacidad no tiene tablas. Las RR de las tablas que consulta las implementan sus dueños.

## 4. Criterios de aceptación

### Servicios en un recorrido

- Criterio 1: El visitante elige una ruta y una tipología de servicio, que es la categoría comercial del comercio: gastronómico, sanitario o alquiler de equipos.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver los servicios de una tipología disponibles a lo largo de una ruta y el tiempo estimado para llegar a cada uno.
  - Entonces: El visitante elige una ruta y una tipología de servicio, que es la categoría comercial del comercio: gastronómico, sanitario o alquiler de equipos.
- Criterio 2: El sistema lista los comercios de esa tipología que están a 500 m o menos de algún hito o parada de la ruta.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver los servicios de una tipología disponibles a lo largo de una ruta y el tiempo estimado para llegar a cada uno.
  - Entonces: El sistema lista los comercios de esa tipología que están a 500 m o menos de algún hito o parada de la ruta.
- Criterio 3: Para cada comercio muestra el tiempo estimado de llegada, calculado desde el inicio de la ruta o desde la posición actual del visitante, según elija.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver los servicios de una tipología disponibles a lo largo de una ruta y el tiempo estimado para llegar a cada uno.
  - Entonces: Para cada comercio muestra el tiempo estimado de llegada, calculado desde el inicio de la ruta o desde la posición actual del visitante, según elija.
- Criterio 4: Desde el inicio, la distancia es la suma de las distancias entre los hitos y paradas consecutivos de la secuencia hasta el hito o parada más cercano al comercio, más la distancia de ese punto al comercio; desde la posición actual, es la distancia en línea recta.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver los servicios de una tipología disponibles a lo largo de una ruta y el tiempo estimado para llegar a cada uno.
  - Entonces: Desde el inicio, la distancia es la suma de las distancias entre los hitos y paradas consecutivos de la secuencia hasta el hito o parada más cercano al comercio, más la distancia de ese punto al comercio; desde la posición actual, es la distancia en línea recta.
- Criterio 5: El tiempo es la distancia dividida entre la velocidad fija del modo de transporte del visitante: a pie 5 km/h, bicicleta 15 km/h, transporte público 20 km/h y vehículo adaptado 20 km/h.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver los servicios de una tipología disponibles a lo largo de una ruta y el tiempo estimado para llegar a cada uno.
  - Entonces: El tiempo es la distancia dividida entre la velocidad fija del modo de transporte del visitante: a pie 5 km/h, bicicleta 15 km/h, transporte público 20 km/h y vehículo adaptado 20 km/h.
- Criterio 6: La distancia se calcula con latitud, longitud y elevación en decimales, con funciones trigonométricas y sin tipos espaciales.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver los servicios de una tipología disponibles a lo largo de una ruta y el tiempo estimado para llegar a cada uno.
  - Entonces: La distancia se calcula con latitud, longitud y elevación en decimales, con funciones trigonométricas y sin tipos espaciales.
- Criterio 7: Si no hay comercios de esa tipología en la ruta, el sistema lo indica.
  - Dado: El visitante inició sesión con su rol; no hay comercios de esa tipología en la ruta.
  - Cuando: El visitante solicita ver los servicios de una tipología disponibles a lo largo de una ruta y el tiempo estimado para llegar a cada uno.
  - Entonces: El sistema lo indica.

### Paradas de transbordo operativas

- Criterio 1: El visitante elige una ruta y el sistema lista las paradas que forman parte de su secuencia.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver las paradas de transporte de una ruta y saber si sus vías adyacentes están operativas.
  - Entonces: El visitante elige una ruta y el sistema lista las paradas que forman parte de su secuencia.
- Criterio 2: Para cada parada muestra su estado (activa, en mantenimiento o fuera de servicio) y si el tramo de vía donde está, o los tramos conectados a él, tienen incidencias activas. Las incidencias preliminares (aún sin verificar) se muestran como aviso.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver las paradas de transporte de una ruta y saber si sus vías adyacentes están operativas.
  - Entonces: Para cada parada muestra su estado (activa, en mantenimiento o fuera de servicio) y si el tramo de vía donde está, o los tramos conectados a él, tienen incidencias activas. Las incidencias preliminares (aún sin verificar) se muestran como aviso.
- Criterio 3: Una parada cuya vía tiene cierre total por mantenimiento no se ofrece como opción de transbordo.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver las paradas de transporte de una ruta y saber si sus vías adyacentes están operativas.
  - Entonces: Una parada cuya vía tiene cierre total por mantenimiento no se ofrece como opción de transbordo.
- Criterio 4: Una incidencia que afecta solo un tramo no marca como afectada toda la vía.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver las paradas de transporte de una ruta y saber si sus vías adyacentes están operativas.
  - Entonces: Una incidencia que afecta solo un tramo no marca como afectada toda la vía.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- No tiene tablas propias: consulta tablas de otras capacidades con funciones o vistas de solo lectura.
- Roles que actúan: `rol_visitante`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Al escribir la prueba SQL de cada historia, indicar qué RR de la sección 3 cubre.
- Definir qué tablas de otras capacidades lee cada consulta o reporte.
