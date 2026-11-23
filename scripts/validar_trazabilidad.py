#!/usr/bin/env python3
"""Validador estándar de la matriz académica. No requiere dependencias externas."""
from collections import Counter
import csv
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
CSV = ROOT / "docs" / "requirements" / "traceability.csv"
MAP = ROOT / "docs" / "requirements" / "traceability.md"
REQUIRED = {"codigo", "funcionalidad", "responsable", "capacidad", "rr", "vista", "tipo", "estado"}
EXPECTED_TYPES = {"Consulta": 8, "CRUD": 20, "Negocio": 9, "Reporte": 3, "Valor agregado": 4}
OWNERS = {"Javier", "Sebastián", "Valeria"}


def expand_rr(expression):
    numbers = set()
    for piece in expression.split(","):
        piece = piece.strip()
        if not piece:
            continue
        match = re.fullmatch(r"(\d+)(?:-(\d+))?", piece)
        if not match:
            raise ValueError(f"Intervalo RR inválido: {piece!r}")
        start, end = int(match.group(1)), int(match.group(2) or match.group(1))
        if end < start:
            raise ValueError(f"Intervalo RR descendente: {piece!r}")
        numbers.update(range(start, end + 1))
    return numbers


def validate():
    with CSV.open(encoding="utf-8", newline="") as file:
        reader = csv.DictReader(file)
        if not REQUIRED.issubset(reader.fieldnames or []):
            raise ValueError(f"Faltan columnas: {REQUIRED - set(reader.fieldnames or [])}")
        rows = list(reader)

    types = Counter(row["tipo"] for row in rows)
    assert dict(types) == EXPECTED_TYPES, f"Distribución inesperada: {types}"
    ids = [row["codigo"] for row in rows]
    assert len(ids) == len(set(ids)), "Existen códigos duplicados"

    seen_rr, seen_views = set(), set()
    markdown = MAP.read_text(encoding="utf-8")
    for row in rows:
        assert row["responsable"] in OWNERS, f"Responsable desconocido: {row['codigo']}"
        assert row["capacidad"] and row["estado"] and row["funcionalidad"], row
        assert re.fullmatch(r"V(0[1-9]|1[0-9]|2[01])", row["vista"]), row
        assert row["codigo"] in markdown, f"Falta código en el Markdown: {row['codigo']}"
        seen_rr |= expand_rr(row["rr"])
        seen_views.add(row["vista"])

    assert seen_rr == set(range(1, 135)), (
        f"RR sin asociación: {sorted(set(range(1, 135)) - seen_rr)}"
    )
    assert seen_views == {f"V{i:02d}" for i in range(1, 22)}, (
        f"Vistas sin mapeo: {sorted({f'V{i:02d}' for i in range(1,22)} - seen_views)}"
    )
    print(f"OK: {len(rows)} filas, {len(seen_rr)} RR y {len(seen_views)} vistas.")
    print("Nota: asociaciones RR preliminares; no equivale a pruebas TDD ejecutadas.")


if __name__ == "__main__":
    try:
        validate()
    except (AssertionError, ValueError, OSError) as error:
        print(f"ERROR: {error}", file=sys.stderr)
        sys.exit(1)
