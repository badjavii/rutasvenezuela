# Especificación: evaluaciones consulta

## 1. Objetivo

Describir el comportamiento verificable de evaluaciones consulta: 1 historia de Valeria Loreto (HU-06), conforme a la primera entrega.

## 2. Requisitos funcionales

- Valoraciones de una ruta: «Como visitante quiero ver las valoraciones, las observaciones de seguridad y los comentarios de una ruta, para saber si me conviene.».

## 3. Reglas de negocio

No tiene RR propias: el capítulo 7 de la primera entrega escribe cada RR sobre una relación, y esta capacidad no tiene tablas. Las RR de las tablas que consulta las implementan sus dueños.

## 4. Criterios de aceptación

### Valoraciones de una ruta

- Criterio 1: El visitante elige una ruta y el sistema lista sus evaluaciones con la calificación, la seguridad percibida, la fecha y la opinión.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver las valoraciones, las observaciones de seguridad y los comentarios de una ruta.
  - Entonces: El visitante elige una ruta y el sistema lista sus evaluaciones con la calificación, la seguridad percibida, la fecha y la opinión.
- Criterio 2: Cada evaluación indica si tiene la marca de recorrido verificado. En las evaluaciones de una ruta la marca siempre es sí, porque exigen un recorrido completado.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver las valoraciones, las observaciones de seguridad y los comentarios de una ruta.
  - Entonces: Cada evaluación indica si tiene la marca de recorrido verificado. En las evaluaciones de una ruta la marca siempre es sí, porque exigen un recorrido completado.
- Criterio 3: Si la ruta no tiene evaluaciones, el sistema lo indica.
  - Dado: El visitante inició sesión con su rol; la ruta no tiene evaluaciones.
  - Cuando: El visitante solicita ver las valoraciones, las observaciones de seguridad y los comentarios de una ruta.
  - Entonces: El sistema lo indica.
- Criterio 4: Un mismo visitante puede aparecer varias veces en la lista, porque publica una evaluación por cada recorrido.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver las valoraciones, las observaciones de seguridad y los comentarios de una ruta.
  - Entonces: Un mismo visitante puede aparecer varias veces en la lista, porque publica una evaluación por cada recorrido.

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
