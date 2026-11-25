# Especificación: rutas tiempos y desvios

## 1. Objetivo

Describir el comportamiento verificable de rutas tiempos y desvios: 2 historias de Sebastián Armas (VA-1, VA-2), conforme a la primera entrega.

## 2. Requisitos funcionales

- Tiempos reales de una ruta: «Como visitante quiero ver cuánto tardaron en promedio otros visitantes entre los hitos de una ruta y en qué hito suelen abandonarla, para planificar mi tiempo.».
- Desvío por incidencia: «Como visitante o guía quiero que el sistema me proponga un desvío cuando un tramo de mi ruta tiene una incidencia, para poder seguir el recorrido.».

## 3. Reglas de negocio

Restricciones del relacional asociadas a las historias de esta capacidad, tomadas del [catálogo RR](../../../docs/requirements/relational-rules.md). La asociación RR↔HU es preliminar: se confirma al escribir la prueba SQL de cada regla. No se modifican las restricciones del modelo relacional validado.

- RR-83 (VA-2): El estado es preliminar, activa, descartada, vencida o resuelta, y la severidad es bajo, medio o crítico.
- RR-84 (VA-2): Toda incidencia tiene fila en AFECTA_HITO o en AFECTA_TRAMO, pero no en las dos.
- RR-85 (VA-2): Si una incidencia afecta dos o más tramos, cada tramo afectado tiene una fila en CONECTA con otro tramo afectado por la misma incidencia.
- RR-102 (VA-2): El tipo de vía es calle, avenida, bulevar, caminería, sendero, puente u otro, y su estado es habilitada o cierre total por mantenimiento. Cada modo permitido es a pie, bicicleta, transporte público o vehículo adaptado.
- RR-103 (VA-2): Un tramo no se conecta consigo mismo.
- RR-106 (VA-1): La duración estimada, si la hay, es positiva. La visibilidad de una ruta dinámica es privada o pública, y su preferencia de transporte es a pie, bicicleta, transporte público o vehículo adaptado.
- RR-110 (VA-2): Toda parada de una ruta tiene un hito de la misma ruta antes y otro después.
- RR-112 (VA-1): Un recorrido es sobre una ruta fija, una ruta dinámica pública o una ruta dinámica que creó el mismo visitante que hace el recorrido.
- RR-113 (VA-1, VA-2): Un recorrido en curso no tiene ni fin ni estado; uno terminado tiene los dos. El estado es completado o abandonado, y el fin es posterior al inicio.
- RR-114 (VA-1): Los hitos que transita un recorrido están en CONFORMA para la ruta de su fila en SOBRE, y cada paso ocurre entre el inicio y el fin del recorrido.
- RR-115 (VA-1): Si un recorrido está completado, tiene fila en TRANSITA con cada hito de su ruta.

## 4. Criterios de aceptación

### Tiempos reales de una ruta

- Criterio 1: Al elegir una ruta, el sistema muestra su secuencia de hitos y, por cada hito, el porcentaje de recorridos que pasó por él.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: Al elegir una ruta.
  - Entonces: El sistema muestra su secuencia de hitos y, por cada hito, el porcentaje de recorridos que pasó por él.
- Criterio 2: Indica el hito después del cual más recorridos se abandonan.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver cuánto tardaron en promedio otros visitantes entre los hitos de una ruta y en qué hito suelen abandonarla.
  - Entonces: Indica el hito después del cual más recorridos se abandonan.
- Criterio 3: Muestra el tiempo promedio entre hitos consecutivos, calculado con la fecha y hora en que cada recorrido pasó por cada hito.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver cuánto tardaron en promedio otros visitantes entre los hitos de una ruta y en qué hito suelen abandonarla.
  - Entonces: Muestra el tiempo promedio entre hitos consecutivos, calculado con la fecha y hora en que cada recorrido pasó por cada hito.
- Criterio 4: Se puede filtrar por rango de fechas.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver cuánto tardaron en promedio otros visitantes entre los hitos de una ruta y en qué hito suelen abandonarla.
  - Entonces: Se puede filtrar por rango de fechas.
- Criterio 5: Si la ruta no tiene recorridos registrados, el sistema lo indica. Por qué es propia: depende de que RECORRIDO sea una entidad con los hitos transitados y su fecha y hora, una corrección que este equipo hizo. No usa el módulo de recomendación del enunciado §1.
  - Dado: El visitante inició sesión con su rol; la ruta no tiene recorridos registrados.
  - Cuando: El visitante solicita ver cuánto tardaron en promedio otros visitantes entre los hitos de una ruta y en qué hito suelen abandonarla.
  - Entonces: El sistema lo indica.

### Desvío por incidencia

- Criterio 1: Si un tramo de la ruta tiene una incidencia en estado activa, el sistema avisa y propone el desvío al visitante o al guía; si está en estado preliminar, solo muestra un aviso informativo y no desvía.
  - Dado: El visitante o guía inició sesión con su rol; un tramo de la ruta tiene una incidencia en estado activa.
  - Cuando: El visitante o guía solicita que el sistema le proponga un desvío cuando un tramo de su ruta tiene una incidencia.
  - Entonces: El sistema avisa y propone el desvío al visitante o al guía; si está en estado preliminar, solo muestra un aviso informativo y no desvía.
- Criterio 2: El sistema muestra los tramos conectados al tramo afectado que no tienen incidencias activas y cuya vía permite el modo de transporte de quien recorre: en una ruta dinámica, su preferencia de transporte; en una ruta fija, el modo que elige el visitante o el guía.
  - Dado: El visitante o guía inició sesión con su rol.
  - Cuando: El visitante o guía solicita que el sistema le proponga un desvío cuando un tramo de su ruta tiene una incidencia.
  - Entonces: El sistema muestra los tramos conectados al tramo afectado que no tienen incidencias activas y cuya vía permite el modo de transporte de quien recorre: en una ruta dinámica, su preferencia de transporte; en una ruta fija, el modo que elige el visitante o el guía.
- Criterio 3: Si ningún tramo conectado cumple las condiciones, el sistema lo indica.
  - Dado: El visitante o guía inició sesión con su rol; ningún tramo conectado cumple las condiciones.
  - Cuando: El visitante o guía solicita que el sistema le proponga un desvío cuando un tramo de su ruta tiene una incidencia.
  - Entonces: El sistema lo indica.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- No tiene tablas propias: consulta tablas de otras capacidades con funciones o vistas de solo lectura.
- Roles que actúan: `rol_visitante`, `rol_guia`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Confirmar con su responsable la asociación preliminar RR↔HU de la sección 3.
- Definir qué tablas de otras capacidades lee cada consulta o reporte.
