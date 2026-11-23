#!/usr/bin/env python3
"""Validación estática de cobertura SDD/TDD, sin ejecutar aplicación ni tests de producto."""
import csv
import os
from collections import Counter, defaultdict
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]


def rows(path):
    with (ROOT / path).open(encoding="utf-8", newline="") as file:
        return list(csv.DictReader(file))


def require(condition, message):
    if not condition:
        raise AssertionError(message)


def main():
    stories = rows("docs/requirements/traceability-detailed.csv")
    criteria = rows("docs/testing/acceptance-cases.csv")
    rules = rows("docs/requirements/relational-rules.csv")
    rule_tests = rows("docs/testing/database-cases.csv")
    screens = rows("docs/testing/interface-cases.csv")
    e2e = rows("docs/testing/integration-cases.csv")

    require(len(stories) == 103, f"Se esperaban 103 historias, hay {len(stories)}")
    require(len(criteria) == 324, f"Se esperaban 324 criterios, hay {len(criteria)}")
    require(len(rules) == 134, f"Se esperaban 134 RR, hay {len(rules)}")
    require(len(rule_tests) == 268, f"Se esperaban 268 pruebas RR, hay {len(rule_tests)}")
    require(len(screens) == 70, f"Se esperaban 70 estados UI, hay {len(screens)}")
    require(len(e2e) == 12, f"Se esperaban 12 E2E críticos, hay {len(e2e)}")

    def unique(items, key):
        values = [row[key] for row in items]
        require(len(values) == len(set(values)), f"Duplicados en {key}")
    for collection, key in [(stories, "codigo"), (criteria, "caso"),
                            (rules, "id"), (rule_tests, "caso"),
                            (screens, "caso"), (e2e, "caso")]:
        unique(collection, key)

    require(Counter(row["responsable"] for row in stories)
            == {"Javier": 45, "Sebastián": 33, "Valeria": 25},
            "Distribución de historias distinta del informe original")

    by_story = defaultdict(set)
    for c in criteria:
        by_story[c["historia"]].add(int(c["criterio"]))
        require(c["estado"] == "PLANIFICADO_NO_EJECUTADO", c["caso"])
        require(bool(c["resultado_esperado"] and c["criterio_original"]), c["caso"])

    capabilities = set()
    for story in stories:
        id_, path, total = story["codigo"], story["especificacion"], int(story["criterios"])
        require(by_story[id_] == set(range(1, total + 1)), f"Cobertura TDD: {id_}")
        require(path.startswith("openspec/changes/") and (ROOT / path).is_file(),
                f"Especificación ausente: {path}")
        source = (ROOT / path).read_text(encoding="utf-8")
        require("## ADDED Requirements" in source, path)
        require(f"### Requirement: {story['titulo']}" in source,
                f"Requisito ausente en {path}: {id_}")
        for n in range(1, total + 1):
            require(f"#### Scenario: {story['titulo']} - criterio {n}" in source,
                    f"Escenario ausente: {id_}/{n}")
        capabilities.add(path)

    require(len(capabilities) == 23, f"Se esperaban 23 capacidades: {len(capabilities)}")

    expect_rr = {f"RR-{n}" for n in range(1, 135)}
    require({row["id"] for row in rules} == expect_rr, "Catálogo RR incompleto")
    require({row["rr"] for row in rule_tests} == expect_rr, "Pruebas RR incompletas")
    for rule in expect_rr:
        rtests = {c["caso"] for c in rule_tests if c["rr"] == rule}
        require(rtests == {f"DB-{rule}-VALID", f"DB-{rule}-REJECT"},
                f"Faltan casos válidos/negativos en {rule}")

    require({row["vista"] for row in screens} ==
            {f"V{n:02d}" for n in range(1, 22)}, "Mockups V01..V21 incompletos")
    require(all(row["estado"] == "PLANIFICADO_NO_EJECUTADO" for row in screens),
            "Estado incorrecto de las pruebas UI")
    require(all(row["estado"] == "PLANIFICADO_NO_EJECUTADO" for row in e2e),
            "Estado incorrecto de las pruebas E2E")

    for proposal in ("territory-heritage-plan", "mobility-routes-plan",
                     "actors-commerce-plan"):
        root = ROOT / "openspec" / "changes" / proposal
        for artifact in ("proposal.md", "design.md", "tasks.md"):
            require((root / artifact).is_file(), f"Falta {root / artifact}")

    # Convención de ramas en PR (no bloquear checkout de main ni ejecución local).
    branch = os.environ.get("GITHUB_HEAD_REF", "")
    if branch and branch not in {"develop", "main"}:
        pattern = (
            r"(?:javier|sebastian|valeria)"
            r"\((?:feat|docs|test|fix|ci)/(?:database|backend|frontend|spec|integration|infra)\)"
            r"-[a-z0-9]+(?:-[a-z0-9]+)*"
        )
        require(re.fullmatch(pattern, branch) is not None,
                f"La rama {branch!r} no cumple docs/development/git-workflow.md")

    readme = (ROOT / "README.md").read_text(encoding="utf-8")
    for path in ("docs/requirements/traceability-detailed.csv", "docs/development/sdd-guide.md",
                 "docs/development/tdd-guide.md", "docs/development/git-workflow.md"):
        require(path in readme, f"Enlace al README ausente: {path}")

    print("OK: 103 HU, 324 criterios, 23 capacidades, 134 RR,")
    print("    268 casos RR, 70 estados UI, 12 flujos E2E.")
    print("Nota: planificación documental; ninguna prueba de producto ejecutada.")


if __name__ == "__main__":
    main()
