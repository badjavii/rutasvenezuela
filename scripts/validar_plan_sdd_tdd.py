#!/usr/bin/env python3
"""Valida trazabilidad SDD/TDD. No ejecuta pruebas de producto."""
import csv
import os
from collections import Counter, defaultdict
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]


def rows(path):
    with (ROOT / path).open(encoding="utf-8", newline="") as handle:
        return list(csv.DictReader(handle))


def require(ok, message):
    if not ok:
        raise AssertionError(message)


def main():
    stories = rows("docs/requirements/traceability-detailed.csv")
    criteria = rows("docs/testing/acceptance-cases.csv")
    rules = rows("docs/requirements/relational-rules.csv")
    rule_tests = rows("docs/testing/database-cases.csv")
    screens = rows("docs/testing/interface-cases.csv")
    e2e = rows("docs/testing/integration-cases.csv")
    for name, actual, expected in (
        ("historias", len(stories), 103),
        ("criterios", len(criteria), 324),
        ("restricciones RR", len(rules), 134),
        ("casos RR", len(rule_tests), 268),
        ("estados UI", len(screens), 70),
        ("escenarios E2E", len(e2e), 12),
    ):
        require(actual == expected, f"{name}: {actual}, esperado {expected}")

    for collection, field in (
        (stories, "codigo"), (criteria, "caso"), (rules, "id"),
        (rule_tests, "caso"), (screens, "caso"), (e2e, "caso")
    ):
        values = [record[field] for record in collection]
        require(len(values) == len(set(values)), f"Duplicados en {field}")
    require(Counter(record["responsable"] for record in stories)
            == {"Javier": 45, "Sebastián": 33, "Valeria": 25},
            "Asignación de historias inesperada")

    linked = defaultdict(set)
    for criterion in criteria:
        linked[criterion["historia"]].add(int(criterion["criterio"]))
        require(criterion["estado"] == "PLANIFICADO_NO_EJECUTADO",
                f"Estado inconsistente: {criterion['caso']}")
        require(bool(criterion["criterio_original"]), criterion["caso"])

    specs = {}
    for item in stories:
        identity = item["codigo"]
        path = item["especificacion"]
        count = int(item["criterios"])
        require(linked[identity] == set(range(1, count + 1)),
                f"Faltan casos en {identity}")
        require(path.startswith("specs/") and path.endswith("/spec.md"),
                f"Ruta SDD incorrecta: {path}")
        filepath = ROOT / path
        require(filepath.is_file(), f"No existe {path}")
        text = specs.setdefault(path, filepath.read_text(encoding="utf-8"))
        for section in ("## 1. Objetivo", "## 2. Requisitos funcionales",
                        "## 3. Reglas de negocio", "## 4. Criterios de aceptación",
                        "## 5. Restricciones técnicas", "## 6. Fuera de alcance",
                        "## 7. Decisiones abiertas"):
            require(section in text, f"Falta {section} en {path}")
        title = item["titulo"]
        begin = text.find(f"### {title}\n")
        require(begin >= 0, f"Requisito {title} ausente en {path}")
        end = text.find("\n### ", begin + 5)
        section = text[begin:end if end >= 0 else len(text)]
        for n in range(1, count + 1):
            require(f"- Criterio {n}:" in section,
                    f"Falta criterio {identity}/{n} en {path}")
        for artifact in ("plan.md", "tasks.md"):
            require(filepath.with_name(artifact).is_file(),
                    f"No existe {filepath.with_name(artifact)}")

    require(len(specs) == 23, f"Capacidades encontradas: {len(specs)}")
    for path in ("specs/constitution.md", "specs/templates/spec-template.md",
                 "specs/templates/plan-template.md", "specs/templates/tasks-template.md",
                 "specs/memory.md", "specs/README.md"):
        require((ROOT / path).is_file(), f"Falta {path}")
    require(not (ROOT / "openspec").exists(), "OpenSpec antiguo presente")

    rr_ids = {f"RR-{n}" for n in range(1, 135)}
    require({r["id"] for r in rules} == rr_ids, "RR incompletas")
    require({r["rr"] for r in rule_tests} == rr_ids, "Casos RR incompletos")
    for rr in rr_ids:
        ids = {x["caso"] for x in rule_tests if x["rr"] == rr}
        require(ids == {f"DB-{rr}-VALID", f"DB-{rr}-REJECT"},
                f"Casos de {rr} incompletos")
    require({x["vista"] for x in screens} ==
            {f"V{n:02d}" for n in range(1, 22)}, "Mockups incompletos")
    require(all(x["estado"] == "PLANIFICADO_NO_EJECUTADO" for x in screens),
            "Hay un caso UI declarado ejecutado sin evidencia")
    require(all(x["estado"] == "PLANIFICADO_NO_EJECUTADO" for x in e2e),
            "Hay un caso E2E declarado ejecutado sin evidencia")

    branch = os.environ.get("GITHUB_HEAD_REF", "")
    if branch and branch not in {"main", "develop"}:
        pattern = (
            r"(?:javier|sebastian|valeria)"
            r"\((?:feat|docs|test|fix|ci|refactor)/"
            r"(?:database|application|presentation|spec|integration|infra)\)"
            r"-[a-z0-9]+(?:-[a-z0-9]+)*"
        )
        require(re.fullmatch(pattern, branch),
                f"La rama {branch} no cumple el Git workflow")

    readme = (ROOT / "README.md").read_text(encoding="utf-8")
    for path in ("specs/README.md", "docs/requirements/traceability-detailed.csv",
                 "docs/development/sdd-guide.md", "docs/development/tdd-guide.md",
                 "docs/development/git-workflow.md"):
        require(path in readme, f"Falta enlace en README: {path}")

    print("OK: 103 HU, 324 criterios, 23 capacidades SDD, 134 RR,")
    print("    268 casos RR, 70 estados UI y 12 escenarios E2E.")
    print("Nota: pruebas planificadas, no ejecutadas.")


if __name__ == "__main__":
    main()
