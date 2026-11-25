# Contratos por capa

**Estado:** contratos de integración de la arquitectura adoptada (Next.js + PostgreSQL en Supabase). Los nombres concretos de funciones, procedimientos y server actions se fijan en cada capacidad al implementarla.

## Capa de datos: reglas, integridad y permisos

Cada capacidad implementa las relaciones del modelo relacional entregado, con restricciones, transacciones y rutinas PL/pgSQL según corresponda. El gestor rechaza las violaciones y las operaciones no autorizadas aunque la aplicación omita controles. [Catálogo RR](../requirements/relational-rules.md) · [Casos SQL](../testing/database-cases.csv) · [Convenciones](database-conventions.md).

- Las operaciones de escritura se exponen como procedimientos (`sp_…`) y las lecturas como funciones (`fn_…`) o vistas.
- Cada rutina recibe `GRANT EXECUTE` solo para los roles de actor que la usan.
- Los errores de negocio se lanzan con `RAISE EXCEPTION` y un mensaje que la interfaz puede mostrar.

## Capa de aplicación: server actions de Next.js

- Lee la sesión de la cookie firmada; sin sesión válida solo permite iniciar sesión.
- Abre la transacción, ejecuta `SET LOCAL ROLE` con el rol de la sesión y `set_config('app.id_cuenta', …, true)`, llama a la rutina y confirma o revierte.
- Comprueba formato de parámetros, paginación, filtros y columnas ordenables por lista blanca.
- Devuelve al componente el resultado o el error del gestor, sin reinterpretarlo.
- No duplica invariantes ni decide permisos: eso lo hace el gestor.
- Usa SQL directo con el driver de PostgreSQL, sin ORM, y `import 'server-only'` en `server/db`.

## Capa de presentación: comportamiento observable

- Cada vista cubre los estados diseñados en el informe: [casos por mockup](../testing/interface-cases.csv).
- Todos los listados tabulares tienen búsqueda, ordenamiento por columna y paginación.
- Las validaciones son para la experiencia de usuario; nunca sustituyen las del gestor.
- Maneja carga, vacío, error y confirmaciones coherentes con los criterios originales.

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

Cada spec lista en su sección 5 las claves foráneas hacia tablas de otras capacidades. Como las claves foráneas se crean después de todas las tablas (`database/02_claves/`), ninguna capacidad espera a otra para crear sus tablas.

## Política de cambios

Cada contrato público se describe primero mediante su capacidad SDD. Las pruebas verifican que la aplicación y la interfaz no alteran el comportamiento definido por la base de datos.
