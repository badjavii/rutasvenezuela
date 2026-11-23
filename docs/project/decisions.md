# Decisiones técnicas del proyecto

Este registro recoge decisiones vigentes y asuntos abiertos. No sustituye al [informe original](../../references/first-delivery.md).

| Decisión | Estado | Alcance |
|---|---|---|
| PostgreSQL como SGBDR | Confirmado | OLTP, integridad, transacciones, restricciones y rutinas |
| Supabase | Confirmado | Alojamiento del gestor |
| Arquitectura web de tres capas | Confirmado | Presentación → aplicación → base de datos |
| FastAPI/Python | Referencia provisional | Backend, validación y acceso seguro a datos |
| React.js | Referencia provisional | Interfaz web |
| Alternativa basada en Node.js | Pendiente de evaluación | No altera las reglas de PostgreSQL |
| Modelo relacional de primera entrega | Aceptado, sin cambios solicitados | Fuente de verdad de relaciones, claves y RR |
| Branching: develop → main | Adoptado en documentación | `develop` integra; `main` publica tags |

Las decisiones provisionales no deben introducir dependencias irreversibles en las especificaciones del dominio. Los cambios deberán justificarse y quedar documentados en su PR.
