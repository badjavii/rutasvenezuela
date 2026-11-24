# Especificación: movilidad vias y tramos

## 1. Objetivo

Describir las capacidades verificables de movilidad vias y tramos, según los criterios de primera entrega.

## 2. Requisitos funcionales

- Registrar vía: «Como administrador quiero registrar vías, para tener la red física sobre la que pasan las rutas.».
- Consultar vía: «Como administrador quiero consultar las vías registradas, para revisar la red física y su estado.».
- Modificar vía: «Como administrador quiero modificar los datos y el estado de una vía, para mantener la red al día.».
- Eliminar vía: «Como administrador quiero eliminar vías, para quitar las que se cargaron por error.».
- Registrar tramo: «Como administrador quiero registrar los tramos de cada vía y cómo se conectan entre sí, para poder calcular desplazamientos y desvíos.».
- Consultar tramo: «Como administrador quiero consultar los tramos de una vía y sus conexiones, para revisar la topología de la red.».
- Modificar tramo: «Como administrador quiero modificar un tramo y sus conexiones, para mantener la topología al día.».
- Eliminar tramo: «Como administrador quiero eliminar tramos, para quitar los que se cargaron por error.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). Conservar el relacional entregado.

## 4. Criterios de aceptación

### Registrar vía

- Criterio 1: Cada vía tiene nombre, tipo (calle, avenida, bulevar, caminería, sendero, puente u otro), modos de recorrido permitidos (a pie, bicicleta, transporte público o vehículo adaptado) y condiciones del terreno.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar vía»
  - Cuando: el actor solicita «Registrar vía» en esas circunstancias
  - Entonces: Cada vía tiene nombre, tipo (calle, avenida, bulevar, caminería, sendero, puente u otro), modos de recorrido permitidos (a pie, bicicleta, transporte público o vehículo adaptado) y condiciones del terreno.
- Criterio 2: La vía se ubica en un municipio y un estado.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar vía»
  - Cuando: el actor solicita «Registrar vía» en esas circunstancias
  - Entonces: La vía se ubica en un municipio y un estado.
- Criterio 3: el sistema la rechaza.
  - Dado: Se cumple la condición «registro una vía con el mismo nombre en el mismo municipio y estado que otra»
  - Cuando: el actor solicita «Registrar vía» en esas circunstancias
  - Entonces: el sistema la rechaza.
- Criterio 4: La vía tiene un estado que indica si está habilitada o tiene cierre total por mantenimiento.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar vía»
  - Cuando: el actor solicita «Registrar vía» en esas circunstancias
  - Entonces: La vía tiene un estado que indica si está habilitada o tiene cierre total por mantenimiento.

### Consultar vía

- Criterio 1: Puedo ver las vías de un municipio con su estado.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar vía»
  - Cuando: el actor solicita «Consultar vía» en esas circunstancias
  - Entonces: Puedo ver las vías de un municipio con su estado.
- Criterio 2: Puedo abrir una vía y ver su tipo, sus modos de recorrido permitidos y las condiciones del terreno.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar vía»
  - Cuando: el actor solicita «Consultar vía» en esas circunstancias
  - Entonces: Puedo abrir una vía y ver su tipo, sus modos de recorrido permitidos y las condiciones del terreno.

### Modificar vía

- Criterio 1: Puedo cambiar sus datos y su estado (habilitada o con cierre total por mantenimiento).
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar vía»
  - Cuando: el actor solicita «Modificar vía» en esas circunstancias
  - Entonces: Puedo cambiar sus datos y su estado (habilitada o con cierre total por mantenimiento).
- Criterio 2: el municipio o el estado y la vía queda con el mismo nombre que otra del mismo municipio y estado, el sistema lo rechaza.
  - Dado: Se cumple la condición «cambio el nombre»
  - Cuando: el actor solicita «Modificar vía» en esas circunstancias
  - Entonces: el municipio o el estado y la vía queda con el mismo nombre que otra del mismo municipio y estado, el sistema lo rechaza.
- Criterio 3: El tipo y los modos de recorrido siguen siendo de los valores permitidos.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar vía»
  - Cuando: el actor solicita «Modificar vía» en esas circunstancias
  - Entonces: El tipo y los modos de recorrido siguen siendo de los valores permitidos.

### Eliminar vía

- Criterio 1: se elimina junto con sus tramos, siempre que ningún tramo tenga incidencias o hitos.
  - Dado: Se cumple la condición «la vía no tiene paradas asociadas»
  - Cuando: el actor solicita «Eliminar vía» en esas circunstancias
  - Entonces: se elimina junto con sus tramos, siempre que ningún tramo tenga incidencias o hitos.
- Criterio 2: el sistema no la elimina.
  - Dado: Se cumple la condición «la vía tiene paradas asociadas»
  - Cuando: el actor solicita «Eliminar vía» en esas circunstancias
  - Entonces: el sistema no la elimina.

### Registrar tramo

- Criterio 1: Cada tramo pertenece a una vía, y una vía tiene uno o más tramos.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar tramo»
  - Cuando: el actor solicita «Registrar tramo» en esas circunstancias
  - Entonces: Cada tramo pertenece a una vía, y una vía tiene uno o más tramos.
- Criterio 2: Para cada tramo se registra si tiene desniveles o escalinatas.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar tramo»
  - Cuando: el actor solicita «Registrar tramo» en esas circunstancias
  - Entonces: Para cada tramo se registra si tiene desniveles o escalinatas.
- Criterio 3: Se registra con qué otros tramos se conecta, también de vías distintas.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar tramo»
  - Cuando: el actor solicita «Registrar tramo» en esas circunstancias
  - Entonces: Se registra con qué otros tramos se conecta, también de vías distintas.
- Criterio 4: Un tramo no se puede conectar consigo mismo.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar tramo»
  - Cuando: el actor solicita «Registrar tramo» en esas circunstancias
  - Entonces: Un tramo no se puede conectar consigo mismo.

### Consultar tramo

- Criterio 1: Puedo ver los tramos de una vía y sus conexiones.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar tramo»
  - Cuando: el actor solicita «Consultar tramo» en esas circunstancias
  - Entonces: Puedo ver los tramos de una vía y sus conexiones.

### Modificar tramo

- Criterio 1: Puedo cambiar los datos del tramo: si tiene desniveles o escalinatas.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar tramo»
  - Cuando: el actor solicita «Modificar tramo» en esas circunstancias
  - Entonces: Puedo cambiar los datos del tramo: si tiene desniveles o escalinatas.
- Criterio 2: Puedo agregar o quitar conexiones con otros tramos.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar tramo»
  - Cuando: el actor solicita «Modificar tramo» en esas circunstancias
  - Entonces: Puedo agregar o quitar conexiones con otros tramos.
- Criterio 3: Un tramo no se puede conectar consigo mismo.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar tramo»
  - Cuando: el actor solicita «Modificar tramo» en esas circunstancias
  - Entonces: Un tramo no se puede conectar consigo mismo.

### Eliminar tramo

- Criterio 1: paradas ni hitos, se elimina.
  - Dado: Se cumple la condición «el tramo no tiene incidencias»
  - Cuando: el actor solicita «Eliminar tramo» en esas circunstancias
  - Entonces: paradas ni hitos, se elimina.
- Criterio 2: paradas o hitos, el sistema no lo elimina.
  - Dado: Se cumple la condición «tiene incidencias»
  - Cuando: el actor solicita «Eliminar tramo» en esas circunstancias
  - Entonces: paradas o hitos, el sistema no lo elimina.

## 5. Restricciones técnicas

PostgreSQL contiene invariantes. Arquitectura web de tres capas; stack de referencia provisional.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar nuevas reglas sin fuente.

## 7. Decisiones abiertas

Revisar contratos entre capas y confirmar tecnología de API/UI.
