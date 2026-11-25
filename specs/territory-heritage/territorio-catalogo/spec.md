# Especificación: territorio catalogo

## 1. Objetivo

Describir el comportamiento verificable de territorio catalogo: 12 historias de Javier Otero (HU-12.1, HU-12.2, HU-12.3, HU-12.4, HU-33.1, HU-33.2, HU-33.3, HU-33.4, HU-34.1, HU-34.2, HU-34.3, HU-34.4), conforme a la primera entrega.

## 2. Requisitos funcionales

- Registrar estado: «Como administrador quiero registrar los estados del país, para ubicar en el territorio los hitos, las rutas y las vías.».
- Consultar estado: «Como administrador quiero consultar los estados registrados, para ver qué territorio está cargado.».
- Modificar estado: «Como administrador quiero modificar un estado, para corregir su nombre.».
- Eliminar estado: «Como administrador quiero eliminar estados, para quitar los que se cargaron por error.».
- Registrar municipio: «Como administrador quiero registrar los municipios de cada estado, para ubicar en el territorio los hitos, las rutas y las vías.».
- Consultar municipio: «Como administrador quiero consultar los municipios, para ver qué territorio está cargado en cada estado.».
- Modificar municipio: «Como administrador quiero modificar un municipio, para corregir su nombre o su estado.».
- Eliminar municipio: «Como administrador quiero eliminar municipios, para quitar los que se cargaron por error.».
- Registrar parroquia: «Como administrador quiero registrar las parroquias de cada municipio, para ubicar los hitos en el territorio.».
- Consultar parroquia: «Como administrador quiero consultar las parroquias, para ver qué territorio está cargado en cada municipio.».
- Modificar parroquia: «Como administrador quiero modificar una parroquia, para corregir su nombre o su municipio.».
- Eliminar parroquia: «Como administrador quiero eliminar parroquias, para quitar las que se cargaron por error.».

## 3. Reglas de negocio

Restricciones del relacional asociadas a las historias de esta capacidad, tomadas del [catálogo RR](../../../docs/requirements/relational-rules.md). La asociación RR↔HU es preliminar: se confirma al escribir la prueba SQL de cada regla. No se modifican las restricciones del modelo relacional validado.


## 4. Criterios de aceptación

### Registrar estado

- Criterio 1: Si registro un estado con un nombre que ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador registra un estado con un nombre que ya existe.
  - Entonces: El sistema lo rechaza.

### Consultar estado

- Criterio 1: Puedo ver el listado de los estados.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de estado.
  - Cuando: El administrador solicita consultar los estados registrados.
  - Entonces: Puedo ver el listado de los estados.

### Modificar estado

- Criterio 1: Puedo cambiar el nombre del estado.
  - Dado: El administrador inició sesión con su rol; existe el estado que se va a modificar.
  - Cuando: El administrador solicita modificar un estado.
  - Entonces: Puedo cambiar el nombre del estado.
- Criterio 2: Si cambio el nombre por uno que ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe el estado que se va a modificar.
  - Cuando: El administrador cambia el nombre por uno que ya existe.
  - Entonces: El sistema lo rechaza.

### Eliminar estado

- Criterio 1: Si el estado no tiene municipios, se elimina.
  - Dado: El administrador inició sesión con su rol; existe el estado que se va a eliminar; el estado no tiene municipios.
  - Cuando: El administrador solicita eliminar estados.
  - Entonces: Se elimina.
- Criterio 2: Si tiene municipios, el sistema no lo elimina.
  - Dado: El administrador inició sesión con su rol; existe el estado que se va a eliminar; el estado tiene municipios.
  - Cuando: El administrador solicita eliminar estados.
  - Entonces: El sistema no lo elimina.

### Registrar municipio

- Criterio 1: Cada municipio pertenece a un estado.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar los municipios de cada estado.
  - Entonces: Cada municipio pertenece a un estado.
- Criterio 2: Se acepta el mismo nombre de municipio en estados distintos (por ejemplo, Sucre o Libertador).
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar los municipios de cada estado.
  - Entonces: Se acepta el mismo nombre de municipio en estados distintos (por ejemplo, Sucre o Libertador).
- Criterio 3: Si registro un municipio con un nombre que ya existe en el mismo estado, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador registra un municipio con un nombre que ya existe en el mismo estado.
  - Entonces: El sistema lo rechaza.

### Consultar municipio

- Criterio 1: Puedo ver los municipios de un estado.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de municipio.
  - Cuando: El administrador solicita consultar los municipios.
  - Entonces: Puedo ver los municipios de un estado.

### Modificar municipio

- Criterio 1: Puedo cambiar el nombre o el estado del municipio.
  - Dado: El administrador inició sesión con su rol; existe el municipio que se va a modificar.
  - Cuando: El administrador solicita modificar un municipio.
  - Entonces: Puedo cambiar el nombre o el estado del municipio.
- Criterio 2: Si el municipio queda con el mismo nombre que otro del mismo estado, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe el municipio que se va a modificar; el municipio queda con el mismo nombre que otro del mismo estado.
  - Cuando: El administrador solicita modificar un municipio.
  - Entonces: El sistema lo rechaza.
- Criterio 3: Se acepta el mismo nombre en estados distintos.
  - Dado: El administrador inició sesión con su rol; existe el municipio que se va a modificar.
  - Cuando: El administrador solicita modificar un municipio.
  - Entonces: Se acepta el mismo nombre en estados distintos.

### Eliminar municipio

- Criterio 1: Si el municipio no tiene parroquias, rutas, vías, instituciones con competencia sobre él ni guías asignados, se elimina.
  - Dado: El administrador inició sesión con su rol; existe el municipio que se va a eliminar; el municipio no tiene parroquias, rutas, vías, instituciones con competencia sobre él ni guías asignados.
  - Cuando: El administrador solicita eliminar municipios.
  - Entonces: Se elimina.
- Criterio 2: Si tiene alguna de esas, el sistema no lo elimina.
  - Dado: El administrador inició sesión con su rol; existe el municipio que se va a eliminar; el municipio tiene alguna de esas.
  - Cuando: El administrador solicita eliminar municipios.
  - Entonces: El sistema no lo elimina.

### Registrar parroquia

- Criterio 1: Cada parroquia pertenece a un municipio.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar las parroquias de cada municipio.
  - Entonces: Cada parroquia pertenece a un municipio.
- Criterio 2: Se acepta el mismo nombre de parroquia en municipios distintos (por ejemplo, San José).
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar las parroquias de cada municipio.
  - Entonces: Se acepta el mismo nombre de parroquia en municipios distintos (por ejemplo, San José).
- Criterio 3: Si registro una parroquia con un nombre que ya existe en el mismo municipio, el sistema la rechaza.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador registra una parroquia con un nombre que ya existe en el mismo municipio.
  - Entonces: El sistema la rechaza.

### Consultar parroquia

- Criterio 1: Puedo ver las parroquias de un municipio.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de parroquia.
  - Cuando: El administrador solicita consultar las parroquias.
  - Entonces: Puedo ver las parroquias de un municipio.

### Modificar parroquia

- Criterio 1: Puedo cambiar el nombre o el municipio de la parroquia.
  - Dado: El administrador inició sesión con su rol; existe la parroquia que se va a modificar.
  - Cuando: El administrador solicita modificar una parroquia.
  - Entonces: Puedo cambiar el nombre o el municipio de la parroquia.
- Criterio 2: Si la parroquia queda con el mismo nombre que otra del mismo municipio, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe la parroquia que se va a modificar; la parroquia queda con el mismo nombre que otra del mismo municipio.
  - Cuando: El administrador solicita modificar una parroquia.
  - Entonces: El sistema lo rechaza.
- Criterio 3: Se acepta el mismo nombre en municipios distintos.
  - Dado: El administrador inició sesión con su rol; existe la parroquia que se va a modificar.
  - Cuando: El administrador solicita modificar una parroquia.
  - Entonces: Se acepta el mismo nombre en municipios distintos.

### Eliminar parroquia

- Criterio 1: Si la parroquia no tiene hitos, se elimina.
  - Dado: El administrador inició sesión con su rol; existe la parroquia que se va a eliminar; la parroquia no tiene hitos.
  - Cuando: El administrador solicita eliminar parroquias.
  - Entonces: Se elimina.
- Criterio 2: Si tiene hitos, el sistema no la elimina.
  - Dado: El administrador inició sesión con su rol; existe la parroquia que se va a eliminar; la parroquia tiene hitos.
  - Cuando: El administrador solicita eliminar parroquias.
  - Entonces: El sistema no la elimina.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `estado`, `municipio`, `parroquia`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Roles que actúan: `rol_administrador`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Confirmar con su responsable la asociación preliminar RR↔HU de la sección 3.
