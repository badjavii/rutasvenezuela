# Especificación: actores comercios

## 1. Objetivo

Describir el comportamiento verificable de actores comercios, conforme a la primera entrega.

## 2. Requisitos funcionales

- Registrar comercio: «Como administrador quiero registrar comercios y aliados de servicio, para que puedan ofrecer sus servicios en las rutas.».
- Consultar comercio: «Como administrador quiero consultar los comercios registrados, para saber quiénes ofrecen servicios.».
- Modificar comercio: «Como administrador quiero modificar los datos de un comercio, para mantenerlos al día.».
- Eliminar comercio: «Como administrador quiero eliminar comercios, para quitar los que ya no participan.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). No modificar las restricciones del modelo relacional validado.

## 4. Criterios de aceptación

### Registrar comercio

- Criterio 1: Se identifica por su RIF jurídico; si ya existe, el sistema lo rechaza.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar comercio»
  - Cuando: el actor solicita «Registrar comercio» en esas circunstancias
  - Entonces: Se identifica por su RIF jurídico; si ya existe, el sistema lo rechaza.
- Criterio 2: Tiene razón social, categoría comercial (gastronómico, sanitario o alquiler de equipos), aforo, número de permiso sanitario, horario de atención y cuenta bancaria.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar comercio»
  - Cuando: el actor solicita «Registrar comercio» en esas circunstancias
  - Entonces: Tiene razón social, categoría comercial (gastronómico, sanitario o alquiler de equipos), aforo, número de permiso sanitario, horario de atención y cuenta bancaria.
- Criterio 3: el sistema lo rechaza.
  - Dado: Se cumple la condición «la razón social ya existe»
  - Cuando: el actor solicita «Registrar comercio» en esas circunstancias
  - Entonces: el sistema lo rechaza.
- Criterio 4: Tiene una contraseña para entrar con su RIF.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar comercio»
  - Cuando: el actor solicita «Registrar comercio» en esas circunstancias
  - Entonces: Tiene una contraseña para entrar con su RIF.
- Criterio 5: La ubicación del comercio se guarda como latitud, longitud y elevación en decimales.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar comercio»
  - Cuando: el actor solicita «Registrar comercio» en esas circunstancias
  - Entonces: La ubicación del comercio se guarda como latitud, longitud y elevación en decimales.

### Consultar comercio

- Criterio 1: Puedo ver el listado de los comercios.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar comercio»
  - Cuando: el actor solicita «Consultar comercio» en esas circunstancias
  - Entonces: Puedo ver el listado de los comercios.
- Criterio 2: Puedo abrir un comercio y ver todos sus datos.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar comercio»
  - Cuando: el actor solicita «Consultar comercio» en esas circunstancias
  - Entonces: Puedo abrir un comercio y ver todos sus datos.

### Modificar comercio

- Criterio 1: Puedo cambiar cualquier dato del comercio.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar comercio»
  - Cuando: el actor solicita «Modificar comercio» en esas circunstancias
  - Entonces: Puedo cambiar cualquier dato del comercio.
- Criterio 2: el sistema lo rechaza.
  - Dado: Se cumple la condición «cambio el RIF por uno que ya existe»
  - Cuando: el actor solicita «Modificar comercio» en esas circunstancias
  - Entonces: el sistema lo rechaza.
- Criterio 3: el sistema lo rechaza.
  - Dado: Se cumple la condición «cambio la razón social por una que ya existe»
  - Cuando: el actor solicita «Modificar comercio» en esas circunstancias
  - Entonces: el sistema lo rechaza.
- Criterio 4: La ubicación sigue guardándose como latitud, longitud y elevación en decimales.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar comercio»
  - Cuando: el actor solicita «Modificar comercio» en esas circunstancias
  - Entonces: La ubicación sigue guardándose como latitud, longitud y elevación en decimales.

### Eliminar comercio

- Criterio 1: se elimina.
  - Dado: Se cumple la condición «el comercio no tiene experiencias ni credenciales asociadas»
  - Cuando: el actor solicita «Eliminar comercio» en esas circunstancias
  - Entonces: se elimina.
- Criterio 2: el sistema no lo elimina.
  - Dado: Se cumple la condición «tiene experiencias o credenciales asociadas»
  - Cuando: el actor solicita «Eliminar comercio» en esas circunstancias
  - Entonces: el sistema no lo elimina.

## 5. Restricciones técnicas

PostgreSQL gestiona integridad y reglas. Aplicación web de tres capas; framework por confirmar.

## 6. Fuera de alcance

Cambios de modelo relacional, funcionalidades no documentadas o patrones anticipados.

## 7. Decisiones abiertas

Validar contratos entre capas y elección de stack de aplicación.
