# Especificación: rutas gestion

## 1. Objetivo

Describir las capacidades verificables de rutas gestion, según los criterios de primera entrega.

## 2. Requisitos funcionales

- Rutas por categoría y territorio: «Como visitante quiero listar las rutas urbanas de una categoría en un municipio o en un estado, para elegir qué recorrer en esa zona.».
- Registrar ruta fija: «Como administrador quiero registrar rutas fijas, para ofrecer recorridos prediseñados por expertos.».
- Consultar ruta fija: «Como administrador quiero consultar las rutas fijas, para revisar qué recorridos se ofrecen.».
- Modificar ruta fija: «Como administrador quiero modificar una ruta fija, para corregir sus datos o su secuencia.».
- Eliminar ruta fija: «Como administrador quiero eliminar rutas fijas, para quitar las que se cargaron por error.».
- Registrar ruta dinámica: «Como visitante quiero registrar mis propias rutas, eligiendo hitos, orden de visita y transporte, para recorrer lo que me interesa.».
- Consultar ruta dinámica: «Como visitante quiero consultar mis rutas, para reutilizarlas cuando quiera.».
- Modificar ruta dinámica: «Como visitante quiero modificar mis rutas, para ajustarlas a lo que quiero recorrer.».
- Eliminar ruta dinámica: «Como visitante quiero eliminar mis rutas, para quitar las que ya no uso.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). Conservar el relacional entregado.

## 4. Criterios de aceptación

### Rutas por categoría y territorio

- Criterio 1: El visitante elige una categoría y un municipio o un estado.
  - Dado: Se cumplen las precondiciones del comportamiento «Rutas por categoría y territorio»
  - Cuando: el actor solicita «Rutas por categoría y territorio» en esas circunstancias
  - Entonces: El visitante elige una categoría y un municipio o un estado.
- Criterio 2: El sistema lista las rutas que incluyen al menos un hito de esa categoría y cuyo origen está en el municipio o el estado elegido.
  - Dado: Se cumplen las precondiciones del comportamiento «Rutas por categoría y territorio»
  - Cuando: el actor solicita «Rutas por categoría y territorio» en esas circunstancias
  - Entonces: El sistema lista las rutas que incluyen al menos un hito de esa categoría y cuyo origen está en el municipio o el estado elegido.
- Criterio 3: Aparecen las rutas fijas y las rutas dinámicas públicas; las dinámicas privadas no aparecen.
  - Dado: Se cumplen las precondiciones del comportamiento «Rutas por categoría y territorio»
  - Cuando: el actor solicita «Rutas por categoría y territorio» en esas circunstancias
  - Entonces: Aparecen las rutas fijas y las rutas dinámicas públicas; las dinámicas privadas no aparecen.
- Criterio 4: el sistema lo indica.
  - Dado: Se cumple la condición «no hay rutas que cumplan el filtro»
  - Cuando: el actor solicita «Rutas por categoría y territorio» en esas circunstancias
  - Entonces: el sistema lo indica.

### Registrar ruta fija

- Criterio 1: La ruta es una secuencia ordenada de hitos y paradas con número de orden; el primero es el origen y el último el destino.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar ruta fija»
  - Cuando: el actor solicita «Registrar ruta fija» en esas circunstancias
  - Entonces: La ruta es una secuencia ordenada de hitos y paradas con número de orden; el primero es el origen y el último el destino.
- Criterio 2: La ruta tiene al menos un hito de origen y uno de destino.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar ruta fija»
  - Cuando: el actor solicita «Registrar ruta fija» en esas circunstancias
  - Entonces: La ruta tiene al menos un hito de origen y uno de destino.
- Criterio 3: No hay dos elementos con el mismo número de orden en la ruta.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar ruta fija»
  - Cuando: el actor solicita «Registrar ruta fija» en esas circunstancias
  - Entonces: No hay dos elementos con el mismo número de orden en la ruta.
- Criterio 4: La ruta tiene duración estimada, mejor horario de inicio y nivel de dificultad.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar ruta fija»
  - Cuando: el actor solicita «Registrar ruta fija» en esas circunstancias
  - Entonces: La ruta tiene duración estimada, mejor horario de inicio y nivel de dificultad.
- Criterio 5: el sistema la rechaza. El mismo nombre sí se acepta en otro municipio o estado.
  - Dado: Se cumple la condición «registro una ruta con el mismo nombre en el mismo municipio y estado de origen que otra»
  - Cuando: el actor solicita «Registrar ruta fija» en esas circunstancias
  - Entonces: el sistema la rechaza. El mismo nombre sí se acepta en otro municipio o estado.

### Consultar ruta fija

- Criterio 1: Puedo ver el listado de las rutas fijas.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar ruta fija»
  - Cuando: el actor solicita «Consultar ruta fija» en esas circunstancias
  - Entonces: Puedo ver el listado de las rutas fijas.
- Criterio 2: Puedo abrir una ruta y ver su secuencia, su duración, su horario, su dificultad y sus guías.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar ruta fija»
  - Cuando: el actor solicita «Consultar ruta fija» en esas circunstancias
  - Entonces: Puedo abrir una ruta y ver su secuencia, su duración, su horario, su dificultad y sus guías.

### Modificar ruta fija

- Criterio 1: Puedo cambiar sus datos y su secuencia de hitos y paradas.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar ruta fija»
  - Cuando: el actor solicita «Modificar ruta fija» en esas circunstancias
  - Entonces: Puedo cambiar sus datos y su secuencia de hitos y paradas.
- Criterio 2: La ruta sigue teniendo al menos un hito de origen y uno de destino.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar ruta fija»
  - Cuando: el actor solicita «Modificar ruta fija» en esas circunstancias
  - Entonces: La ruta sigue teniendo al menos un hito de origen y uno de destino.
- Criterio 3: No puede haber dos elementos con el mismo número de orden.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar ruta fija»
  - Cuando: el actor solicita «Modificar ruta fija» en esas circunstancias
  - Entonces: No puede haber dos elementos con el mismo número de orden.
- Criterio 4: La ruta sigue teniendo duración estimada, mejor horario de inicio y nivel de dificultad.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar ruta fija»
  - Cuando: el actor solicita «Modificar ruta fija» en esas circunstancias
  - Entonces: La ruta sigue teniendo duración estimada, mejor horario de inicio y nivel de dificultad.
- Criterio 5: el sistema lo rechaza; en otro municipio o estado se acepta.
  - Dado: Se cumple la condición «el nombre queda igual al de otra ruta del mismo municipio y estado de origen»
  - Cuando: el actor solicita «Modificar ruta fija» en esas circunstancias
  - Entonces: el sistema lo rechaza; en otro municipio o estado se acepta.

### Eliminar ruta fija

- Criterio 1: experiencias ni contrataciones de guía, se elimina.
  - Dado: Se cumple la condición «la ruta no tiene recorridos»
  - Cuando: el actor solicita «Eliminar ruta fija» en esas circunstancias
  - Entonces: experiencias ni contrataciones de guía, se elimina.
- Criterio 2: experiencias o contrataciones de guía, no se borra, porque se conserva su historial.
  - Dado: Se cumple la condición «tiene recorridos»
  - Cuando: el actor solicita «Eliminar ruta fija» en esas circunstancias
  - Entonces: experiencias o contrataciones de guía, no se borra, porque se conserva su historial.

### Registrar ruta dinámica

- Criterio 1: El visitante elige los hitos, el orden de visita y su preferencia de transporte.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar ruta dinámica»
  - Cuando: el actor solicita «Registrar ruta dinámica» en esas circunstancias
  - Entonces: El visitante elige los hitos, el orden de visita y su preferencia de transporte.
- Criterio 2: La ruta tiene al menos un hito de origen y uno de destino.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar ruta dinámica»
  - Cuando: el actor solicita «Registrar ruta dinámica» en esas circunstancias
  - Entonces: La ruta tiene al menos un hito de origen y uno de destino.
- Criterio 3: El visitante marca la ruta como privada o pública; la privada solo la ve él y la pública aparece en el catálogo.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar ruta dinámica»
  - Cuando: el actor solicita «Registrar ruta dinámica» en esas circunstancias
  - Entonces: El visitante marca la ruta como privada o pública; la privada solo la ve él y la pública aparece en el catálogo.
- Criterio 4: el sistema la rechaza.
  - Dado: Se cumple la condición «registro una ruta con el mismo nombre en el mismo municipio y estado de origen que otra»
  - Cuando: el actor solicita «Registrar ruta dinámica» en esas circunstancias
  - Entonces: el sistema la rechaza.
- Criterio 5: La ruta tiene duración estimada, mejor horario de inicio y nivel de dificultad, como toda ruta; el visitante puede dejarlos en blanco.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar ruta dinámica»
  - Cuando: el actor solicita «Registrar ruta dinámica» en esas circunstancias
  - Entonces: La ruta tiene duración estimada, mejor horario de inicio y nivel de dificultad, como toda ruta; el visitante puede dejarlos en blanco.

### Consultar ruta dinámica

- Criterio 1: Veo la lista de mis rutas, privadas y públicas.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar ruta dinámica»
  - Cuando: el actor solicita «Consultar ruta dinámica» en esas circunstancias
  - Entonces: Veo la lista de mis rutas, privadas y públicas.
- Criterio 2: Puedo abrir una ruta y ver sus hitos, su orden y mi preferencia de transporte.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar ruta dinámica»
  - Cuando: el actor solicita «Consultar ruta dinámica» en esas circunstancias
  - Entonces: Puedo abrir una ruta y ver sus hitos, su orden y mi preferencia de transporte.

### Modificar ruta dinámica

- Criterio 1: Solo el visitante que creó la ruta puede modificarla.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar ruta dinámica»
  - Cuando: el actor solicita «Modificar ruta dinámica» en esas circunstancias
  - Entonces: Solo el visitante que creó la ruta puede modificarla.
- Criterio 2: Puedo cambiar los hitos, el orden de visita y la preferencia de transporte.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar ruta dinámica»
  - Cuando: el actor solicita «Modificar ruta dinámica» en esas circunstancias
  - Entonces: Puedo cambiar los hitos, el orden de visita y la preferencia de transporte.
- Criterio 3: Puedo pasar la ruta de privada a pública o al revés.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar ruta dinámica»
  - Cuando: el actor solicita «Modificar ruta dinámica» en esas circunstancias
  - Entonces: Puedo pasar la ruta de privada a pública o al revés.
- Criterio 4: La ruta sigue teniendo al menos un hito de origen y uno de destino.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar ruta dinámica»
  - Cuando: el actor solicita «Modificar ruta dinámica» en esas circunstancias
  - Entonces: La ruta sigue teniendo al menos un hito de origen y uno de destino.
- Criterio 5: el sistema lo rechaza.
  - Dado: Se cumple la condición «el nombre queda igual al de otra ruta del mismo municipio y estado de origen»
  - Cuando: el actor solicita «Modificar ruta dinámica» en esas circunstancias
  - Entonces: el sistema lo rechaza.

### Eliminar ruta dinámica

- Criterio 1: Solo el visitante que creó la ruta puede eliminarla.
  - Dado: Se cumplen las precondiciones del comportamiento «Eliminar ruta dinámica»
  - Cuando: el actor solicita «Eliminar ruta dinámica» en esas circunstancias
  - Entonces: Solo el visitante que creó la ruta puede eliminarla.
- Criterio 2: se elimina.
  - Dado: Se cumple la condición «la ruta no tiene recorridos ni experiencias»
  - Cuando: el actor solicita «Eliminar ruta dinámica» en esas circunstancias
  - Entonces: se elimina.
- Criterio 3: no se borra, porque se conserva su historial.
  - Dado: Se cumple la condición «la ruta ya tiene recorridos o una experiencia transcurre sobre ella»
  - Cuando: el actor solicita «Eliminar ruta dinámica» en esas circunstancias
  - Entonces: no se borra, porque se conserva su historial.

## 5. Restricciones técnicas

PostgreSQL contiene invariantes. Arquitectura web de tres capas; stack de referencia provisional.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar nuevas reglas sin fuente.

## 7. Decisiones abiertas

Revisar contratos entre capas y confirmar tecnología de API/UI.
