# Especificación: reportes seguridad rutas

## 1. Objetivo

Describir los comportamientos verificables de reportes seguridad rutas, según la primera entrega.

## 2. Requisitos funcionales

- Semáforo de seguridad de una ruta: «Como visitante quiero ver un nivel de seguridad de cada ruta antes de elegirla, combinando la seguridad que percibieron otros visitantes con las incidencias activas en sus hitos y tramos, para evitar rutas riesgosas.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). Mantener modelo relacional validado sin inventar invariantes.

## 4. Criterios de aceptación

### Semáforo de seguridad de una ruta

- Criterio 1: Al ver una ruta, el sistema muestra su nivel de seguridad: verde, amarillo o rojo.
  - Dado: Se cumplen las precondiciones del comportamiento «Semáforo de seguridad de una ruta»
  - Cuando: el actor solicita «Semáforo de seguridad de una ruta» en esas circunstancias
  - Entonces: Al ver una ruta, el sistema muestra su nivel de seguridad: verde, amarillo o rojo.
- Criterio 2: El nivel sale del promedio de la seguridad percibida de las evaluaciones de la ruta y de las incidencias en estado activa en sus hitos y en los tramos donde están sus hitos y paradas.
  - Dado: Se cumplen las precondiciones del comportamiento «Semáforo de seguridad de una ruta»
  - Cuando: el actor solicita «Semáforo de seguridad de una ruta» en esas circunstancias
  - Entonces: El nivel sale del promedio de la seguridad percibida de las evaluaciones de la ruta y de las incidencias en estado activa en sus hitos y en los tramos donde están sus hitos y paradas.
- Criterio 3: Es verde si el promedio es 4 o más y no hay incidencias activas; rojo si el promedio es menor de 3 o hay alguna incidencia crítica activa; amarillo en los demás casos.
  - Dado: Se cumplen las precondiciones del comportamiento «Semáforo de seguridad de una ruta»
  - Cuando: el actor solicita «Semáforo de seguridad de una ruta» en esas circunstancias
  - Entonces: Es verde si el promedio es 4 o más y no hay incidencias activas; rojo si el promedio es menor de 3 o hay alguna incidencia crítica activa; amarillo en los demás casos.
- Criterio 4: el nivel se calcula solo con sus incidencias y el sistema indica que aún no hay valoraciones.
  - Dado: Se cumple la condición «la ruta no tiene evaluaciones»
  - Cuando: el actor solicita «Semáforo de seguridad de una ruta» en esas circunstancias
  - Entonces: el nivel se calcula solo con sus incidencias y el sistema indica que aún no hay valoraciones.
- Criterio 5: El visitante puede ver las incidencias activas que explican el nivel. Por qué es propia: el enunciado da la seguridad percibida como un dato más de la evaluación. Cruzarla con las incidencias para dar un nivel al visitante no está en ningún módulo de §1.
  - Dado: Se cumplen las precondiciones del comportamiento «Semáforo de seguridad de una ruta»
  - Cuando: el actor solicita «Semáforo de seguridad de una ruta» en esas circunstancias
  - Entonces: El visitante puede ver las incidencias activas que explican el nivel. Por qué es propia: el enunciado da la seguridad percibida como un dato más de la evaluación. Cruzarla con las incidencias para dar un nivel al visitante no está en ningún módulo de §1.

## 5. Restricciones técnicas

PostgreSQL gestiona integridad y reglas. Web de tres capas; tecnologías de API/UI provisionales.

## 6. Fuera de alcance

Modificar el modelo relacional o desarrollar capacidades ajenas.

## 7. Decisiones abiertas

Aprobación humana de contratos y stack final.
