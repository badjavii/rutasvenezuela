# Especificación: patrimonio hitos

## 1. Objetivo

Describir el comportamiento verificable de patrimonio hitos: 9 historias de Javier Otero (HU-01, HU-10.1, HU-10.2, HU-10.3, HU-10.4, HU-11.1, HU-11.2, HU-11.3, HU-11.4), conforme a la primera entrega.

## 2. Requisitos funcionales

- Ficha del hito y sus rutas: «Como visitante quiero ver la ficha integral de un hito y en qué rutas está incluido, para decidir cuál recorrer.».
- Registrar hito: «Como administrador quiero registrar hitos, para que los visitantes encuentren los puntos de interés.».
- Consultar hito: «Como administrador quiero consultar los hitos registrados, para revisar qué hay cargado y con qué datos.».
- Modificar hito: «Como administrador quiero modificar los datos de un hito, para mantener la información al día, por ejemplo cuando cambia su estado operativo.».
- Eliminar hito: «Como administrador quiero eliminar hitos, para quitar los que se cargaron por error.».
- Registrar categoría de hito: «Como administrador quiero registrar categorías de hito, para clasificar los puntos de interés.».
- Consultar categoría de hito: «Como administrador quiero consultar las categorías de hito, para saber con cuáles se clasifican los puntos de interés.».
- Modificar categoría de hito: «Como administrador quiero modificar una categoría de hito, para corregir su denominación.».
- Eliminar categoría de hito: «Como administrador quiero eliminar categorías de hito, para quitar las que ya no se usan.».

## 3. Reglas de negocio

Restricciones del relacional asociadas a las historias de esta capacidad, tomadas del [catálogo RR](../../../docs/requirements/relational-rules.md). La asociación RR↔HU es preliminar: se confirma al escribir la prueba SQL de cada regla. No se modifican las restricciones del modelo relacional validado.

- RR-1 (HU-01, HU-10.1, HU-10.2, HU-10.3, HU-10.4): La ubicación de cada hito registrado es distinta de null.
- RR-2 (HU-01, HU-10.1, HU-10.2, HU-10.3, HU-10.4): El tramo sobre el que está un hito es distinto de null.
- RR-13 (HU-01, HU-10.1, HU-10.2, HU-10.3, HU-10.4, HU-11.1, HU-11.2, HU-11.3, HU-11.4): Todo hito tiene al menos una categoría.
- RR-14 (HU-01, HU-10.1, HU-10.2, HU-10.3, HU-10.4): Todo hito tiene su ubicación.
- RR-74 (HU-01, HU-10.1, HU-10.2, HU-10.3, HU-10.4): El estado operativo de todo hito es disponible, en restauración, clausurado temporalmente o cerrado permanentemente.
- RR-75 (HU-01, HU-10.1, HU-10.2, HU-10.3, HU-10.4): Un hito tiene al menos una fila en ABRE si y solo si no es de libre acceso.
- RR-76 (HU-01, HU-10.1, HU-10.2, HU-10.3, HU-10.4): En todo horario, el día es un día de la semana y la hora de cierre es posterior a la de apertura.
- RR-77 (HU-01, HU-10.1, HU-10.2, HU-10.3, HU-10.4): Dos horarios del mismo hito y el mismo día no se cruzan.
- RR-78 (HU-01, HU-10.1, HU-10.2, HU-10.3, HU-10.4): Toda latitud está entre −90 y 90 y toda longitud entre −180 y 180.
- RR-79 (HU-01, HU-10.1, HU-10.2, HU-10.3, HU-10.4): El tramo sobre el que está un hito es de su mismo municipio.

## 4. Criterios de aceptación

### Ficha del hito y sus rutas

- Criterio 1: El visitante elige un hito y el sistema muestra su ficha: nombre, categorías, estado operativo, horario de visita o libre acceso, ubicación (latitud, longitud y elevación), estado, municipio y parroquia, y sus eventos culturales.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver la ficha integral de un hito y en qué rutas está incluido.
  - Entonces: El visitante elige un hito y el sistema muestra su ficha: nombre, categorías, estado operativo, horario de visita o libre acceso, ubicación (latitud, longitud y elevación), estado, municipio y parroquia, y sus eventos culturales.
- Criterio 2: El sistema lista las rutas fijas y dinámicas que incluyen ese hito.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver la ficha integral de un hito y en qué rutas está incluido.
  - Entonces: El sistema lista las rutas fijas y dinámicas que incluyen ese hito.
- Criterio 3: Las rutas dinámicas privadas de otros visitantes no aparecen.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver la ficha integral de un hito y en qué rutas está incluido.
  - Entonces: Las rutas dinámicas privadas de otros visitantes no aparecen.
- Criterio 4: Si el hito no está en ninguna ruta, el sistema lo indica.
  - Dado: El visitante inició sesión con su rol; el hito no está en ninguna ruta.
  - Cuando: El visitante solicita ver la ficha integral de un hito y en qué rutas está incluido.
  - Entonces: El sistema lo indica.

### Registrar hito

- Criterio 1: Cada hito tiene nombre, al menos una categoría, estado operativo y horario de visita o la marca de libre acceso.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar hitos.
  - Entonces: Cada hito tiene nombre, al menos una categoría, estado operativo y horario de visita o la marca de libre acceso.
- Criterio 2: El estado operativo es uno de estos: disponible, en restauración, clausurado temporalmente o cerrado permanentemente.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar hitos.
  - Entonces: El estado operativo es uno de estos: disponible, en restauración, clausurado temporalmente o cerrado permanentemente.
- Criterio 3: La ubicación se guarda como latitud, longitud y elevación en decimales; si el hito está dentro de una estructura (por ejemplo, un piso de un edificio), también su altura dentro de ella.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar hitos.
  - Entonces: La ubicación se guarda como latitud, longitud y elevación en decimales; si el hito está dentro de una estructura (por ejemplo, un piso de un edificio), también su altura dentro de ella.
- Criterio 4: El hito se ubica en una parroquia, con su municipio y su estado.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar hitos.
  - Entonces: El hito se ubica en una parroquia, con su municipio y su estado.
- Criterio 5: El hito puede ubicarse sobre un tramo de vía (es opcional: un hito en un sendero sin registrar queda sin tramo).
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar hitos.
  - Entonces: El hito puede ubicarse sobre un tramo de vía (es opcional: un hito en un sendero sin registrar queda sin tramo).
- Criterio 6: Si registro un hito con un nombre que ya existe en la misma parroquia, el mismo municipio y el mismo estado, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador registra un hito con un nombre que ya existe en la misma parroquia, el mismo municipio y el mismo estado.
  - Entonces: El sistema lo rechaza.
- Criterio 7: Si registro un hito con la misma latitud, longitud y elevación que otro, el sistema lo acepta.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador registra un hito con la misma latitud, longitud y elevación que otro.
  - Entonces: El sistema lo acepta.

### Consultar hito

- Criterio 1: Puedo ver el listado de todos los hitos.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de hito.
  - Cuando: El administrador solicita consultar los hitos registrados.
  - Entonces: Puedo ver el listado de todos los hitos.
- Criterio 2: Puedo abrir un hito y ver todos sus datos: nombre, categorías, estado operativo, horario o libre acceso, ubicación, parroquia, municipio, estado y tramo si lo tiene.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de hito.
  - Cuando: El administrador solicita consultar los hitos registrados.
  - Entonces: Puedo abrir un hito y ver todos sus datos: nombre, categorías, estado operativo, horario o libre acceso, ubicación, parroquia, municipio, estado y tramo si lo tiene.

### Modificar hito

- Criterio 1: Puedo cambiar cualquier dato del hito: nombre, categorías, estado operativo, horario o libre acceso, ubicación, parroquia y tramo.
  - Dado: El administrador inició sesión con su rol; existe el hito que se va a modificar.
  - Cuando: El administrador solicita modificar los datos de un hito.
  - Entonces: Puedo cambiar cualquier dato del hito: nombre, categorías, estado operativo, horario o libre acceso, ubicación, parroquia y tramo.
- Criterio 2: El nuevo estado operativo es uno de los cuatro permitidos: disponible, en restauración, clausurado temporalmente o cerrado permanentemente.
  - Dado: El administrador inició sesión con su rol; existe el hito que se va a modificar.
  - Cuando: El administrador solicita modificar los datos de un hito.
  - Entonces: El nuevo estado operativo es uno de los cuatro permitidos: disponible, en restauración, clausurado temporalmente o cerrado permanentemente.
- Criterio 3: Si dejo el hito sin ninguna categoría, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe el hito que se va a modificar.
  - Cuando: El administrador deja el hito sin ninguna categoría.
  - Entonces: El sistema lo rechaza.
- Criterio 4: Si cambio el nombre o la parroquia y el hito queda con el mismo nombre que otro de la misma parroquia, municipio y estado, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe el hito que se va a modificar.
  - Cuando: El administrador cambia el nombre o la parroquia y el hito queda con el mismo nombre que otro de la misma parroquia, municipio y estado.
  - Entonces: El sistema lo rechaza.
- Criterio 5: Si cambio la ubicación a la misma latitud, longitud y elevación que otro hito, el sistema lo acepta.
  - Dado: El administrador inició sesión con su rol; existe el hito que se va a modificar.
  - Cuando: El administrador cambia la ubicación a la misma latitud, longitud y elevación que otro hito.
  - Entonces: El sistema lo acepta.

### Eliminar hito

- Criterio 1: Si el hito no forma parte de ninguna ruta y no tiene anclajes, eventos, evaluaciones ni incidencias, se elimina.
  - Dado: El administrador inició sesión con su rol; existe el hito que se va a eliminar; el hito no forma parte de ninguna ruta y no tiene anclajes, eventos, evaluaciones ni incidencias.
  - Cuando: El administrador solicita eliminar hitos.
  - Entonces: Se elimina.
- Criterio 2: Si el hito forma parte de una ruta o tiene anclajes, eventos, evaluaciones o incidencias, el sistema no lo elimina y me indica qué lo impide.
  - Dado: El administrador inició sesión con su rol; existe el hito que se va a eliminar; el hito forma parte de una ruta o tiene anclajes, eventos, evaluaciones o incidencias.
  - Cuando: El administrador solicita eliminar hitos.
  - Entonces: El sistema no lo elimina y me indica qué lo impide.
- Criterio 3: En ese caso puedo marcar el hito como cerrado permanentemente.
  - Dado: El administrador inició sesión con su rol; existe el hito que se va a eliminar.
  - Cuando: El administrador solicita eliminar hitos.
  - Entonces: En ese caso puedo marcar el hito como cerrado permanentemente.

### Registrar categoría de hito

- Criterio 1: Si registro una categoría con una denominación que ya existe, el sistema la rechaza.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador registra una categoría con una denominación que ya existe.
  - Entonces: El sistema la rechaza.
- Criterio 2: Un hito se puede asociar a una o varias categorías.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar categorías de hito.
  - Entonces: Un hito se puede asociar a una o varias categorías.

### Consultar categoría de hito

- Criterio 1: Puedo ver el listado de las categorías.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de categoría de hito.
  - Cuando: El administrador solicita consultar las categorías de hito.
  - Entonces: Puedo ver el listado de las categorías.

### Modificar categoría de hito

- Criterio 1: Puedo cambiar la denominación de la categoría.
  - Dado: El administrador inició sesión con su rol; existe la categoría de hito que se va a modificar.
  - Cuando: El administrador solicita modificar una categoría de hito.
  - Entonces: Puedo cambiar la denominación de la categoría.
- Criterio 2: Si cambio la denominación por una que ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe la categoría de hito que se va a modificar.
  - Cuando: El administrador cambia la denominación por una que ya existe.
  - Entonces: El sistema lo rechaza.

### Eliminar categoría de hito

- Criterio 1: Si la categoría no es la única de ningún hito, se elimina y deja de aparecer en los hitos que la tenían.
  - Dado: El administrador inició sesión con su rol; existe la categoría de hito que se va a eliminar; la categoría no es la única de ningún hito.
  - Cuando: El administrador solicita eliminar categorías de hito.
  - Entonces: Se elimina y deja de aparecer en los hitos que la tenían.
- Criterio 2: Si la categoría es la única de algún hito, el sistema no la elimina.
  - Dado: El administrador inició sesión con su rol; existe la categoría de hito que se va a eliminar; la categoría es la única de algún hito.
  - Cuando: El administrador solicita eliminar categorías de hito.
  - Entonces: El sistema no la elimina.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `hito`, `categoria`, `clasifica`, `ubicacion_geografica`, `registra`, `horario`, `abre`, `se_ubica_en`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Claves foráneas hacia tablas de otras capacidades (se crean en `database/02_claves/`, después de todas las tablas):
  - `parroquia` (PARROQUIA), de `territorio-catalogo` (Javier).
  - `tramo` (TRAMO), de `movilidad-vias-y-tramos` (Sebastián).
- Roles que actúan: `rol_visitante`, `rol_administrador`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Confirmar con su responsable la asociación preliminar RR↔HU de la sección 3.
- Acordar con Sebastián los datos de prueba de las tablas referidas.
