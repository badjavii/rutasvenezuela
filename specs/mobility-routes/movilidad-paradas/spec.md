# Especificación: movilidad paradas

## 1. Objetivo

Describir el comportamiento verificable de movilidad paradas: 4 historias de Sebastián Armas (HU-16.1, HU-16.2, HU-16.3, HU-16.4), conforme a la primera entrega.

## 2. Requisitos funcionales

- Registrar parada de transporte: «Como administrador quiero registrar paradas de transporte, para que los visitantes sepan dónde hacer transbordo.».
- Consultar parada de transporte: «Como administrador quiero consultar las paradas de transporte, para revisar dónde están y en qué estado.».
- Modificar parada de transporte: «Como administrador quiero modificar los datos y el estado de una parada, para mantenerla al día.».
- Eliminar parada de transporte: «Como administrador quiero eliminar paradas de transporte, para quitar las que ya no existen.».

## 3. Reglas de negocio

Restricciones del relacional asociadas a las historias de esta capacidad, tomadas del [catálogo RR](../../../docs/requirements/relational-rules.md). La asociación RR↔HU es preliminar: se confirma al escribir la prueba SQL de cada regla. No se modifican las restricciones del modelo relacional validado.

- RR-20 (HU-16.1, HU-16.2, HU-16.3, HU-16.4): La ubicación de cada parada es distinta de null.
- RR-21 (HU-16.1, HU-16.2, HU-16.3, HU-16.4): El tramo donde está cada parada es distinto de null.
- RR-31 (HU-16.1, HU-16.2, HU-16.3, HU-16.4): Toda parada tiene su ubicación.
- RR-32 (HU-16.1, HU-16.2, HU-16.3, HU-16.4): Toda parada está en un tramo.
- RR-33 (HU-16.1, HU-16.2, HU-16.3, HU-16.4): Toda parada tiene al menos un horario.
- RR-101 (HU-16.1, HU-16.2, HU-16.3, HU-16.4): Dos horarios de la misma parada y el mismo día no se cruzan.
- RR-104 (HU-16.1, HU-16.2, HU-16.3, HU-16.4): El estado es activa, en mantenimiento o fuera de servicio; la modalidad es metro, autobús, embarcadero o transporte por cable; la tarifa no es negativa; la frecuencia y el aforo son positivos.
- RR-105 (HU-16.1, HU-16.2, HU-16.3, HU-16.4): El equipamiento es techo o marquesina, iluminación nocturna, taquilla, vigilancia, estacionamiento de transferencia o resguardo de bicicletas.

## 4. Criterios de aceptación

### Registrar parada de transporte

- Criterio 1: Si registro una parada con un código oficial de terminal que ya existe, el sistema la rechaza.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador registra una parada con un código oficial de terminal que ya existe.
  - Entonces: El sistema la rechaza.
- Criterio 2: Cada parada tiene nombre, modalidad, tarifa básica en moneda nacional, nivel de adecuación para discapacidad, horario de apertura y cierre, frecuencia de paso en minutos y aforo máximo.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar paradas de transporte.
  - Entonces: Cada parada tiene nombre, modalidad, tarifa básica en moneda nacional, nivel de adecuación para discapacidad, horario de apertura y cierre, frecuencia de paso en minutos y aforo máximo.
- Criterio 3: Su estado es uno de estos: activa, en mantenimiento o fuera de servicio.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar paradas de transporte.
  - Entonces: Su estado es uno de estos: activa, en mantenimiento o fuera de servicio.
- Criterio 4: Se indica si tiene techo, iluminación nocturna, taquilla, vigilancia y estacionamiento o resguardo de bicicletas.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar paradas de transporte.
  - Entonces: Se indica si tiene techo, iluminación nocturna, taquilla, vigilancia y estacionamiento o resguardo de bicicletas.
- Criterio 5: La ubicación se guarda como latitud, longitud y elevación en decimales.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar paradas de transporte.
  - Entonces: La ubicación se guarda como latitud, longitud y elevación en decimales.
- Criterio 6: No se puede registrar una parada sin asociarla a una vía habilitada, indicando el tramo de esa vía donde está.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar paradas de transporte.
  - Entonces: No se puede registrar una parada sin asociarla a una vía habilitada, indicando el tramo de esa vía donde está.
- Criterio 7: Se puede asociar la parada con los hitos cercanos y con las rutas que usan su modalidad.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar paradas de transporte.
  - Entonces: Se puede asociar la parada con los hitos cercanos y con las rutas que usan su modalidad.

### Consultar parada de transporte

- Criterio 1: Puedo ver las paradas de una vía con su estado.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de parada de transporte.
  - Cuando: El administrador solicita consultar las paradas de transporte.
  - Entonces: Puedo ver las paradas de una vía con su estado.
- Criterio 2: Puedo abrir una parada y ver todos sus datos, su tramo, los hitos cercanos y las rutas asociadas.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de parada de transporte.
  - Cuando: El administrador solicita consultar las paradas de transporte.
  - Entonces: Puedo abrir una parada y ver todos sus datos, su tramo, los hitos cercanos y las rutas asociadas.

### Modificar parada de transporte

- Criterio 1: Puedo cambiar sus datos y su estado: activa, en mantenimiento o fuera de servicio.
  - Dado: El administrador inició sesión con su rol; existe la parada de transporte que se va a modificar.
  - Cuando: El administrador solicita modificar los datos y el estado de una parada.
  - Entonces: Puedo cambiar sus datos y su estado: activa, en mantenimiento o fuera de servicio.
- Criterio 2: Si cambio el código oficial de terminal por uno que ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe la parada de transporte que se va a modificar.
  - Cuando: El administrador cambia el código oficial de terminal por uno que ya existe.
  - Entonces: El sistema lo rechaza.
- Criterio 3: La parada sigue asociada a una vía habilitada, con el tramo donde está; si la cambio de vía, también indico el tramo.
  - Dado: El administrador inició sesión con su rol; existe la parada de transporte que se va a modificar.
  - Cuando: El administrador solicita modificar los datos y el estado de una parada.
  - Entonces: La parada sigue asociada a una vía habilitada, con el tramo donde está; si la cambio de vía, también indico el tramo.
- Criterio 4: Puedo cambiar los hitos cercanos y las rutas asociadas.
  - Dado: El administrador inició sesión con su rol; existe la parada de transporte que se va a modificar.
  - Cuando: El administrador solicita modificar los datos y el estado de una parada.
  - Entonces: Puedo cambiar los hitos cercanos y las rutas asociadas.

### Eliminar parada de transporte

- Criterio 1: Si la parada no forma parte de ninguna ruta, se elimina.
  - Dado: El administrador inició sesión con su rol; existe la parada de transporte que se va a eliminar; la parada no forma parte de ninguna ruta.
  - Cuando: El administrador solicita eliminar paradas de transporte.
  - Entonces: Se elimina.
- Criterio 2: Si forma parte de una ruta, el sistema no la elimina.
  - Dado: El administrador inició sesión con su rol; existe la parada de transporte que se va a eliminar; la parada de transporte forma parte de una ruta.
  - Cuando: El administrador solicita eliminar paradas de transporte.
  - Entonces: El sistema no la elimina.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `parada_transporte`, `equipamiento_urbano`, `se_localiza`, `esta_en`, `funciona`, `cercana`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Claves foráneas hacia tablas de otras capacidades (se crean en `database/02_claves/`, después de todas las tablas):
  - `ubicacion_geografica` (UBICACION_GEOGRAFICA), de `patrimonio-hitos` (Javier).
  - `tramo` (TRAMO), de `movilidad-vias-y-tramos` (Sebastián).
  - `horario` (HORARIO), de `patrimonio-hitos` (Javier).
  - `hito` (HITO), de `patrimonio-hitos` (Javier).
- Roles que actúan: `rol_administrador`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Confirmar con su responsable la asociación preliminar RR↔HU de la sección 3.
- Acordar con Javier los datos de prueba de las tablas referidas.
