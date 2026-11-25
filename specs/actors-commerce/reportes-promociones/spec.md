# Especificación: reportes promociones

## 1. Objetivo

Describir el comportamiento verificable de reportes promociones: 1 historia de Valeria Loreto (RP-2), conforme a la primera entrega.

## 2. Requisitos funcionales

- Desempeño de experiencias y credenciales: «Como comercio o guía quiero ver los cupos usados, las credenciales canjeadas y el monto de cada experiencia, para medir mis ventas.».

## 3. Reglas de negocio

No tiene RR propias: el capítulo 7 de la primera entrega escribe cada RR sobre una relación, y esta capacidad no tiene tablas. Las RR de las tablas que consulta las implementan sus dueños.

## 4. Criterios de aceptación

### Desempeño de experiencias y credenciales

- Criterio 1: Cada comercio o guía ve solo sus propias experiencias.
  - Dado: El comercio o guía inició sesión con su rol.
  - Cuando: El comercio o guía solicita ver los cupos usados, las credenciales canjeadas y el monto de cada experiencia.
  - Entonces: Cada comercio o guía ve solo sus propias experiencias.
- Criterio 2: Para cada experiencia muestra su cupo máximo y los días que faltan para su vencimiento.
  - Dado: El comercio o guía inició sesión con su rol.
  - Cuando: El comercio o guía solicita ver los cupos usados, las credenciales canjeadas y el monto de cada experiencia.
  - Entonces: Para cada experiencia muestra su cupo máximo y los días que faltan para su vencimiento.
- Criterio 3: Muestra cuántas credenciales amparadas por la experiencia se emitieron, canjearon, cancelaron y vencieron, y el monto total abonado, sin contar las credenciales canceladas.
  - Dado: El comercio o guía inició sesión con su rol.
  - Cuando: El comercio o guía solicita ver los cupos usados, las credenciales canjeadas y el monto de cada experiencia.
  - Entonces: Muestra cuántas credenciales amparadas por la experiencia se emitieron, canjearon, cancelaron y vencieron, y el monto total abonado, sin contar las credenciales canceladas.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- No tiene tablas propias: consulta tablas de otras capacidades con funciones o vistas de solo lectura.
- Roles que actúan: `rol_guia`, `rol_comercio`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Al escribir la prueba SQL de cada historia, indicar qué RR de la sección 3 cubre.
- Definir qué tablas de otras capacidades lee cada consulta o reporte.
