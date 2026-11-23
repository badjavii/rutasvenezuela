# Plan de integración y entrega — Equipo 2

**Entrega:** 8 de diciembre de 2026. Las defensas empiezan a partir de esa fecha. **Examen 2:** 17 de diciembre.

## Estado inicial

- 103 historias y 324 criterios de aceptación **documentados**, no implementados.
- 134 restricciones relacionales preservadas y registradas.
- 21 interfaces y sus estados planificados para pruebas.
- PostgreSQL/Supabase y arquitectura de tres capas aprobados. Framework de backend pendiente de acuerdo con Sebastián.
- El esquema relacional de la primera entrega permanece válido; las notas afectan la técnica de modelado ERE.

## Orden de trabajo y dependencias

| Etapa | Objetivo | Qué prueba la aceptación |
|---|---|---|
| A. Base territorial y actores | Estados, municipios, parroquias, cuentas, roles y entidades | PK/FK, claves compuestas, participaciones, permisos |
| B. Patrimonio y movilidad | Hitos, categorías, anclajes, recursos, vías, tramos, paradas y rutas | Restricciones, unicidad, integridad de la topología |
| C. Operaciones transaccionales | Recorridos, incidencias, evaluaciones, experiencias y credenciales | Funciones/procedimientos/triggers con pruebas positivas y negativas |
| D. Adaptadores web | API de validación y vistas conectadas a BD real | Contratos y pruebas de errores; paginación, búsqueda, orden |
| E. Cierre | Seeds, seguridad del gestor, reportes, despliegue, README y defensa | Reproducción completa desde una sola computadora |

## Responsabilidad por funcionalidad, no por capa

| Integrante | Módulo | Capas de su responsabilidad |
|---|---|---|
| Javier | Territorio, patrimonio, instituciones, incidencias, evaluaciones, seguridad de rutas | PostgreSQL + API + UI |
| Sebastián | Vías, tramos, paradas, rutas, guías y recorridos | PostgreSQL + API + UI |
| Valeria | Cuentas, actores, comercios, promociones y credenciales | PostgreSQL + API + UI |

Una funcionalidad compartida exige revisión del módulo adyacente.

## Alcance y prioridades

La matriz original incluye 103 historias. Para el 8 de diciembre no se deben eliminar historias sin aprobación académica. La priorización deberá considerar dependencias, restricciones del gestor, operaciones críticas, cobertura por integrante y demostración OLTP.

Los registros de tests del repositorio son **casos planificados**, no ejecución automatizada. El cierre de cada funcionalidad exige pruebas ejecutadas con evidencia.

## Entrega académica

- [ ] Repositorio con historial progresivo real de commits de todos los integrantes.
- [ ] README reproducible para ejecutar/aprovisionar las tres capas.
- [ ] SQL completo: estructuras, altas/bajas/cambios, procedimientos, funciones, triggers, roles, privilegios y seeds de todas las entidades.
- [ ] Reportes reproducibles (RP-1, RP-2, RP-3).
- [ ] Aplicación web OLTP; listados con paginación, filtros y ordenamiento.
- [ ] Demostración presencial en una computadora y los tres integrantes presentes.
- [ ] Correo asunto exacto `Segunda entrega proyecto grupo 2 NRC Y` (sustituir Y por el NRC confirmado), con enlace accesible y ambiente/SGBDR declarado.
