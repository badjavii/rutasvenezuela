# Especificación: patrimonio anclajes 3d

## 1. Objetivo

Describir los comportamientos verificables de patrimonio anclajes 3d, derivados de la primera entrega.

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

Consultar [reglas relacionales](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). No inferir nuevas invariantes.

## 4. Criterios de aceptación

### Recursos 3D cercanos

- Criterio 1: La app envía la latitud, la longitud y la elevación de origen del visitante.
  - Dado: Se cumplen las precondiciones del comportamiento «Recursos 3D cercanos»
  - Cuando: el actor solicita «Recursos 3D cercanos» en esas circunstancias
  - Entonces: La app envía la latitud, la longitud y la elevación de origen del visitante.
- Criterio 2: Un punto de anclaje se considera cercano si el origen está dentro de su radio efectivo de activación.
  - Dado: Se cumplen las precondiciones del comportamiento «Recursos 3D cercanos»
  - Cuando: el actor solicita «Recursos 3D cercanos» en esas circunstancias
  - Entonces: Un punto de anclaje se considera cercano si el origen está dentro de su radio efectivo de activación.
- Criterio 3: La distancia se calcula con funciones trigonométricas sobre los decimales, sin tipos espaciales.
  - Dado: Se cumplen las precondiciones del comportamiento «Recursos 3D cercanos»
  - Cuando: el actor solicita «Recursos 3D cercanos» en esas circunstancias
  - Entonces: La distancia se calcula con funciones trigonométricas sobre los decimales, sin tipos espaciales.
- Criterio 4: Para cada anclaje cercano devuelve su recurso 3D y los parámetros para proyectarlo: altitud, azimut, inclinación, rotación y escala.
  - Dado: Se cumplen las precondiciones del comportamiento «Recursos 3D cercanos»
  - Cuando: el actor solicita «Recursos 3D cercanos» en esas circunstancias
  - Entonces: Para cada anclaje cercano devuelve su recurso 3D y los parámetros para proyectarlo: altitud, azimut, inclinación, rotación y escala.
- Criterio 5: Para cada recurso devuelve su formato y su ruta de almacenamiento, para que la app lo descargue.
  - Dado: Se cumplen las precondiciones del comportamiento «Recursos 3D cercanos»
  - Cuando: el actor solicita «Recursos 3D cercanos» en esas circunstancias
  - Entonces: Para cada recurso devuelve su formato y su ruta de almacenamiento, para que la app lo descargue.
- Criterio 6: Para cada anclaje devuelve también sus hipervínculos informativos.
  - Dado: Se cumplen las precondiciones del comportamiento «Recursos 3D cercanos»
  - Cuando: el actor solicita «Recursos 3D cercanos» en esas circunstancias
  - Entonces: Para cada anclaje devuelve también sus hipervínculos informativos.
- Criterio 7: el sistema lo indica.
  - Dado: Se cumple la condición «no hay anclajes cercanos»
  - Cuando: el actor solicita «Recursos 3D cercanos» en esas circunstancias
  - Entonces: el sistema lo indica.

### Registrar punto de anclaje

- Criterio 1: Cada anclaje tiene latitud, longitud, altitud respecto al suelo, azimut, inclinación, rotación, radio de activación en metros y escala, todos como decimales.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar punto de anclaje»
  - Cuando: el actor solicita «Registrar punto de anclaje» en esas circunstancias
  - Entonces: Cada anclaje tiene latitud, longitud, altitud respecto al suelo, azimut, inclinación, rotación, radio de activación en metros y escala, todos como decimales.
- Criterio 2: El anclaje pertenece a un hito y se identifica dentro de ese hito.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar punto de anclaje»
  - Cuando: el actor solicita «Registrar punto de anclaje» en esas circunstancias
  - Entonces: El anclaje pertenece a un hito y se identifica dentro de ese hito.
- Criterio 3: Cada anclaje usa exactamente un recurso 3D ya registrado.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar punto de anclaje»
  - Cuando: el actor solicita «Registrar punto de anclaje» en esas circunstancias
  - Entonces: Cada anclaje usa exactamente un recurso 3D ya registrado.
- Criterio 4: La altitud del anclaje se guarda aparte de la elevación del hito y no se calcula a partir de ella.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar punto de anclaje»
  - Cuando: el actor solicita «Registrar punto de anclaje» en esas circunstancias
  - Entonces: La altitud del anclaje se guarda aparte de la elevación del hito y no se calcula a partir de ella.
- Criterio 5: Cada anclaje puede tener uno o varios hipervínculos informativos.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar punto de anclaje»
  - Cuando: el actor solicita «Registrar punto de anclaje» en esas circunstancias
  - Entonces: Cada anclaje puede tener uno o varios hipervínculos informativos.

### Consultar punto de anclaje

- Criterio 1: Puedo ver los anclajes de un hito con su recurso 3D.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar punto de anclaje»
  - Cuando: el actor solicita «Consultar punto de anclaje» en esas circunstancias
  - Entonces: Puedo ver los anclajes de un hito con su recurso 3D.
- Criterio 2: Puedo abrir un anclaje y ver todos sus parámetros y sus hipervínculos.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar punto de anclaje»
  - Cuando: el actor solicita «Consultar punto de anclaje» en esas circunstancias
  - Entonces: Puedo abrir un anclaje y ver todos sus parámetros y sus hipervínculos.

### Modificar punto de anclaje

- Criterio 1: Puedo cambiar sus parámetros (latitud, longitud, altitud respecto al suelo, azimut, inclinación, rotación, radio de activación y escala) y sus hipervínculos, siempre como decimales.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar punto de anclaje»
  - Cuando: el actor solicita «Modificar punto de anclaje» en esas circunstancias
  - Entonces: Puedo cambiar sus parámetros (latitud, longitud, altitud respecto al suelo, azimut, inclinación, rotación, radio de activación y escala) y sus hipervínculos, siempre como decimales.
- Criterio 2: Puedo cambiar su recurso 3D por otro ya registrado; el anclaje sigue usando exactamente uno.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar punto de anclaje»
  - Cuando: el actor solicita «Modificar punto de anclaje» en esas circunstancias
  - Entonces: Puedo cambiar su recurso 3D por otro ya registrado; el anclaje sigue usando exactamente uno.
- Criterio 3: La altitud del anclaje sigue guardándose aparte de la elevación del hito.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar punto de anclaje»
  - Cuando: el actor solicita «Modificar punto de anclaje» en esas circunstancias
  - Entonces: La altitud del anclaje sigue guardándose aparte de la elevación del hito.

### Eliminar punto de anclaje

- Criterio 1: Al eliminar un anclaje se eliminan también sus hipervínculos.
  - Dado: Se cumplen las precondiciones del comportamiento «Eliminar punto de anclaje»
  - Cuando: el actor solicita «Eliminar punto de anclaje» en esas circunstancias
  - Entonces: Al eliminar un anclaje se eliminan también sus hipervínculos.
- Criterio 2: Al eliminar un anclaje, su recurso 3D no se elimina.
  - Dado: Se cumplen las precondiciones del comportamiento «Eliminar punto de anclaje»
  - Cuando: el actor solicita «Eliminar punto de anclaje» en esas circunstancias
  - Entonces: Al eliminar un anclaje, su recurso 3D no se elimina.

### Registrar recurso 3D

- Criterio 1: Cada recurso tiene su identificador (el código del archivo digital), formato, versión, tamaño en MB, descripción y ruta de almacenamiento.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar recurso 3D»
  - Cuando: el actor solicita «Registrar recurso 3D» en esas circunstancias
  - Entonces: Cada recurso tiene su identificador (el código del archivo digital), formato, versión, tamaño en MB, descripción y ruta de almacenamiento.
- Criterio 2: el sistema lo rechaza.
  - Dado: Se cumple la condición «registro un recurso con un identificador que ya existe»
  - Cuando: el actor solicita «Registrar recurso 3D» en esas circunstancias
  - Entonces: el sistema lo rechaza.

### Consultar recurso 3D

- Criterio 1: Puedo ver el listado de los recursos.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar recurso 3D»
  - Cuando: el actor solicita «Consultar recurso 3D» en esas circunstancias
  - Entonces: Puedo ver el listado de los recursos.
- Criterio 2: Puedo ver en qué anclajes se usa cada recurso.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar recurso 3D»
  - Cuando: el actor solicita «Consultar recurso 3D» en esas circunstancias
  - Entonces: Puedo ver en qué anclajes se usa cada recurso.

### Modificar recurso 3D

- Criterio 1: Puedo cambiar sus datos, por ejemplo la versión o la ruta de almacenamiento.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar recurso 3D»
  - Cuando: el actor solicita «Modificar recurso 3D» en esas circunstancias
  - Entonces: Puedo cambiar sus datos, por ejemplo la versión o la ruta de almacenamiento.
- Criterio 2: el sistema lo rechaza.
  - Dado: Se cumple la condición «cambio el identificador por uno que ya existe»
  - Cuando: el actor solicita «Modificar recurso 3D» en esas circunstancias
  - Entonces: el sistema lo rechaza.

### Eliminar recurso 3D

- Criterio 1: se elimina.
  - Dado: Se cumple la condición «ningún anclaje usa el recurso»
  - Cuando: el actor solicita «Eliminar recurso 3D» en esas circunstancias
  - Entonces: se elimina.
- Criterio 2: el sistema no lo elimina.
  - Dado: Se cumple la condición «algún anclaje lo usa»
  - Cuando: el actor solicita «Eliminar recurso 3D» en esas circunstancias
  - Entonces: el sistema no lo elimina.

## 5. Restricciones técnicas

PostgreSQL concentra integridad y transacciones. Aplicación web de tres capas; stack de aplicación provisional.

## 6. Fuera de alcance

Cambiar el modelo relacional validado o incorporar reglas ajenas al informe.

## 7. Decisiones abiertas

Revisión y aprobación humana del contrato y elección definitiva del backend.
