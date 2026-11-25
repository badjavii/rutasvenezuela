# Especificación: guias contrataciones

## 1. Objetivo

Describir el comportamiento verificable de guias contrataciones: 6 historias de Sebastián Armas (HU-29.1, HU-29.2, HU-29.3, HU-29.4, HU-28, VA-3), conforme a la primera entrega.

## 2. Requisitos funcionales

- Registrar guía: «Como administrador quiero registrar guías y baquianos comunitarios, para que puedan acompañar las rutas.».
- Consultar guía: «Como administrador quiero consultar los guías registrados, para saber quiénes pueden acompañar las rutas.».
- Modificar guía: «Como administrador quiero modificar los datos de un guía, para mantenerlos al día.».
- Eliminar guía: «Como administrador quiero eliminar guías, para quitar los registros que ya no corresponden.».
- Asignar guías a una ruta fija: «Como administrador quiero adscribir guías locales a una ruta fija, para ofrecer acompañamiento y narración histórica.».
- Contratación de guía: «Como visitante quiero contratar un guía local para una ruta fija, para recorrerla acompañado y con narración histórica.».

## 3. Reglas de negocio

Restricciones del relacional asociadas a las historias de esta capacidad, tomadas del [catálogo RR](../../../docs/requirements/relational-rules.md). La asociación RR↔HU es preliminar: se confirma al escribir la prueba SQL de cada regla. No se modifican las restricciones del modelo relacional validado.

- RR-23 (HU-29.1, HU-29.2, HU-29.3, HU-29.4): La cuenta de cada guía es distinta de null y es clave alterna: una cuenta es de un solo guía.
- RR-24 (VA-3): El visitante de cada contratación es distinto de null.
- RR-25 (VA-3): El guía de cada contratación es distinto de null.
- RR-26 (VA-3): La ruta de cada contratación es distinta de null.
- RR-37 (HU-29.1, HU-29.2, HU-29.3, HU-29.4): Todo guía tiene su cuenta.
- RR-38 (HU-29.1, HU-29.2, HU-29.3, HU-29.4): Todo guía habla al menos un idioma.
- RR-39 (HU-29.1, HU-29.2, HU-29.3, HU-29.4): Todo guía tiene al menos una especialidad.
- RR-40 (HU-29.1, HU-29.2, HU-29.3, HU-29.4, HU-28): Todo guía tiene al menos una zona asignada.
- RR-41 (VA-3): Toda contratación la hace un visitante.
- RR-42 (VA-3): Toda contratación es de un guía.
- RR-43 (VA-3): Toda contratación es para una ruta fija.
- RR-116 (HU-29.1, HU-29.2, HU-29.3, HU-29.4): Los años de trayectoria no son negativos y la tarifa horaria es positiva.
- RR-117 (HU-29.1, HU-29.2, HU-29.3, HU-29.4, HU-28, VA-3): Un guía adscrito a una ruta fija tiene fila en TRABAJA con el municipio de esa ruta.
- RR-118 (HU-29.1, HU-29.2, HU-29.3, HU-29.4, HU-28, VA-3): El guía de una contratación tiene fila en SIRVE con la ruta de esa contratación.

## 4. Criterios de aceptación

### Registrar guía

- Criterio 1: Se identifica por su número de Registro Turístico Nacional junto con su código de licencia; si esa combinación ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar guías y baquianos comunitarios.
  - Entonces: Se identifica por su número de Registro Turístico Nacional junto con su código de licencia; si esa combinación ya existe, el sistema lo rechaza.
- Criterio 2: Tiene acreditación oficial, años de trayectoria, especialidades temáticas, idiomas, tarifa horaria y zona geográfica asignada.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar guías y baquianos comunitarios.
  - Entonces: Tiene acreditación oficial, años de trayectoria, especialidades temáticas, idiomas, tarifa horaria y zona geográfica asignada.
- Criterio 3: Tiene una contraseña para entrar con su identificador.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar guías y baquianos comunitarios.
  - Entonces: Tiene una contraseña para entrar con su identificador.
- Criterio 4: Una misma persona puede ser guía y también visitante.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar guías y baquianos comunitarios.
  - Entonces: Una misma persona puede ser guía y también visitante.

### Consultar guía

- Criterio 1: Puedo ver el listado de los guías.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de guía.
  - Cuando: El administrador solicita consultar los guías registrados.
  - Entonces: Puedo ver el listado de los guías.
- Criterio 2: Puedo abrir un guía y ver todos sus datos.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de guía.
  - Cuando: El administrador solicita consultar los guías registrados.
  - Entonces: Puedo abrir un guía y ver todos sus datos.

### Modificar guía

- Criterio 1: Puedo cambiar cualquier dato del guía.
  - Dado: El administrador inició sesión con su rol; existe el guía que se va a modificar.
  - Cuando: El administrador solicita modificar los datos de un guía.
  - Entonces: Puedo cambiar cualquier dato del guía.
- Criterio 2: Si cambio el número de Registro Turístico Nacional o el código de licencia y esa combinación ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe el guía que se va a modificar.
  - Cuando: El administrador cambia el número de Registro Turístico Nacional o el código de licencia y esa combinación ya existe.
  - Entonces: El sistema lo rechaza.

### Eliminar guía

- Criterio 1: Si el guía no está adscrito a ninguna ruta, no dirige experiencias, no tiene contrataciones y no valida credenciales, se elimina.
  - Dado: El administrador inició sesión con su rol; existe el guía que se va a eliminar; el guía no está adscrito a ninguna ruta, no dirige experiencias, no tiene contrataciones y no valida credenciales.
  - Cuando: El administrador solicita eliminar guías.
  - Entonces: Se elimina.
- Criterio 2: Si tiene alguna de esas, el sistema no lo elimina.
  - Dado: El administrador inició sesión con su rol; existe el guía que se va a eliminar; el guía tiene alguna de esas.
  - Cuando: El administrador solicita eliminar guías.
  - Entonces: El sistema no lo elimina.

### Asignar guías a una ruta fija

- Criterio 1: A una ruta fija se le pueden adscribir uno o más guías.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita adscribir guías locales a una ruta fija.
  - Entonces: A una ruta fija se le pueden adscribir uno o más guías.
- Criterio 2: Solo se pueden adscribir guías que ya están registrados en el sistema.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita adscribir guías locales a una ruta fija.
  - Entonces: Solo se pueden adscribir guías que ya están registrados en el sistema.
- Criterio 3: Se puede quitar la adscripción de un guía.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita adscribir guías locales a una ruta fija.
  - Entonces: Se puede quitar la adscripción de un guía.
- Criterio 4: La ficha de la ruta fija muestra sus guías adscritos.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita adscribir guías locales a una ruta fija.
  - Entonces: La ficha de la ruta fija muestra sus guías adscritos.

### Contratación de guía

- Criterio 1: Al elegir una ruta fija, el visitante ve los guías adscritos a ella con sus idiomas, especialidades y tarifa horaria.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: Al elegir una ruta fija.
  - Entonces: El visitante ve los guías adscritos a ella con sus idiomas, especialidades y tarifa horaria.
- Criterio 2: Solo se pueden contratar guías adscritos a esa ruta fija.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita contratar un guía local para una ruta fija.
  - Entonces: Solo se pueden contratar guías adscritos a esa ruta fija.
- Criterio 3: La contratación queda registrada con el visitante, el guía, la ruta y la fecha.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita contratar un guía local para una ruta fija.
  - Entonces: La contratación queda registrada con el visitante, el guía, la ruta y la fecha.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `guia`, `guia_idioma`, `guia_especialidad`, `trabaja`, `sirve`, `contratacion`, `contrata_visitante`, `contrata_guia`, `contrata_ruta`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Claves foráneas hacia tablas de otras capacidades (se crean en `database/02_claves/`, después de todas las tablas):
  - `cuenta` (CUENTA), de `actores-identidades` (Valeria).
  - `municipio` (MUNICIPIO), de `territorio-catalogo` (Javier).
  - `ruta_fija` (RUTA_FIJA), de `rutas-gestion` (Sebastián).
  - `visitante` (VISITANTE), de `actores-identidades` (Valeria).
- Roles que actúan: `rol_visitante`, `rol_administrador`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Confirmar con su responsable la asociación preliminar RR↔HU de la sección 3.
- Acordar con Javier y Valeria los datos de prueba de las tablas referidas.
