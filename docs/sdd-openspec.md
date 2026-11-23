# Desarrollo dirigido por especificaciones (SDD)

Se utiliza **[OpenSpec](https://openspec.dev/docs/schemas/spec-driven)** con el esquema oficial `spec-driven`. Los requisitos se documentan **por capacidad de dominio**, sin reproducir en cada uno los códigos académicos; la relación completa está en [trazabilidad detallada](trazabilidad-detallada.csv).

## Estado de planificación

- **103 historias** de la primera entrega desglosadas.
- **324 criterios de aceptación** incorporados como escenarios OpenSpec y casos TDD planificados.
- **23 capacidades** con especificación en borrador, repartidas en tres propuestas independientes.
- **134 RR** catalogadas y vinculadas preliminarmente.
- **21 interfaces** y sus 70 estados de mockup documentados.

**Esto significa cobertura documental, no aprobación de las especificaciones ni ejecución de pruebas.** El modelo relacional de la primera entrega se conserva sin cambios según aclaración de la profesora.

## Organización oficial

```text
openspec/
├── config.yaml
├── specs/               # Especificaciones vigentes consolidadas (aún sin aprobar)
└── changes/             # Propuestas aún abiertas
    ├── territory-heritage-plan/
    │   ├── proposal.md
    │   ├── design.md
    │   ├── tasks.md
    │   └── specs/<capability>/spec.md
    ├── mobility-routes-plan/
    │   └── ...
    └── actors-commerce-plan/
        └── ...
```

Se mantienen las especificaciones bajo `changes/` porque el proyecto está **en planificación**, todavía sin el ciclo de revisión, implementación y archivo concluido. No trasladarlas manualmente a `openspec/specs/`: utilizar el flujo oficial de OpenSpec cuando el cambio sea verificado y aprobado.

## Flujo de trabajo

1. Consultar informe original y [catálogo HU](requisitos/criterios-originales.md).
2. Revisar [matriz de trazabilidad](trazabilidad-detallada.csv) para identificar capacidad, autor, RR y vista.
3. Leer `proposal.md`: por qué y hasta dónde llega la capacidad.
4. Revisar `specs/<capability>/spec.md`: requisitos observables y escenarios.
5. Usar `design.md` para decisiones SQL/API/UI; FastAPI/React todavía están en evaluación frente a Node.js.
6. Derivar/refinar pruebas por capa en [TDD](pruebas-tdd.md).
7. Acordar `tasks.md`; implementar **solo** en una PR posterior que siga RED → GREEN → REFACTOR.
8. Ejecutar revisión y archivo de cambios mediante OpenSpec cuando corresponda.

## Autoridad de las fuentes

1. Enunciado y aclaraciones de la profesora.
2. Modelo relacional validado en la primera entrega y fórmulas de RR.
3. Historias y criterios originales.
4. Mockups de las vistas.
5. Propuestas técnicas (distinguidas de decisiones aprobadas).

Las observaciones sobre el ERE no autorizan alterar el esquema relacional. Véase [observaciones-ere.md](observaciones-ere.md).

## Revisión de calidad de cada capacidad

- Requisitos separados por comportamiento observable (sin suposiciones nuevas).
- Escenarios derivados de criterios del informe, pero **revisar manualmente GIVEN, WHEN y THEN** para definir fixtures y casos límite.
- Correspondencia exacta con la matriz académica.
- Diseño de SQL conserva claves, relaciones y semántica original.
- Autorización y transacciones planificadas con tests de base de datos.
- Las dependencias entre módulos se revisan entre integrantes.
- Las pruebas propuestas **no se marcan en verde** hasta que exista evidencia de ejecución.

## Herramientas

OpenSpec 2.x puede inicializarse para OpenCode con `openspec init --tools opencode` en una instalación local. El repositorio ya conserva `openspec/config.yaml`; no es necesario regenerarlo salvo por decisión del equipo.

[Guía oficial de escritura de especificaciones](https://github.com/Fission-AI/OpenSpec/blob/main/docs/writing-specs.md).
