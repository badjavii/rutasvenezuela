# Especificación: promociones experiencias

## 1. Objetivo

Describir el comportamiento verificable de promociones experiencias: 5 historias de Valeria Loreto (HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4), conforme a la primera entrega.

## 2. Requisitos funcionales

- Experiencias vigentes de un recorrido: «Como visitante quiero ver las experiencias promocionales vigentes de una ruta, para aprovechar las promociones durante el recorrido.».
- Registrar experiencia promocional: «Como comercio o guía quiero registrar experiencias promocionales, para atraer visitantes a mis servicios.».
- Consultar experiencia promocional: «Como comercio o guía quiero consultar mis experiencias promocionales, para saber cuáles tengo publicadas.».
- Modificar experiencia promocional: «Como comercio o guía quiero modificar mis experiencias promocionales, para ajustar su oferta.».
- Eliminar experiencia promocional: «Como comercio o guía quiero eliminar mis experiencias promocionales, para retirar las que ya no ofrezco.».

## 3. Reglas de negocio

Restricciones del relacional asociadas a las historias de esta capacidad, tomadas del [catálogo RR](../../../docs/requirements/relational-rules.md). La asociación RR↔HU es preliminar: se confirma al escribir la prueba SQL de cada regla. No se modifican las restricciones del modelo relacional validado.

- RR-52 (HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4): El comercio que promueve cada experiencia es distinto de null.
- RR-53 (HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4): El guía que dirige cada experiencia es distinto de null.
- RR-54 (HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4): La ruta de cada experiencia es distinta de null.
- RR-69 (HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4): Toda experiencia la promueve un comercio.
- RR-70 (HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4): Toda experiencia la dirige un guía.
- RR-71 (HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4): Toda experiencia transcurre sobre una ruta.
- RR-122 (HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4): La fecha de vencimiento es posterior a la de activación y el cupo máximo es de al menos una persona.
- RR-123 (HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4): El precio total es positivo y el descuento está entre 0 y 100.
- RR-124 (HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4): Toda experiencia tiene al menos una fila en INCLUYE o en INCLUYE_COMERCIO.
- RR-125 (HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4): Todo hito que incluye una experiencia está en CONFORMA para la ruta de su fila en TRANSCURRE.
- RR-126 (HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4): Una experiencia transcurre sobre una ruta fija o sobre una ruta dinámica pública.

## 4. Criterios de aceptación

### Experiencias vigentes de un recorrido

- Criterio 1: El visitante elige una ruta y el sistema lista sus experiencias vigentes: las que tienen la fecha actual entre su fecha de activación y su fecha de vencimiento.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver las experiencias promocionales vigentes de una ruta.
  - Entonces: El visitante elige una ruta y el sistema lista sus experiencias vigentes: las que tienen la fecha actual entre su fecha de activación y su fecha de vencimiento.
- Criterio 2: Para cada experiencia muestra título, descripción, precio, porcentaje de descuento, cupo y código promocional si lo tiene.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver las experiencias promocionales vigentes de una ruta.
  - Entonces: Para cada experiencia muestra título, descripción, precio, porcentaje de descuento, cupo y código promocional si lo tiene.
- Criterio 3: Si la ruta no tiene experiencias vigentes, el sistema lo indica.
  - Dado: El visitante inició sesión con su rol; la ruta no tiene experiencias vigentes.
  - Cuando: El visitante solicita ver las experiencias promocionales vigentes de una ruta.
  - Entonces: El sistema lo indica.

### Registrar experiencia promocional

- Criterio 1: Si registro una experiencia con el mismo título y la misma fecha de activación que otra, el sistema la rechaza.
  - Dado: El comercio o guía inició sesión con su rol.
  - Cuando: El comercio o guía registra una experiencia con el mismo título y la misma fecha de activación que otra.
  - Entonces: El sistema la rechaza.
- Criterio 2: Cada experiencia tiene descripción, precio total, cupo máximo por grupo, porcentaje de descuento y fecha de vencimiento; el código promocional es opcional.
  - Dado: El comercio o guía inició sesión con su rol.
  - Cuando: El comercio o guía solicita registrar experiencias promocionales.
  - Entonces: Cada experiencia tiene descripción, precio total, cupo máximo por grupo, porcentaje de descuento y fecha de vencimiento; el código promocional es opcional.
- Criterio 3: Si la fecha de vencimiento no es posterior a la de activación, el sistema la rechaza.
  - Dado: El comercio o guía inició sesión con su rol; la fecha de vencimiento no es posterior a la de activación.
  - Cuando: El comercio o guía solicita registrar experiencias promocionales.
  - Entonces: El sistema la rechaza.
- Criterio 4: Si el cupo es menor que una persona, el sistema la rechaza.
  - Dado: El comercio o guía inició sesión con su rol; el cupo es menor que una persona.
  - Cuando: El comercio o guía solicita registrar experiencias promocionales.
  - Entonces: El sistema la rechaza.
- Criterio 5: La experiencia se vincula al comercio que la promueve, al guía certificado que la dirige, a la ruta del recorrido y a los hitos o comercios (servicios) que incluye.
  - Dado: El comercio o guía inició sesión con su rol.
  - Cuando: El comercio o guía solicita registrar experiencias promocionales.
  - Entonces: La experiencia se vincula al comercio que la promueve, al guía certificado que la dirige, a la ruta del recorrido y a los hitos o comercios (servicios) que incluye.

### Consultar experiencia promocional

- Criterio 1: Veo la lista de mis experiencias.
  - Dado: El comercio o guía inició sesión con su rol; existe al menos un registro de experiencia promocional.
  - Cuando: El comercio o guía solicita consultar sus experiencias promocionales.
  - Entonces: Veo la lista de mis experiencias.
- Criterio 2: Puedo abrir una experiencia y ver sus datos y sus vínculos.
  - Dado: El comercio o guía inició sesión con su rol; existe al menos un registro de experiencia promocional.
  - Cuando: El comercio o guía solicita consultar sus experiencias promocionales.
  - Entonces: Puedo abrir una experiencia y ver sus datos y sus vínculos.

### Modificar experiencia promocional

- Criterio 1: Solo el comercio que promueve la experiencia o el guía que la dirige puede modificarla.
  - Dado: El comercio o guía inició sesión con su rol; existe la experiencia promocional que se va a modificar.
  - Cuando: El comercio o guía solicita modificar sus experiencias promocionales.
  - Entonces: Solo el comercio que promueve la experiencia o el guía que la dirige puede modificarla.
- Criterio 2: Si el título y la fecha de activación quedan iguales a los de otra experiencia, el sistema lo rechaza.
  - Dado: El comercio o guía inició sesión con su rol; existe la experiencia promocional que se va a modificar; el título y la fecha de activación quedan iguales a los de otra experiencia.
  - Cuando: El comercio o guía solicita modificar sus experiencias promocionales.
  - Entonces: El sistema lo rechaza.
- Criterio 3: Si la fecha de vencimiento no es posterior a la de activación, el sistema lo rechaza.
  - Dado: El comercio o guía inició sesión con su rol; existe la experiencia promocional que se va a modificar; la fecha de vencimiento no es posterior a la de activación.
  - Cuando: El comercio o guía solicita modificar sus experiencias promocionales.
  - Entonces: El sistema lo rechaza.
- Criterio 4: Si el cupo queda menor que una persona, el sistema lo rechaza.
  - Dado: El comercio o guía inició sesión con su rol; existe la experiencia promocional que se va a modificar; el cupo queda menor que una persona.
  - Cuando: El comercio o guía solicita modificar sus experiencias promocionales.
  - Entonces: El sistema lo rechaza.

### Eliminar experiencia promocional

- Criterio 1: Solo el comercio que promueve la experiencia o el guía que la dirige puede eliminarla.
  - Dado: El comercio o guía inició sesión con su rol; existe la experiencia promocional que se va a eliminar.
  - Cuando: El comercio o guía solicita eliminar sus experiencias promocionales.
  - Entonces: Solo el comercio que promueve la experiencia o el guía que la dirige puede eliminarla.
- Criterio 2: Si ninguna credencial se adquirió bajo la experiencia, se elimina.
  - Dado: El comercio o guía inició sesión con su rol; existe la experiencia promocional que se va a eliminar; ninguna credencial se adquirió bajo la experiencia.
  - Cuando: El comercio o guía solicita eliminar sus experiencias promocionales.
  - Entonces: Se elimina.
- Criterio 3: Si hay credenciales adquiridas bajo la experiencia, el sistema no la elimina y me indica qué lo impide.
  - Dado: El comercio o guía inició sesión con su rol; existe la experiencia promocional que se va a eliminar; hay credenciales adquiridas bajo la experiencia.
  - Cuando: El comercio o guía solicita eliminar sus experiencias promocionales.
  - Entonces: El sistema no la elimina y me indica qué lo impide.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- Tablas propias: `experiencia_turistica`, `promueve`, `dirige`, `transcurre`, `incluye`, `incluye_comercio`. Nombres físicos según las [convenciones de base de datos](../../../docs/development/database-conventions.md).
- Claves foráneas hacia tablas de otras capacidades (se crean en `database/02_claves/`, después de todas las tablas):
  - `comercio` (COMERCIO), de `actores-comercios` (Valeria).
  - `guia` (GUIA), de `guias-contrataciones` (Sebastián).
  - `ruta_turistica` (RUTA_TURISTICA), de `rutas-gestion` (Sebastián).
  - `hito` (HITO), de `patrimonio-hitos` (Javier).
- Roles que actúan: `rol_visitante`, `rol_guia`, `rol_comercio`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Confirmar con su responsable la asociación preliminar RR↔HU de la sección 3.
- Acordar con Javier y Sebastián los datos de prueba de las tablas referidas.
