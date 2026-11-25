# Convenciones de base de datos

Cómo se pasa el modelo relacional de la primera entrega a tablas físicas de PostgreSQL. Aplica a todas las capacidades.

## Esquema

Todos los objetos del proyecto van en el esquema `rutasvzla`, no en `public`. Cada script empieza con:

```sql
SET search_path TO rutasvzla, public, extensions;
```

`public` y `extensions` quedan solo para extensiones como `pgcrypto`: en un PostgreSQL local está en `public` y en Supabase en `extensions`. Un esquema que no existe en el `search_path` se ignora, así que la misma línea sirve en los dos.

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

**Propuesta, pendiente de aprobación de los tres.** El PDF de la primera entrega fija los atributos de cada relación, pero casi nunca su tipo. Para que las claves foráneas entre capacidades coincidan, todos usan esta tabla.

**Regla principal:** una columna que es clave foránea tiene exactamente el tipo de la columna que referencia, aunque el modelo la renombre (`estado_hito`, `tramo_origen`, `municipio_ruta`…).

| Atributos del relacional | Tipo |
|---|---|
| Nombres que forman claves o se referencian: `nombreEstado`, `nombreMunicipio`, `nombreParroquia`, `nombreHito`, `nombreVia`, `nombreRuta`, `nombreParada`, `nombreEvento`, `denominacion`, `tipoEquipamiento` | `VARCHAR(100)` |
| Otros nombres y textos cortos: `nombres`, `apellidos`, `nombreFuncionario`, `razonSocial`, `funcionarioEnlace`, `titulo`, `cargo`, `especialidad`, `paisOrigen`, `idioma`, `idiomaNativo`, `acreditacion`, `decretoAdscripcion`, `permisoSanitario`, `accesibilidad`, `condicionTerreno`, `version`, `formato` | `VARCHAR(100)` |
| Textos largos: `descripcion`, `narrativaEvento`, `opinionTextual`, `justificacion`, `hipervinculo`, `rutaAlmacenamiento` | `TEXT` |
| Identificadores que escribe el actor y códigos: `cedulaPasaporte`, `cedulaFuncionario`, `cedulaAdmin`, `rifInstitucional`, `rifJuridico`, `rtn`, `codigoLicencia`, `codigoTerminal`, `codigoCredencial`, `codigoPromocional`, `codigoResena`, `cuentaBancaria`, `telefonoEmergencia` | `VARCHAR(30)` |
| `correo` | `VARCHAR(254)` |
| Claves que genera el sistema: `idCuenta`, `idRecorrido`, `idRecurso`, `numeroReporte`, `nroContratacion` | `INTEGER GENERATED ALWAYS AS IDENTITY` en la tabla que las crea; `INTEGER` donde se referencian |
| `contrasena` | `TEXT` (hash de `crypt(…, gen_salt('bf'))`, nunca el texto) |
| Listas cerradas: `estadoOperativo`, `estadoVia`, `estadoParada`, `estadoRecorrido`, `estadoCredencial`, `tipoVia`, `modo`, `modalidad`, `nivelTerritorial`, `nivelSeveridad`, `nivelDificultad`, `nivelAdecuacion`, `categoriaComercial`, `visibilidad`, `preferenciaTransporte`, `grupoSanguineo`, `diaSemana` | `VARCHAR(30)` + `CHECK (… IN (…))` con su `-- RR-n`, sin `ENUM`, para que la regla se lea igual que en el capítulo 7 |
| Fechas: `fechaActivacion`, `fechaCierre`, `fechaContratacion`, `fechaEmision`, `fechaEstimadaResolucion`, `fechaInicio`, `fechaVencimiento`, `nuevaFecha` | `DATE` |
| Fecha y hora: `fechaHoraDeteccion`, `fechaHoraInicio`, `fechaHoraFin`, `fechaHoraPaso`, `fechaHoraProgramada` | `TIMESTAMP` (hora de Venezuela: `app_rv` trabaja en `America/Caracas`) |
| Horas: `horaApertura`, `horaCierre`, `mejorHorarioInicio` | `TIME` |
| Duraciones: `duracionEstimada`, `frecuenciaPaso` | `INTEGER` (minutos) |
| Montos: `costo`, `precioTotal`, `montoAbonado`, `tarifaBasica`, `tarifaHoraria` | `NUMERIC(12,2)` |
| Coordenadas: `latitud`, `longitud` | `NUMERIC(9,6)`, sin tipos espaciales (HU-02, criterio 3) |
| Medidas: `elevacion`, `altitudRespectoSuelo`, `alturaDentroEstructura`, `radioActivacion`, `escalaVisualizacion`, `azimut`, `rotacion`, `inclinacion`, `tamanoMB`, `porcentajeDescuento` | `NUMERIC(10,2)` |
| Cantidades: `numeroTramo`, `orden`, `calificacion`, `indiceSeguridad`, `aforo`, `aforoMaximo`, `cupoMaximo`, `cantidadBeneficiarios`, `aniosTrayectoria` | `INTEGER` |
| Sí/no: `libreAcceso`, `recorridoVerificado`, `tieneDesnivel`, `tieneEscalinata` | `BOOLEAN` |

Si un atributo no aparece aquí, se agrega a la tabla en el mismo PR que lo usa.

## Scripts y orden de construcción

Un archivo por capacidad en cada carpeta, con el mismo nombre de la capacidad (por ejemplo `database/01_tablas/patrimonio-hitos.sql`). El autor es el responsable de esa capacidad. Así dos integrantes nunca editan el mismo archivo.

| Orden | Carpeta | Contenido |
|---|---|---|
| 0 | `database/00_esquema.sql` | Extensiones, esquema `rutasvzla` y roles base (`rv_owner`, `app_rv`, roles de actor). Es común y no crea tablas |
| 1 | `database/01_tablas/` | `CREATE TABLE` con clave primaria, `NOT NULL`, `UNIQUE` y `CHECK` simples, sin claves foráneas |
| 2 | `database/02_claves/` | `ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY` |
| 3 | `database/03_reglas/` | Triggers, funciones y procedimientos en PL/pgSQL |
| 4 | `database/04_seguridad/` | `GRANT`/`REVOKE` a los roles de actor |
| 5 | `database/05_datos/` | Datos de prueba |
| — | `database/tests/` | Pruebas SQL, cada una dentro de `BEGIN … ROLLBACK` |

`database/build.sql` ejecuta todo en ese orden con `\ir` de `psql`, en una sola transacción y como `rv_owner`. Ya lista el archivo de cada capacidad con tablas, así que nadie tiene que editarlo para la fase 1. `database/test.sql` corre las pruebas de `database/tests/`. Las claves foráneas van después de todas las tablas para que el orden de creación no importe y para romper los ciclos entre capacidades (por ejemplo `instituciones-entes` ↔ `actores-identidades`). La clave foránea la escribe el dueño de la tabla que referencia, en su propio archivo de `02_claves/`.

## Ejecución

- En desarrollo: contra la base de Supabase con `psql` o con la herramienta PSQL de pgAdmin. El editor SQL de Supabase no entiende `\ir`.
- En la defensa: el mismo `build.sql` sobre un PostgreSQL local, sin pasos manuales.
