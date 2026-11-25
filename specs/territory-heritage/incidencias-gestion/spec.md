# Especificación: incidencias gestion

## 1. Objetivo

Describir el comportamiento verificable de incidencias gestion: 4 historias de Javier Otero (HU-19, HU-20, HU-36, HU-37), conforme a la primera entrega.

## 2. Requisitos funcionales

- Reportar incidencia: «Como visitante, guía o funcionario quiero reportar una incidencia en un hito o en un tramo de vía, para avisar a los demás usuarios.».
- Verificar incidencia: «Como funcionario quiero verificar las incidencias preliminares, para que solo se publiquen hechos confirmados.».
- Prorrogar incidencia: «Como funcionario quiero prorrogar la fecha estimada de resolución de una incidencia, para que siga activa mientras se resuelve.».
- Cerrar incidencia: «Como funcionario de la institución responsable quiero cerrar una incidencia resuelta, para que deje de afectar al hito o al tramo.».

## 3. Reglas de negocio

RR del capítulo 7 de la primera entrega escritas sobre las tablas de esta capacidad (la relación del ∀ exterior), con su autor. La fórmula completa está en el informe y el texto en el [catálogo RR](../../../docs/requirements/relational-rules.md). No se modifican las restricciones del modelo relacional validado.

- RR-5 (GENERA, Javier): La cuenta que genera cada incidencia es distinta de null.
- RR-6 (AFECTA_HITO, Javier): El hito afectado es distinto de null.
- RR-7 (VERIFICA, Javier): El funcionario que verifica es distinto de null.
- RR-8 (CIERRA, Javier): El funcionario que cierra es distinto de null.
- RR-18 (INCIDENCIA, Javier): Toda incidencia la generó una cuenta.
- RR-83 (INCIDENCIA, Javier): El estado es preliminar, activa, descartada, vencida o resuelta, y la severidad es bajo, medio o crítico.
- RR-84 (INCIDENCIA, Javier): Toda incidencia tiene fila en AFECTA_HITO o en AFECTA_TRAMO, pero no en las dos.
- RR-85 (AFECTA_TRAMO, Javier): Si una incidencia afecta dos o más tramos, cada tramo afectado tiene una fila en CONECTA con otro tramo afectado por la misma incidencia.
- RR-86 (GENERA, Javier): La cuenta que genera una incidencia está en CUENTA_VISITANTE, CUENTA_GUIA o CUENTA_FUNCIONARIO.
- RR-87 (INCIDENCIA, Javier): Una incidencia preliminar la generó la cuenta de un visitante o de un guía, y no tiene fila en VERIFICA ni en CIERRA.
- RR-88 (GENERA, Javier): Si la generó un visitante o un guía y ya no está preliminar, tiene fila en VERIFICA. Si la generó un funcionario, no la tiene. Toda incidencia descartada tiene fila en VERIFICA.
- RR-89 (INCIDENCIA, Javier): Una incidencia está resuelta si y solo si tiene fila en CIERRA. Tiene fecha de cierre si y solo si está resuelta.
- RR-90 (CIERRA, Javier): El funcionario que cierra pertenece a un ente con competencia sobre el municipio del hito afectado o de alguno de los tramos afectados.
- RR-91 (INCIDENCIA, Javier): Una incidencia activa o vencida está activa si y solo si su fechaEstimadaResolucion, o la nuevaFecha de alguna fila de PRORROGA con su mismo numeroReporte, todavía no pasó. Si ya pasaron todas, está vencida. (Solo en lenguaje natural: necesita la fecha de hoy, que el lenguaje de restricciones del curso no define.)
- RR-92 (PRORROGA, Javier): La nuevaFecha de toda prórroga es posterior a la fecha estimada de resolución de su incidencia, y esa incidencia no está preliminar ni descartada.
- RR-93 (INCIDENCIA, Javier): La fecha estimada de resolución y la fecha de cierre no son anteriores a la fecha de detección.

## 4. Criterios de aceptación

### Reportar incidencia

- Criterio 1: El sistema asigna un número de reporte correlativo.
  - Dado: El visitante, guía o funcionario inició sesión con su rol.
  - Cuando: El visitante, guía o funcionario solicita reportar una incidencia en un hito o en un tramo de vía.
  - Entonces: El sistema asigna un número de reporte correlativo.
- Criterio 2: Se registran la fecha y hora de detección, la fecha estimada de resolución, la narrativa y la severidad: bajo, medio o crítico.
  - Dado: El visitante, guía o funcionario inició sesión con su rol.
  - Cuando: El visitante, guía o funcionario solicita reportar una incidencia en un hito o en un tramo de vía.
  - Entonces: Se registran la fecha y hora de detección, la fecha estimada de resolución, la narrativa y la severidad: bajo, medio o crítico.
- Criterio 3: La incidencia se asocia a un hito o a un tramo de vía, o a una secuencia de tramos.
  - Dado: El visitante, guía o funcionario inició sesión con su rol.
  - Cuando: El visitante, guía o funcionario solicita reportar una incidencia en un hito o en un tramo de vía.
  - Entonces: La incidencia se asocia a un hito o a un tramo de vía, o a una secuencia de tramos.
- Criterio 4: Se guarda el usuario que la reporta: visitante, guía o funcionario.
  - Dado: El visitante, guía o funcionario inició sesión con su rol.
  - Cuando: El visitante, guía o funcionario solicita reportar una incidencia en un hito o en un tramo de vía.
  - Entonces: Se guarda el usuario que la reporta: visitante, guía o funcionario.
- Criterio 5: Si la reporta un visitante o un guía, queda en estado preliminar hasta que un funcionario la verifique.
  - Dado: El visitante, guía o funcionario inició sesión con su rol.
  - Cuando: La reporta un visitante o un guía.
  - Entonces: Queda en estado preliminar hasta que un funcionario la verifique.
- Criterio 6: Si la reporta un funcionario, queda activa sin pasar por verificación.
  - Dado: El visitante, guía o funcionario inició sesión con su rol.
  - Cuando: La reporta un funcionario.
  - Entonces: Queda activa sin pasar por verificación.

### Verificar incidencia

- Criterio 1: Solo un funcionario o autoridad competente puede verificar una incidencia.
  - Dado: El funcionario inició sesión con su rol.
  - Cuando: El funcionario solicita verificar las incidencias preliminares.
  - Entonces: Solo un funcionario o autoridad competente puede verificar una incidencia.
- Criterio 2: El funcionario ve la lista de incidencias en estado preliminar.
  - Dado: El funcionario inició sesión con su rol.
  - Cuando: El funcionario solicita verificar las incidencias preliminares.
  - Entonces: El funcionario ve la lista de incidencias en estado preliminar.
- Criterio 3: Si el hecho es veraz, la confirma: queda activa y el funcionario ratifica o cambia su severidad.
  - Dado: El funcionario inició sesión con su rol; el hecho es veraz.
  - Cuando: El funcionario solicita verificar las incidencias preliminares.
  - Entonces: La confirma: queda activa y el funcionario ratifica o cambia su severidad.
- Criterio 4: Si el hecho no es veraz, la descarta: la incidencia pasa a estado descartada y no afecta al hito ni al tramo.
  - Dado: El funcionario inició sesión con su rol; el hecho no es veraz.
  - Cuando: El funcionario solicita verificar las incidencias preliminares.
  - Entonces: La descarta: la incidencia pasa a estado descartada y no afecta al hito ni al tramo.

### Prorrogar incidencia

- Criterio 1: Solo un funcionario o autoridad competente puede prorrogar una incidencia.
  - Dado: El funcionario inició sesión con su rol.
  - Cuando: El funcionario solicita prorrogar la fecha estimada de resolución de una incidencia.
  - Entonces: Solo un funcionario o autoridad competente puede prorrogar una incidencia.
- Criterio 2: La prórroga exige una justificación; sin ella, el sistema la rechaza.
  - Dado: El funcionario inició sesión con su rol.
  - Cuando: El funcionario solicita prorrogar la fecha estimada de resolución de una incidencia.
  - Entonces: La prórroga exige una justificación; sin ella, el sistema la rechaza.
- Criterio 3: La nueva fecha estimada debe ser posterior a la anterior.
  - Dado: El funcionario inició sesión con su rol.
  - Cuando: El funcionario solicita prorrogar la fecha estimada de resolución de una incidencia.
  - Entonces: La nueva fecha estimada debe ser posterior a la anterior.
- Criterio 4: Se guarda la prórroga con su nueva fecha y su justificación.
  - Dado: El funcionario inició sesión con su rol.
  - Cuando: El funcionario solicita prorrogar la fecha estimada de resolución de una incidencia.
  - Entonces: Se guarda la prórroga con su nueva fecha y su justificación.
- Criterio 5: Una incidencia activa pasa a estado vencida si se supera su fecha estimada de resolución sin una prórroga justificada, y deja de afectar al hito o al tramo.
  - Dado: El funcionario inició sesión con su rol.
  - Cuando: El funcionario solicita prorrogar la fecha estimada de resolución de una incidencia.
  - Entonces: Una incidencia activa pasa a estado vencida si se supera su fecha estimada de resolución sin una prórroga justificada, y deja de afectar al hito o al tramo.

### Cerrar incidencia

- Criterio 1: Solo la autoridad institucional responsable puede cerrar la incidencia: un funcionario de una institución con competencia sobre el municipio del hito o del tramo afectado.
  - Dado: El funcionario de la institución responsable inició sesión con su rol.
  - Cuando: El funcionario de la institución responsable solicita cerrar una incidencia resuelta.
  - Entonces: Solo la autoridad institucional responsable puede cerrar la incidencia: un funcionario de una institución con competencia sobre el municipio del hito o del tramo afectado.
- Criterio 2: Solo se cierran incidencias en estado activa: una preliminar primero se verifica, y las descartadas o vencidas no se cierran.
  - Dado: El funcionario de la institución responsable inició sesión con su rol.
  - Cuando: El funcionario de la institución responsable solicita cerrar una incidencia resuelta.
  - Entonces: Solo se cierran incidencias en estado activa: una preliminar primero se verifica, y las descartadas o vencidas no se cierran.
- Criterio 3: Al cerrarse, la incidencia pasa a estado resuelta y se guarda la fecha de cierre.
  - Dado: El funcionario de la institución responsable inició sesión con su rol.
  - Cuando: Al cerrarse.
  - Entonces: La incidencia pasa a estado resuelta y se guarda la fecha de cierre.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `incidencia`, `genera`, `afecta_hito`, `afecta_tramo`, `verifica`, `prorroga`, `cierra`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Claves foráneas hacia tablas de otras capacidades (se crean en `database/02_claves/`, después de todas las tablas):
  - `cuenta` (CUENTA), de `actores-identidades` (Valeria).
  - `hito` (HITO), de `patrimonio-hitos` (Javier).
  - `tramo` (TRAMO), de `movilidad-vias-y-tramos` (Sebastián).
  - `funcionario` (FUNCIONARIO), de `actores-identidades` (Valeria).
- Roles que actúan: `rol_visitante`, `rol_guia`, `rol_ente`, `rol_funcionario`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Al escribir la prueba SQL de cada historia, indicar qué RR de la sección 3 cubre.
- Acordar con Sebastián y Valeria los datos de prueba de las tablas referidas.
