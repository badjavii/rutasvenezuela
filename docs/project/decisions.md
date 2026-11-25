# Decisiones técnicas del proyecto

Este registro recoge decisiones vigentes y asuntos abiertos. No sustituye al [informe original](../../references/first-delivery.md).

| Decisión | Estado | Alcance |
|---|---|---|
| PostgreSQL como SGBDR | Confirmado | OLTP, integridad, transacciones, restricciones y rutinas |
| Supabase | Confirmado | Alojamiento del gestor |
| Arquitectura web de tres capas | Confirmado | Presentación → aplicación → base de datos |
| Next.js | Adoptado (24/11/2026) | Capa de presentación y capa de aplicación |
| Supabase solo como PostgreSQL | Adoptado (24/11/2026) | Sin Supabase Auth, API automática ni RLS |
| Autorización con roles de PostgreSQL | Adoptado (24/11/2026) | Un rol por actor, `GRANT`/`REVOKE` y `SET LOCAL ROLE` |
| Esquema `rutasvzla` y nombres snake_case | Adoptado (24/11/2026) | [Convenciones de base de datos](../development/database-conventions.md) |
| Modelo relacional de primera entrega | Aceptado, sin cambios solicitados | Fuente de verdad de relaciones, claves y RR |
| Branching: develop → main | Adoptado en documentación | `develop` integra; `main` publica tags |

Las decisiones pendientes no deben introducir dependencias irreversibles en las especificaciones del dominio. Los cambios deberán justificarse y quedar documentados en su PR.
