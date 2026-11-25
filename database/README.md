# Base de datos

Scripts de PostgreSQL de RutasVenezuela, en el esquema `rutasvzla`. El orden, los nombres y la regla de un archivo por capacidad están en las [convenciones de base de datos](../docs/development/database-conventions.md).

```text
database/
├── 00_esquema.sql     # extensiones, esquema y roles base (fase 1)
├── 01_tablas/         # CREATE TABLE sin claves foráneas, un archivo por capacidad
├── 02_claves/         # claves foráneas
├── 03_reglas/         # triggers, funciones y procedimientos (PL/pgSQL)
├── 04_seguridad/      # GRANT/REVOKE a los roles de actor
├── 05_datos/          # datos de prueba
├── tests/             # pruebas SQL (BEGIN … ROLLBACK)
└── build.sql          # ejecuta todo en orden con \ir (fase 1)
```

`schema.sql` se conserva vacío por la acción acordada en las [observaciones del ERE](../docs/project/ere-feedback.md); en la fase 1 lo reemplazan `00_esquema.sql` y `build.sql`.

Construir la base desde cero:

```bash
psql "$DATABASE_URL" -f database/build.sql
```
