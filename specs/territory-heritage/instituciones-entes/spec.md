# Especificación: instituciones entes

## 1. Objetivo

Describir los comportamientos verificables de instituciones entes, derivados de la primera entrega.

## 2. Requisitos funcionales

- Registrar institución: «Como administrador quiero registrar instituciones y entes públicos patrimoniales, para que participen en la verificación de incidencias y el mantenimiento.».
- Consultar institución: «Como administrador quiero consultar las instituciones registradas, para saber qué entes participan.».
- Modificar institución: «Como administrador quiero modificar los datos de una institución, para mantenerlos al día.».
- Eliminar institución: «Como administrador quiero eliminar instituciones, para quitar las que ya no participan.».

## 3. Reglas de negocio

Consultar [reglas relacionales](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). No inferir nuevas invariantes.

## 4. Criterios de aceptación

### Registrar institución

- Criterio 1: Se identifica por su RIF institucional; si ya existe, el sistema la rechaza.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar institución»
  - Cuando: el actor solicita «Registrar institución» en esas circunstancias
  - Entonces: Se identifica por su RIF institucional; si ya existe, el sistema la rechaza.
- Criterio 2: Tiene denominación oficial, nivel territorial de competencia, nombre del funcionario enlace y decreto oficial de adscripción patrimonial.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar institución»
  - Cuando: el actor solicita «Registrar institución» en esas circunstancias
  - Entonces: Tiene denominación oficial, nivel territorial de competencia, nombre del funcionario enlace y decreto oficial de adscripción patrimonial.
- Criterio 3: el sistema la rechaza.
  - Dado: Se cumple la condición «la denominación oficial ya existe»
  - Cuando: el actor solicita «Registrar institución» en esas circunstancias
  - Entonces: el sistema la rechaza.
- Criterio 4: Tiene una contraseña para entrar con su RIF.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar institución»
  - Cuando: el actor solicita «Registrar institución» en esas circunstancias
  - Entonces: Tiene una contraseña para entrar con su RIF.
- Criterio 5: Se registran los municipios sobre los que tiene competencia, uno o varios.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar institución»
  - Cuando: el actor solicita «Registrar institución» en esas circunstancias
  - Entonces: Se registran los municipios sobre los que tiene competencia, uno o varios.

### Consultar institución

- Criterio 1: Puedo ver el listado de las instituciones.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar institución»
  - Cuando: el actor solicita «Consultar institución» en esas circunstancias
  - Entonces: Puedo ver el listado de las instituciones.
- Criterio 2: Puedo abrir una institución y ver todos sus datos y los municipios sobre los que tiene competencia.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar institución»
  - Cuando: el actor solicita «Consultar institución» en esas circunstancias
  - Entonces: Puedo abrir una institución y ver todos sus datos y los municipios sobre los que tiene competencia.

### Modificar institución

- Criterio 1: Puedo cambiar cualquier dato de la institución y sus municipios de competencia.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar institución»
  - Cuando: el actor solicita «Modificar institución» en esas circunstancias
  - Entonces: Puedo cambiar cualquier dato de la institución y sus municipios de competencia.
- Criterio 2: el sistema lo rechaza.
  - Dado: Se cumple la condición «cambio el RIF por uno que ya existe»
  - Cuando: el actor solicita «Modificar institución» en esas circunstancias
  - Entonces: el sistema lo rechaza.
- Criterio 3: el sistema lo rechaza.
  - Dado: Se cumple la condición «cambio la denominación oficial por una que ya existe»
  - Cuando: el actor solicita «Modificar institución» en esas circunstancias
  - Entonces: el sistema lo rechaza.

### Eliminar institución

- Criterio 1: se elimina.
  - Dado: Se cumple la condición «la institución no tiene funcionarios asociados»
  - Cuando: el actor solicita «Eliminar institución» en esas circunstancias
  - Entonces: se elimina.
- Criterio 2: el sistema no la elimina.
  - Dado: Se cumple la condición «tiene funcionarios asociados»
  - Cuando: el actor solicita «Eliminar institución» en esas circunstancias
  - Entonces: el sistema no la elimina.

## 5. Restricciones técnicas

PostgreSQL concentra integridad y transacciones. Aplicación web de tres capas; stack de aplicación provisional.

## 6. Fuera de alcance

Cambiar el modelo relacional validado o incorporar reglas ajenas al informe.

## 7. Decisiones abiertas

Revisión y aprobación humana del contrato y elección definitiva del backend.
