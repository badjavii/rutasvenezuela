<div align="center">

<img src="assets/rutasvenezuela-logo.svg" alt="RutasVenezuela" width="700">

Sistema web de gestión de rutas turísticas : UCAB

![Database](https://img.shields.io/badge/Database-PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)
![Status](https://img.shields.io/badge/Status-Planning-6C7086?style=for-the-badge)

</div>

## Sobre el proyecto

RutasVenezuela es una aplicación web para gestionar territorio, patrimonio, rutas turísticas, movilidad, recorridos, visitantes, incidencias, experiencias y reportes. Se desarrolla como proyecto de la asignatura Sistemas de Bases de Datos de la Universidad Católica Andrés Bello (UCAB).

El núcleo es una base de datos PostgreSQL transaccional (OLTP), desplegada mediante Supabase, que concentra restricciones de integridad, procedimientos almacenados, funciones y triggers. La aplicación sigue una arquitectura web de tres capas lógicas: presentación, aplicación y datos.

**Arquitectura adoptada:** Next.js con App Router y TypeScript reúne las capas de presentación y aplicación en un único proyecto; PostgreSQL en Supabase constituye la capa de datos. La lógica de negocio, las restricciones y la autorización a nivel de datos corresponden al gestor.

**Fecha de la segunda entrega:** 8 de diciembre de 2026.

## Seguridad

El diseño contempla roles de actor en PostgreSQL, transacciones con `SET LOCAL ROLE` y contexto de identidad por cuenta. Las rutinas verificarán propiedad y competencia además de los privilegios del rol. El navegador no accede al gestor. El [contrato transversal de seguridad (PR #7)](https://github.com/badjavii/rutasvenezuela/pull/7) y sus 23 casos TDD se encuentran en revisión; esta descripción no implica que la autenticación o autorización por registro esté implementada. Las [convenciones TypeScript (PR #8)](https://github.com/badjavii/rutasvenezuela/pull/8) se revisan por separado.

## Organización del repositorio

```text
rutasvenezuela/
├── assets/                 # Recursos del proyecto
├── database/               # Estructuras, rutinas, triggers, seguridad y semillas
├── web/                    # Next.js: presentación y aplicación
├── specs/                  # SDD: constitución, especificaciones, planes y tareas
├── references/             # Informe académico y contexto externo
├── docs/                   # Guías, trazabilidad y pruebas planificadas
├── scripts/                # Validadores del proyecto
├── .github/                # Plantillas y automatizaciones
├── AGENTS.md               # Instrucciones para agentes de desarrollo
└── README.md
```

## Especificaciones y pruebas

El desarrollo combina SDD (definir qué debe cumplir cada capacidad mediante las plantillas de especificación) y TDD (derivar pruebas verificables antes de implementar).

La primera entrega documenta 103 historias de usuario, 324 criterios de aceptación, 134 restricciones relacionales y 21 interfaces. Consulta la [matriz detallada HU → especificación](docs/requirements/traceability-detailed.csv) para localizar la especificación SDD asociada. Estas referencias se conectan con especificaciones del dominio y planes de pruebas; todavía no representan funcionalidades implementadas ni pruebas ejecutadas.

La puerta de entrada a toda la documentación es [docs/README.md](docs/README.md). Allí encontrarás las guías [SDD](docs/development/sdd-guide.md) y [TDD](docs/development/tdd-guide.md), la [trazabilidad académica](docs/requirements/traceability.md) y las [fuentes originales](references/README.md).

## Instalación y ejecución

```bash
git clone https://github.com/badjavii/rutasvenezuela.git
cd rutasvenezuela

# Validaciones documentales, sin dependencias adicionales
python3 scripts/validar_trazabilidad.py
python3 scripts/validar_plan_sdd_tdd.py
```

La infraestructura de PostgreSQL ya dispone de scripts de construcción y pruebas. La aplicación Next.js aún no está implementada. Consulta [base de datos](database/README.md) para ejecutar las pruebas sobre una instancia local desechable. No ejecutar `build.sql` sobre una base compartida con datos: elimina y recrea el esquema `rutasvzla`.

Las especificaciones se mantienen en [specs/README.md](specs/README.md) y se basan en las plantillas de la clase de APIs de Python.

## Colaboración

Las ramas individuales se proponen y revisan mediante pull requests hacia `develop`. La rama `main` se reserva para versiones estables; su promoción exige revisión, validación y un Git tag de versión. Las ramas de trabajo se conservan.

Consulta [Git workflow](docs/development/git-workflow.md) para convenciones de ramas, commits, PR, revisiones, integración y versionado. El [registro de ramas](docs/project/branch-ledger.csv) conserva el responsable, estado y PR asociado.

## Integración continua

El workflow [Documentation Quality](.github/workflows/docs-quality.yml) comprueba automáticamente la documentación, el mapa de trazabilidad y la cobertura planificada de SDD/TDD. Se ejecuta sobre pull requests dirigidos a `develop` o `main`.

El workflow [Database](.github/workflows/database.yml) construye el esquema dos veces en PostgreSQL 17 y ejecuta las pruebas SQL. Las pruebas de aplicación e interfaz se añadirán durante su implementación.

## Documentación y referencias

- [Índice de documentación](docs/README.md)
- [Informe original de la primera entrega, sin imágenes](references/first-delivery.md)
- [Repositorio de contexto y referencias externas](references/README.md)
- [Especificaciones SDD](specs/README.md)

## Créditos

Este proyecto está orgullosamente diseñado y desarrollado por el Equipo 2 de la asignatura Sistemas de Bases de Datos de la Universidad Católica Andrés Bello (UCAB), bajo la supervisión de la profesora Marlene Goncalves Da Silva.

| Integrante | Responsabilidades principales |
|---|---|
| Javier Otero | Territorio, patrimonio, hitos, instituciones, incidencias y evaluaciones |
| Sebastián Armas | Movilidad, vías, tramos, rutas, guías y recorridos |
| Valeria Loreto | Actores, visitantes, comercios, experiencias promocionales y credenciales |

Cada integrante desarrolla las funcionalidades de su dominio a través de las capas pertinentes de la aplicación.

## Licencia

Este proyecto se distribuye bajo la GNU General Public License, versión 3 (GPL-3.0). Consulta el archivo [LICENSE](LICENSE) para conocer los términos completos.
