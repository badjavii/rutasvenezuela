# Especificación: movilidad paradas

## 1. Objetivo

Describir las capacidades verificables de movilidad paradas, según los criterios de primera entrega.

## 2. Requisitos funcionales

- Registrar parada de transporte: «Como administrador quiero registrar paradas de transporte, para que los visitantes sepan dónde hacer transbordo.».
- Consultar parada de transporte: «Como administrador quiero consultar las paradas de transporte, para revisar dónde están y en qué estado.».
- Modificar parada de transporte: «Como administrador quiero modificar los datos y el estado de una parada, para mantenerla al día.».
- Eliminar parada de transporte: «Como administrador quiero eliminar paradas de transporte, para quitar las que ya no existen.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). Conservar el relacional entregado.

## 4. Criterios de aceptación

### Registrar parada de transporte

- Criterio 1: el sistema la rechaza.
  - Dado: Se cumple la condición «registro una parada con un código oficial de terminal que ya existe»
  - Cuando: el actor solicita «Registrar parada de transporte» en esas circunstancias
  - Entonces: el sistema la rechaza.
- Criterio 2: Cada parada tiene nombre, modalidad, tarifa básica en moneda nacional, nivel de adecuación para discapacidad, horario de apertura y cierre, frecuencia de paso en minutos y aforo máximo.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar parada de transporte»
  - Cuando: el actor solicita «Registrar parada de transporte» en esas circunstancias
  - Entonces: Cada parada tiene nombre, modalidad, tarifa básica en moneda nacional, nivel de adecuación para discapacidad, horario de apertura y cierre, frecuencia de paso en minutos y aforo máximo.
- Criterio 3: Su estado es uno de estos: activa, en mantenimiento o fuera de servicio.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar parada de transporte»
  - Cuando: el actor solicita «Registrar parada de transporte» en esas circunstancias
  - Entonces: Su estado es uno de estos: activa, en mantenimiento o fuera de servicio.
- Criterio 4: Se indica si tiene techo, iluminación nocturna, taquilla, vigilancia y estacionamiento o resguardo de bicicletas.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar parada de transporte»
  - Cuando: el actor solicita «Registrar parada de transporte» en esas circunstancias
  - Entonces: Se indica si tiene techo, iluminación nocturna, taquilla, vigilancia y estacionamiento o resguardo de bicicletas.
- Criterio 5: La ubicación se guarda como latitud, longitud y elevación en decimales.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar parada de transporte»
  - Cuando: el actor solicita «Registrar parada de transporte» en esas circunstancias
  - Entonces: La ubicación se guarda como latitud, longitud y elevación en decimales.
- Criterio 6: No se puede registrar una parada sin asociarla a una vía habilitada, indicando el tramo de esa vía donde está.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar parada de transporte»
  - Cuando: el actor solicita «Registrar parada de transporte» en esas circunstancias
  - Entonces: No se puede registrar una parada sin asociarla a una vía habilitada, indicando el tramo de esa vía donde está.
- Criterio 7: Se puede asociar la parada con los hitos cercanos y con las rutas que usan su modalidad.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar parada de transporte»
  - Cuando: el actor solicita «Registrar parada de transporte» en esas circunstancias
  - Entonces: Se puede asociar la parada con los hitos cercanos y con las rutas que usan su modalidad.

### Consultar parada de transporte

- Criterio 1: Puedo ver las paradas de una vía con su estado.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar parada de transporte»
  - Cuando: el actor solicita «Consultar parada de transporte» en esas circunstancias
  - Entonces: Puedo ver las paradas de una vía con su estado.
- Criterio 2: Puedo abrir una parada y ver todos sus datos, su tramo, los hitos cercanos y las rutas asociadas.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar parada de transporte»
  - Cuando: el actor solicita «Consultar parada de transporte» en esas circunstancias
  - Entonces: Puedo abrir una parada y ver todos sus datos, su tramo, los hitos cercanos y las rutas asociadas.

### Modificar parada de transporte

- Criterio 1: Puedo cambiar sus datos y su estado: activa, en mantenimiento o fuera de servicio.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar parada de transporte»
  - Cuando: el actor solicita «Modificar parada de transporte» en esas circunstancias
  - Entonces: Puedo cambiar sus datos y su estado: activa, en mantenimiento o fuera de servicio.
- Criterio 2: el sistema lo rechaza.
  - Dado: Se cumple la condición «cambio el código oficial de terminal por uno que ya existe»
  - Cuando: el actor solicita «Modificar parada de transporte» en esas circunstancias
  - Entonces: el sistema lo rechaza.
- Criterio 3: La parada sigue asociada a una vía habilitada, con el tramo donde está; si la cambio de vía, también indico el tramo.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar parada de transporte»
  - Cuando: el actor solicita «Modificar parada de transporte» en esas circunstancias
  - Entonces: La parada sigue asociada a una vía habilitada, con el tramo donde está; si la cambio de vía, también indico el tramo.
- Criterio 4: Puedo cambiar los hitos cercanos y las rutas asociadas.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar parada de transporte»
  - Cuando: el actor solicita «Modificar parada de transporte» en esas circunstancias
  - Entonces: Puedo cambiar los hitos cercanos y las rutas asociadas.

### Eliminar parada de transporte

- Criterio 1: se elimina.
  - Dado: Se cumple la condición «la parada no forma parte de ninguna ruta»
  - Cuando: el actor solicita «Eliminar parada de transporte» en esas circunstancias
  - Entonces: se elimina.
- Criterio 2: el sistema no la elimina.
  - Dado: Se cumple la condición «forma parte de una ruta»
  - Cuando: el actor solicita «Eliminar parada de transporte» en esas circunstancias
  - Entonces: el sistema no la elimina.

## 5. Restricciones técnicas

PostgreSQL contiene invariantes. Arquitectura web de tres capas; stack de referencia provisional.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar nuevas reglas sin fuente.

## 7. Decisiones abiertas

Revisar contratos entre capas y confirmar tecnología de API/UI.
