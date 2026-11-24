# Especificación: territorio catalogo

## 1. Objetivo

Describir los comportamientos verificables de territorio catalogo, según la primera entrega.

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

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). Mantener modelo relacional validado sin inventar invariantes.

## 4. Criterios de aceptación

### Registrar estado

- Criterio 1: el sistema lo rechaza.
  - Dado: Se cumple la condición «registro un estado con un nombre que ya existe»
  - Cuando: el actor solicita «Registrar estado» en esas circunstancias
  - Entonces: el sistema lo rechaza.

### Consultar estado

- Criterio 1: Puedo ver el listado de los estados.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar estado»
  - Cuando: el actor solicita «Consultar estado» en esas circunstancias
  - Entonces: Puedo ver el listado de los estados.

### Modificar estado

- Criterio 1: Puedo cambiar el nombre del estado.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar estado»
  - Cuando: el actor solicita «Modificar estado» en esas circunstancias
  - Entonces: Puedo cambiar el nombre del estado.
- Criterio 2: el sistema lo rechaza.
  - Dado: Se cumple la condición «cambio el nombre por uno que ya existe»
  - Cuando: el actor solicita «Modificar estado» en esas circunstancias
  - Entonces: el sistema lo rechaza.

### Eliminar estado

- Criterio 1: se elimina.
  - Dado: Se cumple la condición «el estado no tiene municipios»
  - Cuando: el actor solicita «Eliminar estado» en esas circunstancias
  - Entonces: se elimina.
- Criterio 2: el sistema no lo elimina.
  - Dado: Se cumple la condición «tiene municipios»
  - Cuando: el actor solicita «Eliminar estado» en esas circunstancias
  - Entonces: el sistema no lo elimina.

### Registrar municipio

- Criterio 1: Cada municipio pertenece a un estado.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar municipio»
  - Cuando: el actor solicita «Registrar municipio» en esas circunstancias
  - Entonces: Cada municipio pertenece a un estado.
- Criterio 2: Se acepta el mismo nombre de municipio en estados distintos (por ejemplo, Sucre o Libertador).
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar municipio»
  - Cuando: el actor solicita «Registrar municipio» en esas circunstancias
  - Entonces: Se acepta el mismo nombre de municipio en estados distintos (por ejemplo, Sucre o Libertador).
- Criterio 3: el sistema lo rechaza.
  - Dado: Se cumple la condición «registro un municipio con un nombre que ya existe en el mismo estado»
  - Cuando: el actor solicita «Registrar municipio» en esas circunstancias
  - Entonces: el sistema lo rechaza.

### Consultar municipio

- Criterio 1: Puedo ver los municipios de un estado.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar municipio»
  - Cuando: el actor solicita «Consultar municipio» en esas circunstancias
  - Entonces: Puedo ver los municipios de un estado.

### Modificar municipio

- Criterio 1: Puedo cambiar el nombre o el estado del municipio.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar municipio»
  - Cuando: el actor solicita «Modificar municipio» en esas circunstancias
  - Entonces: Puedo cambiar el nombre o el estado del municipio.
- Criterio 2: el sistema lo rechaza.
  - Dado: Se cumple la condición «el municipio queda con el mismo nombre que otro del mismo estado»
  - Cuando: el actor solicita «Modificar municipio» en esas circunstancias
  - Entonces: el sistema lo rechaza.
- Criterio 3: Se acepta el mismo nombre en estados distintos.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar municipio»
  - Cuando: el actor solicita «Modificar municipio» en esas circunstancias
  - Entonces: Se acepta el mismo nombre en estados distintos.

### Eliminar municipio

- Criterio 1: rutas, vías, instituciones con competencia sobre él ni guías asignados, se elimina.
  - Dado: Se cumple la condición «el municipio no tiene parroquias»
  - Cuando: el actor solicita «Eliminar municipio» en esas circunstancias
  - Entonces: rutas, vías, instituciones con competencia sobre él ni guías asignados, se elimina.
- Criterio 2: el sistema no lo elimina.
  - Dado: Se cumple la condición «tiene alguna de esas»
  - Cuando: el actor solicita «Eliminar municipio» en esas circunstancias
  - Entonces: el sistema no lo elimina.

### Registrar parroquia

- Criterio 1: Cada parroquia pertenece a un municipio.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar parroquia»
  - Cuando: el actor solicita «Registrar parroquia» en esas circunstancias
  - Entonces: Cada parroquia pertenece a un municipio.
- Criterio 2: Se acepta el mismo nombre de parroquia en municipios distintos (por ejemplo, San José).
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar parroquia»
  - Cuando: el actor solicita «Registrar parroquia» en esas circunstancias
  - Entonces: Se acepta el mismo nombre de parroquia en municipios distintos (por ejemplo, San José).
- Criterio 3: el sistema la rechaza.
  - Dado: Se cumple la condición «registro una parroquia con un nombre que ya existe en el mismo municipio»
  - Cuando: el actor solicita «Registrar parroquia» en esas circunstancias
  - Entonces: el sistema la rechaza.

### Consultar parroquia

- Criterio 1: Puedo ver las parroquias de un municipio.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar parroquia»
  - Cuando: el actor solicita «Consultar parroquia» en esas circunstancias
  - Entonces: Puedo ver las parroquias de un municipio.

### Modificar parroquia

- Criterio 1: Puedo cambiar el nombre o el municipio de la parroquia.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar parroquia»
  - Cuando: el actor solicita «Modificar parroquia» en esas circunstancias
  - Entonces: Puedo cambiar el nombre o el municipio de la parroquia.
- Criterio 2: el sistema lo rechaza.
  - Dado: Se cumple la condición «la parroquia queda con el mismo nombre que otra del mismo municipio»
  - Cuando: el actor solicita «Modificar parroquia» en esas circunstancias
  - Entonces: el sistema lo rechaza.
- Criterio 3: Se acepta el mismo nombre en municipios distintos.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar parroquia»
  - Cuando: el actor solicita «Modificar parroquia» en esas circunstancias
  - Entonces: Se acepta el mismo nombre en municipios distintos.

### Eliminar parroquia

- Criterio 1: se elimina.
  - Dado: Se cumple la condición «la parroquia no tiene hitos»
  - Cuando: el actor solicita «Eliminar parroquia» en esas circunstancias
  - Entonces: se elimina.
- Criterio 2: el sistema no la elimina.
  - Dado: Se cumple la condición «tiene hitos»
  - Cuando: el actor solicita «Eliminar parroquia» en esas circunstancias
  - Entonces: el sistema no la elimina.

## 5. Restricciones técnicas

PostgreSQL gestiona integridad y reglas. Web de tres capas; tecnologías de API/UI provisionales.

## 6. Fuera de alcance

Modificar el modelo relacional o desarrollar capacidades ajenas.

## 7. Decisiones abiertas

Aprobación humana de contratos y stack final.
