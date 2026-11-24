#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 5 ]]; then
  echo 'Uso: bash scripts/new-work-branch.sh <author> <kind> <layer> <slug> "<summary>"' >&2
  exit 2
fi

author="$1"
kind="$2"
layer="$3"
slug="$4"
summary="$5"

[[ "$author" =~ ^(javier|sebastian|valeria)$ ]] || { echo 'Autor inválido' >&2; exit 2; }
[[ "$kind" =~ ^(feat|docs|test|fix|ci|refactor)$ ]] || { echo 'Tipo inválido' >&2; exit 2; }
[[ "$layer" =~ ^(database|backend|frontend|spec|integration|infra)$ ]] || { echo 'Capa inválida' >&2; exit 2; }
[[ "$slug" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] || { echo 'Descripción de rama inválida' >&2; exit 2; }
[[ -n "$summary" ]] || { echo 'La descripción no puede estar vacía' >&2; exit 2; }

root="$(git rev-parse --show-toplevel)"
cd "$root"
[[ -z "$(git status --porcelain)" ]] || { echo 'El árbol de trabajo debe estar limpio' >&2; exit 1; }

branch="$author($kind/$layer)-$slug"
git check-ref-format --branch "$branch" >/dev/null
git fetch origin develop
git switch -c "$branch" origin/develop

python3 - "$branch" "$author" "$kind" "$layer" "$summary" <<'PY'
import csv
from datetime import date
from pathlib import Path
import sys

branch, author, kind, layer, summary = sys.argv[1:]
today = date.today().isoformat()
owner = {"javier": "Javier Otero", "sebastian": "Sebastián Armas",
         "valeria": "Valeria Loreto"}[author]
readme = Path("templates/branch-readme.md").read_text(encoding="utf-8")
for key, value in {
    "{{BRANCH}}": branch, "{{OWNER}}": owner, "{{KIND}}": kind,
    "{{LAYER}}": layer, "{{CREATED_DATE}}": today, "{{SUMMARY}}": summary,
}.items():
    readme = readme.replace(key, value)
Path("README.md").write_text(readme, encoding="utf-8")

path = Path("docs/project/branch-ledger.csv")
with path.open(encoding="utf-8", newline="") as handle:
    reader = csv.DictReader(handle)
    fields, records = list(reader.fieldnames or []), list(reader)
if any(row["branch"] == branch for row in records):
    raise SystemExit("La rama ya está en el registro")
records.append({
    "branch": branch, "owner": owner, "kind": kind, "layer": layer,
    "summary": summary, "source": "develop", "target": "develop",
    "created_at": today, "pull_request": "", "status": "in_progress",
    "updated_at": today,
})
with path.open("w", encoding="utf-8", newline="") as handle:
    writer = csv.DictWriter(handle, fieldnames=fields)
    writer.writeheader()
    writer.writerows(records)
PY

git add README.md docs/project/branch-ledger.csv
git commit -m "docs(branch): initialize $slug workspace"
echo "Rama creada: $branch"
echo 'Antes de abrir PR ejecuta bash scripts/prepare-pr.sh'
