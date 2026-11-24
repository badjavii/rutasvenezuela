# Especificación: guias contrataciones

## 1. Objetivo

Describir los comportamientos verificables de guias contrataciones, según la primera entrega.

## 2. Requisitos funcionales

- Registrar guía: «Como administrador quiero registrar guías y baquianos comunitarios, para que puedan acompañar las rutas.».
- Consultar guía: «Como administrador quiero consultar los guías registrados, para saber quiénes pueden acompañar las rutas.».
- Modificar guía: «Como administrador quiero modificar los datos de un guía, para mantenerlos al día.».
- Eliminar guía: «Como administrador quiero eliminar guías, para quitar los registros que ya no corresponden.».
- Asignar guías a una ruta fija: «Como administrador quiero adscribir guías locales a una ruta fija, para ofrecer acompañamiento y narración histórica.».
- Contratación de guía: «Como visitante quiero contratar un guía local para una ruta fija, para recorrerla acompañado y con narración histórica.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). Mantener modelo relacional validado sin inventar invariantes.

## 4. Criterios de aceptación

### Registrar guía

- Criterio 1: Se identifica por su número de Registro Turístico Nacional junto con su código de licencia; si esa combinación ya existe, el sistema lo rechaza.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar guía»
  - Cuando: el actor solicita «Registrar guía» en esas circunstancias
  - Entonces: Se identifica por su número de Registro Turístico Nacional junto con su código de licencia; si esa combinación ya existe, el sistema lo rechaza.
- Criterio 2: Tiene acreditación oficial, años de trayectoria, especialidades temáticas, idiomas, tarifa horaria y zona geográfica asignada.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar guía»
  - Cuando: el actor solicita «Registrar guía» en esas circunstancias
  - Entonces: Tiene acreditación oficial, años de trayectoria, especialidades temáticas, idiomas, tarifa horaria y zona geográfica asignada.
- Criterio 3: Tiene una contraseña para entrar con su identificador.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar guía»
  - Cuando: el actor solicita «Registrar guía» en esas circunstancias
  - Entonces: Tiene una contraseña para entrar con su identificador.
- Criterio 4: Una misma persona puede ser guía y también visitante.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar guía»
  - Cuando: el actor solicita «Registrar guía» en esas circunstancias
  - Entonces: Una misma persona puede ser guía y también visitante.

### Consultar guía

- Criterio 1: Puedo ver el listado de los guías.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar guía»
  - Cuando: el actor solicita «Consultar guía» en esas circunstancias
  - Entonces: Puedo ver el listado de los guías.
- Criterio 2: Puedo abrir un guía y ver todos sus datos.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar guía»
  - Cuando: el actor solicita «Consultar guía» en esas circunstancias
  - Entonces: Puedo abrir un guía y ver todos sus datos.

### Modificar guía

- Criterio 1: Puedo cambiar cualquier dato del guía.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar guía»
  - Cuando: el actor solicita «Modificar guía» en esas circunstancias
  - Entonces: Puedo cambiar cualquier dato del guía.
- Criterio 2: el sistema lo rechaza.
  - Dado: Se cumple la condición «cambio el número de Registro Turístico Nacional o el código de licencia y esa combinación ya existe»
  - Cuando: el actor solicita «Modificar guía» en esas circunstancias
  - Entonces: el sistema lo rechaza.

### Eliminar guía

- Criterio 1: no dirige experiencias, no tiene contrataciones y no valida credenciales, se elimina.
  - Dado: Se cumple la condición «el guía no está adscrito a ninguna ruta»
  - Cuando: el actor solicita «Eliminar guía» en esas circunstancias
  - Entonces: no dirige experiencias, no tiene contrataciones y no valida credenciales, se elimina.
- Criterio 2: el sistema no lo elimina.
  - Dado: Se cumple la condición «tiene alguna de esas»
  - Cuando: el actor solicita «Eliminar guía» en esas circunstancias
  - Entonces: el sistema no lo elimina.

### Asignar guías a una ruta fija

- Criterio 1: A una ruta fija se le pueden adscribir uno o más guías.
  - Dado: Se cumplen las precondiciones del comportamiento «Asignar guías a una ruta fija»
  - Cuando: el actor solicita «Asignar guías a una ruta fija» en esas circunstancias
  - Entonces: A una ruta fija se le pueden adscribir uno o más guías.
- Criterio 2: Solo se pueden adscribir guías que ya están registrados en el sistema.
  - Dado: Se cumplen las precondiciones del comportamiento «Asignar guías a una ruta fija»
  - Cuando: el actor solicita «Asignar guías a una ruta fija» en esas circunstancias
  - Entonces: Solo se pueden adscribir guías que ya están registrados en el sistema.
- Criterio 3: Se puede quitar la adscripción de un guía.
  - Dado: Se cumplen las precondiciones del comportamiento «Asignar guías a una ruta fija»
  - Cuando: el actor solicita «Asignar guías a una ruta fija» en esas circunstancias
  - Entonces: Se puede quitar la adscripción de un guía.
- Criterio 4: La ficha de la ruta fija muestra sus guías adscritos.
  - Dado: Se cumplen las precondiciones del comportamiento «Asignar guías a una ruta fija»
  - Cuando: el actor solicita «Asignar guías a una ruta fija» en esas circunstancias
  - Entonces: La ficha de la ruta fija muestra sus guías adscritos.

### Contratación de guía

- Criterio 1: Al elegir una ruta fija, el visitante ve los guías adscritos a ella con sus idiomas, especialidades y tarifa horaria.
  - Dado: Se cumplen las precondiciones del comportamiento «Contratación de guía»
  - Cuando: el actor solicita «Contratación de guía» en esas circunstancias
  - Entonces: Al elegir una ruta fija, el visitante ve los guías adscritos a ella con sus idiomas, especialidades y tarifa horaria.
- Criterio 2: Solo se pueden contratar guías adscritos a esa ruta fija.
  - Dado: Se cumplen las precondiciones del comportamiento «Contratación de guía»
  - Cuando: el actor solicita «Contratación de guía» en esas circunstancias
  - Entonces: Solo se pueden contratar guías adscritos a esa ruta fija.
- Criterio 3: La contratación queda registrada con el visitante, el guía, la ruta y la fecha.
  - Dado: Se cumplen las precondiciones del comportamiento «Contratación de guía»
  - Cuando: el actor solicita «Contratación de guía» en esas circunstancias
  - Entonces: La contratación queda registrada con el visitante, el guía, la ruta y la fecha.

## 5. Restricciones técnicas

PostgreSQL gestiona integridad y reglas. Web de tres capas; tecnologías de API/UI provisionales.

## 6. Fuera de alcance

Modificar el modelo relacional o desarrollar capacidades ajenas.

## 7. Decisiones abiertas

Aprobación humana de contratos y stack final.
