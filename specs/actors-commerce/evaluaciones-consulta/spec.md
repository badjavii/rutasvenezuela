# Especificación: evaluaciones consulta

## 1. Objetivo

Describir el comportamiento verificable de evaluaciones consulta: 1 historia de Valeria Loreto (HU-06), conforme a la primera entrega.

## 2. Requisitos funcionales

- Valoraciones de una ruta: «Como visitante quiero ver las valoraciones, las observaciones de seguridad y los comentarios de una ruta, para saber si me conviene.».

## 3. Reglas de negocio

Restricciones del relacional asociadas a las historias de esta capacidad, tomadas del [catálogo RR](../../../docs/requirements/relational-rules.md). La asociación RR↔HU es preliminar: se confirma al escribir la prueba SQL de cada regla. No se modifican las restricciones del modelo relacional validado.

- RR-9 (HU-06): El recorrido que respalda cada evaluación es distinto de null.
- RR-10 (HU-06): El hito evaluado es distinto de null.
- RR-11 (HU-06): La ruta evaluada es distinta de null.
- RR-19 (HU-06): Toda evaluación la respalda un recorrido.
- RR-94 (HU-06): La calificación y el índice de seguridad son enteros de 1 a 5.
- RR-95 (HU-06): Toda evaluación tiene fila en EVALUA_HITO o en EVALUA_RUTA, exactamente en una.
- RR-96 (HU-06): Si una evaluación es de una ruta, el recorrido que la respalda está completado y es sobre esa misma ruta.
- RR-97 (HU-06): Si una evaluación es de un hito, el recorrido que la respalda ya terminó y tiene fila en TRANSITA con ese hito.
- RR-98 (HU-06): La fecha de emisión de una evaluación no es anterior al fin del recorrido que la respalda.
- RR-99 (HU-06): La marca recorridoVerificado es verdadera si y solo si el recorrido que respalda la evaluación está completado.
- RR-100 (HU-06): Dos evaluaciones distintas de ruta no las respalda el mismo recorrido. Tampoco dos evaluaciones distintas del mismo hito.

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

- Confirmar con su responsable la asociación preliminar RR↔HU de la sección 3.
- Definir qué tablas de otras capacidades lee cada consulta o reporte.
