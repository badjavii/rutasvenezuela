# Especificación: reportes conservacion

## 1. Objetivo

Describir el comportamiento verificable de reportes conservacion: 1 historia de Javier Otero (RP-1), conforme a la primera entrega.

## 2. Requisitos funcionales

- Estado de conservación e incidencias por territorio: «Como institución quiero ver el estado de conservación de los hitos y sus incidencias por territorio, para tomar decisiones de mantenimiento.».

## 3. Reglas de negocio

No tiene RR propias: el capítulo 7 de la primera entrega escribe cada RR sobre una relación, y esta capacidad no tiene tablas. Las RR de las tablas que consulta las implementan sus dueños.

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

- Al escribir la prueba SQL de cada historia, indicar qué RR de la sección 3 cubre.
- Definir qué tablas de otras capacidades lee cada consulta o reporte.
