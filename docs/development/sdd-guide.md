# Desarrollo dirigido por especificaciones (SDD)

El proyecto sigue la metodología de la clase de APIs de Python, basada en una constitución de trabajo y tres artefactos por capacidad: `spec.md`, `plan.md` y `tasks.md`. No requiere la CLI de OpenSpec.

## 1. Cómo navegar

En [specs/README.md](../../specs/README.md) se encuentran las especificaciones, agrupadas en tres dominios: territorio/patrimonio, movilidad/rutas y actores/comercio.

La [constitución](../../specs/constitution.md) define criterios transversales. En [templates/](../../specs/templates/) se conservan las plantillas ajustadas a este proyecto y en [specs/memory.md](../../specs/memory.md) constan decisiones y próxima prioridad.

## 2. Fuente y trazabilidad

La fuente académica es [el informe original](../../references/first-delivery.md). Las historias, reglas y pantallas se relacionan en la [matriz detallada](../requirements/traceability-detailed.csv). La matriz indica la especificación concreta y las pruebas relevantes, evitando repetir identificadores académicos en todos los textos.

Se mantienen 103 historias, 324 criterios de aceptación y 23 capacidades de dominio. Las asociaciones de RR son preliminares y requieren revisión humana; no son instrucciones para modificar el esquema relacional validado.

## 3. Flujo de elaboración

1. Identificar capacidad y responsable usando la matriz.
2. Redactar `spec.md` con objetivo, requisitos, reglas, criterios, restricciones, exclusiones y decisiones abiertas.
3. Crear `plan.md` con estrategia y componentes por capa, sin registrar tareas terminadas.
4. Definir `tasks.md` con unidades de trabajo verificables y sus pruebas.
5. Aprobar los criterios antes de programar.
6. Aplicar el [ciclo TDD](tdd-guide.md) para cada nueva regla o comportamiento.
7. Actualizar `tasks.md` y `specs/memory.md` al cerrar cada tarea con evidencia.

Las especificaciones existentes son propuestas iniciales derivadas del informe, no contratos aprobados ni prueba de que la aplicación esté implementada.

## 4. Responsabilidades entre capas

Cada integrante desarrolla su funcionalidad a través de PostgreSQL, API e interfaz cuando corresponda. La base de datos conserva reglas de integridad y transacciones; el backend valida y autoriza. No se fija un framework de API mientras esté pendiente la decisión colectiva.

## 5. Control de cambios

Toda propuesta técnica que amplíe alcance requiere revisión humana. Los agentes consultan [AGENTS.md](../../AGENTS.md), la constitución, la capacidad y el Git workflow antes de modificar código. No se mantienen copias paralelas de especificaciones en carpetas propias del agente.
