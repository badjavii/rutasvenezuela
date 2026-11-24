# Especificación: reportes afluencia

## 1. Objetivo

Describir las capacidades verificables de reportes afluencia, según los criterios de primera entrega.

## 2. Requisitos funcionales

- Afluencia y calidad percibida por ruta: «Como institución turística, o como funcionario de ella, quiero ver la afluencia y la calificación de cada ruta, para tomar decisiones de planificación.».

## 3. Reglas de negocio

Consultar [RR](../../../docs/requirements/relational-rules.md) y [trazabilidad](../../../docs/requirements/traceability-detailed.csv). Conservar el relacional entregado.

## 4. Criterios de aceptación

### Afluencia y calidad percibida por ruta

- Criterio 1: Para cada ruta muestra cuántos recorridos se iniciaron, cuántos se completaron y cuántos se abandonaron, y el porcentaje de finalización.
  - Dado: Se cumplen las precondiciones del comportamiento «Afluencia y calidad percibida por ruta»
  - Cuando: el actor solicita «Afluencia y calidad percibida por ruta» en esas circunstancias
  - Entonces: Para cada ruta muestra cuántos recorridos se iniciaron, cuántos se completaron y cuántos se abandonaron, y el porcentaje de finalización.
- Criterio 2: Muestra la calificación promedio y la seguridad percibida promedio de todas sus evaluaciones, incluidas las de un mismo visitante en viajes distintos.
  - Dado: Se cumplen las precondiciones del comportamiento «Afluencia y calidad percibida por ruta»
  - Cuando: el actor solicita «Afluencia y calidad percibida por ruta» en esas circunstancias
  - Entonces: Muestra la calificación promedio y la seguridad percibida promedio de todas sus evaluaciones, incluidas las de un mismo visitante en viajes distintos.
- Criterio 3: Se puede filtrar por rango de fechas.
  - Dado: Se cumplen las precondiciones del comportamiento «Afluencia y calidad percibida por ruta»
  - Cuando: el actor solicita «Afluencia y calidad percibida por ruta» en esas circunstancias
  - Entonces: Se puede filtrar por rango de fechas.
- Criterio 4: Muestra el hito más visitado de la ruta, según los hitos por los que pasaron sus recorridos.
  - Dado: Se cumplen las precondiciones del comportamiento «Afluencia y calidad percibida por ruta»
  - Cuando: el actor solicita «Afluencia y calidad percibida por ruta» en esas circunstancias
  - Entonces: Muestra el hito más visitado de la ruta, según los hitos por los que pasaron sus recorridos.
- Criterio 5: La institución o su funcionario ven las rutas de los municipios donde la institución tiene competencia, y pueden filtrar por estado y municipio.
  - Dado: Se cumplen las precondiciones del comportamiento «Afluencia y calidad percibida por ruta»
  - Cuando: el actor solicita «Afluencia y calidad percibida por ruta» en esas circunstancias
  - Entonces: La institución o su funcionario ven las rutas de los municipios donde la institución tiene competencia, y pueden filtrar por estado y municipio.
- Criterio 6: No se listan las rutas dinámicas privadas de los visitantes.
  - Dado: Se cumplen las precondiciones del comportamiento «Afluencia y calidad percibida por ruta»
  - Cuando: el actor solicita «Afluencia y calidad percibida por ruta» en esas circunstancias
  - Entonces: No se listan las rutas dinámicas privadas de los visitantes.

## 5. Restricciones técnicas

PostgreSQL contiene invariantes. Arquitectura web de tres capas; stack de referencia provisional.

## 6. Fuera de alcance

Cambiar el modelo relacional o agregar nuevas reglas sin fuente.

## 7. Decisiones abiertas

Revisar contratos entre capas y confirmar tecnología de API/UI.
