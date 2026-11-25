# Especificación: rutas recorridos

## 1. Objetivo

Describir el comportamiento verificable de rutas recorridos: 1 historia de Sebastián Armas (HU-21), conforme a la primera entrega.

## 2. Requisitos funcionales

- Registrar recorrido: «Como visitante quiero que se registre cada recorrido que hago de una ruta, para tener mi historial y poder evaluarla.».

## 3. Reglas de negocio

Restricciones del relacional asociadas a las historias de esta capacidad, tomadas del [catálogo RR](../../../docs/requirements/relational-rules.md). La asociación RR↔HU es preliminar: se confirma al escribir la prueba SQL de cada regla. No se modifican las restricciones del modelo relacional validado.

- RR-27 (HU-21): El visitante de cada recorrido es distinto de null.
- RR-28 (HU-21): La ruta de cada recorrido es distinta de null.
- RR-44 (HU-21): Todo recorrido lo hace un visitante.
- RR-45 (HU-21): Todo recorrido es sobre una ruta.
- RR-112 (HU-21): Un recorrido es sobre una ruta fija, una ruta dinámica pública o una ruta dinámica que creó el mismo visitante que hace el recorrido.
- RR-113 (HU-21): Un recorrido en curso no tiene ni fin ni estado; uno terminado tiene los dos. El estado es completado o abandonado, y el fin es posterior al inicio.
- RR-114 (HU-21): Los hitos que transita un recorrido están en CONFORMA para la ruta de su fila en SOBRE, y cada paso ocurre entre el inicio y el fin del recorrido.
- RR-115 (HU-21): Si un recorrido está completado, tiene fila en TRANSITA con cada hito de su ruta.

## 4. Criterios de aceptación

### Registrar recorrido

- Criterio 1: Al iniciar, el sistema crea un recorrido nuevo con su identificador, el visitante, la ruta y la marca de tiempo de inicio.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: Al iniciar.
  - Entonces: El sistema crea un recorrido nuevo con su identificador, el visitante, la ruta y la marca de tiempo de inicio.
- Criterio 2: Solo se pueden recorrer rutas fijas, rutas dinámicas públicas o las rutas propias del visitante.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita que se registre cada recorrido que hago de una ruta.
  - Entonces: Solo se pueden recorrer rutas fijas, rutas dinámicas públicas o las rutas propias del visitante.
- Criterio 3: Durante el recorrido se registran los hitos por los que el visitante pasa, cada uno con su fecha y hora.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita que se registre cada recorrido que hago de una ruta.
  - Entonces: Durante el recorrido se registran los hitos por los que el visitante pasa, cada uno con su fecha y hora.
- Criterio 4: Al terminar se guarda la marca de tiempo de fin, que debe ser posterior a la de inicio, y el estado: completado o abandonado.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: Al terminar.
  - Entonces: Se guarda la marca de tiempo de fin, que debe ser posterior a la de inicio, y el estado: completado o abandonado.
- Criterio 5: Si el visitante repite la ruta, se crea un registro nuevo y no se modifica el anterior.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante repite la ruta.
  - Entonces: Se crea un registro nuevo y no se modifica el anterior.
- Criterio 6: Los recorridos quedan en el historial de la ruta.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita que se registre cada recorrido que hago de una ruta.
  - Entonces: Los recorridos quedan en el historial de la ruta.
- Criterio 7: El visitante puede ver la lista de sus recorridos, con su ruta, fechas y estado.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita que se registre cada recorrido que hago de una ruta.
  - Entonces: El visitante puede ver la lista de sus recorridos, con su ruta, fechas y estado.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `recorrido`, `realiza`, `sobre`, `transita`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Claves foráneas hacia tablas de otras capacidades (se crean en `database/02_claves/`, después de todas las tablas):
  - `visitante` (VISITANTE), de `actores-identidades` (Valeria).
  - `ruta_turistica` (RUTA_TURISTICA), de `rutas-gestion` (Sebastián).
  - `hito` (HITO), de `patrimonio-hitos` (Javier).
- Roles que actúan: `rol_visitante`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Confirmar con su responsable la asociación preliminar RR↔HU de la sección 3.
- Acordar con Javier y Valeria los datos de prueba de las tablas referidas.
