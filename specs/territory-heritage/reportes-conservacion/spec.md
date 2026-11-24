# Especificación: reportes conservacion

## 1. Objetivo

Describir los comportamientos verificables de reportes conservacion, según la primera entrega.

## 2. Requisitos funcionales

- Estado de conservación e incidencias por territorio: «Como institución quiero ver el estado de conservación de los hitos y sus incidencias por territorio, para tomar decisiones de mantenimiento.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). Mantener modelo relacional validado sin inventar invariantes.

## 4. Criterios de aceptación

### Estado de conservación e incidencias por territorio

- Criterio 1: Se puede filtrar por estado y por municipio.
  - Dado: Se cumplen las precondiciones del comportamiento «Estado de conservación e incidencias por territorio»
  - Cuando: el actor solicita «Estado de conservación e incidencias por territorio» en esas circunstancias
  - Entonces: Se puede filtrar por estado y por municipio.
- Criterio 2: Muestra cuántos hitos hay en cada estado operativo: disponible, en restauración, clausurado temporalmente y cerrado permanentemente.
  - Dado: Se cumplen las precondiciones del comportamiento «Estado de conservación e incidencias por territorio»
  - Cuando: el actor solicita «Estado de conservación e incidencias por territorio» en esas circunstancias
  - Entonces: Muestra cuántos hitos hay en cada estado operativo: disponible, en restauración, clausurado temporalmente y cerrado permanentemente.
- Criterio 3: Muestra cuántas incidencias en estado activa hay, sin contar las descartadas ni las vencidas, y cuántas son críticas.
  - Dado: Se cumplen las precondiciones del comportamiento «Estado de conservación e incidencias por territorio»
  - Cuando: el actor solicita «Estado de conservación e incidencias por territorio» en esas circunstancias
  - Entonces: Muestra cuántas incidencias en estado activa hay, sin contar las descartadas ni las vencidas, y cuántas son críticas.
- Criterio 4: Muestra los días promedio de resolución, calculados entre la fecha de detección y la fecha de cierre, sobre las incidencias en estado resuelta del territorio filtrado.
  - Dado: Se cumplen las precondiciones del comportamiento «Estado de conservación e incidencias por territorio»
  - Cuando: el actor solicita «Estado de conservación e incidencias por territorio» en esas circunstancias
  - Entonces: Muestra los días promedio de resolución, calculados entre la fecha de detección y la fecha de cierre, sobre las incidencias en estado resuelta del territorio filtrado.

## 5. Restricciones técnicas

PostgreSQL gestiona integridad y reglas. Web de tres capas; tecnologías de API/UI provisionales.

## 6. Fuera de alcance

Modificar el modelo relacional o desarrollar capacidades ajenas.

## 7. Decisiones abiertas

Aprobación humana de contratos y stack final.
