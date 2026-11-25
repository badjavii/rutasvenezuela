# Convenciones de base de datos

Cómo se pasa el modelo relacional de la primera entrega a tablas físicas de PostgreSQL. Aplica a todas las capacidades.

## Esquema

Todos los objetos del proyecto van en el esquema `rutasvzla`, no en `public`. Cada script empieza con:

```sql
SET search_path TO rutasvzla, public;
```

`public` queda solo para extensiones como `pgcrypto`.

## Nombres

Los objetos conservan los nombres en español del modelo relacional, para que la trazabilidad con la primera entrega sea directa. Se escriben en minúsculas y snake_case, sin comillas, sin tildes ni ñ. PostgreSQL convierte a minúsculas todo identificador sin comillas, así que `idCuenta` y `idcuenta` serían el mismo nombre ilegible; por eso se separa con guion bajo.

| Modelo relacional | Tabla física | Regla |
|---|---|---|
| `CUENTA(idCuenta, contrasena)` | `cuenta(id_cuenta, contrasena)` | Relación en minúsculas; atributo camelCase → snake_case |
| `HITO(…, nombreHito, libreAcceso)` | `hito(…, nombre_hito, libre_acceso)` | Igual |
| `UBICACION_GEOGRAFICA(latitud, …)` | `ubicacion_geografica(latitud, …)` | Ya está en snake_case: solo minúsculas |
| `RECURSO_3D(idRecurso, tamanoMB)` | `recurso_3d(id_recurso, tamano_mb)` | Una sigla en mayúsculas cuenta como una palabra |

Cuando una clave foránea renombra atributos en el modelo (por ejemplo `estadoHito` en `SE_UBICA_EN`), se conserva ese nombre: `estado_hito`.

## Restricciones y rutinas

| Objeto | Nombre | Ejemplo |
|---|---|---|
| Clave primaria | `pk_<tabla>` | `pk_hito` |
| Clave foránea | `fk_<tabla>_<tabla_referida>` | `fk_hito_parroquia` |
| Unicidad | `uq_<tabla>_<columnas>` | `uq_categoria_denominacion` |
| Comprobación | `ck_<tabla>_<regla>` | `ck_recorrido_fin_posterior` |
| Función | `fn_<accion>` | `fn_iniciar_sesion` |
| Procedimiento | `sp_<accion>` | `sp_registrar_hito` |
| Función de trigger | `tf_<tabla>_<regla>` | `tf_incidencia_estado` |
| Trigger | `tg_<tabla>_<regla>` | `tg_incidencia_estado` |
| Rol de actor | `rol_<actor>` | `rol_visitante`, `rol_guia`, `rol_comercio`, `rol_ente`, `rol_funcionario`, `rol_administrador` |

Cada restricción que implementa una RR lleva un comentario con su código (`-- RR-31`), para enlazarla con el [catálogo RR](../requirements/relational-rules.md) y sus [casos de prueba](../testing/database-cases.csv).

## Tipos

- Coordenadas (latitud, longitud, elevación, altitud): `NUMERIC`, sin tipos espaciales (HU-02, criterio 3).
- Contraseñas: se guarda el hash de `crypt(…, gen_salt('bf'))` de `pgcrypto`, nunca el texto.
- El resto de los tipos y dominios los fija el dueño de cada tabla según los dominios del ERE de la primera entrega.

## Scripts y orden de construcción

Un archivo por capacidad en cada carpeta, con el mismo nombre de la capacidad (por ejemplo `database/01_tablas/patrimonio-hitos.sql`). El autor es el responsable de esa capacidad. Así dos integrantes nunca editan el mismo archivo.

| Orden | Carpeta | Contenido |
|---|---|---|
| 0 | `database/00_esquema.sql` | Extensiones, esquema `rutasvzla` y roles base (`rv_owner`, `app_rv`, roles de actor) |
| 1 | `database/01_tablas/` | `CREATE TABLE` con clave primaria, `NOT NULL`, `UNIQUE` y `CHECK` simples, sin claves foráneas |
| 2 | `database/02_claves/` | `ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY` |
| 3 | `database/03_reglas/` | Triggers, funciones y procedimientos en PL/pgSQL |
| 4 | `database/04_seguridad/` | `GRANT`/`REVOKE` a los roles de actor |
| 5 | `database/05_datos/` | Datos de prueba |
| — | `database/tests/` | Pruebas SQL, cada una dentro de `BEGIN … ROLLBACK` |

Un script `database/build.sql` ejecuta todo en ese orden con `\ir` de `psql`. Las claves foráneas van después de todas las tablas para que el orden de creación no importe y para romper los ciclos entre capacidades (por ejemplo `instituciones-entes` ↔ `actores-identidades`). La clave foránea la escribe el dueño de la tabla que referencia, en su propio archivo de `02_claves/`.

## Ejecución

- En desarrollo: contra la base de Supabase con `psql` o con la herramienta PSQL de pgAdmin. El editor SQL de Supabase no entiende `\ir`.
- En la defensa: el mismo `build.sql` sobre un PostgreSQL local, sin pasos manuales.
