# Especificación: reportes afluencia

## 1. Objetivo

Describir el comportamiento verificable de reportes afluencia: 1 historia de Sebastián Armas (RP-3), conforme a la primera entrega.

## 2. Requisitos funcionales

- Afluencia y calidad percibida por ruta: «Como institución turística, o como funcionario de ella, quiero ver la afluencia y la calificación de cada ruta, para tomar decisiones de planificación.».

## 3. Reglas de negocio

No tiene RR propias: el capítulo 7 de la primera entrega escribe cada RR sobre una relación, y esta capacidad no tiene tablas. Las RR de las tablas que consulta las implementan sus dueños.

## 4. Criterios de aceptación

### Afluencia y calidad percibida por ruta

- Criterio 1: Para cada ruta muestra cuántos recorridos se iniciaron, cuántos se completaron y cuántos se abandonaron, y el porcentaje de finalización.
  - Dado: La institución turística, o funcionario de ella inició sesión con su rol.
  - Cuando: La institución turística, o funcionario de ella solicita ver la afluencia y la calificación de cada ruta.
  - Entonces: Para cada ruta muestra cuántos recorridos se iniciaron, cuántos se completaron y cuántos se abandonaron, y el porcentaje de finalización.
- Criterio 2: Muestra la calificación promedio y la seguridad percibida promedio de todas sus evaluaciones, incluidas las de un mismo visitante en viajes distintos.
  - Dado: La institución turística, o funcionario de ella inició sesión con su rol.
  - Cuando: La institución turística, o funcionario de ella solicita ver la afluencia y la calificación de cada ruta.
  - Entonces: Muestra la calificación promedio y la seguridad percibida promedio de todas sus evaluaciones, incluidas las de un mismo visitante en viajes distintos.
- Criterio 3: Se puede filtrar por rango de fechas.
  - Dado: La institución turística, o funcionario de ella inició sesión con su rol.
  - Cuando: La institución turística, o funcionario de ella solicita ver la afluencia y la calificación de cada ruta.
  - Entonces: Se puede filtrar por rango de fechas.
- Criterio 4: Muestra el hito más visitado de la ruta, según los hitos por los que pasaron sus recorridos.
  - Dado: La institución turística, o funcionario de ella inició sesión con su rol.
  - Cuando: La institución turística, o funcionario de ella solicita ver la afluencia y la calificación de cada ruta.
  - Entonces: Muestra el hito más visitado de la ruta, según los hitos por los que pasaron sus recorridos.
- Criterio 5: La institución o su funcionario ven las rutas de los municipios donde la institución tiene competencia, y pueden filtrar por estado y municipio.
  - Dado: La institución turística, o funcionario de ella inició sesión con su rol.
  - Cuando: La institución turística, o funcionario de ella solicita ver la afluencia y la calificación de cada ruta.
  - Entonces: La institución o su funcionario ven las rutas de los municipios donde la institución tiene competencia, y pueden filtrar por estado y municipio.
- Criterio 6: No se listan las rutas dinámicas privadas de los visitantes.
  - Dado: La institución turística, o funcionario de ella inició sesión con su rol.
  - Cuando: La institución turística, o funcionario de ella solicita ver la afluencia y la calificación de cada ruta.
  - Entonces: No se listan las rutas dinámicas privadas de los visitantes.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- No tiene tablas propias: consulta tablas de otras capacidades con funciones o vistas de solo lectura.
- Roles que actúan: `rol_ente`, `rol_funcionario`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Al escribir la prueba SQL de cada historia, indicar qué RR de la sección 3 cubre.
- Definir qué tablas de otras capacidades lee cada consulta o reporte.
