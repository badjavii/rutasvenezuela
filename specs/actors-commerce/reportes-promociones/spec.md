# Especificación: reportes promociones

## 1. Objetivo

Describir el comportamiento verificable de reportes promociones: 1 historia de Valeria Loreto (RP-2), conforme a la primera entrega.

## 2. Requisitos funcionales

- Desempeño de experiencias y credenciales: «Como comercio o guía quiero ver los cupos usados, las credenciales canjeadas y el monto de cada experiencia, para medir mis ventas.».

## 3. Reglas de negocio

Restricciones del relacional asociadas a las historias de esta capacidad, tomadas del [catálogo RR](../../../docs/requirements/relational-rules.md). La asociación RR↔HU es preliminar: se confirma al escribir la prueba SQL de cada regla. No se modifican las restricciones del modelo relacional validado.

- RR-52 (RP-2): El comercio que promueve cada experiencia es distinto de null.
- RR-53 (RP-2): El guía que dirige cada experiencia es distinto de null.
- RR-54 (RP-2): La ruta de cada experiencia es distinta de null.
- RR-55 (RP-2): El visitante que adquiere cada credencial es distinto de null.
- RR-56 (RP-2): La experiencia que ampara cada credencial es distinta de null.
- RR-57 (RP-2): El hito reservado es distinto de null.
- RR-58 (RP-2): El comercio reservado es distinto de null.
- RR-59 (RP-2): La cuenta que valida cada credencial es distinta de null.
- RR-69 (RP-2): Toda experiencia la promueve un comercio.
- RR-70 (RP-2): Toda experiencia la dirige un guía.
- RR-71 (RP-2): Toda experiencia transcurre sobre una ruta.
- RR-72 (RP-2): Toda credencial la adquirió un visitante.
- RR-73 (RP-2): Toda credencial tiene la cuenta que la valida.
- RR-119 (RP-2): Dos horarios del mismo comercio y el mismo día no se cruzan.
- RR-122 (RP-2): La fecha de vencimiento es posterior a la de activación y el cupo máximo es de al menos una persona.
- RR-123 (RP-2): El precio total es positivo y el descuento está entre 0 y 100.
- RR-124 (RP-2): Toda experiencia tiene al menos una fila en INCLUYE o en INCLUYE_COMERCIO.
- RR-125 (RP-2): Todo hito que incluye una experiencia está en CONFORMA para la ruta de su fila en TRANSCURRE.
- RR-126 (RP-2): Una experiencia transcurre sobre una ruta fija o sobre una ruta dinámica pública.
- RR-127 (RP-2): El estado es emitido, canjeado, cancelado o vencido; el monto abonado no es negativo; hay al menos un beneficiario.
- RR-128 (RP-2): Toda credencial tiene fila en RESERVA_HITO o en RESERVA_COMERCIO, exactamente en una.
- RR-129 (RP-2): La cuenta que valida una credencial está en CUENTA_COMERCIO o en CUENTA_GUIA.
- RR-130 (RP-2): Si una credencial reserva un comercio y la valida la cuenta de un comercio, esa cuenta es la del comercio reservado.
- RR-131 (RP-2): Una credencial con estadoCredencial = 'emitido' no tiene su fechaHoraProgramada en el pasado. Si la fecha pasó sin canjearse, está vencida. (Solo en lenguaje natural: necesita la fecha de hoy, que el lenguaje de restricciones del curso no define.)
- RR-132 (RP-2): Si una credencial tiene fila en RESERVA_COMERCIO, hay una fila de DISPONIBLE del mismo rifJuridico cuyo diaSemana es el día de la semana de fechaHoraProgramada y cuyo rango de horaApertura a horaCierre contiene su hora. Lo mismo con RESERVA_HITO y ABRE, salvo que el hito tenga libreAcceso verdadero. (Solo en lenguaje natural: necesita el día de la semana y la hora de una fecha, que el lenguaje de restricciones del curso no define.)
- RR-133 (RP-2): Si una credencial se adquiere bajo una experiencia, el hito o el comercio que reserva está en INCLUYE o en INCLUYE_COMERCIO para esa experiencia.
- RR-134 (RP-2): Si una credencial se adquiere bajo una experiencia, sus beneficiarios no superan el cupo de la experiencia y su fecha programada está entre la activación y el vencimiento de la experiencia.

## 4. Criterios de aceptación

### Desempeño de experiencias y credenciales

- Criterio 1: Cada comercio o guía ve solo sus propias experiencias.
  - Dado: El comercio o guía inició sesión con su rol.
  - Cuando: El comercio o guía solicita ver los cupos usados, las credenciales canjeadas y el monto de cada experiencia.
  - Entonces: Cada comercio o guía ve solo sus propias experiencias.
- Criterio 2: Para cada experiencia muestra su cupo máximo y los días que faltan para su vencimiento.
  - Dado: El comercio o guía inició sesión con su rol.
  - Cuando: El comercio o guía solicita ver los cupos usados, las credenciales canjeadas y el monto de cada experiencia.
  - Entonces: Para cada experiencia muestra su cupo máximo y los días que faltan para su vencimiento.
- Criterio 3: Muestra cuántas credenciales amparadas por la experiencia se emitieron, canjearon, cancelaron y vencieron, y el monto total abonado, sin contar las credenciales canceladas.
  - Dado: El comercio o guía inició sesión con su rol.
  - Cuando: El comercio o guía solicita ver los cupos usados, las credenciales canjeadas y el monto de cada experiencia.
  - Entonces: Muestra cuántas credenciales amparadas por la experiencia se emitieron, canjearon, cancelaron y vencieron, y el monto total abonado, sin contar las credenciales canceladas.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- No tiene tablas propias: consulta tablas de otras capacidades con funciones o vistas de solo lectura.
- Roles que actúan: `rol_guia`, `rol_comercio`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Confirmar con su responsable la asociación preliminar RR↔HU de la sección 3.
- Definir qué tablas de otras capacidades lee cada consulta o reporte.
