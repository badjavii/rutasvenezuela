<div align="center">

# RutasVenezuela : Web

<!-- Subtítulo -->
_Capas de presentación y de aplicación con Next.js_

<!-- Insignias -->
![Módulo](https://img.shields.io/badge/Módulo-Web-94e2d5?labelColor=181825&style=for-the-badge)
![Estado](https://img.shields.io/badge/Estado-Planificación-f5c2e7?labelColor=181825&style=for-the-badge)

</div>

## Sobre el módulo

Aplicación Next.js (App Router, TypeScript) que reúne dos de las tres capas. La capa de datos vive en `database/`.

## Estructura prevista

```text
web/
├── app/               # Capa de presentación: páginas (server components)
├── components/        # Capa de presentación: componentes; los interactivos con "use client"
└── server/            # Capa de aplicación: solo corre en el servidor
    ├── actions/       # Server actions ("use server"), un archivo por capacidad
    └── db/            # Conexión, sesión y transacción con SET LOCAL ROLE (import 'server-only')
```

## Reglas

- Sin reglas de negocio ni decisiones de permisos: las toma PostgreSQL con roles y `GRANT`.
- Cada operación: leer la sesión, abrir la transacción, `SET LOCAL ROLE`, llamar a la función o al procedimiento, devolver el resultado o el error del gestor.
- SQL directo con el driver de PostgreSQL, sin ORM y sin `supabase-js`.
- Las credenciales de la base de datos van en variables de entorno del servidor, nunca en el navegador.
- Todos los listados tabulares tienen búsqueda, ordenamiento por columna y paginación.

Ver [arquitectura](../docs/architecture.md) y [contratos por capa](../docs/development/layer-contracts.md).

## Instalación y uso

Se documentarán al crear el proyecto Next.js.

## Créditos

Módulo perteneciente al proyecto RutasVenezuela, desarrollado para la asignatura Sistemas de Bases de Datos de la UCAB.
