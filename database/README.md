# Base de datos

Scripts de PostgreSQL de RutasVenezuela, en el esquema `rutasvzla`. El orden, los nombres y la regla de un archivo por capacidad están en las [convenciones de base de datos](../docs/development/database-conventions.md).

```text
database/
├── 00_esquema.sql     # pgcrypto en extensions, esquema y roles base; común, no crea tablas
├── 01_tablas/         # CREATE TABLE sin claves foráneas, un archivo por capacidad (ya creados, vacíos)
├── 02_claves/         # claves foráneas, un archivo por capacidad (ya creados, vacíos)
├── 03_reglas/         # triggers, funciones y procedimientos (PL/pgSQL)
├── 04_seguridad/      # GRANT/REVOKE a los roles de actor
├── 05_datos/          # datos de prueba
├── tests/             # pruebas SQL (BEGIN … ROLLBACK)
├── build.sql          # ejecuta todo en orden con \ir, en una transacción
└── test.sql           # corre las pruebas de tests/
```

Requiere PostgreSQL 16 o posterior; la revisión de GitHub usa PostgreSQL 17.

Construir la base desde cero y probarla (borra y recrea el esquema `rutasvzla`; los roles se conservan):

```bash
psql "$DATABASE_URL" -f database/build.sql
psql "$DATABASE_URL" -f database/test.sql
```

`DATABASE_URL` es la cadena de conexión del administrador de la base (`postgres`). Va en el entorno o en un `.env` que no se sube al repositorio. Usar una instancia local desechable o un proyecto de Supabase dedicado a pruebas sin datos que deban conservarse. No ejecutar la reconstrucción en el entorno compartido o de producción.

La contraseña de `app_rv` no está en los scripts. Se fija una vez por servidor, a mano:

```sql
ALTER ROLE app_rv PASSWORD '…';
```

La revisión de GitHub «Base de datos» corre `build.sql` dos veces (para comprobar que se puede repetir) y `test.sql` en un PostgreSQL limpio en cada PR.
