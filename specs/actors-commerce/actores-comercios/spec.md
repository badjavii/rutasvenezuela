# Especificación: actores comercios

## 1. Objetivo

Describir el comportamiento verificable de actores comercios: 4 historias de Valeria Loreto (HU-30.1, HU-30.2, HU-30.3, HU-30.4), conforme a la primera entrega.

## 2. Requisitos funcionales

- Registrar comercio: «Como administrador quiero registrar comercios y aliados de servicio, para que puedan ofrecer sus servicios en las rutas.».
- Consultar comercio: «Como administrador quiero consultar los comercios registrados, para saber quiénes ofrecen servicios.».
- Modificar comercio: «Como administrador quiero modificar los datos de un comercio, para mantenerlos al día.».
- Eliminar comercio: «Como administrador quiero eliminar comercios, para quitar los que ya no participan.».

## 3. Reglas de negocio

Restricciones del relacional asociadas a las historias de esta capacidad, tomadas del [catálogo RR](../../../docs/requirements/relational-rules.md). La asociación RR↔HU es preliminar: se confirma al escribir la prueba SQL de cada regla. No se modifican las restricciones del modelo relacional validado.

- RR-47 (HU-30.1, HU-30.2, HU-30.3, HU-30.4): La cuenta de cada comercio es distinta de null y es clave alterna: una cuenta es de un solo comercio.
- RR-48 (HU-30.1, HU-30.2, HU-30.3, HU-30.4): La ubicación de cada comercio es distinta de null.
- RR-60 (HU-30.1, HU-30.2, HU-30.3, HU-30.4): La razón social es clave alterna: es distinta de null y no se repite.
- RR-63 (HU-30.1, HU-30.2, HU-30.3, HU-30.4): Todo comercio tiene su cuenta.
- RR-66 (HU-30.1, HU-30.2, HU-30.3, HU-30.4): Todo comercio tiene su ubicación.
- RR-67 (HU-30.1, HU-30.2, HU-30.3, HU-30.4): Todo comercio tiene al menos un horario.
- RR-119 (HU-30.1, HU-30.2, HU-30.3, HU-30.4): Dos horarios del mismo comercio y el mismo día no se cruzan.
- RR-121 (HU-30.1, HU-30.2, HU-30.3, HU-30.4): La categoría es gastronómico, sanitario o alquiler de equipos, y el aforo es positivo.

## 4. Criterios de aceptación

### Registrar comercio

- Criterio 1: Se identifica por su RIF jurídico; si ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar comercios y aliados de servicio.
  - Entonces: Se identifica por su RIF jurídico; si ya existe, el sistema lo rechaza.
- Criterio 2: Tiene razón social, categoría comercial (gastronómico, sanitario o alquiler de equipos), aforo, número de permiso sanitario, horario de atención y cuenta bancaria.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar comercios y aliados de servicio.
  - Entonces: Tiene razón social, categoría comercial (gastronómico, sanitario o alquiler de equipos), aforo, número de permiso sanitario, horario de atención y cuenta bancaria.
- Criterio 3: Si la razón social ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; la razón social ya existe.
  - Cuando: El administrador solicita registrar comercios y aliados de servicio.
  - Entonces: El sistema lo rechaza.
- Criterio 4: Tiene una contraseña para entrar con su RIF.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar comercios y aliados de servicio.
  - Entonces: Tiene una contraseña para entrar con su RIF.
- Criterio 5: La ubicación del comercio se guarda como latitud, longitud y elevación en decimales.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar comercios y aliados de servicio.
  - Entonces: La ubicación del comercio se guarda como latitud, longitud y elevación en decimales.

### Consultar comercio

- Criterio 1: Puedo ver el listado de los comercios.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de comercio.
  - Cuando: El administrador solicita consultar los comercios registrados.
  - Entonces: Puedo ver el listado de los comercios.
- Criterio 2: Puedo abrir un comercio y ver todos sus datos.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de comercio.
  - Cuando: El administrador solicita consultar los comercios registrados.
  - Entonces: Puedo abrir un comercio y ver todos sus datos.

### Modificar comercio

- Criterio 1: Puedo cambiar cualquier dato del comercio.
  - Dado: El administrador inició sesión con su rol; existe el comercio que se va a modificar.
  - Cuando: El administrador solicita modificar los datos de un comercio.
  - Entonces: Puedo cambiar cualquier dato del comercio.
- Criterio 2: Si cambio el RIF por uno que ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe el comercio que se va a modificar.
  - Cuando: El administrador cambia el RIF por uno que ya existe.
  - Entonces: El sistema lo rechaza.
- Criterio 3: Si cambio la razón social por una que ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe el comercio que se va a modificar.
  - Cuando: El administrador cambia la razón social por una que ya existe.
  - Entonces: El sistema lo rechaza.
- Criterio 4: La ubicación sigue guardándose como latitud, longitud y elevación en decimales.
  - Dado: El administrador inició sesión con su rol; existe el comercio que se va a modificar.
  - Cuando: El administrador solicita modificar los datos de un comercio.
  - Entonces: La ubicación sigue guardándose como latitud, longitud y elevación en decimales.

### Eliminar comercio

- Criterio 1: Si el comercio no tiene experiencias ni credenciales asociadas, se elimina.
  - Dado: El administrador inició sesión con su rol; existe el comercio que se va a eliminar; el comercio no tiene experiencias ni credenciales asociadas.
  - Cuando: El administrador solicita eliminar comercios.
  - Entonces: Se elimina.
- Criterio 2: Si tiene experiencias o credenciales asociadas, el sistema no lo elimina.
  - Dado: El administrador inició sesión con su rol; existe el comercio que se va a eliminar; el comercio tiene experiencias o credenciales asociadas.
  - Cuando: El administrador solicita eliminar comercios.
  - Entonces: El sistema no lo elimina.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `comercio`, `ubicado`, `disponible`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Claves foráneas hacia tablas de otras capacidades (se crean en `database/02_claves/`, después de todas las tablas):
  - `cuenta` (CUENTA), de `actores-identidades` (Valeria).
  - `ubicacion_geografica` (UBICACION_GEOGRAFICA), de `patrimonio-hitos` (Javier).
  - `horario` (HORARIO), de `patrimonio-hitos` (Javier).
- Roles que actúan: `rol_administrador`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Confirmar con su responsable la asociación preliminar RR↔HU de la sección 3.
- Acordar con Javier los datos de prueba de las tablas referidas.
