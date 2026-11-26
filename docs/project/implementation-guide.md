# Cómo abordamos la implementación

Esta guía explica de principio a fin cómo vamos a pasar de las especificaciones al sistema funcionando: qué le toca a cada integrante, en qué orden se trabaja, cómo es una rama de punta a punta y cuándo algo está terminado. Resume y enlaza los documentos de detalle, sin reemplazarlos. Si algo de aquí contradice al [informe entregado](../../references/first-delivery.md) o a una guía de detalle, manda la fuente original y se corrige esta guía.

## 1. El sistema en una imagen

```text
Navegador ──► Next.js ───────────────────────────► PostgreSQL (Supabase)
              app/, components/   presentación      esquema rutasvzla
              server/actions/     aplicación        tablas, reglas (PL/pgSQL),
              server/db/          conexión y rol     roles y GRANT
```

- **Presentación (`web/app`, `web/components`):** las 21 vistas de la primera entrega. Solo muestran datos y formularios.
- **Aplicación (`web/server`):** una server action por operación. Lee la sesión, abre una transacción, cambia al rol del actor (`SET LOCAL ROLE`), llama a una función o procedimiento del gestor y devuelve el resultado o el error.
- **Datos (`database/`):** PostgreSQL decide todo lo que es regla: integridad, reglas relacionales (RR), triggers y permisos. Supabase se usa solo como PostgreSQL alojado, sin Auth, API automática ni RLS.

La razón de fondo: el proyecto se evalúa sobre el gestor, así que las reglas y la seguridad viven en la base y no en TypeScript. Detalle en [arquitectura](../architecture.md) y [contratos por capa](../development/layer-contracts.md).

## 2. Dónde estamos (26/11/2026)

| Pieza | Estado | Dónde |
|---|---|---|
| Specs SDD de las 23 capacidades | En `develop`, cada responsable debe aprobar las suyas | [specs/](../../specs/README.md) |
| Esquema base, roles, `build.sql`, `test.sql` y CI con PostgreSQL 17 | En `develop` (PR #6) | [database/](../../database/README.md) |
| Rol `rol_autenticacion` y pgcrypto en el esquema `extensions` | En revisión (PR #10) | `database/00_esquema.sql` |
| Contrato de seguridad (identidad, propiedad, competencia, 23 casos) | En revisión (PR #7) | `docs/development/security.md` (al integrarse) |
| Convenciones de TypeScript y Next.js | En revisión (PR #8) | `docs/development/` |
| Primeras tablas: catálogo territorial | En revisión (PR #9), sirve de ejemplo para las demás | `database/01_tablas/territorio-catalogo.sql` |
| Proyecto Next.js en `web/` | Sin crear | [web/README.md](../../web/README.md) |
| Proyecto de Supabase y `.env` | Sin crear | — |

Según el calendario de la primera entrega (sección 1.4), hoy cierra el sprint 3. Solo está hecha la base del esquema, así que hay que replanificar lo que queda (sección 6).

## 3. Qué le toca a cada uno

Cada integrante es dueño de sus capacidades en **todas las capas**: tablas, claves, reglas, permisos, datos de prueba, server actions y vistas. Nadie edita un archivo de otra capacidad. Por eso hay un archivo por capacidad en cada carpeta de `database/`.

### Capacidades con tablas (84 relaciones del modelo entregado)

| Integrante | Capacidad | Tablas |
|---|---|---|
| Javier (30) | territorio-catalogo | `estado`, `municipio`, `parroquia` |
| | instituciones-entes | `ente_publico`, `cuenta_ente_publico`, `competencia` |
| | patrimonio-hitos | `hito`, `categoria`, `clasifica`, `ubicacion_geografica`, `registra`, `horario`, `abre`, `se_ubica_en` |
| | patrimonio-anclajes-3d | `punto_geoespacial`, `punto_hipervinculo`, `recurso_3d`, `proyecta` |
| | patrimonio-eventos | `evento` |
| | incidencias-gestion | `incidencia`, `genera`, `afecta_hito`, `afecta_tramo`, `verifica`, `prorroga`, `cierra` |
| | evaluaciones-publicacion | `evaluacion_experiencia`, `respaldada_por`, `evalua_hito`, `evalua_ruta` |
| Sebastián (30) | movilidad-vias-y-tramos | `via`, `via_modo`, `tramo`, `conecta` |
| | movilidad-paradas | `parada_transporte`, `equipamiento_urbano`, `se_localiza`, `esta_en`, `funciona`, `cercana` |
| | rutas-gestion | `ruta_turistica`, `ruta_fija`, `ruta_dinamica`, `conforma`, `usa`, `crea` |
| | rutas-recorridos | `recorrido`, `realiza`, `sobre`, `transita` |
| | guias-contrataciones | `guia`, `cuenta_guia`, `guia_idioma`, `guia_especialidad`, `trabaja`, `sirve`, `contratacion`, `contrata_visitante`, `contrata_guia`, `contrata_ruta` |
| Valeria (24) | actores-identidades | `cuenta`, `visitante`, `cuenta_visitante`, `funcionario`, `cuenta_funcionario`, `pertenece_a`, `administrador`, `cuenta_administrador` |
| | actores-comercios | `comercio`, `cuenta_comercio`, `ubicado`, `disponible` |
| | credenciales-gestion | `credencial_digital`, `adquiere`, `ampara`, `reserva_hito`, `reserva_comercio`, `valida` |
| | promociones-experiencias | `experiencia_turistica`, `promueve`, `dirige`, `transcurre`, `incluye`, `incluye_comercio` |

### Capacidades sin tablas propias (consultas, reportes y valor agregado)

Trabajan sobre tablas de otros, con funciones de consulta y vistas.

| Integrante | Capacidad | Historias |
|---|---|---|
| Javier | reportes-conservacion, reportes-seguridad-rutas | RP-1, VA-4 |
| Sebastián | movilidad-servicios-y-transbordos, rutas-tiempos-y-desvios, reportes-afluencia | HU-04, HU-05, VA-1, VA-2, RP-3 |
| Valeria | evaluaciones-consulta, reportes-promociones | HU-06, RP-2 |

Lo que hay que hacer en cada capacidad está en su `specs/<módulo>/<capacidad>/tasks.md`. Es el único lugar donde se marca el progreso.

### Responsabilidades transversales (plan de la segunda entrega, sección 1.4 del informe)

En la matriz del informe, R es quien hace su parte, V es quien revisa el conjunto y R/V hace ambas cosas.

| Entregable | Sprint | Responsable |
|---|---|---|
| Modelo entidad-relación corregido | S2 | Los tres (R/V: Javier) |
| Scripts de creación con la autoría de cada integrante | S1 a S4 | Cada quien los de sus HU |
| Reglas de integridad automatizadas en el gestor | S1 a S3 | Cada quien las de sus HU (R/V: Sebastián) |
| CRUD, interfaces y algoritmos | S1 a S4 | Cada quien los de sus HU |
| Tablas con paginado, orden por columnas y búsqueda avanzada | S1 | Valeria |
| Reportes | S4 | RP-1 Javier, RP-2 Valeria, RP-3 Sebastián |
| Seguridad lógica: roles, cuentas y privilegios | S1 (base) y S4 (completa) | Sebastián (R/V) |
| Datos de prueba en volumen, realistas y del contexto venezolano | S1 a S4 | Cada quien los de sus tablas (V: Valeria) |

## 4. Cómo se trabaja una capacidad, paso a paso

Es el mismo ciclo para todos. Una rama puede cubrir una sola capa (por ejemplo, solo tablas). Es mejor así: PR chicos se revisan más rápido.

### 4.1 Antes de empezar

1. Leer y **aprobar tu spec** (`spec.md`, `plan.md`, `tasks.md`). Si un criterio no coincide con el informe, se corrige la spec primero, en un PR de documentación.
2. Revisar los tipos en las [convenciones de base de datos](../development/database-conventions.md): una clave foránea tiene el mismo tipo que la columna a la que apunta.

### 4.2 Crear la rama

Siempre desde `develop` actualizado:

```bash
git switch develop && git pull
bash scripts/new-work-branch.sh <autor> <tipo> <capa> <slug> "<resumen>"
# ejemplo:
bash scripts/new-work-branch.sh sebastian feat database vias-tablas "Tablas de vías y tramos"
```

Crea la rama `sebastian(feat/database)-vias-tablas`, un README de trazabilidad propio de la rama y su fila en el [registro de ramas](branch-ledger.csv). En Windows, si `python3` abre la Microsoft Store, ejecutar la parte de Python del script con `python`. Detalle en [git workflow](../development/git-workflow.md).

### 4.3 Ciclo TDD dentro de la rama

TDD aquí significa **escribir primero la prueba, verla fallar y después escribir lo mínimo para que pase**, en cualquier capa. En la base de datos las pruebas son archivos SQL, no pruebas unitarias de JavaScript.

```text
RED       escribir database/tests/<capacidad>.sql y agregarlo a database/test.sql
          → commit → CI falla por la razón esperada (la tabla o la regla no existe)
GREEN     escribir lo mínimo en 01_tablas / 02_claves / 03_reglas …
          → commit → CI pasa (build dos veces y todas las pruebas)
REFACTOR  ordenar sin cambiar el comportamiento → CI sigue pasando
```

- Cada prueba va entre `BEGIN … ROLLBACK`, así no deja datos.
- Por cada RR hay al menos un caso válido (se acepta) y uno de violación (el gestor rechaza). Son 268 casos planificados en [database-cases.csv](../testing/database-cases.csv).
- Se anota el commit RED y el GREEN en `tasks.md` y en la descripción del PR. Es la evidencia de que se hizo TDD.
- El PR #9 (catálogo territorial) es el ejemplo a seguir: prueba de duplicados, nulos y claves foráneas inexistentes.

### 4.4 Qué va en cada carpeta

| Orden | Carpeta | Qué escribe el dueño | Prueba RED típica |
|---|---|---|---|
| 1 | `01_tablas/<cap>.sql` | `CREATE TABLE` con clave primaria, `NOT NULL`, `UNIQUE` y `CHECK` simples | Insertar duplicado o nulo y esperar el rechazo |
| 2 | `02_claves/<cap>.sql` | Claves foráneas de **tus** tablas, aunque apunten a tablas de otro | Insertar con referencia inexistente |
| 3 | `03_reglas/<cap>.sql` | Triggers, funciones y procedimientos en PL/pgSQL para las RR y las operaciones | Caso válido y caso de violación de cada RR |
| 4 | `04_seguridad/<cap>.sql` | `GRANT EXECUTE` de cada rutina al rol del actor | Rol sin permiso → rechazo del gestor |
| 5 | `05_datos/<cap>.sql` | Datos de prueba persistentes | Conteos y consultas sobre los datos |

`build.sql` corre primero todos los `01_tablas` y después todos los `02_claves`. Por eso no importa el orden de creación entre capacidades y se rompen los ciclos (por ejemplo, instituciones ↔ identidades). Si tu clave foránea apunta a una tabla que todavía no está en `develop`, déjala anotada como pendiente en `tasks.md` y agrégala cuando se integre la otra.

### 4.5 Capas de aplicación y presentación

Cuando la base de una capacidad está en `develop`:

1. **Server action** en `web/server/actions/<cap>.ts`: usa `conActor(sesion, operación)`. Este helper abre la transacción, hace `SET LOCAL ROLE`, fija `app.id_cuenta` y llama a la rutina. No contiene reglas de negocio ni decisiones de permisos.
2. **Prueba de la action:** el rol correcto obtiene el resultado y un rol sin privilegio recibe el error del gestor.
3. **Vista** en `web/app/`: los estados de la [matriz de interfaz](../testing/interface-cases.csv). Los listados tienen búsqueda, orden y paginación.

### 4.6 Abrir el PR

```bash
bash scripts/prepare-pr.sh     # restaura el README de develop y deja la fila lista para revisión
git push -u origin <rama>
gh pr create --base develop    # descripción en español con la plantilla del repositorio
```

- El PR lo revisa otro integrante. Quien lo abre no lo integra.
- Si tocas algo compartido (`00_esquema.sql`, `build.sql`, convenciones), avisa en el PR a quien afecte.
- Se integra sin squash, para que se vean los commits de cada uno. El [plan de entrega](delivery-plan.md) pide commits progresivos reales de cada integrante, y los scripts llevan la autoría de cada quien.

## 5. En qué orden se construye

Las piezas dependen unas de otras. Este es el orden y el porqué:

```text
Fase 0  Acuerdos      tipos, acciones referenciales, specs aprobadas, PR #7 #8 #10
   │
Fase 1  Tablas        01_tablas + 02_claves de las 84 relaciones
   │                  (sin tablas no hay dónde probar reglas)
   ├──────────────┐
Fase 2  Reglas    Fase 2b  Base web
   03_reglas         web/ Next.js, server/db con conActor,
   04_seguridad      inicio de sesión (fn_iniciar_sesion)
   05_datos             │
   │                    │
   └────────┬───────────┘
Fase 3  Funcionalidad   por capacidad: actions + vistas
                        CRUD → operaciones → consultas → reportes → VA
   │
Cierre  Integración     casos E2E, regresión, ensayo de defensa, congelar
```

- **Las tablas van primero** porque todas las pruebas de reglas y de la aplicación necesitan tablas reales.
- **La seguridad se diseña en la fase 0 y se aplica desde la fase 2.** Cada rutina nace con su `GRANT` y con la verificación de propiedad o competencia del contrato de seguridad (PR #7). No se deja para el final.
- **La base web (fase 2b) va en paralelo** a las reglas: el `conActor` y el inicio de sesión los usan todas las capacidades, así que conviene que estén listos cuando lleguen las server actions.

## 6. Calendario

### Lo que dice la primera entrega (sección 1.4 y matriz del cap. 8)

| Sprint | Fechas | Contenido | Javier | Sebastián | Valeria |
|---|---|---|---|---|---|
| S1 | 06/11–12/11 | Base de datos, seguridad base, CRUD de territorio, vías y actores | HU-11, 12, 31, 33, 34 | HU-15, 29, 35 | HU-08, 09, 30 |
| S2 | 13/11–19/11 | CRUD de catálogo y correcciones | HU-10, 13, 14, 24 | HU-03, 16, 17 | HU-07, 23, 26 |
| S3 | 20/11–26/11 | Operaciones y reglas del negocio | HU-19, 20, 22, 36, 37 | HU-05, 21, 25, 28 | HU-06, 18, 27, 32 |
| S4 | 27/11–03/12 | Consultas, reportes, valor agregado, seguridad completa | HU-01, 02, RP-1, VA-4 | HU-04, RP-3, VA-1, VA-2, VA-3 | RP-2 |
| Cierre | 04/12–07/12 | Pruebas E2E, ensayo de defensa, congelamiento | todos | todos | todos |

Entrega y defensa: **08/12/2026**.

### Propuesta de reajuste (pendiente de acuerdo entre los tres)

Mantiene el contenido y el orden de los sprints, y comprime las fechas a los 12 días que quedan.

| Fase | Fechas | Qué tiene que quedar en `develop` |
|---|---|---|
| 0. Acuerdos | 26/11–27/11 | PR #7, #8, #9 y #10 integrados. Tabla de tipos y acciones referenciales aprobadas. Cada uno aprueba sus specs. Proyecto de Supabase creado |
| 1. Tablas | 27/11–29/11 | `01_tablas` y `02_claves` de las 84 relaciones, con sus pruebas estructurales |
| 2. Reglas y base web | 29/11–02/12 | RR y CRUD de los sprints S1–S2 en `03_reglas`, con `04_seguridad` y `05_datos`. `web/` creado, con `conActor` e inicio de sesión |
| 3. Funcionalidad | 01/12–05/12 | Server actions y vistas por capacidad: CRUD (S1–S2), operaciones (S3), consultas, reportes y VA (S4) |
| Cierre | 06/12–07/12 | Casos E2E, regresión, release `develop → main` con tag, ensayo de defensa |
| Entrega | 08/12 | Defensa |

Cada integrante avanza con sus HU en el orden de la tabla de sprints: primero lo de S1, después S2, y así.

## 7. Reglas de seguridad, en corto

El detalle y los 23 casos de prueba están en el contrato de seguridad (PR #7). Lo que todos deben respetar:

1. **Next.js se conecta con un solo usuario, `app_rv`**, que no tiene permisos propios. En cada operación cambia al rol del actor con `SET LOCAL ROLE`, dentro de una transacción.
2. **Los roles de actor no tienen permisos sobre tablas**, solo `EXECUTE` sobre las rutinas que les corresponden. Así nadie salta las reglas con un `UPDATE` directo.
3. **Toda rutina es `SECURITY DEFINER` con `SET search_path = rutasvzla, pg_temp`**, y no se ejecuta sin un `GRANT` explícito: los privilegios por defecto se lo quitan a PUBLIC.
4. **Quién es el usuario** lo dice `fn_cuenta_actual()`, que lee `app.id_cuenta`. Nunca se acepta un id de cuenta enviado por el formulario.
5. **Propiedad y competencia se verifican en la base:** una rutina que modifica algo comprueba que pertenece al actor (CREA, REALIZA, ADQUIERE…) o que el funcionario tiene competencia sobre el lugar.
6. **Contraseñas** con `extensions.crypt` y `extensions.gen_salt('bf')`. Nunca en texto plano. Ni la contraseña de `app_rv` ni otros secretos van al repositorio.

## 8. Cuándo algo está terminado

Una historia está hecha cuando:

- [ ] Sus pruebas SQL (válido y violación de cada RR asociada) pasan en CI.
- [ ] Sus rutinas tienen `GRANT` solo al rol que corresponde y una prueba de rechazo para otro rol.
- [ ] Hay datos de prueba realistas (contexto venezolano) que permiten mostrarla en la defensa.
- [ ] La server action y la vista funcionan con los estados de la matriz de interfaz.
- [ ] Sus criterios de aceptación de la primera entrega se ejecutaron y pasan.
- [ ] Está marcada en `tasks.md`, con los commits RED y GREEN, e integrada en `develop`.

Que esté documentada no la hace terminada. Solo cuenta lo que se ejecutó.

## 9. Decisiones pendientes

| Decisión | Qué falta | Bloquea |
|---|---|---|
| Tabla común de tipos | Aprobación de los tres (hoy dice «Propuesta») | Fase 1 |
| Acciones referenciales (`ON UPDATE CASCADE`, `ON DELETE RESTRICT`, como en el PR #9) | Ratificar para todo el modelo | Fase 1 |
| Integrar PR #7 con los ajustes de concurrencia (`FOR SHARE`) y revocación de sesiones | Revisión de Javier | Fase 2 |
| Identificador de inicio de sesión y cuentas con varios roles (HU-08) | Decisión de Valeria y del equipo | Inicio de sesión |
| Modelo entidad-relación corregido (entregable 1, S2) | Aplicar las observaciones del [ERE](ere-feedback.md), R/V Javier | Documento de la segunda entrega |
| Quién crea el proyecto de Supabase y cómo se comparte el `.env` | Acordar | Fase 2b |
| Quién inicializa `web/` | Acordar | Fase 2b |

## 10. Dudas frecuentes

**¿Cada uno crea sus tablas o una persona crea todas?** Cada uno las suyas, en su archivo de `01_tablas`. Lo común (`00_esquema.sql`) ya está hecho.

**¿Mi tabla apunta a una de otro integrante. Quién escribe la clave foránea?** Tú, en tu `02_claves`, con el mismo tipo que la columna referenciada.

**¿Puedo cambiar el modelo relacional?** Por ahora no: se sigue el modelo entregado. Si aparece un problema, se discute y se documenta en su propio PR.

**¿Qué hago si CI falla en el PR de otro?** Avisarle en el PR con la salida del error. No se corrige la rama de otro sin acuerdo.

**¿Dónde veo qué RR me tocan?** En el `tasks.md` de tu capacidad y en el [catálogo de RR](../requirements/relational-rules.md).
