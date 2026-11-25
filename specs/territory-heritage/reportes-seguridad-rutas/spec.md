# Especificación: reportes seguridad rutas

## 1. Objetivo

Describir el comportamiento verificable de reportes seguridad rutas: 1 historia de Javier Otero (VA-4), conforme a la primera entrega.

## 2. Requisitos funcionales

- Semáforo de seguridad de una ruta: «Como visitante quiero ver un nivel de seguridad de cada ruta antes de elegirla, combinando la seguridad que percibieron otros visitantes con las incidencias activas en sus hitos y tramos, para evitar rutas riesgosas.».

## 3. Reglas de negocio

Restricciones del relacional asociadas a las historias de esta capacidad, tomadas del [catálogo RR](../../../docs/requirements/relational-rules.md). La asociación RR↔HU es preliminar: se confirma al escribir la prueba SQL de cada regla. No se modifican las restricciones del modelo relacional validado.

- RR-83 (VA-4): El estado es preliminar, activa, descartada, vencida o resuelta, y la severidad es bajo, medio o crítico.
- RR-84 (VA-4): Toda incidencia tiene fila en AFECTA_HITO o en AFECTA_TRAMO, pero no en las dos.
- RR-85 (VA-4): Si una incidencia afecta dos o más tramos, cada tramo afectado tiene una fila en CONECTA con otro tramo afectado por la misma incidencia.
- RR-89 (VA-4): Una incidencia está resuelta si y solo si tiene fila en CIERRA. Tiene fecha de cierre si y solo si está resuelta.
- RR-90 (VA-4): El funcionario que cierra pertenece a un ente con competencia sobre el municipio del hito afectado o de alguno de los tramos afectados.
- RR-91 (VA-4): Una incidencia activa o vencida está activa si y solo si su fechaEstimadaResolucion, o la nuevaFecha de alguna fila de PRORROGA con su mismo numeroReporte, todavía no pasó. Si ya pasaron todas, está vencida. (Solo en lenguaje natural: necesita la fecha de hoy, que el lenguaje de restricciones del curso no define.)

## 4. Criterios de aceptación

### Semáforo de seguridad de una ruta

- Criterio 1: Al ver una ruta, el sistema muestra su nivel de seguridad: verde, amarillo o rojo.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: Al ver una ruta.
  - Entonces: El sistema muestra su nivel de seguridad: verde, amarillo o rojo.
- Criterio 2: El nivel sale del promedio de la seguridad percibida de las evaluaciones de la ruta y de las incidencias en estado activa en sus hitos y en los tramos donde están sus hitos y paradas.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver un nivel de seguridad de cada ruta antes de elegirla, combinando la seguridad que percibieron otros visitantes con las incidencias activas en sus hitos y tramos.
  - Entonces: El nivel sale del promedio de la seguridad percibida de las evaluaciones de la ruta y de las incidencias en estado activa en sus hitos y en los tramos donde están sus hitos y paradas.
- Criterio 3: Es verde si el promedio es 4 o más y no hay incidencias activas; rojo si el promedio es menor de 3 o hay alguna incidencia crítica activa; amarillo en los demás casos.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver un nivel de seguridad de cada ruta antes de elegirla, combinando la seguridad que percibieron otros visitantes con las incidencias activas en sus hitos y tramos.
  - Entonces: Es verde si el promedio es 4 o más y no hay incidencias activas; rojo si el promedio es menor de 3 o hay alguna incidencia crítica activa; amarillo en los demás casos.
- Criterio 4: Si la ruta no tiene evaluaciones, el nivel se calcula solo con sus incidencias y el sistema indica que aún no hay valoraciones.
  - Dado: El visitante inició sesión con su rol; la ruta no tiene evaluaciones.
  - Cuando: El visitante solicita ver un nivel de seguridad de cada ruta antes de elegirla, combinando la seguridad que percibieron otros visitantes con las incidencias activas en sus hitos y tramos.
  - Entonces: El nivel se calcula solo con sus incidencias y el sistema indica que aún no hay valoraciones.
- Criterio 5: El visitante puede ver las incidencias activas que explican el nivel. Por qué es propia: el enunciado da la seguridad percibida como un dato más de la evaluación. Cruzarla con las incidencias para dar un nivel al visitante no está en ningún módulo de §1.
  - Dado: El visitante inició sesión con su rol.
  - Cuando: El visitante solicita ver un nivel de seguridad de cada ruta antes de elegirla, combinando la seguridad que percibieron otros visitantes con las incidencias activas en sus hitos y tramos.
  - Entonces: El visitante puede ver las incidencias activas que explican el nivel. Por qué es propia: el enunciado da la seguridad percibida como un dato más de la evaluación. Cruzarla con las incidencias para dar un nivel al visitante no está en ningún módulo de §1.

## 5. Restricciones técnicas

- Capa de datos: PostgreSQL alojado en Supabase y usado solo como PostgreSQL (sin Supabase Auth, API automática ni RLS). Objetos en el esquema `rutasvzla`. Las reglas de negocio se implementan en el gestor con restricciones, triggers, funciones y procedimientos en PL/pgSQL, y el gestor autoriza cada operación con roles y `GRANT`/`REVOKE`.
- Capa de aplicación: Next.js en el servidor (server actions y `server/db`). Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y llama a la función o al procedimiento. No repite las reglas del gestor ni decide permisos por su cuenta.
- Capa de presentación: Next.js (server components y client components). Muestra los datos y los errores que devuelve el gestor; sus validaciones son solo de experiencia de usuario.
- No tiene tablas propias: consulta tablas de otras capacidades con funciones o vistas de solo lectura.
- Roles que actúan: `rol_visitante`.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar reglas sin fuente. Crear o alterar tablas de otras capacidades: solo se referencian o se leen, y cualquier cambio se coordina con su responsable.

## 7. Decisiones abiertas

- Confirmar con su responsable la asociación preliminar RR↔HU de la sección 3.
- Definir qué tablas de otras capacidades lee cada consulta o reporte.
