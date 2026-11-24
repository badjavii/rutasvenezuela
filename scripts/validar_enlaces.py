#!/usr/bin/env python3
"""Comprobar destinos locales de enlaces Markdown sin instalar dependencias."""
from pathlib import Path
from urllib.parse import unquote
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
BROKEN = []
CHECK = [ROOT / "README.md", ROOT / "AGENTS.md"]
CHECK.extend((ROOT / "docs").rglob("*.md"))
CHECK.extend((ROOT / "specs").rglob("*.md"))
CHECK.extend((ROOT / "references").rglob("*.md"))

for file in CHECK:
    if not file.is_file():
        continue
    data = file.read_text(encoding="utf-8")
    for match in re.finditer(r"\]\(([^\n)]+)\)", data):
        dest = match.group(1).strip().split("#", 1)[0]
        if not dest or re.match(r"^(?:https?://|mailto:|data:)", dest):
            continue
        # Los enlaces explícitos a archivos se interpretan desde el .md origen.
        target = (file.parent / unquote(dest)).resolve()
        if not target.is_relative_to(ROOT.resolve()) or not target.exists():
            BROKEN.append(f"{file.relative_to(ROOT)} -> {dest}")

if BROKEN:
    print("Enlaces locales sin resolver:")
    for broken in BROKEN:
        print(" -", broken)
    sys.exit(1)
print(f"OK: enlaces locales de {len(CHECK)} documentos revisados.")
