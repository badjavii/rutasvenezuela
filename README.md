<div align="center">

<!-- Logo -->
<p align="center">
    <img src="assets/rutasvenezuela-logo.svg"
         alt="RutasVenezuela"
         width="320" />
</p>

<!-- Subtítulo -->
_Proyecto de Sistemas de Bases de Datos_

<!-- Insignias -->
![Base de datos](https://img.shields.io/badge/Base_de_datos-PostgreSQL-94e2d5?labelColor=181825&style=for-the-badge&logo=postgresql&logoColor=white)
![Plataforma](https://img.shields.io/badge/Plataforma-Supabase-f5c2e7?labelColor=181825&style=for-the-badge&logo=supabase&logoColor=white)
![Estado](https://img.shields.io/badge/Estado-En_desarrollo-a6e3a1?labelColor=181825&style=for-the-badge)

</div>

## Sobre el proyecto

**RutasVenezuela** es un proyecto académico de la asignatura Sistemas de Bases de Datos de la Universidad Católica Andrés Bello (UCAB).

Su objetivo es desarrollar una aplicación web respaldada por una base de datos relacional, integrando diseño de datos, restricciones de integridad, lógica de negocio y operaciones de consulta y modificación de información.

Este repositorio contiene la implementación correspondiente a la segunda entrega del proyecto.

## Estructura del proyecto

```text
RutasVenezuela/
├── assets/       # Recursos gráficos y logotipo SVG
├── backend/      # Aplicación del servidor
├── frontend/     # Interfaz web
├── database/     # Scripts SQL y lógica de base de datos
└── docs/         # Documentación técnica
```

## Instalación

Clonar el repositorio:

```bash
git clone https://github.com/Badjavii/RutasVenezuela.git
cd RutasVenezuela
```

Las dependencias e instrucciones de configuración se documentarán una vez definido el conjunto de tecnologías del proyecto.

## Uso

La aplicación se encuentra actualmente en desarrollo.

Las instrucciones de ejecución del backend y del frontend se incorporarán cuando sus respectivos entornos estén configurados.

## Base de datos

Los componentes de la base de datos se organizan de la siguiente manera:

- `schema.sql`: creación de tablas y restricciones de integridad.
- `seeds/`: inserción de datos iniciales y de prueba.
- `routines/`: procedimientos almacenados y funciones.
- `triggers/`: disparadores de la base de datos.
- `security/`: roles, permisos y mecanismos de seguridad.

Se contempla PostgreSQL mediante Supabase como tecnología de persistencia, sujeto a la validación de los requisitos académicos.

## Notas

- El proyecto utiliza una estructura modular.
- Los scripts SQL se mantienen separados del código de aplicación.
- Las credenciales y variables de entorno privadas no deben incorporarse al repositorio.
- La configuración de despliegue se añadirá durante las siguientes etapas de desarrollo.

## Créditos

Proyecto desarrollado para la asignatura **Sistemas de Bases de Datos** de la Universidad Católica Andrés Bello (UCAB).
