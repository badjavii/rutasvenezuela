# Especificación: patrimonio hitos

## 1. Objetivo

Describir los comportamientos verificables de patrimonio hitos, según la primera entrega.

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

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). Mantener modelo relacional validado sin inventar invariantes.

## 4. Criterios de aceptación

### Ficha del hito y sus rutas

- Criterio 1: El visitante elige un hito y el sistema muestra su ficha: nombre, categorías, estado operativo, horario de visita o libre acceso, ubicación (latitud, longitud y elevación), estado, municipio y parroquia, y sus eventos culturales.
  - Dado: Se cumplen las precondiciones del comportamiento «Ficha del hito y sus rutas»
  - Cuando: el actor solicita «Ficha del hito y sus rutas» en esas circunstancias
  - Entonces: El visitante elige un hito y el sistema muestra su ficha: nombre, categorías, estado operativo, horario de visita o libre acceso, ubicación (latitud, longitud y elevación), estado, municipio y parroquia, y sus eventos culturales.
- Criterio 2: El sistema lista las rutas fijas y dinámicas que incluyen ese hito.
  - Dado: Se cumplen las precondiciones del comportamiento «Ficha del hito y sus rutas»
  - Cuando: el actor solicita «Ficha del hito y sus rutas» en esas circunstancias
  - Entonces: El sistema lista las rutas fijas y dinámicas que incluyen ese hito.
- Criterio 3: Las rutas dinámicas privadas de otros visitantes no aparecen.
  - Dado: Se cumplen las precondiciones del comportamiento «Ficha del hito y sus rutas»
  - Cuando: el actor solicita «Ficha del hito y sus rutas» en esas circunstancias
  - Entonces: Las rutas dinámicas privadas de otros visitantes no aparecen.
- Criterio 4: el sistema lo indica.
  - Dado: Se cumple la condición «el hito no está en ninguna ruta»
  - Cuando: el actor solicita «Ficha del hito y sus rutas» en esas circunstancias
  - Entonces: el sistema lo indica.

### Registrar hito

- Criterio 1: Cada hito tiene nombre, al menos una categoría, estado operativo y horario de visita o la marca de libre acceso.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar hito»
  - Cuando: el actor solicita «Registrar hito» en esas circunstancias
  - Entonces: Cada hito tiene nombre, al menos una categoría, estado operativo y horario de visita o la marca de libre acceso.
- Criterio 2: El estado operativo es uno de estos: disponible, en restauración, clausurado temporalmente o cerrado permanentemente.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar hito»
  - Cuando: el actor solicita «Registrar hito» en esas circunstancias
  - Entonces: El estado operativo es uno de estos: disponible, en restauración, clausurado temporalmente o cerrado permanentemente.
- Criterio 3: La ubicación se guarda como latitud, longitud y elevación en decimales; si el hito está dentro de una estructura (por ejemplo, un piso de un edificio), también su altura dentro de ella.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar hito»
  - Cuando: el actor solicita «Registrar hito» en esas circunstancias
  - Entonces: La ubicación se guarda como latitud, longitud y elevación en decimales; si el hito está dentro de una estructura (por ejemplo, un piso de un edificio), también su altura dentro de ella.
- Criterio 4: El hito se ubica en una parroquia, con su municipio y su estado.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar hito»
  - Cuando: el actor solicita «Registrar hito» en esas circunstancias
  - Entonces: El hito se ubica en una parroquia, con su municipio y su estado.
- Criterio 5: El hito puede ubicarse sobre un tramo de vía (es opcional: un hito en un sendero sin registrar queda sin tramo).
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar hito»
  - Cuando: el actor solicita «Registrar hito» en esas circunstancias
  - Entonces: El hito puede ubicarse sobre un tramo de vía (es opcional: un hito en un sendero sin registrar queda sin tramo).
- Criterio 6: el mismo municipio y el mismo estado, el sistema lo rechaza.
  - Dado: Se cumple la condición «registro un hito con un nombre que ya existe en la misma parroquia»
  - Cuando: el actor solicita «Registrar hito» en esas circunstancias
  - Entonces: el mismo municipio y el mismo estado, el sistema lo rechaza.
- Criterio 7: longitud y elevación que otro, el sistema lo acepta.
  - Dado: Se cumple la condición «registro un hito con la misma latitud»
  - Cuando: el actor solicita «Registrar hito» en esas circunstancias
  - Entonces: longitud y elevación que otro, el sistema lo acepta.

### Consultar hito

- Criterio 1: Puedo ver el listado de todos los hitos.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar hito»
  - Cuando: el actor solicita «Consultar hito» en esas circunstancias
  - Entonces: Puedo ver el listado de todos los hitos.
- Criterio 2: Puedo abrir un hito y ver todos sus datos: nombre, categorías, estado operativo, horario o libre acceso, ubicación, parroquia, municipio, estado y tramo si lo tiene.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar hito»
  - Cuando: el actor solicita «Consultar hito» en esas circunstancias
  - Entonces: Puedo abrir un hito y ver todos sus datos: nombre, categorías, estado operativo, horario o libre acceso, ubicación, parroquia, municipio, estado y tramo si lo tiene.

### Modificar hito

- Criterio 1: Puedo cambiar cualquier dato del hito: nombre, categorías, estado operativo, horario o libre acceso, ubicación, parroquia y tramo.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar hito»
  - Cuando: el actor solicita «Modificar hito» en esas circunstancias
  - Entonces: Puedo cambiar cualquier dato del hito: nombre, categorías, estado operativo, horario o libre acceso, ubicación, parroquia y tramo.
- Criterio 2: El nuevo estado operativo es uno de los cuatro permitidos: disponible, en restauración, clausurado temporalmente o cerrado permanentemente.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar hito»
  - Cuando: el actor solicita «Modificar hito» en esas circunstancias
  - Entonces: El nuevo estado operativo es uno de los cuatro permitidos: disponible, en restauración, clausurado temporalmente o cerrado permanentemente.
- Criterio 3: el sistema lo rechaza.
  - Dado: Se cumple la condición «dejo el hito sin ninguna categoría»
  - Cuando: el actor solicita «Modificar hito» en esas circunstancias
  - Entonces: el sistema lo rechaza.
- Criterio 4: municipio y estado, el sistema lo rechaza.
  - Dado: Se cumple la condición «cambio el nombre o la parroquia y el hito queda con el mismo nombre que otro de la misma parroquia»
  - Cuando: el actor solicita «Modificar hito» en esas circunstancias
  - Entonces: municipio y estado, el sistema lo rechaza.
- Criterio 5: longitud y elevación que otro hito, el sistema lo acepta.
  - Dado: Se cumple la condición «cambio la ubicación a la misma latitud»
  - Cuando: el actor solicita «Modificar hito» en esas circunstancias
  - Entonces: longitud y elevación que otro hito, el sistema lo acepta.

### Eliminar hito

- Criterio 1: eventos, evaluaciones ni incidencias, se elimina.
  - Dado: Se cumple la condición «el hito no forma parte de ninguna ruta y no tiene anclajes»
  - Cuando: el actor solicita «Eliminar hito» en esas circunstancias
  - Entonces: eventos, evaluaciones ni incidencias, se elimina.
- Criterio 2: eventos, evaluaciones o incidencias, el sistema no lo elimina y me indica qué lo impide.
  - Dado: Se cumple la condición «el hito forma parte de una ruta o tiene anclajes»
  - Cuando: el actor solicita «Eliminar hito» en esas circunstancias
  - Entonces: eventos, evaluaciones o incidencias, el sistema no lo elimina y me indica qué lo impide.
- Criterio 3: En ese caso puedo marcar el hito como cerrado permanentemente.
  - Dado: Se cumplen las precondiciones del comportamiento «Eliminar hito»
  - Cuando: el actor solicita «Eliminar hito» en esas circunstancias
  - Entonces: En ese caso puedo marcar el hito como cerrado permanentemente.

### Registrar categoría de hito

- Criterio 1: el sistema la rechaza.
  - Dado: Se cumple la condición «registro una categoría con una denominación que ya existe»
  - Cuando: el actor solicita «Registrar categoría de hito» en esas circunstancias
  - Entonces: el sistema la rechaza.
- Criterio 2: Un hito se puede asociar a una o varias categorías.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar categoría de hito»
  - Cuando: el actor solicita «Registrar categoría de hito» en esas circunstancias
  - Entonces: Un hito se puede asociar a una o varias categorías.

### Consultar categoría de hito

- Criterio 1: Puedo ver el listado de las categorías.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar categoría de hito»
  - Cuando: el actor solicita «Consultar categoría de hito» en esas circunstancias
  - Entonces: Puedo ver el listado de las categorías.

### Modificar categoría de hito

- Criterio 1: Puedo cambiar la denominación de la categoría.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar categoría de hito»
  - Cuando: el actor solicita «Modificar categoría de hito» en esas circunstancias
  - Entonces: Puedo cambiar la denominación de la categoría.
- Criterio 2: el sistema lo rechaza.
  - Dado: Se cumple la condición «cambio la denominación por una que ya existe»
  - Cuando: el actor solicita «Modificar categoría de hito» en esas circunstancias
  - Entonces: el sistema lo rechaza.

### Eliminar categoría de hito

- Criterio 1: se elimina y deja de aparecer en los hitos que la tenían.
  - Dado: Se cumple la condición «la categoría no es la única de ningún hito»
  - Cuando: el actor solicita «Eliminar categoría de hito» en esas circunstancias
  - Entonces: se elimina y deja de aparecer en los hitos que la tenían.
- Criterio 2: el sistema no la elimina.
  - Dado: Se cumple la condición «la categoría es la única de algún hito»
  - Cuando: el actor solicita «Eliminar categoría de hito» en esas circunstancias
  - Entonces: el sistema no la elimina.

## 5. Restricciones técnicas

PostgreSQL gestiona integridad y reglas. Web de tres capas; tecnologías de API/UI provisionales.

## 6. Fuera de alcance

Modificar el modelo relacional o desarrollar capacidades ajenas.

## 7. Decisiones abiertas

Aprobación humana de contratos y stack final.
