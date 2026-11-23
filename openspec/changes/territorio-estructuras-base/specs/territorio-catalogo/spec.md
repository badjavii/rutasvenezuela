# Catálogo territorial — Delta de especificación (propuesta)

> **Estado: propuesta sin aprobar.** Traducida de la primera entrega; sujeta a correcciones de la profesora.

## ADDED Requirements

### Requirement: Identificación jerárquica del territorio

El sistema SHALL mantener estados, municipios y parroquias identificables de forma consistente con su pertenencia territorial, evitando ambigüedades entre nombres iguales en diferentes entidades propietarias.

#### Scenario: Municipio dentro de un estado

- **GIVEN** un estado registrado
- **WHEN** se registra un municipio perteneciente a ese estado con una identificación válida
- **THEN** el municipio queda asociado al estado, conservando la identificación territorial completa

#### Scenario: Municipio sin estado propietario

- **GIVEN** que no existe el estado propietario requerido
- **WHEN** se intenta registrar un municipio dependiente de él
- **THEN** PostgreSQL rechaza la operación y no deja relaciones huérfanas

### Requirement: Identificación de parroquias

El sistema SHALL asociar cada parroquia al municipio y estado propietarios, conservando la identificación dependiente prevista en el modelo.

#### Scenario: Parroquia en municipio existente

- **GIVEN** un municipio válido dentro de un estado
- **WHEN** se registra una parroquia de ese municipio
- **THEN** se preserva su pertenencia y se puede recuperar mediante su identificación completa

#### Scenario: Parroquia con municipio inexistente

- **GIVEN** una referencia a municipio no registrado
- **WHEN** se intenta crear una parroquia
- **THEN** la base de datos rechaza la referencia inválida

No introducir identificadores artificiales ni diseñar borrados en cascada hasta contrastar el modelo corregido.
