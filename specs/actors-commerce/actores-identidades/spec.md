# Especificación: actores identidades

## 1. Objetivo

Describir el comportamiento verificable de actores identidades, conforme a la primera entrega.

## 2. Requisitos funcionales

- Registrar visitante: «Como administrador quiero registrar visitantes, para que puedan usar la plataforma.».
- Consultar visitante: «Como administrador quiero consultar los visitantes registrados, para revisar quiénes usan la plataforma.».
- Modificar visitante: «Como administrador quiero modificar los datos de un visitante, para mantenerlos al día.».
- Eliminar visitante: «Como administrador quiero eliminar visitantes, para quitar los registros que ya no corresponden.».
- Registrar funcionario: «Como administrador quiero registrar las cuentas de los funcionarios públicos, para que las autoridades puedan verificar y cerrar incidencias.».
- Consultar funcionario: «Como administrador quiero consultar los funcionarios, para saber quiénes representan a cada institución.».
- Modificar funcionario: «Como administrador quiero modificar las cuentas de los funcionarios, para mantener sus datos al día.».
- Eliminar funcionario: «Como administrador quiero eliminar cuentas de funcionarios, para quitar las de quienes ya no participan.».
- Iniciar sesión: «Como actor del sistema quiero entrar con mi identificador y mi contraseña, para usar la plataforma según mi rol.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). No modificar las restricciones del modelo relacional validado.

## 4. Criterios de aceptación

### Registrar visitante

- Criterio 1: Se identifica por su cédula de identidad o pasaporte; si ya existe, el sistema lo rechaza.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar visitante»
  - Cuando: el actor solicita «Registrar visitante» en esas circunstancias
  - Entonces: Se identifica por su cédula de identidad o pasaporte; si ya existe, el sistema lo rechaza.
- Criterio 2: Tiene nombres, apellidos, país de origen, idioma nativo, teléfono de emergencia, grupo sanguíneo y especificaciones de accesibilidad física o sensorial.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar visitante»
  - Cuando: el actor solicita «Registrar visitante» en esas circunstancias
  - Entonces: Tiene nombres, apellidos, país de origen, idioma nativo, teléfono de emergencia, grupo sanguíneo y especificaciones de accesibilidad física o sensorial.
- Criterio 3: Tiene una contraseña para entrar con su identificador.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar visitante»
  - Cuando: el actor solicita «Registrar visitante» en esas circunstancias
  - Entonces: Tiene una contraseña para entrar con su identificador.
- Criterio 4: Una misma persona puede ser visitante y también tener otro rol, por ejemplo guía.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar visitante»
  - Cuando: el actor solicita «Registrar visitante» en esas circunstancias
  - Entonces: Una misma persona puede ser visitante y también tener otro rol, por ejemplo guía.

### Consultar visitante

- Criterio 1: Puedo ver el listado de todos los visitantes.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar visitante»
  - Cuando: el actor solicita «Consultar visitante» en esas circunstancias
  - Entonces: Puedo ver el listado de todos los visitantes.
- Criterio 2: Puedo abrir un visitante y ver todos sus datos.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar visitante»
  - Cuando: el actor solicita «Consultar visitante» en esas circunstancias
  - Entonces: Puedo abrir un visitante y ver todos sus datos.

### Modificar visitante

- Criterio 1: Puedo cambiar cualquier dato del visitante.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar visitante»
  - Cuando: el actor solicita «Modificar visitante» en esas circunstancias
  - Entonces: Puedo cambiar cualquier dato del visitante.
- Criterio 2: el sistema lo rechaza.
  - Dado: Se cumple la condición «cambio su cédula o pasaporte por uno que ya existe»
  - Cuando: el actor solicita «Modificar visitante» en esas circunstancias
  - Entonces: el sistema lo rechaza.

### Eliminar visitante

- Criterio 1: evaluaciones, credenciales, rutas propias ni contrataciones de guía, se elimina.
  - Dado: Se cumple la condición «el visitante no tiene recorridos»
  - Cuando: el actor solicita «Eliminar visitante» en esas circunstancias
  - Entonces: evaluaciones, credenciales, rutas propias ni contrataciones de guía, se elimina.
- Criterio 2: evaluaciones, credenciales, rutas propias o contrataciones de guía, el sistema no lo elimina y me indica qué lo impide.
  - Dado: Se cumple la condición «tiene recorridos»
  - Cuando: el actor solicita «Eliminar visitante» en esas circunstancias
  - Entonces: evaluaciones, credenciales, rutas propias o contrataciones de guía, el sistema no lo elimina y me indica qué lo impide.

### Registrar funcionario

- Criterio 1: Cada funcionario se identifica por su cédula y tiene nombre, cargo y una contraseña.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar funcionario»
  - Cuando: el actor solicita «Registrar funcionario» en esas circunstancias
  - Entonces: Cada funcionario se identifica por su cédula y tiene nombre, cargo y una contraseña.
- Criterio 2: Cada funcionario queda asociado a la institución a la que pertenece.
  - Dado: Se cumplen las precondiciones del comportamiento «Registrar funcionario»
  - Cuando: el actor solicita «Registrar funcionario» en esas circunstancias
  - Entonces: Cada funcionario queda asociado a la institución a la que pertenece.

### Consultar funcionario

- Criterio 1: Puedo ver los funcionarios de una institución.
  - Dado: Se cumplen las precondiciones del comportamiento «Consultar funcionario»
  - Cuando: el actor solicita «Consultar funcionario» en esas circunstancias
  - Entonces: Puedo ver los funcionarios de una institución.

### Modificar funcionario

- Criterio 1: Puedo cambiar los datos del funcionario y su institución.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar funcionario»
  - Cuando: el actor solicita «Modificar funcionario» en esas circunstancias
  - Entonces: Puedo cambiar los datos del funcionario y su institución.
- Criterio 2: El funcionario sigue asociado a una institución.
  - Dado: Se cumplen las precondiciones del comportamiento «Modificar funcionario»
  - Cuando: el actor solicita «Modificar funcionario» en esas circunstancias
  - Entonces: El funcionario sigue asociado a una institución.

### Eliminar funcionario

- Criterio 1: se elimina su cuenta.
  - Dado: Se cumple la condición «el funcionario no verificó ni cerró ninguna incidencia»
  - Cuando: el actor solicita «Eliminar funcionario» en esas circunstancias
  - Entonces: se elimina su cuenta.
- Criterio 2: el sistema no lo elimina y me indica qué lo impide.
  - Dado: Se cumple la condición «verificó o cerró alguna incidencia»
  - Cuando: el actor solicita «Eliminar funcionario» en esas circunstancias
  - Entonces: el sistema no lo elimina y me indica qué lo impide.

### Iniciar sesión

- Criterio 1: El actor entra con su identificador (cédula o pasaporte del visitante, RIF del comercio o de la institución, registro del guía, o cédula del funcionario o del administrador) y su contraseña.
  - Dado: Se cumplen las precondiciones del comportamiento «Iniciar sesión»
  - Cuando: el actor solicita «Iniciar sesión» en esas circunstancias
  - Entonces: El actor entra con su identificador (cédula o pasaporte del visitante, RIF del comercio o de la institución, registro del guía, o cédula del funcionario o del administrador) y su contraseña.
- Criterio 2: el sistema rechaza la entrada.
  - Dado: Se cumple la condición «el identificador o la contraseña no coinciden»
  - Cuando: el actor solicita «Iniciar sesión» en esas circunstancias
  - Entonces: el sistema rechaza la entrada.
- Criterio 3: usa la plataforma con el rol de la interacción que esté haciendo.
  - Dado: Se cumple la condición «la persona tiene varios roles»
  - Cuando: el actor solicita «Iniciar sesión» en esas circunstancias
  - Entonces: usa la plataforma con el rol de la interacción que esté haciendo.

## 5. Restricciones técnicas

PostgreSQL gestiona integridad y reglas. Aplicación web de tres capas; framework por confirmar.

## 6. Fuera de alcance

Cambios de modelo relacional, funcionalidades no documentadas o patrones anticipados.

## 7. Decisiones abiertas

Validar contratos entre capas y elección de stack de aplicación.
