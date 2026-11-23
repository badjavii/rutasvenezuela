# Contratos previstos por capa

**Estado:** especificación de integración, sin endpoints ni componentes definitivos. El equipo definió PostgreSQL/Supabase; FastAPI + React sigue propuesto, pendiente de la alternativa Node.js.

## Base de datos: reglas e integridad

Cada capacidad se implementará utilizando las relaciones del modelo relacional entregado, con restricciones, transacciones y rutinas PostgreSQL según corresponda. **El SGBDR rechaza las violaciones aunque el cliente omita controles.** [Catálogo RR](../requirements/relational-rules.md) · [Casos SQL](../pruebas/casos-rr.csv).

## Capa de aplicación: validación

- Solicitudes tipadas y bien formadas; autenticación y autorización del usuario.
- Comprobación de identificadores y parámetros, paginación, filtros y columnas ordenables por lista blanca.
- Operaciones de negocio invocan rutinas transaccionales del gestor.
- Respuestas consistentes para errores de integridad, autorización y datos inexistentes.
- **No duplicar invariantes como fuente única fuera de PostgreSQL.**
- Sin fijar rutas HTTP ni paquetes hasta aprobar el stack (FastAPI vs Node.js).

## Capa de interfaz: comportamiento observable

- Cada vista cubrirá los estados diseñados en el informe: [casos por mockup](../pruebas/casos-interfaces.csv).
- Todos los listados tabulares tendrán búsqueda, ordenamiento por columna y paginación.
- Validaciones para experiencia de usuario; nunca sustituir la validación del backend ni del gestor.
- Manejar carga, vacío, error y confirmaciones coherentes con los criterios originales.

## Dependencias entre módulos

| Contrato compartido | Responsable primario | Coordinación necesaria |
|---|---|---|
| Estado → municipio → parroquia | Javier | Sebastián (rutas/vías), Valeria (actores) |
| Hito ↔ tramo y categoría | Javier | Sebastián (vías/tramos) |
| Incidencia ↔ actor ↔ competencia | Javier | Valeria (actores), Sebastián (tramos) |
| Recorrido ↔ evaluación | Sebastián y Javier | Valeria (valoraciones) |
| Credencial ↔ experiencia ↔ comercio/guía | Valeria | Sebastián (guías) |
| Seguridad y cuentas | Valeria, coordinación de seguridad Sebastián | Todos |
| Reportes y filtros | Cada responsable | Todos para datos cruzados |

## Política de cambios

Cada contrato público se describe primero mediante su capacidad OpenSpec. Las pruebas de contrato verifican que el adaptador API/UI no altera el comportamiento definido por la base de datos. Cuando se acuerde la tecnología del backend, completar los diseños con rutas, entradas, salidas y errores concretos, sin modificar las reglas académicas.
