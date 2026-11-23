# Desarrollo dirigido por especificaciones (SDD)

Este repositorio utiliza [OpenSpec](https://github.com/Fission-AI/OpenSpec) con su estructura nativa (`openspec/config.yaml`, `openspec/specs/`, `openspec/changes/`).

## Fuente de verdad

1. Enunciado y aclaraciones de la profesora.
2. Correcciones de la primera entrega, **todavía no incorporadas**.
3. ERE y esquema relacional revisados.
4. Requisitos y criterios de aceptación del informe.
5. Propuestas técnicas identificadas como tales.

[El mapa de trazabilidad](trazabilidad.md) concentra HU, RR y V. **No transcribir esos códigos en todas las especificaciones**: redactar las capacidades en lenguaje del dominio. Cuando cambien los requisitos, actualizar primero este mapa.

## Flujo acordado

1. Abrir una propuesta de cambio (ejemplo `territorio-estructuras-base`).
2. Justificar el comportamiento, alcance, restricciones y dependencias en `proposal.md`.
3. Describir requisitos observables y escenarios GIVEN/WHEN/THEN en `changes/<cambio>/specs/<capacidad>/spec.md`.
4. En `design.md`, decidir objetos y transacciones de PostgreSQL, contratos de API e interfaz si aplica. Anotar alternativas abiertas.
5. Derivar casos de prueba del escenario ([TDD](pruebas-tdd.md)) y planificar `tasks.md` por DB, API, UI e integración.
6. Solicitar revisión humana de la especificación antes de escribir implementación.
7. En la futura fase de implementación: pruebas RED, implementación GREEN, REFACTOR, CI y revisión de PR.
8. Cuando el cambio esté verificado y aprobado, archivar mediante el flujo propio de OpenSpec.

### Archivo de capacidad esperado

```markdown
# Gestión de incidencias

## Requirement: Registro de reportes
El sistema SHALL permitir reportes válidos por los actores autorizados.

### Scenario: Registro de un visitante
- **GIVEN** un visitante autorizado y un objeto afectado válido
- **WHEN** registra el reporte con datos válidos
- **THEN** persiste el reporte en estado preliminar con número correlativo
```

**Advertencia:** el ejemplo ilustra formato y deriva de los criterios de la HU original, **no** sustituye la especificación definitiva, que depende del modelo corregido.

### Organización

Separar las capacidades por nombre del dominio (territorio/catalogo, patrimonio/hitos, incidencias/gestion, movilidad/vias-y-tramos, etc.). Una regla se define una sola vez. El mapa central relaciona esa regla con el código académico y con las vistas.

No crear tres OpenSpec independientes ni reimplementar reglas por capa. La documentación de diseño puede hablar de DB/API/UI, pero la spec se centra en el comportamiento.

## Pautas de revisión de calidad

- Todo requisito tiene al menos un escenario verificable.
- Ninguna decisión técnica se presenta como regla del negocio sin soporte.
- Las dependencias cruzadas quedan explícitas.
- Los datos de prueba reproducen escenarios válidos y violaciones de integridad.
- En cambios de dominio compartido se solicita revisión de los responsables afectados.
- Evitar especificaciones masivas que mezclen varias capacidades distintas.
