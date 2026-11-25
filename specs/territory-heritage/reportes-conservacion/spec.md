# Especificación: reportes conservacion

## 1. Objetivo

Describir el comportamiento verificable de reportes conservacion: 1 historia de Javier Otero (RP-1), conforme a la primera entrega.

## 2. Requisitos funcionales

- Estado de conservación e incidencias por territorio: «Como institución quiero ver el estado de conservación de los hitos y sus incidencias por territorio, para tomar decisiones de mantenimiento.».

## 3. Reglas de negocio

Restricciones del relacional asociadas a las historias de esta capacidad, tomadas del [catálogo RR](../../../docs/requirements/relational-rules.md). La asociación RR↔HU es preliminar: se confirma al escribir la prueba SQL de cada regla. No se modifican las restricciones del modelo relacional validado.

- RR-5 (RP-1): La cuenta que genera cada incidencia es distinta de null.
- RR-6 (RP-1): El hito afectado es distinto de null.
- RR-7 (RP-1): El funcionario que verifica es distinto de null.
- RR-8 (RP-1): El funcionario que cierra es distinto de null.
- RR-18 (RP-1): Toda incidencia la generó una cuenta.
- RR-83 (RP-1): El estado es preliminar, activa, descartada, vencida o resuelta, y la severidad es bajo, medio o crítico.
- RR-84 (RP-1): Toda incidencia tiene fila en AFECTA_HITO o en AFECTA_TRAMO, pero no en las dos.
- RR-85 (RP-1): Si una incidencia afecta dos o más tramos, cada tramo afectado tiene una fila en CONECTA con otro tramo afectado por la misma incidencia.
- RR-86 (RP-1): La cuenta que genera una incidencia está en CUENTA_VISITANTE, CUENTA_GUIA o CUENTA_FUNCIONARIO.
- RR-87 (RP-1): Una incidencia preliminar la generó la cuenta de un visitante o de un guía, y no tiene fila en VERIFICA ni en CIERRA.
- RR-88 (RP-1): Si la generó un visitante o un guía y ya no está preliminar, tiene fila en VERIFICA. Si la generó un funcionario, no la tiene. Toda incidencia descartada tiene fila en VERIFICA.
- RR-89 (RP-1): Una incidencia está resuelta si y solo si tiene fila en CIERRA. Tiene fecha de cierre si y solo si está resuelta.
- RR-90 (RP-1): El funcionario que cierra pertenece a un ente con competencia sobre el municipio del hito afectado o de alguno de los tramos afectados.
- RR-91 (RP-1): Una incidencia activa o vencida está activa si y solo si su fechaEstimadaResolucion, o la nuevaFecha de alguna fila de PRORROGA con su mismo numeroReporte, todavía no pasó. Si ya pasaron todas, está vencida. (Solo en lenguaje natural: necesita la fecha de hoy, que el lenguaje de restricciones del curso no define.)
- RR-92 (RP-1): La nuevaFecha de toda prórroga es posterior a la fecha estimada de resolución de su incidencia, y esa incidencia no está preliminar ni descartada.
- RR-93 (RP-1): La fecha estimada de resolución y la fecha de cierre no son anteriores a la fecha de detección.

## 4. Criterios de aceptación

### Estado de conservación e incidencias por territorio

- Criterio 1: Se puede filtrar por estado y por municipio.
  - Dado: La institución inició sesión con su rol.
  - Cuando: La institución solicita ver el estado de conservación de los hitos y sus incidencias por territorio.
  - Entonces: Se puede filtrar por estado y por municipio.
- Criterio 2: Muestra cuántos hitos hay en cada estado operativo: disponible, en restauración, clausurado temporalmente y cerrado permanentemente.
  - Dado: La institución inició sesión con su rol.
  - Cuando: La institución solicita ver el estado de conservación de los hitos y sus incidencias por territorio.
  - Entonces: Muestra cuántos hitos hay en cada estado operativo: disponible, en restauración, clausurado temporalmente y cerrado permanentemente.
- Criterio 3: Muestra cuántas incidencias en estado activa hay, sin contar las descartadas ni las vencidas, y cuántas son críticas.
  - Dado: La institución inició sesión con su rol.
  - Cuando: La institución solicita ver el estado de conservación de los hitos y sus incidencias por territorio.
  - Entonces: Muestra cuántas incidencias en estado activa hay, sin contar las descartadas ni las vencidas, y cuántas son críticas.
- Criterio 4: Muestra los días promedio de resolución, calculados entre la fecha de detección y la fecha de cierre, sobre las incidencias en estado resuelta del territorio filtrado.
  - Dado: La institución inició sesión con su rol.
  - Cuando: La institución solicita ver el estado de conservación de los hitos y sus incidencias por territorio.
  - Entonces: Muestra los días promedio de resolución, calculados entre la fecha de detección y la fecha de cierre, sobre las incidencias en estado resuelta del territorio filtrado.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- No tiene tablas propias: consulta tablas de otras capacidades con funciones o vistas de solo lectura.
- Roles que actúan: `rol_ente`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Confirmar con su responsable la asociación preliminar RR↔HU de la sección 3.
- Definir qué tablas de otras capacidades lee cada consulta o reporte.
