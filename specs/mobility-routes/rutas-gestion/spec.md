# Especificación: rutas gestion

## 1. Objetivo

Describir el comportamiento verificable de rutas gestion: 9 historias de Sebastián Armas (HU-03, HU-17.1, HU-17.2, HU-17.3, HU-17.4, HU-25.1, HU-25.2, HU-25.3, HU-25.4), conforme a la primera entrega.

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

RR del capítulo 7 de la primera entrega escritas sobre las tablas de esta capacidad (la relación del ∀ exterior), con su autor. La fórmula completa está en el informe y el texto en el [catálogo RR](../../../docs/requirements/relational-rules.md). No se modifican las restricciones del modelo relacional validado.

- RR-22 (CREA, Sebastián): El visitante que crea cada ruta dinámica es distinto de null.
- RR-34 (RUTA_TURISTICA, Sebastián): Toda ruta tiene al menos dos hitos: el de origen y el de destino.
- RR-35 (RUTA_TURISTICA, Sebastián): Toda ruta es fija o dinámica, exactamente una de las dos.
- RR-36 (RUTA_DINAMICA, Sebastián): Toda ruta dinámica la creó un visitante.
- RR-106 (RUTA_TURISTICA, Sebastián): La duración estimada, si la hay, es positiva. La visibilidad de una ruta dinámica es privada o pública, y su preferencia de transporte es a pie, bicicleta, transporte público o vehículo adaptado.
- RR-107 (RUTA_FIJA, Sebastián): Toda ruta fija tiene en RUTA_TURISTICA su duración estimada, su mejor horario de inicio y su nivel de dificultad.
- RR-108 (CONFORMA, Sebastián): Dentro de una ruta, dos filas de CONFORMA o de USA nunca comparten número de orden, y todo orden es positivo.
- RR-109 (RUTA_TURISTICA, Sebastián): La secuencia de una ruta empieza en 1 con un hito y no deja huecos: toda fila con orden mayor que 1 tiene otra de la misma ruta con el orden anterior.
- RR-110 (USA, Sebastián): Toda parada de una ruta tiene un hito de la misma ruta antes y otro después.
- RR-111 (CONFORMA, Sebastián): El hito de orden 1 de una ruta, que es su origen, está en el municipio de la ruta.

## 4. Criterios de aceptación

### Rutas por categoría y territorio

- Criterio 1: El visitante elige una categoría y un municipio o un estado.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita listar las rutas urbanas de una categoría en un municipio o en un estado.
  - Entonces: El visitante elige una categoría y un municipio o un estado.
- Criterio 2: El sistema lista las rutas que incluyen al menos un hito de esa categoría y cuyo origen está en el municipio o el estado elegido.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita listar las rutas urbanas de una categoría en un municipio o en un estado.
  - Entonces: El sistema lista las rutas que incluyen al menos un hito de esa categoría y cuyo origen está en el municipio o el estado elegido.
- Criterio 3: Aparecen las rutas fijas y las rutas dinámicas públicas; las dinámicas privadas no aparecen.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita listar las rutas urbanas de una categoría en un municipio o en un estado.
  - Entonces: Aparecen las rutas fijas y las rutas dinámicas públicas; las dinámicas privadas no aparecen.
- Criterio 4: Si no hay rutas que cumplan el filtro, el sistema lo indica.
  - Dado: El visitante inició sesión con su rol; no hay rutas que cumplan el filtro.
  - Cuando: El visitante solicita listar las rutas urbanas de una categoría en un municipio o en un estado.
  - Entonces: El sistema lo indica.

### Registrar ruta fija

- Criterio 1: La ruta es una secuencia ordenada de hitos y paradas con número de orden; el primero es el origen y el último el destino.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar rutas fijas.
  - Entonces: La ruta es una secuencia ordenada de hitos y paradas con número de orden; el primero es el origen y el último el destino.
- Criterio 2: La ruta tiene al menos un hito de origen y uno de destino.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar rutas fijas.
  - Entonces: La ruta tiene al menos un hito de origen y uno de destino.
- Criterio 3: No hay dos elementos con el mismo número de orden en la ruta.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar rutas fijas.
  - Entonces: No hay dos elementos con el mismo número de orden en la ruta.
- Criterio 4: La ruta tiene duración estimada, mejor horario de inicio y nivel de dificultad.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar rutas fijas.
  - Entonces: La ruta tiene duración estimada, mejor horario de inicio y nivel de dificultad.
- Criterio 5: Si registro una ruta con el mismo nombre en el mismo municipio y estado de origen que otra, el sistema la rechaza. El mismo nombre sí se acepta en otro municipio o estado.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador registra una ruta con el mismo nombre en el mismo municipio y estado de origen que otra.
  - Entonces: El sistema la rechaza. El mismo nombre sí se acepta en otro municipio o estado.

### Consultar ruta fija

- Criterio 1: Puedo ver el listado de las rutas fijas.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de ruta fija.
  - Cuando: El administrador solicita consultar las rutas fijas.
  - Entonces: Puedo ver el listado de las rutas fijas.
- Criterio 2: Puedo abrir una ruta y ver su secuencia, su duración, su horario, su dificultad y sus guías.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de ruta fija.
  - Cuando: El administrador solicita consultar las rutas fijas.
  - Entonces: Puedo abrir una ruta y ver su secuencia, su duración, su horario, su dificultad y sus guías.

### Modificar ruta fija

- Criterio 1: Puedo cambiar sus datos y su secuencia de hitos y paradas.
  - Dado: El administrador inició sesión con su rol; existe la ruta fija que se va a modificar.
  - Cuando: El administrador solicita modificar una ruta fija.
  - Entonces: Puedo cambiar sus datos y su secuencia de hitos y paradas.
- Criterio 2: La ruta sigue teniendo al menos un hito de origen y uno de destino.
  - Dado: El administrador inició sesión con su rol; existe la ruta fija que se va a modificar.
  - Cuando: El administrador solicita modificar una ruta fija.
  - Entonces: La ruta sigue teniendo al menos un hito de origen y uno de destino.
- Criterio 3: No puede haber dos elementos con el mismo número de orden.
  - Dado: El administrador inició sesión con su rol; existe la ruta fija que se va a modificar.
  - Cuando: El administrador solicita modificar una ruta fija.
  - Entonces: No puede haber dos elementos con el mismo número de orden.
- Criterio 4: La ruta sigue teniendo duración estimada, mejor horario de inicio y nivel de dificultad.
  - Dado: El administrador inició sesión con su rol; existe la ruta fija que se va a modificar.
  - Cuando: El administrador solicita modificar una ruta fija.
  - Entonces: La ruta sigue teniendo duración estimada, mejor horario de inicio y nivel de dificultad.
- Criterio 5: Si el nombre queda igual al de otra ruta del mismo municipio y estado de origen, el sistema lo rechaza; en otro municipio o estado se acepta.
  - Dado: El administrador inició sesión con su rol; existe la ruta fija que se va a modificar; el nombre queda igual al de otra ruta del mismo municipio y estado de origen.
  - Cuando: El administrador solicita modificar una ruta fija.
  - Entonces: El sistema lo rechaza; en otro municipio o estado se acepta.

### Eliminar ruta fija

- Criterio 1: Si la ruta no tiene recorridos, experiencias ni contrataciones de guía, se elimina.
  - Dado: El administrador inició sesión con su rol; existe la ruta fija que se va a eliminar; la ruta no tiene recorridos, experiencias ni contrataciones de guía.
  - Cuando: El administrador solicita eliminar rutas fijas.
  - Entonces: Se elimina.
- Criterio 2: Si tiene recorridos, experiencias o contrataciones de guía, no se borra, porque se conserva su historial.
  - Dado: El administrador inició sesión con su rol; existe la ruta fija que se va a eliminar; la ruta fija tiene recorridos, experiencias o contrataciones de guía.
  - Cuando: El administrador solicita eliminar rutas fijas.
  - Entonces: No se borra, porque se conserva su historial.

### Registrar ruta dinámica

- Criterio 1: El visitante elige los hitos, el orden de visita y su preferencia de transporte.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita registrar sus propias rutas, eligiendo hitos, orden de visita y transporte.
  - Entonces: El visitante elige los hitos, el orden de visita y su preferencia de transporte.
- Criterio 2: La ruta tiene al menos un hito de origen y uno de destino.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita registrar sus propias rutas, eligiendo hitos, orden de visita y transporte.
  - Entonces: La ruta tiene al menos un hito de origen y uno de destino.
- Criterio 3: El visitante marca la ruta como privada o pública; la privada solo la ve él y la pública aparece en el catálogo.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita registrar sus propias rutas, eligiendo hitos, orden de visita y transporte.
  - Entonces: El visitante marca la ruta como privada o pública; la privada solo la ve él y la pública aparece en el catálogo.
- Criterio 4: Si registro una ruta con el mismo nombre en el mismo municipio y estado de origen que otra, el sistema la rechaza.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante registra una ruta con el mismo nombre en el mismo municipio y estado de origen que otra.
  - Entonces: El sistema la rechaza.
- Criterio 5: La ruta tiene duración estimada, mejor horario de inicio y nivel de dificultad, como toda ruta; el visitante puede dejarlos en blanco.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita registrar sus propias rutas, eligiendo hitos, orden de visita y transporte.
  - Entonces: La ruta tiene duración estimada, mejor horario de inicio y nivel de dificultad, como toda ruta; el visitante puede dejarlos en blanco.

### Consultar ruta dinámica

- Criterio 1: Veo la lista de mis rutas, privadas y públicas.
  - Dado: El visitante inició sesión con su rol; existe al menos un registro de ruta dinámica.
  - Cuando: El visitante solicita consultar sus rutas.
  - Entonces: Veo la lista de mis rutas, privadas y públicas.
- Criterio 2: Puedo abrir una ruta y ver sus hitos, su orden y mi preferencia de transporte.
  - Dado: El visitante inició sesión con su rol; existe al menos un registro de ruta dinámica.
  - Cuando: El visitante solicita consultar sus rutas.
  - Entonces: Puedo abrir una ruta y ver sus hitos, su orden y mi preferencia de transporte.

### Modificar ruta dinámica

- Criterio 1: Solo el visitante que creó la ruta puede modificarla.
  - Dado: El visitante inició sesión con su rol; existe la ruta dinámica que se va a modificar.
  - Cuando: El visitante solicita modificar sus rutas.
  - Entonces: Solo el visitante que creó la ruta puede modificarla.
- Criterio 2: Puedo cambiar los hitos, el orden de visita y la preferencia de transporte.
  - Dado: El visitante inició sesión con su rol; existe la ruta dinámica que se va a modificar.
  - Cuando: El visitante solicita modificar sus rutas.
  - Entonces: Puedo cambiar los hitos, el orden de visita y la preferencia de transporte.
- Criterio 3: Puedo pasar la ruta de privada a pública o al revés.
  - Dado: El visitante inició sesión con su rol; existe la ruta dinámica que se va a modificar.
  - Cuando: El visitante solicita modificar sus rutas.
  - Entonces: Puedo pasar la ruta de privada a pública o al revés.
- Criterio 4: La ruta sigue teniendo al menos un hito de origen y uno de destino.
  - Dado: El visitante inició sesión con su rol; existe la ruta dinámica que se va a modificar.
  - Cuando: El visitante solicita modificar sus rutas.
  - Entonces: La ruta sigue teniendo al menos un hito de origen y uno de destino.
- Criterio 5: Si el nombre queda igual al de otra ruta del mismo municipio y estado de origen, el sistema lo rechaza.
  - Dado: El visitante inició sesión con su rol; existe la ruta dinámica que se va a modificar; el nombre queda igual al de otra ruta del mismo municipio y estado de origen.
  - Cuando: El visitante solicita modificar sus rutas.
  - Entonces: El sistema lo rechaza.

### Eliminar ruta dinámica

- Criterio 1: Solo el visitante que creó la ruta puede eliminarla.
  - Dado: El visitante inició sesión con su rol; existe la ruta dinámica que se va a eliminar.
  - Cuando: El visitante solicita eliminar sus rutas.
  - Entonces: Solo el visitante que creó la ruta puede eliminarla.
- Criterio 2: Si la ruta no tiene recorridos ni experiencias, se elimina.
  - Dado: El visitante inició sesión con su rol; existe la ruta dinámica que se va a eliminar; la ruta no tiene recorridos ni experiencias.
  - Cuando: El visitante solicita eliminar sus rutas.
  - Entonces: Se elimina.
- Criterio 3: Si la ruta ya tiene recorridos o una experiencia transcurre sobre ella, no se borra, porque se conserva su historial.
  - Dado: El visitante inició sesión con su rol; existe la ruta dinámica que se va a eliminar; la ruta ya tiene recorridos o una experiencia transcurre sobre ella.
  - Cuando: El visitante solicita eliminar sus rutas.
  - Entonces: No se borra, porque se conserva su historial.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `ruta_turistica`, `ruta_fija`, `ruta_dinamica`, `conforma`, `usa`, `crea`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Claves foráneas hacia tablas de otras capacidades (se crean en `database/02_claves/`, después de todas las tablas):
  - `municipio` (MUNICIPIO), de `territorio-catalogo` (Javier).
  - `hito` (HITO), de `patrimonio-hitos` (Javier).
  - `parada_transporte` (PARADA_TRANSPORTE), de `movilidad-paradas` (Sebastián).
  - `visitante` (VISITANTE), de `actores-identidades` (Valeria).
- Roles que actúan: `rol_visitante`, `rol_administrador`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Al escribir la prueba SQL de cada historia, indicar qué RR de la sección 3 cubre.
- Acordar con Javier y Valeria los datos de prueba de las tablas referidas.

## 8. Decisiones de implementación

Aprobadas por Sebastián Armas el 27/11/2026, junto con la especificación. No agregan reglas: aplican las RR, los criterios y las [convenciones de base de datos](../../../docs/development/database-conventions.md) a casos que el informe no detalla.

- Registrar o modificar una ruta envía su secuencia completa de hitos y paradas. RR-34, RR-108, RR-109, RR-110 y RR-111 se verifican al confirmar la transacción. El `orden` es una sola numeración para hitos (`conforma`) y paradas (`usa`).
- RR-35 (fija o dinámica, exactamente una) y RR-22 y RR-36 (creador de la dinámica) también se verifican al confirmar.
- Claves foráneas: `ruta_fija`, `ruta_dinamica`, `conforma`, `usa`, `crea` y `sirve` → ruta con `ON DELETE CASCADE` (datos propios y adscripciones de guías); `sobre`, `transcurre` (Valeria) y `contrata_ruta` con `ON DELETE RESTRICT` (HU-17.4, criterio 2; HU-25.4, criterio 3); `evalua_ruta` (Javier) con `ON DELETE RESTRICT`.
- Autorización por registro: modificar o eliminar una ruta dinámica exige que `crea` la vincule con `fn_visitante_actual()`; consultar rutas dinámicas devuelve solo las del visitante; HU-03 lista las rutas fijas y las dinámicas públicas.
- El nombre es único por estado y municipio entre todas las rutas, porque es la clave del modelo. Un visitante puede recibir el rechazo por una ruta de otro (HU-25.1, criterio 4); el mensaje no revela datos de esa ruta.
