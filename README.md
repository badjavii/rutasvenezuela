<div align="center">

<img src="assets/rutasvenezuela-logo.svg" alt="RutasVenezuela" width="700">

**Sistema web de gestión de rutas turísticas — UCAB**

![Database](https://img.shields.io/badge/Database-PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)
![Status](https://img.shields.io/badge/Status-Planning-6C7086?style=for-the-badge)

</div>

## Sobre el proyecto

**RutasVenezuela** es una aplicación web para gestionar territorio, patrimonio, rutas turísticas, movilidad, recorridos, visitantes, incidencias, experiencias y reportes. Se desarrolla como proyecto de la asignatura **Sistemas de Bases de Datos** de la Universidad Católica Andrés Bello (UCAB).

El núcleo es una base de datos **PostgreSQL** transaccional (OLTP), desplegada mediante **Supabase**, que concentra restricciones de integridad, procedimientos almacenados, funciones y triggers. La aplicación sigue una arquitectura web de tres capas: presentación, servicio y datos.

**Stack de referencia:** React.js para la interfaz y Python/FastAPI para el backend; la elección definitiva de estas tecnologías todavía está pendiente de confirmación. La base de datos y sus reglas de negocio permanecen como prioridad.

**Fecha de la segunda entrega:** 8 de diciembre de 2026.

## Organización del repositorio

```text
rutasvenezuela/
├── assets/                 # Recursos del proyecto
├── database/               # Estructuras, rutinas, triggers, seguridad y semillas
├── backend/                # Aplicación de servidor
├── frontend/               # Aplicación web
├── openspec/               # Requisitos por capacidad y propuestas de cambio
├── references/             # Informe íntegro y contexto externo
├── docs/                   # Guías, trazabilidad y pruebas planificadas
├── scripts/                # Validadores del proyecto
├── .github/                # Plantillas y automatizaciones
├── AGENTS.md               # Instrucciones para agentes de desarrollo
└── README.md
```

## Especificaciones y pruebas

El desarrollo combina **SDD** (definir qué debe cumplir cada capacidad mediante OpenSpec) y **TDD** (derivar pruebas verificables antes de implementar).

La primera entrega documenta **103 historias de usuario, 324 criterios de aceptación, 134 restricciones relacionales y 21 interfaces**. Estas referencias se conectan con especificaciones del dominio y planes de pruebas; **todavía no representan funcionalidades implementadas ni pruebas ejecutadas**.

La puerta de entrada a toda la documentación es [docs/README.md](docs/README.md). Allí encontrarás las guías [SDD](docs/development/sdd-guide.md) y [TDD](docs/development/tdd-guide.md), la [trazabilidad académica](docs/requirements/traceability.md) y las [fuentes originales](references/README.md).

## Instalación y ejecución

```bash
git clone https://github.com/badjavii/rutasvenezuela.git
cd rutasvenezuela

# Validaciones documentales, sin dependencias adicionales
python3 scripts/validar_trazabilidad.py
python3 scripts/validar_plan_sdd_tdd.py
```

La aplicación todavía está en fase de planificación: no existe un comando de despliegue funcional. El procedimiento completo para configurar PostgreSQL, backend y frontend se añadirá cuando estén implementados.

OpenSpec se encuentra configurado en `openspec/config.yaml`. Cada colaborador puede instalar localmente su CLI e integración con OpenCode.

## Colaboración

Las ramas individuales se proponen y revisan mediante **pull requests hacia `develop`**. La rama `main` se reserva para versiones estables; su promoción exige revisión, validación y un **Git tag** de versión. Las ramas de trabajo se conservan.

Consulta [Git workflow](docs/development/git-workflow.md) para convenciones de ramas, commits, PR, revisiones, integración y versionado.

## Integración continua

El workflow [Documentation Quality](.github/workflows/docs-quality.yml) comprueba automáticamente la documentación, el mapa de trazabilidad y la cobertura planificada de SDD/TDD. Se ejecuta sobre pull requests dirigidos a `develop` o `main`.

**Las pruebas funcionales de PostgreSQL, API e interfaz se añadirán durante la implementación.**

## Documentación y referencias

- [Índice de documentación](docs/README.md)
- [Informe original de la primera entrega, sin imágenes](references/first-delivery.md)
- [Repositorio de contexto y referencias externas](references/README.md)
- [OpenSpec — documentación oficial](https://github.com/Fission-AI/OpenSpec)

## Créditos

Este proyecto está orgullosamente diseñado y desarrollado por el **Equipo 2** de la asignatura **Sistemas de Bases de Datos** de la **Universidad Católica Andrés Bello (UCAB)**, bajo la supervisión de la profesora **Marlene Goncalves Da Silva**.

| Integrante | Responsabilidades principales |
|---|---|
| **Javier Otero** | Territorio, patrimonio, hitos, instituciones, incidencias y evaluaciones |
| **Sebastián Armas** | Movilidad, vías, tramos, rutas, guías y recorridos |
| **Valeria Loreto** | Actores, visitantes, comercios, experiencias promocionales y credenciales |

Cada integrante desarrolla las funcionalidades de su dominio a través de las capas pertinentes de la aplicación.

## Licencia

Este proyecto se distribuye bajo la **GNU General Public License, versión 3 (GPL-3.0)**. Consulta el archivo [LICENSE](LICENSE) para conocer los términos completos.
