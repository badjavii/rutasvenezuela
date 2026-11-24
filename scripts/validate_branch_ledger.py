#!/usr/bin/env python3
"""Comprueba el esquema del registro central de ramas."""
import csv
from datetime import date
from pathlib import Path

root = Path(__file__).resolve().parents[1]
path = root / "docs/project/branch-ledger.csv"
required = {"branch", "owner", "kind", "layer", "summary", "source",
            "target", "created_at", "pull_request", "status", "updated_at"}

with path.open(encoding="utf-8", newline="") as f:
    reader = csv.DictReader(f)
    assert required == set(reader.fieldnames or []), "Cabecera incorrecta"
    rows = list(reader)

assert len({row["branch"] for row in rows}) == len(rows), "Ramas duplicadas"
for row in rows:
    assert row["branch"] and row["summary"], "Registro incompleto"
    assert row["target"] == "develop", row["branch"]
    assert row["source"] == "develop", row["branch"]
    for key in ("created_at", "updated_at"):
        if row[key]:
            date.fromisoformat(row[key])
    assert row["status"] in {"preview", "in_progress", "ready_for_pr",
                             "in_review", "merged", "closed"}, row["status"]
print(f"OK: {len(rows)} ramas registradas, fechas y estados válidos.")
