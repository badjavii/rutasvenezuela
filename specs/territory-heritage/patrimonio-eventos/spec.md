# Especificación: patrimonio eventos

## 1. Objetivo

Describir el comportamiento verificable de patrimonio eventos: 4 historias de Javier Otero (HU-24.1, HU-24.2, HU-24.3, HU-24.4), conforme a la primera entrega.

## 2. Requisitos funcionales

- Registrar evento cultural: «Como administrador quiero registrar los eventos culturales de un hito, para que los visitantes conozcan su cronograma.».
- Consultar evento cultural: «Como administrador quiero consultar los eventos culturales de un hito, para revisar su cronograma.».
- Modificar evento cultural: «Como administrador quiero modificar un evento cultural, para corregir su nombre o su fecha de inicio.».
- Eliminar evento cultural: «Como administrador quiero eliminar eventos culturales, para quitar los que ya no se realizan.».

## 3. Reglas de negocio

Restricciones del relacional asociadas a las historias de esta capacidad, tomadas del [catálogo RR](../../../docs/requirements/relational-rules.md). La asociación RR↔HU es preliminar: se confirma al escribir la prueba SQL de cada regla. No se modifican las restricciones del modelo relacional validado.


## 4. Criterios de aceptación

### Registrar evento cultural

- Criterio 1: Cada evento pertenece a un hito y tiene nombre y fecha de inicio, y nada más: no lleva fecha de fin ni horario.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar los eventos culturales de un hito.
  - Entonces: Cada evento pertenece a un hito y tiene nombre y fecha de inicio, y nada más: no lleva fecha de fin ni horario.
- Criterio 2: Si registro en el mismo hito un evento con el mismo nombre y la misma fecha de inicio que otro, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador registra en el mismo hito un evento con el mismo nombre y la misma fecha de inicio que otro.
  - Entonces: El sistema lo rechaza.
- Criterio 3: Se acepta el mismo nombre de evento en otra fecha o en otro hito.
  - Dado: El administrador inició sesión con su rol.
  - Cuando: El administrador solicita registrar los eventos culturales de un hito.
  - Entonces: Se acepta el mismo nombre de evento en otra fecha o en otro hito.

### Consultar evento cultural

- Criterio 1: Puedo ver los eventos de un hito, que forman su cronograma.
  - Dado: El administrador inició sesión con su rol; existe al menos un registro de evento cultural.
  - Cuando: El administrador solicita consultar los eventos culturales de un hito.
  - Entonces: Puedo ver los eventos de un hito, que forman su cronograma.

### Modificar evento cultural

- Criterio 1: Puedo cambiar el nombre o la fecha de inicio del evento.
  - Dado: El administrador inició sesión con su rol; existe el evento cultural que se va a modificar.
  - Cuando: El administrador solicita modificar un evento cultural.
  - Entonces: Puedo cambiar el nombre o la fecha de inicio del evento.
- Criterio 2: Si el evento queda con el mismo nombre y la misma fecha de inicio que otro del mismo hito, el sistema lo rechaza.
  - Dado: El administrador inició sesión con su rol; existe el evento cultural que se va a modificar; el evento queda con el mismo nombre y la misma fecha de inicio que otro del mismo hito.
  - Cuando: El administrador solicita modificar un evento cultural.
  - Entonces: El sistema lo rechaza.
- Criterio 3: El evento sigue sin fecha de fin ni horario.
  - Dado: El administrador inició sesión con su rol; existe el evento cultural que se va a modificar.
  - Cuando: El administrador solicita modificar un evento cultural.
  - Entonces: El evento sigue sin fecha de fin ni horario.

### Eliminar evento cultural

- Criterio 1: Puedo eliminar un evento sin afectar al hito.
  - Dado: El administrador inició sesión con su rol; existe el evento cultural que se va a eliminar.
  - Cuando: El administrador solicita eliminar eventos culturales.
  - Entonces: Puedo eliminar un evento sin afectar al hito.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `evento`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Claves foráneas hacia tablas de otras capacidades (se crean en `database/02_claves/`, después de todas las tablas):
  - `hito` (HITO), de `patrimonio-hitos` (Javier).
- Roles que actúan: `rol_administrador`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Confirmar con su responsable la asociación preliminar RR↔HU de la sección 3.
