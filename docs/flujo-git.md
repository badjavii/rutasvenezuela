# Flujo Git y pull requests — Equipo 2

## Convención de ramas

Usamos **autor + (tipo/capa) + descripción** con términos en inglés:

```text
<author>(<kind>/<layer>)-<short-description>
```

- **Autor:** `javier`, `sebastian`, `valeria`.
- **Tipo:** `feat` (funcionalidad), `docs` (documentación), `test` (pruebas), `fix` (corrección), `ci` (automatización).
- **Capa:** `database`, `backend`, `frontend`, `spec`, `integration`, `infra`.
- **Descripción:** palabras en inglés, minúsculas, separadas por guiones.

Ejemplos válidos:

```text
javier(docs/spec)-sdd-tdd-traceability
javier(feat/database)-territory-tables
javier(test/database)-incident-integrity
javier(feat/backend)-incident-reporting
sebastian(feat/database)-road-segments
sebastian(feat/backend)-route-endpoints
valeria(feat/frontend)-credentials-ui
valeria(test/integration)-credential-redemption
```

**Importante:** Git **prohíbe los dos puntos (`:`) en nombres de ramas**. Por eso `javier(doc/spec):sdd-tdd-trazabilidad` no es válido. La alternativa conserva los paréntesis y utiliza `-` después de ellos.

Como Bash interpreta los paréntesis, **es obligatorio entrecomillar el nombre**:

```bash
git switch main
git pull --ff-only
git switch -c 'javier(feat/database)-territory-tables'
git push -u origin 'javier(feat/database)-territory-tables'
```

## Desarrollo de cada funcionalidad

1. Consultar la [capacidad OpenSpec](sdd-openspec.md), sus requisitos y escenarios.
2. Seguir la [trazabilidad detallada](trazabilidad-detallada.csv) para ubicar HU, RR y mockups, sin duplicarlos en toda la implementación.
3. Redactar o ajustar las pruebas previstas antes de implementar: RED → GREEN → REFACTOR.
4. Hacer commits pequeños y progresivos desde la identidad de Git real del responsable.
5. Abrir PR a `main`, enlazar la spec, pruebas, casos ejecutados y dependencias.
6. Solicitar revisión de otro integrante; validar GitHub Actions antes del merge.
7. Integrar únicamente cambios aprobados. Evitar pushes directos a `main`.

## Reglas de colaboración

- Cada miembro desarrolla las funciones de su módulo en **PostgreSQL, API e interfaz**; no se reparte el trabajo solamente por tecnología.
- Si una modificación de SQL afecta relaciones de otro módulo, la PR requiere revisión del integrante afectado.
- Los cambios de esquema y privilegios exigen atención especial y pruebas de reversibilidad.
- El historial de commits debe ser real y atribuible; no simular actividad pasada.
- Ningún agente automatiza un merge o despliegue sin autorización humana.
- `main` debe conservarse estable. La protección automática de rama se configurará, si el equipo la considera necesaria, en los ajustes del repositorio.

## Plantilla mínima de pull request

```markdown
## Alcance
- Responsable:
- Módulo y capa:
- Especificación OpenSpec:
- Entrada de la matriz de trazabilidad:

## Implementación
- Contrato de datos / rutinas / interfaz:
- Dependencias:

## Verificación
- Casos TDD previstos:
- Pruebas ejecutadas:
- Resultados y evidencia:
- GitHub Actions:

## Observaciones
- Riesgos o dudas:
```

## Convención de commits

Se recomienda `docs:`, `feat:`, `test:`, `fix:`, `ci:` o `refactor:`, con mensajes breves en inglés o español pero consistentes. El autor del commit debe ser quien realizó el trabajo y entiende su implementación.
