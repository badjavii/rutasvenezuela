# Especificación: actores identidades

## 1. Objetivo

Describir el comportamiento verificable de actores identidades: 9 historias de Valeria Loreto (HU-09.1, HU-09.2, HU-09.3, HU-09.4, HU-26.1, HU-26.2, HU-26.3, HU-26.4, HU-08), conforme a la primera entrega.

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

RR del capítulo 7 de la primera entrega escritas sobre las tablas de esta capacidad (la relación del ∀ exterior), con su autor. La fórmula completa está en el informe y el texto en el [catálogo RR](../../../docs/requirements/relational-rules.md). No se modifican las restricciones del modelo relacional validado.

- RR-46 (CUENTA_VISITANTE, Valeria): La cuenta de cada visitante es distinta de null y es clave alterna: una cuenta es de un solo visitante.
- RR-49 (CUENTA_FUNCIONARIO, Valeria): La cuenta de cada funcionario es distinta de null y es clave alterna: una cuenta es de un solo funcionario.
- RR-50 (PERTENECE_A, Valeria): El ente al que pertenece cada funcionario es distinto de null.
- RR-51 (CUENTA_ADMINISTRADOR, Valeria): La cuenta de cada administrador es distinta de null y es clave alterna: una cuenta es de un solo administrador.
- RR-61 (CUENTA, Valeria): Cada cuenta es de exactamente un actor: está en al menos una de las seis relaciones CUENTA_<ACTOR> y nunca en dos a la vez.
- RR-62 (VISITANTE, Valeria): Todo visitante tiene su cuenta.
- RR-64 (FUNCIONARIO, Valeria): Todo funcionario tiene su cuenta.
- RR-65 (ADMINISTRADOR, Valeria): Todo administrador tiene su cuenta.
- RR-68 (FUNCIONARIO, Valeria): Todo funcionario pertenece a un ente.
- RR-120 (VISITANTE, Valeria): El grupo sanguíneo es uno de los ocho grupos ABO con su factor Rh.

## 4. Criterios de aceptación

### Registrar visitante

- Criterio 1: Se identifica por su cédula de identidad o pasaporte; si ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar visitantes.
  - Entonces: Se identifica por su cédula de identidad o pasaporte; si ya existe, el sistema lo rechaza.
- Criterio 2: Tiene nombres, apellidos, país de origen, idioma nativo, teléfono de emergencia, grupo sanguíneo y especificaciones de accesibilidad física o sensorial.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar visitantes.
  - Entonces: Tiene nombres, apellidos, país de origen, idioma nativo, teléfono de emergencia, grupo sanguíneo y especificaciones de accesibilidad física o sensorial.
- Criterio 3: Tiene una contraseña para entrar con su identificador.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar visitantes.
  - Entonces: Tiene una contraseña para entrar con su identificador.
- Criterio 4: Una misma persona puede ser visitante y también tener otro rol, por ejemplo guía.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar visitantes.
  - Entonces: Una misma persona puede ser visitante y también tener otro rol, por ejemplo guía.

### Consultar visitante

- Criterio 1: Puedo ver el listado de todos los visitantes.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de visitante.
  - Cuando: El administrador solicita consultar los visitantes registrados.
  - Entonces: Puedo ver el listado de todos los visitantes.
- Criterio 2: Puedo abrir un visitante y ver todos sus datos.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de visitante.
  - Cuando: El administrador solicita consultar los visitantes registrados.
  - Entonces: Puedo abrir un visitante y ver todos sus datos.

### Modificar visitante

- Criterio 1: Puedo cambiar cualquier dato del visitante.
  - Dado: El administrador inició sesión con su rol; existe el visitante que se va a modificar.
  - Cuando: El administrador solicita modificar los datos de un visitante.
  - Entonces: Puedo cambiar cualquier dato del visitante.
- Criterio 2: Si cambio su cédula o pasaporte por uno que ya existe, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe el visitante que se va a modificar.
  - Cuando: El administrador cambia su cédula o pasaporte por uno que ya existe.
  - Entonces: El sistema lo rechaza.

### Eliminar visitante

- Criterio 1: Si el visitante no tiene recorridos, evaluaciones, credenciales, rutas propias ni contrataciones de guía, se elimina.
  - Dado: El administrador inició sesión con su rol; existe el visitante que se va a eliminar; el visitante no tiene recorridos, evaluaciones, credenciales, rutas propias ni contrataciones de guía.
  - Cuando: El administrador solicita eliminar visitantes.
  - Entonces: Se elimina.
- Criterio 2: Si tiene recorridos, evaluaciones, credenciales, rutas propias o contrataciones de guía, el sistema no lo elimina y me indica qué lo impide.
  - Dado: El administrador inició sesión con su rol; existe el visitante que se va a eliminar; el visitante tiene recorridos, evaluaciones, credenciales, rutas propias o contrataciones de guía.
  - Cuando: El administrador solicita eliminar visitantes.
  - Entonces: El sistema no lo elimina y me indica qué lo impide.

### Registrar funcionario

- Criterio 1: Cada funcionario se identifica por su cédula y tiene nombre, cargo y una contraseña.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar las cuentas de los funcionarios públicos.
  - Entonces: Cada funcionario se identifica por su cédula y tiene nombre, cargo y una contraseña.
- Criterio 2: Cada funcionario queda asociado a la institución a la que pertenece.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar las cuentas de los funcionarios públicos.
  - Entonces: Cada funcionario queda asociado a la institución a la que pertenece.

### Consultar funcionario

- Criterio 1: Puedo ver los funcionarios de una institución.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de funcionario.
  - Cuando: El administrador solicita consultar los funcionarios.
  - Entonces: Puedo ver los funcionarios de una institución.

### Modificar funcionario

- Criterio 1: Puedo cambiar los datos del funcionario y su institución.
  - Dado: El administrador inició sesión con su rol; existe el funcionario que se va a modificar.
  - Cuando: El administrador solicita modificar las cuentas de los funcionarios.
  - Entonces: Puedo cambiar los datos del funcionario y su institución.
- Criterio 2: El funcionario sigue asociado a una institución.
  - Dado: El administrador inició sesión con su rol; existe el funcionario que se va a modificar.
  - Cuando: El administrador solicita modificar las cuentas de los funcionarios.
  - Entonces: El funcionario sigue asociado a una institución.

### Eliminar funcionario

- Criterio 1: Si el funcionario no verificó ni cerró ninguna incidencia, se elimina su cuenta.
  - Dado: El administrador inició sesión con su rol; existe el funcionario que se va a eliminar; el funcionario no verificó ni cerró ninguna incidencia.
  - Cuando: El administrador solicita eliminar cuentas de funcionarios.
  - Entonces: Se elimina su cuenta.
- Criterio 2: Si verificó o cerró alguna incidencia, el sistema no lo elimina y me indica qué lo impide.
  - Dado: El administrador inició sesión con su rol; existe el funcionario que se va a eliminar; el funcionario verificó o cerró alguna incidencia.
  - Cuando: El administrador solicita eliminar cuentas de funcionarios.
  - Entonces: El sistema no lo elimina y me indica qué lo impide.

### Iniciar sesión

- Criterio 1: El actor entra con su identificador (cédula o pasaporte del visitante, RIF del comercio o de la institución, registro del guía, o cédula del funcionario o del administrador) y su contraseña.
  - Dado: El actor tiene una cuenta con su identificador y su contraseña.
  - Cuando: El actor solicita entrar con su identificador y su contraseña.
  - Entonces: El actor entra con su identificador (cédula o pasaporte del visitante, RIF del comercio o de la institución, registro del guía, o cédula del funcionario o del administrador) y su contraseña.
- Criterio 2: Si el identificador o la contraseña no coinciden, el sistema rechaza la entrada.
  - Dado: El actor tiene una cuenta con su identificador y su contraseña; el identificador o la contraseña no coinciden.
  - Cuando: El actor solicita entrar con su identificador y su contraseña.
  - Entonces: El sistema rechaza la entrada.
- Criterio 3: Si la persona tiene varios roles, usa la plataforma con el rol de la interacción que esté haciendo.
  - Dado: El actor tiene una cuenta con su identificador y su contraseña; la persona tiene varios roles.
  - Cuando: El actor solicita entrar con su identificador y su contraseña.
  - Entonces: Usa la plataforma con el rol de la interacción que esté haciendo.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `cuenta`, `visitante`, `cuenta_visitante`, `funcionario`, `cuenta_funcionario`, `pertenece_a`, `administrador`, `cuenta_administrador`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Claves foráneas hacia tablas de otras capacidades (se crean en `database/02_claves/`, después de todas las tablas):
  - `ente_publico` (ENTE_PUBLICO), de `instituciones-entes` (Javier).
- Roles que actúan: `rol_visitante`, `rol_guia`, `rol_comercio`, `rol_ente`, `rol_funcionario`, `rol_administrador`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Al escribir la prueba SQL de cada historia, indicar qué RR de la sección 3 cubre.
- Acordar con Javier los datos de prueba de las tablas referidas.
- Inicio de sesión: `CUENTA` guarda `idCuenta` y `contrasena`, y el identificador de cada actor (cédula o pasaporte, RIF, registro del guía) está en su relación, enlazada por `CUENTA_<ACTOR>`. Falta decidir cómo sabe el sistema en qué relación buscar el identificador que escribe el actor (HU-08, criterio 1).
- Persona con varios roles (HU-08, criterio 3): cómo elige el rol de la interacción al iniciar sesión.
