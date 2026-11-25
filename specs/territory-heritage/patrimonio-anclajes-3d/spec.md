# Especificación: patrimonio anclajes 3d

## 1. Objetivo

Describir el comportamiento verificable de patrimonio anclajes 3d: 9 historias de Javier Otero (HU-02, HU-13.1, HU-13.2, HU-13.3, HU-13.4, HU-14.1, HU-14.2, HU-14.3, HU-14.4), conforme a la primera entrega.

## 2. Requisitos funcionales

- Recursos 3D cercanos: «Como visitante quiero recuperar los recursos 3D de los hitos cercanos a mi posición, para ver los elementos virtuales en la cámara.».
- Registrar punto de anclaje: «Como administrador quiero registrar puntos de anclaje de un hito, para que la app sobreponga los elementos 3D cuando el usuario enfoca la cámara.».
- Consultar punto de anclaje: «Como administrador quiero consultar los puntos de anclaje de un hito, para revisar cómo se proyecta su contenido 3D.».
- Modificar punto de anclaje: «Como administrador quiero modificar un punto de anclaje, para ajustar su posición, sus parámetros o su recurso 3D.».
- Eliminar punto de anclaje: «Como administrador quiero eliminar puntos de anclaje, para quitar los que ya no se usan.».
- Registrar recurso 3D: «Como administrador quiero registrar recursos tridimensionales, para proyectarlos en la realidad aumentada.».
- Consultar recurso 3D: «Como administrador quiero consultar los recursos tridimensionales, para saber cuáles hay y dónde se usan.».
- Modificar recurso 3D: «Como administrador quiero modificar un recurso tridimensional, para actualizar su versión o su ruta de almacenamiento.».
- Eliminar recurso 3D: «Como administrador quiero eliminar recursos tridimensionales, para quitar los que ya no se usan.».

## 3. Reglas de negocio

RR del capítulo 7 de la primera entrega escritas sobre las tablas de esta capacidad (la relación del ∀ exterior), con su autor. La fórmula completa está en el informe y el texto en el [catálogo RR](../../../docs/requirements/relational-rules.md). No se modifican las restricciones del modelo relacional validado.

- RR-3 (PROYECTA, Javier): El recurso 3D que proyecta cada punto es distinto de null.
- RR-15 (PUNTO_GEOESPACIAL, Javier): Todo punto de anclaje proyecta un recurso 3D.
- RR-80 (PUNTO_GEOESPACIAL, Javier): El radio de activación y la escala son positivos, la altitud respecto al suelo no es negativa, el azimut y la rotación están en [0, 360) y la inclinación en [−90, 90].
- RR-81 (RECURSO_3D, Javier): Todo recurso 3D tiene un tamaño positivo.

## 4. Criterios de aceptación

### Recursos 3D cercanos

- Criterio 1: La app envía la latitud, la longitud y la elevación de origen del visitante.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita recuperar los recursos 3D de los hitos cercanos a su posición.
  - Entonces: La app envía la latitud, la longitud y la elevación de origen del visitante.
- Criterio 2: Un punto de anclaje se considera cercano si el origen está dentro de su radio efectivo de activación.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita recuperar los recursos 3D de los hitos cercanos a su posición.
  - Entonces: Un punto de anclaje se considera cercano si el origen está dentro de su radio efectivo de activación.
- Criterio 3: La distancia se calcula con funciones trigonométricas sobre los decimales, sin tipos espaciales.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita recuperar los recursos 3D de los hitos cercanos a su posición.
  - Entonces: La distancia se calcula con funciones trigonométricas sobre los decimales, sin tipos espaciales.
- Criterio 4: Para cada anclaje cercano devuelve su recurso 3D y los parámetros para proyectarlo: altitud, azimut, inclinación, rotación y escala.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita recuperar los recursos 3D de los hitos cercanos a su posición.
  - Entonces: Para cada anclaje cercano devuelve su recurso 3D y los parámetros para proyectarlo: altitud, azimut, inclinación, rotación y escala.
- Criterio 5: Para cada recurso devuelve su formato y su ruta de almacenamiento, para que la app lo descargue.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita recuperar los recursos 3D de los hitos cercanos a su posición.
  - Entonces: Para cada recurso devuelve su formato y su ruta de almacenamiento, para que la app lo descargue.
- Criterio 6: Para cada anclaje devuelve también sus hipervínculos informativos.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita recuperar los recursos 3D de los hitos cercanos a su posición.
  - Entonces: Para cada anclaje devuelve también sus hipervínculos informativos.
- Criterio 7: Si no hay anclajes cercanos, el sistema lo indica.
  - Dado: El visitante inició sesión con su rol; no hay anclajes cercanos.
  - Cuando: El visitante solicita recuperar los recursos 3D de los hitos cercanos a su posición.
  - Entonces: El sistema lo indica.

### Registrar punto de anclaje

- Criterio 1: Cada anclaje tiene latitud, longitud, altitud respecto al suelo, azimut, inclinación, rotación, radio de activación en metros y escala, todos como decimales.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar puntos de anclaje de un hito.
  - Entonces: Cada anclaje tiene latitud, longitud, altitud respecto al suelo, azimut, inclinación, rotación, radio de activación en metros y escala, todos como decimales.
- Criterio 2: El anclaje pertenece a un hito y se identifica dentro de ese hito.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar puntos de anclaje de un hito.
  - Entonces: El anclaje pertenece a un hito y se identifica dentro de ese hito.
- Criterio 3: Cada anclaje usa exactamente un recurso 3D ya registrado.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar puntos de anclaje de un hito.
  - Entonces: Cada anclaje usa exactamente un recurso 3D ya registrado.
- Criterio 4: La altitud del anclaje se guarda aparte de la elevación del hito y no se calcula a partir de ella.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar puntos de anclaje de un hito.
  - Entonces: La altitud del anclaje se guarda aparte de la elevación del hito y no se calcula a partir de ella.
- Criterio 5: Cada anclaje puede tener uno o varios hipervínculos informativos.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar puntos de anclaje de un hito.
  - Entonces: Cada anclaje puede tener uno o varios hipervínculos informativos.

### Consultar punto de anclaje

- Criterio 1: Puedo ver los anclajes de un hito con su recurso 3D.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de punto de anclaje.
  - Cuando: El administrador solicita consultar los puntos de anclaje de un hito.
  - Entonces: Puedo ver los anclajes de un hito con su recurso 3D.
- Criterio 2: Puedo abrir un anclaje y ver todos sus parámetros y sus hipervínculos.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de punto de anclaje.
  - Cuando: El administrador solicita consultar los puntos de anclaje de un hito.
  - Entonces: Puedo abrir un anclaje y ver todos sus parámetros y sus hipervínculos.

### Modificar punto de anclaje

- Criterio 1: Puedo cambiar sus parámetros (latitud, longitud, altitud respecto al suelo, azimut, inclinación, rotación, radio de activación y escala) y sus hipervínculos, siempre como decimales.
  - Dado: El administrador inició sesión con su rol; existe el punto de anclaje que se va a modificar.
  - Cuando: El administrador solicita modificar un punto de anclaje.
  - Entonces: Puedo cambiar sus parámetros (latitud, longitud, altitud respecto al suelo, azimut, inclinación, rotación, radio de activación y escala) y sus hipervínculos, siempre como decimales.
- Criterio 2: Puedo cambiar su recurso 3D por otro ya registrado; el anclaje sigue usando exactamente uno.
  - Dado: El administrador inició sesión con su rol; existe el punto de anclaje que se va a modificar.
  - Cuando: El administrador solicita modificar un punto de anclaje.
  - Entonces: Puedo cambiar su recurso 3D por otro ya registrado; el anclaje sigue usando exactamente uno.
- Criterio 3: La altitud del anclaje sigue guardándose aparte de la elevación del hito.
  - Dado: El administrador inició sesión con su rol; existe el punto de anclaje que se va a modificar.
  - Cuando: El administrador solicita modificar un punto de anclaje.
  - Entonces: La altitud del anclaje sigue guardándose aparte de la elevación del hito.

### Eliminar punto de anclaje

- Criterio 1: Al eliminar un anclaje se eliminan también sus hipervínculos.
  - Dado: El administrador inició sesión con su rol; existe el punto de anclaje que se va a eliminar.
  - Cuando: Al eliminar un anclaje.
  - Entonces: Se eliminan también sus hipervínculos.
- Criterio 2: Al eliminar un anclaje, su recurso 3D no se elimina.
  - Dado: El administrador inició sesión con su rol; existe el punto de anclaje que se va a eliminar.
  - Cuando: Al eliminar un anclaje.
  - Entonces: Su recurso 3D no se elimina.

### Registrar recurso 3D

- Criterio 1: Cada recurso tiene su identificador (el código del archivo digital), formato, versión, tamaño en MB, descripción y ruta de almacenamiento.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar recursos tridimensionales.
  - Entonces: Cada recurso tiene su identificador (el código del archivo digital), formato, versión, tamaño en MB, descripción y ruta de almacenamiento.
- Criterio 2: Si registro un recurso con un identificador que ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador registra un recurso con un identificador que ya existe.
  - Entonces: El sistema lo rechaza.

### Consultar recurso 3D

- Criterio 1: Puedo ver el listado de los recursos.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de recurso 3D.
  - Cuando: El administrador solicita consultar los recursos tridimensionales.
  - Entonces: Puedo ver el listado de los recursos.
- Criterio 2: Puedo ver en qué anclajes se usa cada recurso.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de recurso 3D.
  - Cuando: El administrador solicita consultar los recursos tridimensionales.
  - Entonces: Puedo ver en qué anclajes se usa cada recurso.

### Modificar recurso 3D

- Criterio 1: Puedo cambiar sus datos, por ejemplo la versión o la ruta de almacenamiento.
  - Dado: El administrador inició sesión con su rol; existe el recurso 3D que se va a modificar.
  - Cuando: El administrador solicita modificar un recurso tridimensional.
  - Entonces: Puedo cambiar sus datos, por ejemplo la versión o la ruta de almacenamiento.
- Criterio 2: Si cambio el identificador por uno que ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe el recurso 3D que se va a modificar.
  - Cuando: El administrador cambia el identificador por uno que ya existe.
  - Entonces: El sistema lo rechaza.

### Eliminar recurso 3D

- Criterio 1: Si ningún anclaje usa el recurso, se elimina.
  - Dado: El administrador inició sesión con su rol; existe el recurso 3D que se va a eliminar; ningún anclaje usa el recurso.
  - Cuando: El administrador solicita eliminar recursos tridimensionales.
  - Entonces: Se elimina.
- Criterio 2: Si algún anclaje lo usa, el sistema no lo elimina.
  - Dado: El administrador inició sesión con su rol; existe el recurso 3D que se va a eliminar; algún anclaje lo usa.
  - Cuando: El administrador solicita eliminar recursos tridimensionales.
  - Entonces: El sistema no lo elimina.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `punto_geoespacial`, `punto_hipervinculo`, `recurso_3d`, `proyecta`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Claves foráneas hacia tablas de otras capacidades (se crean en `database/02_claves/`, después de todas las tablas):
  - `hito` (HITO), de `patrimonio-hitos` (Javier).
- Roles que actúan: `rol_visitante`, `rol_administrador`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Al escribir la prueba SQL de cada historia, indicar qué RR de la sección 3 cubre.
