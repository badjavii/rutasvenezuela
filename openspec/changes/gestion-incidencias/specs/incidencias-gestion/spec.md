# Gestión de incidencias — Delta de especificación (propuesta)

> **No aprobada / sin implementar.** Requisitos derivados de la HU de reportar incidencias y RR del informe original. Pendiente contrastar correcciones.

## ADDED Requirements

### Requirement: Reporte de incidencias por actores autorizados

El sistema SHALL permitir que visitantes, guías y funcionarios registren una incidencia que afecte un hito **o** uno o varios tramos, con número correlativo y datos de detección, resolución estimada, narrativa y severidad válida.

#### Scenario: Reporte por visitante o guía

- **GIVEN** un visitante o guía habilitado y un elemento afectado válido
- **WHEN** registra la incidencia con severidad bajo, medio o crítico
- **THEN** se asigna un número de reporte correlativo, se guarda la autoría y queda preliminar hasta verificación

#### Scenario: Reporte por funcionario

- **GIVEN** un funcionario habilitado y un elemento afectado válido
- **WHEN** registra una incidencia con datos válidos
- **THEN** se registra como activa sin pasar por la verificación preliminar

#### Scenario: Afectación incompatible

- **GIVEN** una incidencia que identifica un hito como afectado
- **WHEN** se intenta registrar también una afectación de tramo sobre la misma incidencia
- **THEN** PostgreSQL rechaza la combinación incompatible de manera atómica

### Requirement: Verificación de reportes preliminares

El sistema SHALL permitir verificar o descartar reportes preliminares por un funcionario autorizado, respetando las competencias establecidas en el modelo.

#### Scenario: Confirmación de reporte preliminar

- **GIVEN** una incidencia preliminar reportada por un visitante o guía
- **WHEN** un funcionario autorizado confirma el hecho
- **THEN** el estado pasa a activa y queda registrada la verificación

#### Scenario: Rechazo de reporte preliminar

- **GIVEN** una incidencia preliminar
- **WHEN** un funcionario autorizado descarta el hecho
- **THEN** se registra como descartada y no se considera una afectación vigente

### Requirement: Cierre y prórroga coherentes

El sistema SHALL mantener el ciclo de vida de las incidencias, incluyendo prórrogas de fecha y cierres ejecutados por funcionarios competentes.

#### Scenario: Cierre autorizado

- **GIVEN** una incidencia susceptible de cierre y un funcionario territorialmente competente
- **WHEN** registra su resolución
- **THEN** el estado, la fecha de cierre y la relación con el funcionario quedan sincronizados

#### Scenario: Cierre sin competencia

- **GIVEN** un funcionario sin competencia para el territorio afectado
- **WHEN** intenta cerrar la incidencia
- **THEN** PostgreSQL rechaza el cierre

**Cuestión a revisar:** la restricción de conectividad de tramos del informe original asegura vecinos conectados, pero no necesariamente conectividad global. No fortalecerla sin acuerdo del equipo y revisión académica.
