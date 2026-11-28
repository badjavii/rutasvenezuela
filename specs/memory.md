# Estado de especificaciones

Estado: planificación SDD/TDD sin implementación funcional verificada.

Se conserva el modelo relacional aceptado de la primera entrega. Arquitectura adoptada el 24/11/2026: Next.js (presentación y aplicación) y PostgreSQL en Supabase (datos), con las reglas y la autorización en el gestor. Esquema `rutasvzla`.

Siguiente paso (fase 1): cada integrante crea las tablas de sus capacidades en `database/01_tablas/` y sus claves foráneas en `database/02_claves/`, según las [convenciones](../docs/development/database-conventions.md). Antes, cada responsable revisa y aprueba sus especificaciones.

El progreso individual se registra exclusivamente en el `tasks.md` de cada capacidad.

## Iteración territorial

PR #9: las pruebas estructurales de estado, municipio y parroquia verificaron RED (`ef17348`) y GREEN (`fff4984`) en PostgreSQL 17. La propuesta de tipos y acciones referenciales requiere revisión; las rutinas, permisos, datos de prueba persistentes y aplicación siguen pendientes. No se declara completada la capacidad.

## Iteración de vías y tramos

28/11/2026: las pruebas estructurales de `via`, `via_modo`, `tramo` y `conecta` verificaron RED (`3e4ea47`) y GREEN (`be59af0`) en PostgreSQL 18. RR-29 y RR-30 verificaron RED (`6f5dfce`) y GREEN (`e95b135`) con triggers de restricción diferidos. Las rutinas, los permisos y los datos de prueba siguen pendientes. No se declara completada la capacidad.

## Iteración de paradas

28/11/2026: tablas, claves y reglas de movilidad-paradas (RR-20, RR-21, RR-31, RR-32, RR-33, RR-101, RR-104, RR-105 y vía habilitada) verificaron RED (`51374d9`) y GREEN (`6fab451`) en PostgreSQL 18. `build.sql` y `test.sql` fijan `\encoding UTF8` (`bdc0f68`): sin eso, psql en Windows con la salida redirigida guardaba mal las tildes de los `CHECK`. Pendiente: las claves foráneas hacia `ubicacion_geografica`, `horario` e `hito`, los valores de `nivel_adecuacion` y `nivel_dificultad` (el informe no los define), las rutinas y los permisos.

## Iteración de rutas

28/11/2026: tablas, claves y reglas de rutas-gestion (RR-22, RR-34, RR-35, RR-36, RR-106 a RR-111) verificaron RED (`ff6f1d5`) y GREEN (`1925caf`) en PostgreSQL 18. La secuencia de cada ruta (RR-34, RR-108, RR-109, RR-110 y RR-111) se verifica al confirmar con `fn_verificar_secuencia_ruta`. RR-111 era un `CHECK` y pasó ahí (`4d004f4`): al renombrar un municipio, la cascada cambia el municipio de la ruta y el del hito en pasos distintos, y el `CHECK` lo rechazaba a mitad. Pendiente: claves hacia `hito` y `visitante`, rutinas y permisos.

## Aprobación de specs

27/11/2026: Sebastián aprobó sus 8 especificaciones de `mobility-routes`. Sus 33 historias pasan a `ESPECIFICADO_APROBADO` en la [matriz](../docs/requirements/traceability-detailed.csv), y cada spec registra sus decisiones de implementación en la sección 8. Javier y Valeria aprueban las suyas del mismo modo.
