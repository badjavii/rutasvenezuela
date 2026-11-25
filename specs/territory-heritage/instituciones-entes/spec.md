# Especificación: instituciones entes

## 1. Objetivo

Describir el comportamiento verificable de instituciones entes: 4 historias de Javier Otero (HU-31.1, HU-31.2, HU-31.3, HU-31.4), conforme a la primera entrega.

## 2. Requisitos funcionales

- Registrar institución: «Como administrador quiero registrar instituciones y entes públicos patrimoniales, para que participen en la verificación de incidencias y el mantenimiento.».
- Consultar institución: «Como administrador quiero consultar las instituciones registradas, para saber qué entes participan.».
- Modificar institución: «Como administrador quiero modificar los datos de una institución, para mantenerlos al día.».
- Eliminar institución: «Como administrador quiero eliminar instituciones, para quitar las que ya no participan.».

## 3. Reglas de negocio

RR del capítulo 7 de la primera entrega escritas sobre las tablas de esta capacidad (la relación del ∀ exterior), con su autor. La fórmula completa está en el informe y el texto en el [catálogo RR](../../../docs/requirements/relational-rules.md). No se modifican las restricciones del modelo relacional validado.

- RR-4 (CUENTA_ENTE_PUBLICO, Javier): La cuenta de cada ente es distinta de null y es clave alterna: una cuenta es de un solo ente.
- RR-12 (ENTE_PUBLICO, Javier): La denominación oficial es clave alterna: es distinta de null y no se repite.
- RR-16 (ENTE_PUBLICO, Javier): Todo ente tiene competencia sobre al menos un municipio.
- RR-17 (ENTE_PUBLICO, Javier): Todo ente tiene su cuenta.
- RR-82 (ENTE_PUBLICO, Javier): El nivel territorial es nacional, estadal o municipal. Un ente municipal tiene exactamente una fila en COMPETENCIA. Todas las filas de COMPETENCIA de un ente estadal tienen el mismo estado.

## 4. Criterios de aceptación

### Registrar institución

- Criterio 1: Se identifica por su RIF institucional; si ya existe, el sistema la rechaza.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar instituciones y entes públicos patrimoniales.
  - Entonces: Se identifica por su RIF institucional; si ya existe, el sistema la rechaza.
- Criterio 2: Tiene denominación oficial, nivel territorial de competencia, nombre del funcionario enlace y decreto oficial de adscripción patrimonial.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar instituciones y entes públicos patrimoniales.
  - Entonces: Tiene denominación oficial, nivel territorial de competencia, nombre del funcionario enlace y decreto oficial de adscripción patrimonial.
- Criterio 3: Si la denominación oficial ya existe, el sistema la rechaza.
  - Dado: El administrador inició sesión con su rol; la denominación oficial ya existe.
  - Cuando: El administrador solicita registrar instituciones y entes públicos patrimoniales.
  - Entonces: El sistema la rechaza.
- Criterio 4: Tiene una contraseña para entrar con su RIF.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar instituciones y entes públicos patrimoniales.
  - Entonces: Tiene una contraseña para entrar con su RIF.
- Criterio 5: Se registran los municipios sobre los que tiene competencia, uno o varios.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar instituciones y entes públicos patrimoniales.
  - Entonces: Se registran los municipios sobre los que tiene competencia, uno o varios.

### Consultar institución

- Criterio 1: Puedo ver el listado de las instituciones.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de institución.
  - Cuando: El administrador solicita consultar las instituciones registradas.
  - Entonces: Puedo ver el listado de las instituciones.
- Criterio 2: Puedo abrir una institución y ver todos sus datos y los municipios sobre los que tiene competencia.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de institución.
  - Cuando: El administrador solicita consultar las instituciones registradas.
  - Entonces: Puedo abrir una institución y ver todos sus datos y los municipios sobre los que tiene competencia.

### Modificar institución

- Criterio 1: Puedo cambiar cualquier dato de la institución y sus municipios de competencia.
  - Dado: El administrador inició sesión con su rol; existe la institución que se va a modificar.
  - Cuando: El administrador solicita modificar los datos de una institución.
  - Entonces: Puedo cambiar cualquier dato de la institución y sus municipios de competencia.
- Criterio 2: Si cambio el RIF por uno que ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe la institución que se va a modificar.
  - Cuando: El administrador cambia el RIF por uno que ya existe.
  - Entonces: El sistema lo rechaza.
- Criterio 3: Si cambio la denominación oficial por una que ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe la institución que se va a modificar.
  - Cuando: El administrador cambia la denominación oficial por una que ya existe.
  - Entonces: El sistema lo rechaza.

### Eliminar institución

- Criterio 1: Si la institución no tiene funcionarios asociados, se elimina.
  - Dado: El administrador inició sesión con su rol; existe la institución que se va a eliminar; la institución no tiene funcionarios asociados.
  - Cuando: El administrador solicita eliminar instituciones.
  - Entonces: Se elimina.
- Criterio 2: Si tiene funcionarios asociados, el sistema no la elimina.
  - Dado: El administrador inició sesión con su rol; existe la institución que se va a eliminar; la institución tiene funcionarios asociados.
  - Cuando: El administrador solicita eliminar instituciones.
  - Entonces: El sistema no la elimina.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `ente_publico`, `cuenta_ente_publico`, `competencia`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Claves foráneas hacia tablas de otras capacidades (se crean en `database/02_claves/`, después de todas las tablas):
  - `cuenta` (CUENTA), de `actores-identidades` (Valeria).
  - `municipio` (MUNICIPIO), de `territorio-catalogo` (Javier).
- Roles que actúan: `rol_administrador`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Al escribir la prueba SQL de cada historia, indicar qué RR de la sección 3 cubre.
- Acordar con Valeria los datos de prueba de las tablas referidas.
- Hay un ciclo de claves foráneas con `actores-identidades`; se resuelve creando las tablas primero y las claves en `database/02_claves/`.
