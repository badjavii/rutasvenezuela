#!/usr/bin/env bash
set -euo pipefail

root="$(git rev-parse --show-toplevel)"
cd "$root"
branch="$(git branch --show-current)"
[[ "$branch" != "main" && "$branch" != "develop" ]] || { echo 'Solo para ramas de trabajo' >&2; exit 1; }
[[ -z "$(git status --porcelain)" ]] || { echo 'Confirma primero los cambios pendientes' >&2; exit 1; }

git fetch origin develop
base="$(git merge-base HEAD origin/develop)"
git show "$base:README.md" > README.md

python3 - "$branch" <<'PY'
import csv
from datetime import date
from pathlib import Path
import sys

branch = sys.argv[1]
path = Path("docs/project/branch-ledger.csv")
with path.open(encoding="utf-8", newline="") as handle:
    reader = csv.DictReader(handle)
    fields, records = list(reader.fieldnames or []), list(reader)
for row in records:
    if row["branch"] == branch:
        row["status"] = "ready_for_pr"
        row["updated_at"] = date.today().isoformat()
        break
else:
    raise SystemExit("No se encontró la rama en el registro")
with path.open("w", encoding="utf-8", newline="") as handle:
    writer = csv.DictWriter(handle, fieldnames=fields)
    writer.writeheader()
    writer.writerows(records)
PY

if grep -q BRANCH_STATUS_README README.md; then
  echo 'No se pudo restaurar el README principal' >&2
  exit 1
fi
git add README.md docs/project/branch-ledger.csv
if ! git diff --cached --quiet; then
  git commit -m 'docs(branch): restore project README before review'
fi
if ! git diff --quiet "$base" HEAD -- README.md; then
  echo 'README.md sigue apareciendo en el diff; revisa antes de abrir el PR' >&2
  exit 1
fi
echo 'README estable restaurado. Puede abrirse un PR a develop.'
