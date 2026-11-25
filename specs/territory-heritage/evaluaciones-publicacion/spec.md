# Especificación: evaluaciones publicacion

## 1. Objetivo

Describir el comportamiento verificable de evaluaciones publicacion: 1 historia de Javier Otero (HU-22), conforme a la primera entrega.

## 2. Requisitos funcionales

- Publicar evaluación: «Como visitante quiero calificar una ruta o un hito que recorrí, para orientar a otros visitantes.».

## 3. Reglas de negocio

Restricciones del relacional asociadas a las historias de esta capacidad, tomadas del [catálogo RR](../../../docs/requirements/relational-rules.md). La asociación RR↔HU es preliminar: se confirma al escribir la prueba SQL de cada regla. No se modifican las restricciones del modelo relacional validado.

- RR-9 (HU-22): El recorrido que respalda cada evaluación es distinto de null.
- RR-10 (HU-22): El hito evaluado es distinto de null.
- RR-11 (HU-22): La ruta evaluada es distinta de null.
- RR-19 (HU-22): Toda evaluación la respalda un recorrido.
- RR-94 (HU-22): La calificación y el índice de seguridad son enteros de 1 a 5.
- RR-95 (HU-22): Toda evaluación tiene fila en EVALUA_HITO o en EVALUA_RUTA, exactamente en una.
- RR-96 (HU-22): Si una evaluación es de una ruta, el recorrido que la respalda está completado y es sobre esa misma ruta.
- RR-97 (HU-22): Si una evaluación es de un hito, el recorrido que la respalda ya terminó y tiene fila en TRANSITA con ese hito.
- RR-98 (HU-22): La fecha de emisión de una evaluación no es anterior al fin del recorrido que la respalda.
- RR-99 (HU-22): La marca recorridoVerificado es verdadera si y solo si el recorrido que respalda la evaluación está completado.
- RR-100 (HU-22): Dos evaluaciones distintas de ruta no las respalda el mismo recorrido. Tampoco dos evaluaciones distintas del mismo hito.

## 4. Criterios de aceptación

### Publicar evaluación

- Criterio 1: Cada evaluación tiene un código de reseña único.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita calificar una ruta o un hito que recorrí.
  - Entonces: Cada evaluación tiene un código de reseña único.
- Criterio 2: La calificación y la seguridad percibida van de 1 a 5 estrellas; el sistema rechaza valores fuera de ese rango.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita calificar una ruta o un hito que recorrí.
  - Entonces: La calificación y la seguridad percibida van de 1 a 5 estrellas; el sistema rechaza valores fuera de ese rango.
- Criterio 3: Se guardan la fecha de emisión y la opinión textual. La marca de recorrido verificado no se escribe a mano: es sí cuando el recorrido que respalda la evaluación está completado, y no cuando está abandonado (solo posible al evaluar un hito).
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita calificar una ruta o un hito que recorrí.
  - Entonces: Se guardan la fecha de emisión y la opinión textual. La marca de recorrido verificado no se escribe a mano: es sí cuando el recorrido que respalda la evaluación está completado, y no cuando está abandonado (solo posible al evaluar un hito).
- Criterio 4: La evaluación se liga a un visitante registrado y a una ruta o a un hito.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita calificar una ruta o un hito que recorrí.
  - Entonces: La evaluación se liga a un visitante registrado y a una ruta o a un hito.
- Criterio 5: Para evaluar una ruta, el visitante debe tener un recorrido completado de esa ruta; para evaluar un hito, un recorrido (completado o abandonado) que haya pasado por ese hito. Si no, el sistema rechaza la evaluación.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita calificar una ruta o un hito que recorrí.
  - Entonces: Para evaluar una ruta, el visitante debe tener un recorrido completado de esa ruta; para evaluar un hito, un recorrido (completado o abandonado) que haya pasado por ese hito. Si no, el sistema rechaza la evaluación.
- Criterio 6: Cada evaluación queda ligada al recorrido que la respalda.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita calificar una ruta o un hito que recorrí.
  - Entonces: Cada evaluación queda ligada al recorrido que la respalda.
- Criterio 7: El visitante publica una evaluación nueva por cada viaje y las anteriores se conservan: no se actualiza la anterior. Un recorrido respalda como máximo una evaluación de su ruta y una por cada hito que transitó.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita calificar una ruta o un hito que recorrí.
  - Entonces: El visitante publica una evaluación nueva por cada viaje y las anteriores se conservan: no se actualiza la anterior. Un recorrido respalda como máximo una evaluación de su ruta y una por cada hito que transitó.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `evaluacion_experiencia`, `respaldada_por`, `evalua_hito`, `evalua_ruta`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Claves foráneas hacia tablas de otras capacidades (se crean en `database/02_claves/`, después de todas las tablas):
  - `recorrido` (RECORRIDO), de `rutas-recorridos` (Sebastián).
  - `hito` (HITO), de `patrimonio-hitos` (Javier).
  - `ruta_turistica` (RUTA_TURISTICA), de `rutas-gestion` (Sebastián).
- Roles que actúan: `rol_visitante`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Confirmar con su responsable la asociación preliminar RR↔HU de la sección 3.
- Acordar con Sebastián los datos de prueba de las tablas referidas.
