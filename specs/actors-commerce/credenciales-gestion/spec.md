# Especificación: credenciales gestion

## 1. Objetivo

Describir el comportamiento verificable de credenciales gestion: 5 historias de Valeria Loreto (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27), conforme a la primera entrega.

## 2. Requisitos funcionales

- Validar credencial: «Como comercio o guía quiero validar la autenticidad de una credencial digital, para saber si puedo darle acceso al visitante.».
- Adquirir credencial digital: «Como visitante quiero adquirir una credencial digital, para entrar a un recinto pagado o reservar un servicio.».
- Consultar credencial digital: «Como visitante quiero consultar mis credenciales digitales, para saber cuáles tengo y en qué estado están.».
- Cancelar credencial digital: «Como visitante quiero cancelar una credencial digital, para no usar una reserva que ya no necesito. Este es el borrado del CRUD: la credencial no se modifica ni se elimina, se cancela.».
- Canjear credencial: «Como comercio o guía quiero canjear la credencial de un visitante, para darle acceso.».

## 3. Reglas de negocio

Restricciones del relacional asociadas a las historias de esta capacidad, tomadas del [catálogo RR](../../../docs/requirements/relational-rules.md). La asociación RR↔HU es preliminar: se confirma al escribir la prueba SQL de cada regla. No se modifican las restricciones del modelo relacional validado.

- RR-55 (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27): El visitante que adquiere cada credencial es distinto de null.
- RR-56 (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27): La experiencia que ampara cada credencial es distinta de null.
- RR-57 (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27): El hito reservado es distinto de null.
- RR-58 (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27): El comercio reservado es distinto de null.
- RR-59 (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27): La cuenta que valida cada credencial es distinta de null.
- RR-72 (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27): Toda credencial la adquirió un visitante.
- RR-73 (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27): Toda credencial tiene la cuenta que la valida.
- RR-127 (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27): El estado es emitido, canjeado, cancelado o vencido; el monto abonado no es negativo; hay al menos un beneficiario.
- RR-128 (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27): Toda credencial tiene fila en RESERVA_HITO o en RESERVA_COMERCIO, exactamente en una.
- RR-129 (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27): La cuenta que valida una credencial está en CUENTA_COMERCIO o en CUENTA_GUIA.
- RR-130 (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27): Si una credencial reserva un comercio y la valida la cuenta de un comercio, esa cuenta es la del comercio reservado.
- RR-131 (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27): Una credencial con estadoCredencial = 'emitido' no tiene su fechaHoraProgramada en el pasado. Si la fecha pasó sin canjearse, está vencida. (Solo en lenguaje natural: necesita la fecha de hoy, que el lenguaje de restricciones del curso no define.)
- RR-132 (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27): Si una credencial tiene fila en RESERVA_COMERCIO, hay una fila de DISPONIBLE del mismo rifJuridico cuyo diaSemana es el día de la semana de fechaHoraProgramada y cuyo rango de horaApertura a horaCierre contiene su hora. Lo mismo con RESERVA_HITO y ABRE, salvo que el hito tenga libreAcceso verdadero. (Solo en lenguaje natural: necesita el día de la semana y la hora de una fecha, que el lenguaje de restricciones del curso no define.)
- RR-133 (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27): Si una credencial se adquiere bajo una experiencia, el hito o el comercio que reserva está en INCLUYE o en INCLUYE_COMERCIO para esa experiencia.
- RR-134 (HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27): Si una credencial se adquiere bajo una experiencia, sus beneficiarios no superan el cupo de la experiencia y su fecha programada está entre la activación y el vencimiento de la experiencia.

## 4. Criterios de aceptación

### Validar credencial

- Criterio 1: Al ingresar un código de credencial, el sistema indica si existe y en qué estado está: emitido, canjeado, cancelado o vencido.
  - Dado: El comercio o guía inició sesión con su rol.
  - Cuando: Al ingresar un código de credencial.
  - Entonces: El sistema indica si existe y en qué estado está: emitido, canjeado, cancelado o vencido.
- Criterio 2: La credencial solo se considera válida si está emitida y la fecha y hora programadas corresponden al horario autorizado.
  - Dado: El comercio o guía inició sesión con su rol.
  - Cuando: El comercio o guía solicita validar la autenticidad de una credencial digital.
  - Entonces: La credencial solo se considera válida si está emitida y la fecha y hora programadas corresponden al horario autorizado.
- Criterio 3: Si el código no existe, el sistema indica que la credencial no es auténtica.
  - Dado: El comercio o guía inició sesión con su rol; el código no existe.
  - Cuando: El comercio o guía solicita validar la autenticidad de una credencial digital.
  - Entonces: El sistema indica que la credencial no es auténtica.

### Adquirir credencial digital

- Criterio 1: El sistema genera un código alfanumérico de verificación único.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita adquirir una credencial digital.
  - Entonces: El sistema genera un código alfanumérico de verificación único.
- Criterio 2: La credencial tiene fecha y hora programadas para la visita, monto abonado y cantidad de beneficiarios.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita adquirir una credencial digital.
  - Entonces: La credencial tiene fecha y hora programadas para la visita, monto abonado y cantidad de beneficiarios.
- Criterio 3: Se vincula al visitante que la adquiere, al hito o comercio (servicio) reservado y al aliado comercial o guía que validará la entrada.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita adquirir una credencial digital.
  - Entonces: Se vincula al visitante que la adquiere, al hito o comercio (servicio) reservado y al aliado comercial o guía que validará la entrada.
- Criterio 4: Si la credencial se adquiere bajo una experiencia promocional, queda vinculada a ella; si no, queda sin experiencia.
  - Dado: El visitante inició sesión con su rol; la credencial se adquiere bajo una experiencia promocional.
  - Cuando: El visitante solicita adquirir una credencial digital.
  - Entonces: Queda vinculada a ella; si no, queda sin experiencia.
- Criterio 5: Al emitirse queda en estado emitido.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita adquirir una credencial digital.
  - Entonces: Al emitirse queda en estado emitido.

### Consultar credencial digital

- Criterio 1: Veo la lista de mis credenciales con su estado.
  - Dado: El visitante inició sesión con su rol; existe al menos un registro de credencial digital.
  - Cuando: El visitante solicita consultar sus credenciales digitales.
  - Entonces: Veo la lista de mis credenciales con su estado.
- Criterio 2: Si pasa la fecha programada sin canjearse, la credencial aparece como vencida.
  - Dado: El visitante inició sesión con su rol; existe al menos un registro de credencial digital; pasa la fecha programada sin canjearse.
  - Cuando: El visitante solicita consultar sus credenciales digitales.
  - Entonces: La credencial aparece como vencida.

### Cancelar credencial digital

- Criterio 1: Puedo cancelar una credencial emitida; pasa a estado cancelado y ya no se puede canjear.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita cancelar una credencial digital.
  - Entonces: Puedo cancelar una credencial emitida; pasa a estado cancelado y ya no se puede canjear.
- Criterio 2: Si la credencial ya fue canjeada, está vencida o ya está cancelada, el sistema no me deja cancelarla.
  - Dado: El visitante inició sesión con su rol; la credencial ya fue canjeada, está vencida o ya está cancelada.
  - Cuando: El visitante solicita cancelar una credencial digital.
  - Entonces: El sistema no me deja cancelarla.

### Canjear credencial

- Criterio 1: Solo puede canjearla el aliado comercial o el guía asociado a esa credencial.
  - Dado: El comercio o guía inició sesión con su rol.
  - Cuando: El comercio o guía solicita canjear la credencial de un visitante.
  - Entonces: Solo puede canjearla el aliado comercial o el guía asociado a esa credencial.
- Criterio 2: Si la credencial ya fue canjeada, está cancelada o está vencida, el sistema rechaza el canje.
  - Dado: El comercio o guía inició sesión con su rol; la credencial ya fue canjeada, está cancelada o está vencida.
  - Cuando: El comercio o guía solicita canjear la credencial de un visitante.
  - Entonces: El sistema rechaza el canje.
- Criterio 3: Si se intenta canjear fuera del horario operativo autorizado para su fecha, el sistema lo rechaza.
  - Dado: El comercio o guía inició sesión con su rol.
  - Cuando: Se intenta canjear fuera del horario operativo autorizado para su fecha.
  - Entonces: El sistema lo rechaza.
- Criterio 4: Al canjearse, la credencial pasa a estado canjeado.
  - Dado: El comercio o guía inició sesión con su rol.
  - Cuando: Al canjearse.
  - Entonces: La credencial pasa a estado canjeado.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `credencial_digital`, `adquiere`, `ampara`, `reserva_hito`, `reserva_comercio`, `valida`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Claves foráneas hacia tablas de otras capacidades (se crean en `database/02_claves/`, después de todas las tablas):
  - `visitante` (VISITANTE), de `actores-identidades` (Valeria).
  - `experiencia_turistica` (EXPERIENCIA_TURISTICA), de `promociones-experiencias` (Valeria).
  - `hito` (HITO), de `patrimonio-hitos` (Javier).
  - `comercio` (COMERCIO), de `actores-comercios` (Valeria).
  - `cuenta` (CUENTA), de `actores-identidades` (Valeria).
- Roles que actúan: `rol_visitante`, `rol_guia`, `rol_comercio`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Confirmar con su responsable la asociación preliminar RR↔HU de la sección 3.
- Acordar con Javier los datos de prueba de las tablas referidas.
