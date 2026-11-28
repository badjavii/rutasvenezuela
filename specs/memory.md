# Estado de especificaciones

Estado: planificación SDD/TDD sin implementación funcional verificada.

Se conserva el modelo relacional aceptado de la primera entrega. Arquitectura adoptada el 24/11/2026: Next.js (presentación y aplicación) y PostgreSQL en Supabase (datos), con las reglas y la autorización en el gestor. Esquema `rutasvzla`.

Siguiente paso (fase 1): cada integrante crea las tablas de sus capacidades en `database/01_tablas/` y sus claves foráneas en `database/02_claves/`, según las [convenciones](../docs/development/database-conventions.md). Antes, cada responsable revisa y aprueba sus especificaciones.

El progreso individual se registra exclusivamente en el `tasks.md` de cada capacidad.

## Iteración territorial

PR #9: las pruebas estructurales de estado, municipio y parroquia verificaron RED (`ef17348`) y GREEN (`fff4984`) en PostgreSQL 17. La propuesta de tipos y acciones referenciales requiere revisión; las rutinas, permisos, datos de prueba persistentes y aplicación siguen pendientes. No se declara completada la capacidad.

## Iteración de vías y tramos

28/11/2026: las pruebas estructurales de `via`, `via_modo`, `tramo` y `conecta` verificaron RED (`3e4ea47`) y GREEN (`be59af0`) en PostgreSQL 18. RR-29, RR-30, las rutinas, los permisos y los datos de prueba siguen pendientes. No se declara completada la capacidad.

## Aprobación de specs

27/11/2026: Sebastián aprobó sus 8 especificaciones de `mobility-routes`. Sus 33 historias pasan a `ESPECIFICADO_APROBADO` en la [matriz](../docs/requirements/traceability-detailed.csv), y cada spec registra sus decisiones de implementación en la sección 8. Javier y Valeria aprueban las suyas del mismo modo.
