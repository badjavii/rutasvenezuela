# Arquitectura de RutasVenezuela

Tres capas y dos tecnologías: Next.js para la capa de presentación y la capa de aplicación, y PostgreSQL alojado en Supabase para la capa de datos. Adoptada por el equipo el 24/11/2026, a partir de la propuesta de arquitectura de la segunda entrega.

## Estado de las decisiones

| Decisión | Estado | Fundamento |
|---|---|---|
| PostgreSQL como SGBDR OLTP | Confirmada verbalmente | Aprobación presencial de la profesora |
| Modelo relacional de primera entrega | Validado, sin cambios solicitados | Aclaración del equipo tras la devolución calificada con 17,3/20 |
| Observaciones de ERE | Mejoras conceptuales, sin rediseño obligatorio del relacional | Técnicas alternativas y oportunidades de generalización, legibilidad y extensibilidad |
| Supabase para alojar PostgreSQL | Confirmada verbalmente | Se usa solo como PostgreSQL: sin Supabase Auth, sin su API automática y sin RLS |
| Reglas de negocio en el gestor | Confirmada | Restricciones, triggers, funciones y procedimientos en PL/pgSQL |
| Arquitectura web de tres capas | Confirmada | Recomendación presencial de la profesora |
| Next.js (presentación y aplicación) | Adoptada | Propuesta de arquitectura de la segunda entrega |
| Autorización con roles de PostgreSQL | Adoptada | Un rol por actor, `GRANT`/`REVOKE` y `SET LOCAL ROLE` por operación |
| Esquema `rutasvzla` | Adoptada | Ver [convenciones de base de datos](development/database-conventions.md) |
| PostgreSQL local en la defensa | Pendiente de confirmar con la profesora | La base se construye desde los scripts del repositorio |

## Separación de responsabilidades

```text
Navegador
  └─ HTML generado por Next.js y client components ("use client")
       ↓ formularios y acciones (sin SQL ni credenciales en el navegador)
Servidor Next.js
  ├─ Capa de presentación: server components (app/, components/)
  └─ Capa de aplicación: server actions ("use server") y server/db
       · lee la sesión (cookie firmada)
       · BEGIN; SET LOCAL ROLE <rol del actor>; SELECT fn_…() o CALL sp_…(); COMMIT
       ↓ SQL directo con el driver de PostgreSQL, sin ORM
PostgreSQL (Supabase), esquema rutasvzla
  └─ Tablas, restricciones, triggers, funciones, procedimientos, roles y privilegios
```

La base de datos determina las invariantes y los permisos aunque la aplicación o la interfaz omitan validaciones. La capa de aplicación no repite reglas del gestor ni decide permisos por su cuenta: fija el rol y llama a la rutina. Las validaciones de la interfaz son solo de experiencia de usuario. Los reportes consultan datos reales.

## Seguridad

- Un rol de PostgreSQL por actor: `rol_visitante`, `rol_guia`, `rol_comercio`, `rol_ente`, `rol_funcionario` y `rol_administrador`, con `GRANT`/`REVOKE` sobre funciones, procedimientos y tablas.
- La aplicación se conecta como `app_rv` (`LOGIN NOINHERIT`), miembro de los roles de actor. Sin `SET ROLE` no tiene privilegios propios.
- `fn_iniciar_sesion` (`SECURITY DEFINER`) valida la contraseña de `cuenta` con `pgcrypto` y devuelve el rol. Antes de que exista una sesión, la aplicación la llama con `SET LOCAL ROLE rol_autenticacion`, un rol técnico que solo puede ejecutar esa rutina. La aplicación guarda la cuenta y el rol en una cookie firmada.
- En cada operación: `SET LOCAL ROLE` y `set_config('app.id_cuenta', …, true)` dentro de la transacción, para que las rutinas sepan quién actúa.
- `rv_owner` es dueño del esquema y de los objetos; `postgres` solo se usa para crear la base y los roles.

## Estructura del repositorio

```text
database/   scripts SQL en orden de construcción (ver database/README.md)
web/        aplicación Next.js (ver web/README.md)
specs/      especificaciones SDD por capacidad
docs/       guías, trazabilidad y casos de prueba
```

Ver [contratos técnicos por capa](development/layer-contracts.md), [convenciones de base de datos](development/database-conventions.md) y el [plan de implementación](project/delivery-plan.md).

## Convenciones

- El alcance académico y la semántica se consultan en [el mapa de trazabilidad](requirements/traceability.md) y las fuentes originales.
- No utilizar tipos o extensiones espaciales incompatibles con el enunciado; las coordenadas se representan mediante tipos numéricos primitivos.
- No permitir acceso directo del navegador al gestor ni exponer credenciales de base de datos.
- Distinguir usuarios/roles del dominio de roles/privilegios del gestor.
- Las decisiones que afecten a las tres capas requieren revisión entre integrantes.
- Los scripts deben ejecutarse en cualquier PostgreSQL, no solo en Supabase.

## Decisiones abiertas prioritarias

1. Confirmar con la profesora que PL/pgSQL cuenta como PL/SQL y que la defensa puede hacerse con PostgreSQL local y pgAdmin.
2. Definir cómo encuentra el sistema la cuenta a partir del identificador que escribe el actor: está en su relación (cédula, RIF, registro del guía) y se enlaza con `CUENTA` por `CUENTA_<ACTOR>`.
3. Definir cómo elige el rol una persona con varios roles (HU-08, criterio 3).
4. Acordar despliegue reproducible desde una sola computadora y mecanismo de datos de prueba.
5. Confirmar número de grupo/NRC para el correo obligatorio.

## Fechas

**8 de diciembre de 2026:** entrega y comienzo de defensas. **17 de diciembre de 2026:** segundo examen. El repositorio debe exhibir historial progresivo real de los tres autores.
