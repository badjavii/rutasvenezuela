# Guía de documentación — RutasVenezuela

Este directorio contiene las **guías operativas** y la **documentación derivada** del proyecto. Para leer el informe académico íntegro, usa [references/first-delivery.md](../references/first-delivery.md). Para conocer la propuesta y las especificaciones del dominio, consulta [OpenSpec](../openspec/changes/).

## Cómo orientarse

| Si quieres… | Comienza por… | Después consulta… |
|---|---|---|
| Entender el sistema y las capas | [Arquitectura](architecture.md) | [Contratos por capa](development/layer-contracts.md) |
| Encontrar qué requisito corresponde a una HU, RR o pantalla | [Mapa de trazabilidad](requirements/traceability.md) | [Matriz detallada](requirements/traceability-detailed.csv) |
| Leer las fuentes originales | [Referencias](../references/README.md) | [Informe íntegro](../references/first-delivery.md) |
| Especificar una funcionalidad | [Guía SDD](development/sdd-guide.md) | [Propuestas OpenSpec](../openspec/changes/) |
| Preparar o ejecutar pruebas | [Guía TDD](development/tdd-guide.md) | [Casos de prueba](testing/) |
| Trabajar con ramas o abrir un PR | [Git workflow](development/git-workflow.md) | [Plantilla de PR](../.github/pull_request_template.md) |
| Revisar el alcance y la entrega | [Plan de entrega](project/delivery-plan.md) | [Observaciones del ERE](project/ere-feedback.md) |

## Estructura

```text
docs/
├── README.md                         # Índice de lectura
├── architecture.md                   # Arquitectura general
├── development/
│   ├── git-workflow.md               # Ramas, commits, PR y tags
│   ├── sdd-guide.md                  # Uso de OpenSpec
│   ├── tdd-guide.md                  # Método de pruebas
│   └── layer-contracts.md            # Contratos entre capas
├── requirements/
│   ├── traceability.md               # Mapa agrupado
│   ├── traceability.csv
│   ├── traceability-detailed.csv      # HU → capacidad OpenSpec
│   ├── acceptance-criteria.md        # Criterios originales extraídos
│   ├── relational-rules.md           # RR en lenguaje natural
│   └── relational-rules.csv
├── testing/
│   ├── acceptance-cases.csv
│   ├── database-cases.csv
│   ├── interface-cases.csv
│   └── integration-cases.csv
└── project/
    ├── delivery-plan.md
    ├── ere-feedback.md
    └── decisions.md
```

## Fuente de verdad y estado

1. **Informe académico original:** contiene reglas, modelo relacional validado e historias. No reinterpretarlo silenciosamente.
2. **Trazabilidad:** vincula códigos académicos con capacidades, responsables y pruebas; sus asociaciones RR↔HU requieren revisión.
3. **OpenSpec:** describe comportamientos observables propuestos, todavía pendientes de revisión humana.
4. **TDD:** planifica casos; no representa pruebas ejecutadas.

El contenido se redacta en **español**. Los identificadores de archivos, ramas, commits y PR siguen convenciones técnicas en inglés.
