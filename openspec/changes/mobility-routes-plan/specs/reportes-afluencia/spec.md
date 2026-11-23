# reportes afluencia

> Plan de comportamiento basado en el informe de primera entrega. **No implementado.** Código académico, RR, vista y responsable: [mapa detallado](../../../../../docs/requirements/traceability-detailed.csv). El modelo relacional entregado se conserva.

## ADDED Requirements

### Requirement: Afluencia y calidad percibida por ruta

El sistema SHALL cumplir el siguiente objetivo funcional: «Como institución turística, o como funcionario de ella, quiero ver la afluencia y la calificación de cada ruta, para tomar decisiones de planificación.».

#### Scenario: Afluencia y calidad percibida por ruta - criterio 1

- **GIVEN** Se cumplen las precondiciones del comportamiento «Afluencia y calidad percibida por ruta»
- **WHEN** el actor solicita «Afluencia y calidad percibida por ruta» en esas circunstancias
- **THEN** Para cada ruta muestra cuántos recorridos se iniciaron, cuántos se completaron y cuántos se abandonaron, y el porcentaje de finalización.

#### Scenario: Afluencia y calidad percibida por ruta - criterio 2

- **GIVEN** Se cumplen las precondiciones del comportamiento «Afluencia y calidad percibida por ruta»
- **WHEN** el actor solicita «Afluencia y calidad percibida por ruta» en esas circunstancias
- **THEN** Muestra la calificación promedio y la seguridad percibida promedio de todas sus evaluaciones, incluidas las de un mismo visitante en viajes distintos.

#### Scenario: Afluencia y calidad percibida por ruta - criterio 3

- **GIVEN** Se cumplen las precondiciones del comportamiento «Afluencia y calidad percibida por ruta»
- **WHEN** el actor solicita «Afluencia y calidad percibida por ruta» en esas circunstancias
- **THEN** Se puede filtrar por rango de fechas.

#### Scenario: Afluencia y calidad percibida por ruta - criterio 4

- **GIVEN** Se cumplen las precondiciones del comportamiento «Afluencia y calidad percibida por ruta»
- **WHEN** el actor solicita «Afluencia y calidad percibida por ruta» en esas circunstancias
- **THEN** Muestra el hito más visitado de la ruta, según los hitos por los que pasaron sus recorridos.

#### Scenario: Afluencia y calidad percibida por ruta - criterio 5

- **GIVEN** Se cumplen las precondiciones del comportamiento «Afluencia y calidad percibida por ruta»
- **WHEN** el actor solicita «Afluencia y calidad percibida por ruta» en esas circunstancias
- **THEN** La institución o su funcionario ven las rutas de los municipios donde la institución tiene competencia, y pueden filtrar por estado y municipio.

#### Scenario: Afluencia y calidad percibida por ruta - criterio 6

- **GIVEN** Se cumplen las precondiciones del comportamiento «Afluencia y calidad percibida por ruta»
- **WHEN** el actor solicita «Afluencia y calidad percibida por ruta» en esas circunstancias
- **THEN** No se listan las rutas dinámicas privadas de los visitantes.

