# Especificación: movilidad vias y tramos

## 1. Objetivo

Describir el comportamiento verificable de movilidad vias y tramos: 8 historias de Sebastián Armas (HU-15.1, HU-15.2, HU-15.3, HU-15.4, HU-35.1, HU-35.2, HU-35.3, HU-35.4), conforme a la primera entrega.

## 2. Requisitos funcionales

- Registrar vía: «Como administrador quiero registrar vías, para tener la red física sobre la que pasan las rutas.».
- Consultar vía: «Como administrador quiero consultar las vías registradas, para revisar la red física y su estado.».
- Modificar vía: «Como administrador quiero modificar los datos y el estado de una vía, para mantener la red al día.».
- Eliminar vía: «Como administrador quiero eliminar vías, para quitar las que se cargaron por error.».
- Registrar tramo: «Como administrador quiero registrar los tramos de cada vía y cómo se conectan entre sí, para poder calcular desplazamientos y desvíos.».
- Consultar tramo: «Como administrador quiero consultar los tramos de una vía y sus conexiones, para revisar la topología de la red.».
- Modificar tramo: «Como administrador quiero modificar un tramo y sus conexiones, para mantener la topología al día.».
- Eliminar tramo: «Como administrador quiero eliminar tramos, para quitar los que se cargaron por error.».

## 3. Reglas de negocio

RR del capítulo 7 de la primera entrega escritas sobre las tablas de esta capacidad (la relación del ∀ exterior), con su autor. La fórmula completa está en el informe y el texto en el [catálogo RR](../../../docs/requirements/relational-rules.md). No se modifican las restricciones del modelo relacional validado.

- RR-29 (VIA, Sebastián): Toda vía tiene al menos un tramo.
- RR-30 (VIA, Sebastián): Toda vía tiene al menos un modo permitido.
- RR-102 (VIA, Sebastián): El tipo de vía es calle, avenida, bulevar, caminería, sendero, puente u otro, y su estado es habilitada o cierre total por mantenimiento. Cada modo permitido es a pie, bicicleta, transporte público o vehículo adaptado.
- RR-103 (CONECTA, Sebastián): Un tramo no se conecta consigo mismo.

## 4. Criterios de aceptación

### Registrar vía

- Criterio 1: Cada vía tiene nombre, tipo (calle, avenida, bulevar, caminería, sendero, puente u otro), modos de recorrido permitidos (a pie, bicicleta, transporte público o vehículo adaptado) y condiciones del terreno.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar vías.
  - Entonces: Cada vía tiene nombre, tipo (calle, avenida, bulevar, caminería, sendero, puente u otro), modos de recorrido permitidos (a pie, bicicleta, transporte público o vehículo adaptado) y condiciones del terreno.
- Criterio 2: La vía se ubica en un municipio y un estado.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar vías.
  - Entonces: La vía se ubica en un municipio y un estado.
- Criterio 3: Si registro una vía con el mismo nombre en el mismo municipio y estado que otra, el sistema la rechaza.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador registra una vía con el mismo nombre en el mismo municipio y estado que otra.
  - Entonces: El sistema la rechaza.
- Criterio 4: La vía tiene un estado que indica si está habilitada o tiene cierre total por mantenimiento.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar vías.
  - Entonces: La vía tiene un estado que indica si está habilitada o tiene cierre total por mantenimiento.

### Consultar vía

- Criterio 1: Puedo ver las vías de un municipio con su estado.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de vía.
  - Cuando: El administrador solicita consultar las vías registradas.
  - Entonces: Puedo ver las vías de un municipio con su estado.
- Criterio 2: Puedo abrir una vía y ver su tipo, sus modos de recorrido permitidos y las condiciones del terreno.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de vía.
  - Cuando: El administrador solicita consultar las vías registradas.
  - Entonces: Puedo abrir una vía y ver su tipo, sus modos de recorrido permitidos y las condiciones del terreno.

### Modificar vía

- Criterio 1: Puedo cambiar sus datos y su estado (habilitada o con cierre total por mantenimiento).
  - Dado: El administrador inició sesión con su rol; existe la vía que se va a modificar.
  - Cuando: El administrador solicita modificar los datos y el estado de una vía.
  - Entonces: Puedo cambiar sus datos y su estado (habilitada o con cierre total por mantenimiento).
- Criterio 2: Si cambio el nombre, el municipio o el estado y la vía queda con el mismo nombre que otra del mismo municipio y estado, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe la vía que se va a modificar.
  - Cuando: El administrador cambia el nombre, el municipio o el estado y la vía queda con el mismo nombre que otra del mismo municipio y estado.
  - Entonces: El sistema lo rechaza.
- Criterio 3: El tipo y los modos de recorrido siguen siendo de los valores permitidos.
  - Dado: El administrador inició sesión con su rol; existe la vía que se va a modificar.
  - Cuando: El administrador solicita modificar los datos y el estado de una vía.
  - Entonces: El tipo y los modos de recorrido siguen siendo de los valores permitidos.

### Eliminar vía

- Criterio 1: Si la vía no tiene paradas asociadas, se elimina junto con sus tramos, siempre que ningún tramo tenga incidencias o hitos.
  - Dado: El administrador inició sesión con su rol; existe la vía que se va a eliminar; la vía no tiene paradas asociadas.
  - Cuando: El administrador solicita eliminar vías.
  - Entonces: Se elimina junto con sus tramos, siempre que ningún tramo tenga incidencias o hitos.
- Criterio 2: Si la vía tiene paradas asociadas, el sistema no la elimina.
  - Dado: El administrador inició sesión con su rol; existe la vía que se va a eliminar; la vía tiene paradas asociadas.
  - Cuando: El administrador solicita eliminar vías.
  - Entonces: El sistema no la elimina.

### Registrar tramo

- Criterio 1: Cada tramo pertenece a una vía, y una vía tiene uno o más tramos.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar los tramos de cada vía y cómo se conectan entre sí.
  - Entonces: Cada tramo pertenece a una vía, y una vía tiene uno o más tramos.
- Criterio 2: Para cada tramo se registra si tiene desniveles o escalinatas.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar los tramos de cada vía y cómo se conectan entre sí.
  - Entonces: Para cada tramo se registra si tiene desniveles o escalinatas.
- Criterio 3: Se registra con qué otros tramos se conecta, también de vías distintas.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar los tramos de cada vía y cómo se conectan entre sí.
  - Entonces: Se registra con qué otros tramos se conecta, también de vías distintas.
- Criterio 4: Un tramo no se puede conectar consigo mismo.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar los tramos de cada vía y cómo se conectan entre sí.
  - Entonces: Un tramo no se puede conectar consigo mismo.

### Consultar tramo

- Criterio 1: Puedo ver los tramos de una vía y sus conexiones.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de tramo.
  - Cuando: El administrador solicita consultar los tramos de una vía y sus conexiones.
  - Entonces: Puedo ver los tramos de una vía y sus conexiones.

### Modificar tramo

- Criterio 1: Puedo cambiar los datos del tramo: si tiene desniveles o escalinatas.
  - Dado: El administrador inició sesión con su rol; existe el tramo que se va a modificar.
  - Cuando: El administrador solicita modificar un tramo y sus conexiones.
  - Entonces: Puedo cambiar los datos del tramo: si tiene desniveles o escalinatas.
- Criterio 2: Puedo agregar o quitar conexiones con otros tramos.
  - Dado: El administrador inició sesión con su rol; existe el tramo que se va a modificar.
  - Cuando: El administrador solicita modificar un tramo y sus conexiones.
  - Entonces: Puedo agregar o quitar conexiones con otros tramos.
- Criterio 3: Un tramo no se puede conectar consigo mismo.
  - Dado: El administrador inició sesión con su rol; existe el tramo que se va a modificar.
  - Cuando: El administrador solicita modificar un tramo y sus conexiones.
  - Entonces: Un tramo no se puede conectar consigo mismo.

### Eliminar tramo

- Criterio 1: Si el tramo no tiene incidencias, paradas ni hitos, se elimina.
  - Dado: El administrador inició sesión con su rol; existe el tramo que se va a eliminar; el tramo no tiene incidencias, paradas ni hitos.
  - Cuando: El administrador solicita eliminar tramos.
  - Entonces: Se elimina.
- Criterio 2: Si tiene incidencias, paradas o hitos, el sistema no lo elimina.
  - Dado: El administrador inició sesión con su rol; existe el tramo que se va a eliminar; el tramo tiene incidencias, paradas o hitos.
  - Cuando: El administrador solicita eliminar tramos.
  - Entonces: El sistema no lo elimina.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `via`, `via_modo`, `tramo`, `conecta`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Claves foráneas hacia tablas de otras capacidades (se crean en `database/02_claves/`, después de todas las tablas):
  - `municipio` (MUNICIPIO), de `territorio-catalogo` (Javier).
- Roles que actúan: `rol_administrador`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Al escribir la prueba SQL de cada historia, indicar qué RR de la sección 3 cubre.
- Acordar con Javier los datos de prueba de las tablas referidas.
