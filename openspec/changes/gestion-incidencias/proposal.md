# Propuesta — Gestionar incidencias

## Por qué

El sistema registra incidencias sobre hitos o tramos, con verificación, prórroga y cierre. El comportamiento exige invariantes transaccionales y relaciones con actores y competencias territoriales.

## Alcance

**Javier Otero** es el responsable funcional. La línea base incluye registro, verificación, prórroga y cierre; interfaces de reporte y gestión. Las relaciones académicas están centralizadas en el [mapa](../../../docs/trazabilidad.md).

## Condición de avance

El equipo confirmó que el modelo relacional entregado no requiere cambios. La especificación puede avanzar usando sus relaciones, claves y RR existentes; no aprobar los contratos de API ni decisiones SQL nuevas sin revisión de escenarios.

## Riesgos

Exclusión mutua entre hito/tramos, conectividad de segmentos, autoridad competente y transiciones del ciclo de vida.
