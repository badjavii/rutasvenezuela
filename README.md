<div align="center">

<!-- Logo -->
<p align="center">
    <img src="assets/rutasvenezuela-logo.svg" alt="RutasVenezuela" width="700" />
</p>

_Proyecto de Sistemas de Bases de Datos · Equipo 2 · UCAB_

![Base de datos](https://img.shields.io/badge/Base_de_datos-PostgreSQL-94e2d5?labelColor=181825&style=for-the-badge&logo=postgresql&logoColor=white)
![Plataforma](https://img.shields.io/badge/Plataforma-Supabase-f5c2e7?labelColor=181825&style=for-the-badge&logo=supabase&logoColor=white)
![Estado](https://img.shields.io/badge/Estado-Planificación-a6e3a1?labelColor=181825&style=for-the-badge)

</div>

## Sobre el proyecto

**RutasVenezuela** es una aplicación web académica de la asignatura Sistemas de Bases de Datos de la Universidad Católica Andrés Bello (UCAB). Integra territorio, patrimonio, movilidad, rutas turísticas, actores, incidencias, experiencias y reportes mediante una **base de datos relacional transaccional OLTP**.

Para la **segunda entrega (8 de diciembre de 2026)**, el énfasis está en el diseño e implementación del gestor: relaciones, restricciones de integridad, procedimientos almacenados, funciones, triggers, seguridad lógica, datos de prueba y consultas reales. El proyecto se encuentra **en planificación**, sin código funcional implementado todavía.

## Arquitectura

```text
React.js (propuesto) → API FastAPI (propuesto) → PostgreSQL / Supabase (aprobado)
  Presentación            Validación y acceso          Reglas y transacciones
```

La profesora aprobó PostgreSQL/Supabase y una arquitectura web de tres capas. **FastAPI y React siguen como propuesta técnica de Javier**, pendiente de revisar con Sebastián su alternativa basada en Node.js. Las **reglas de negocio viven en PostgreSQL**; el backend valida solicitudes y gestiona controles de acceso.

Más detalles y decisiones pendientes en [Arquitectura](docs/arquitectura.md).

## Organización del repositorio

```text
rutasvenezuela/
├── assets/                 # Logo y recursos
├── backend/                # Código del servicio (pendiente)
├── frontend/               # Interfaz web (pendiente)
├── database/               # Esquema SQL, funciones, triggers, roles y semillas
├── docs/                   # SDD, TDD, trazabilidad, fuentes y flujo Git
├── openspec/               # Especificaciones y propuestas OpenSpec
├── scripts/                # Comprobaciones documentales
├── .github/workflows/      # GitHub Actions
├── AGENTS.md               # Instrucciones concisas para agentes
└── README.md
```

## Desarrollo por especificaciones y pruebas

Separaremos **qué debe ocurrir (SDD)** de **cómo verificarlo (TDD)**:

1. Identificar capacidad y responsable en el [mapa HU–RR–V](docs/trazabilidad.md).
2. Especificar escenarios observables con [OpenSpec](docs/sdd-openspec.md).
3. Derivar pruebas PostgreSQL, API, interfaz e integración con la [guía TDD](docs/pruebas-tdd.md).
4. Aprobar el contrato; luego implementar por una rama específica mediante RED → GREEN → REFACTOR.
5. Abrir PR con evidencia de pruebas y revisión de otro integrante.

El [mapa de trazabilidad](docs/trazabilidad.md) (también [CSV](docs/trazabilidad.csv)) evita repetir identificadores académicos dentro de cada especificación.

La primera entrega contiene 8 consultas, 20 grupos CRUD (79 operaciones), 9 operaciones del negocio, 3 reportes y 4 valores agregados, según la matriz original. **Corrección aclarada:** la profesora no solicitó cambios al modelo relacional entregado. Las observaciones se refieren al ERE y a la elección de técnicas de modelado (incluidas oportunidades de generalización, extensibilidad y legibilidad). La trazabilidad HU↔RR aún debe revisarse como correspondencia documental, no como corrección del esquema. Ver [observaciones del ERE](docs/observaciones-ere.md).

## Instalación y ejecución

```bash
git clone https://github.com/badjavii/rutasvenezuela.git
cd rutasvenezuela
```

La aplicación todavía no tiene dependencias ni ejecutables. **No existe un comando de arranque funcional** en esta fase. Los pasos reproducibles de configuración y despliegue se completarán cuando estén implementadas las tres capas.

Para iniciar documentación con OpenSpec:

```bash
npm install -g @fission-ai/openspec@latest
openspec init --tools opencode
```

Si OpenSpec ya está inicializado (el repositorio contiene `openspec/config.yaml`), **no lo reinicialices innecesariamente**. El perfil de skills de OpenCode se configura localmente en cada máquina.

Las comprobaciones documentales pueden ejecutarse sin instalar dependencias:

```bash
python3 scripts/validar_trazabilidad.py
```

## Colaboración y GitHub Actions

El [flujo Git](docs/flujo-git.md) establece ramas del tipo `feature/<integrante>/<modulo>/<capa>-<tarea>`, como `feature/javier/territorio/database-estructuras`, con PR hacia `main` y commits progresivos por integrante.

La acción [Calidad de documentación](.github/workflows/docs-quality.yml) verifica la presencia de documentación y la integridad de la matriz. **Aún no ejecuta tests SQL/API/UI**, porque no existe código funcional; estos checks se incorporarán al implementar cada capa.

## Créditos

**Equipo 2 — Sistemas de Bases de Datos, Universidad Católica Andrés Bello (UCAB)**

**Profesora:** Marlene Goncalves Da Silva.

| Integrante | Dominio responsable | Liderazgo transversal de la primera entrega |
|---|---|---|
| **Javier Otero** | Territorio y patrimonio: hitos, anclajes, entidades públicas, incidencias y evaluaciones | Diagramación e integridad del ERE |
| **Sebastián Armas** | Movilidad y rutas: vías, tramos, paradas, guías, rutas y recorridos | Modelo relacional, restricciones y seguridad lógica |
| **Valeria Loreto** | Actores y comercio: visitantes, comercios, funcionarios, experiencias y credenciales | Interfaces, reportes y patrones de tablas |

Cada integrante debe desarrollar las funcionalidades de su dominio **en las tres capas** cuando corresponda; las responsabilidades no se dividen por framework.

Consulta [fuentes académicas](docs/fuentes.md) y [documentación OpenSpec](https://github.com/Fission-AI/OpenSpec).
