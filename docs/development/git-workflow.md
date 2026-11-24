# Flujo Git : RutasVenezuela

El proyecto utiliza `develop` para integración y `main` para versiones estables. No se fusionan ramas de funcionalidad directamente en `main`.

## 1. Modelo de ramas

```text
main                          Versión estable y etiquetada
  ↑ PR de release + CI + revisión
develop                       Integración de funcionalidades verificadas
  ↑ PR + CI + revisión
<author>(<kind>/<layer>)-...  Trabajo individual de cada integrante
```

La rama `develop` se crea desde `main` y concentra los cambios en validación. Cuando una versión esté lista, se abre un PR `develop → main`, se verifica su calidad y, después del merge, se etiqueta el commit en `main`.

Las ramas de trabajo se conservan aun después de integrar sus PR. No se eliminan ramas de desarrollo, no se reescribe su historial y no se utilizan force pushes. Solo se permite retirar excepcionalmente una rama creada con nombre erróneo, previa comprobación de que todos sus commits ya estén conservados en otra rama.

## 2. Convención de ramas

```text
<author>(<kind>/<layer>)-<short-description>
```

- **Author:** `javier`, `sebastian`, `valeria`.
- **Kind:** `feat`, `docs`, `test`, `fix`, `ci`, `refactor`.
- **Layer:** `database`, `backend`, `frontend`, `spec`, `integration`, `infra`.
- **Description:** inglés, minúsculas, palabras separadas con guiones.

Ejemplos:

```text
javier(docs/spec)-consolidate-planning
javier(feat/database)-territory-tables
javier(test/database)-incident-integrity
javier(feat/backend)-incident-reporting
sebastian(feat/database)-road-segments
sebastian(feat/backend)-route-endpoints
valeria(feat/frontend)-credential-management
valeria(test/integration)-credential-redemption
```

Git no permite `:` en nombres de referencia. Por eso la separación final se hace con `-`. En Bash, los paréntesis obligan a entrecomillar el nombre:

```bash
git switch develop
git pull --ff-only origin develop
git switch -c 'javier(feat/database)-territory-tables'
git push -u origin 'javier(feat/database)-territory-tables'
```

## 3. README temporal y registro por rama

La creación de ramas se realiza siempre desde `origin/develop`. No se usa una rama de plantilla como base porque arrastraría código y divergencias. Git no posee un ajuste para seleccionar una rama padre por defecto al usar `git switch -c`; el script de trabajo proporciona ese comportamiento.

```bash
bash scripts/new-work-branch.sh javier feat database territory-tables "Create territory structures"
```

El comando crea la rama, genera un README de estado desde [la plantilla](../../templates/branch-readme.md) y registra la rama en [branch-ledger.csv](../project/branch-ledger.csv). Es un README temporal, que contiene propósito, responsable, capa, cambios previstos, estado de pruebas y PR.

Antes de abrir el PR:

```bash
bash scripts/prepare-pr.sh
```

El script restaura el README institucional de la base de la rama y deja la entrada del registro lista para revisión. Los commits del README temporal siguen en el historial, pero no aparecen en el contenido final del PR. GitHub Actions bloquea los PR cuyo README aún tenga el marcador `BRANCH_STATUS_README`. Las PR que actualicen legítimamente el README institucional se gestionan como cambios documentales independientes.

El registro central contiene las ramas incorporadas mediante PR; las ramas todavía en trabajo pueden aparecer en la plataforma antes de que su registro se integre. Registrar solo fechas y vínculos verificables.

### Rama de demostración

La rama `javier(docs/spec)-branch-readme-preview` sirve para revisar el formato del README. No se utiliza como origen de nuevas ramas ni se fusiona a `develop` sin aprobación.

## 4. Convención de commits

Formato basado en Conventional Commits:

```text
<type>(<scope>): <imperative-summary>
```

Los mensajes de commit se escriben en inglés, usando un verbo en imperativo, sin punto final. El `scope` normalmente identifica la capa o módulo.

```text
feat(database): create territory tables
test(database): cover incident integrity constraints
docs(spec): document territory acceptance scenarios
fix(frontend): correct credential form validation
ci(workflows): validate traceability on develop
refactor(backend): simplify route response mapping
```

Hacer commits pequeños, progresivos y atribuibles al integrante real. No agrupar todo en un solo commit ni fabricar contribuciones.

## 4. Títulos y descripciones de pull requests

**Título:** mismo formato de Conventional Commits y en inglés:

```text
feat(database): implement territory schema
docs(spec): consolidate SDD and TDD planning
fix(backend): handle invalid route parameters
```

**Descripción:** en español, siguiendo la [plantilla oficial](../../.github/pull_request_template.md). Debe contener propósito, módulo, responsable, especificación OpenSpec, cambios realizados, pruebas previstas y ejecutadas, dependencias y riesgos.

**Comentarios en revisión:** describir el comportamiento observado, la corrección concreta solicitada y el requisito/escenario afectado; evitar mensajes ambiguos. Contestar el hilo con la decisión aplicada y el commit que la resuelve.

## 5. Revisión e integración

1. Una rama de trabajo nace de `develop`.
2. El integrante revisa [SDD](sdd-guide.md) y [TDD](tdd-guide.md) antes de implementar.
3. Se crea una PR hacia `develop`, con título y plantilla normalizados.
4. GitHub Actions valida la documentación y, cuando existan, las pruebas funcionales.
5. Un compañero revisa la PR; los cambios compartidos de SQL se coordinan entre responsables.
6. Tras aprobarla, se integra preservando los commits individuales; no se utiliza squash como opción habitual.
7. La rama de origen no se elimina.

`main` y `develop` deben quedar protegidas frente a pushes directos o borrados cuando la configuración del repositorio permita aplicar reglas de protección. Esta política está documentada, pero no implica que la protección de GitHub ya esté habilitada.

## 6. Versiones estables y Git tags

Se usa Semantic Versioning (`MAJOR.MINOR.PATCH`), con tags anotados `vX.Y.Z`.

- **MAJOR:** cambios incompatibles de contratos.
- **MINOR:** nuevas funcionalidades compatibles.
- **PATCH:** correcciones compatibles.

Para llevar `develop` a `main`: abrir PR de release, revisar integración y CI, hacer merge mediante aprobación y etiquetar el commit resultante de `main`.

```bash
git fetch origin
git switch main
git pull --ff-only origin main
git tag -a v0.1.0 -m "Release v0.1.0"
git push origin v0.1.0
```

El tag debe señalar exactamente el commit publicado; no crear versiones en ramas sin revisar. Registrar los cambios del release mediante descripción y, cuando proceda, GitHub Releases.

## 7. Responsabilidades

Cada integrante desarrolla su dominio a través de base de datos, API e interfaz, según la historia. Las dependencias entre módulos se revisan con el responsable correspondiente. No se ejecutan merges a `main` ni despliegues sin revisión humana.
