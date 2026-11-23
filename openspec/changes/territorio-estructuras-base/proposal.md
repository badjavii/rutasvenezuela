# Propuesta — Estructuras base de territorio

## Por qué

Territorio identifica estados, municipios y parroquias; proporciona las claves referenciadas por patrimonio, rutas y actores. La primera entrega plantea identificación dependiente y claves compuestas.

## Qué cambia

**Solo planificación:** preparar especificaciones observables y pruebas de integridad para crear y relacionar estados, municipios y parroquias; el esquema DDL se implementará después. Esta propuesta requiere revisar las correcciones de la profesora.

## Alcance

Dominio: `territorio/catalogo`. Responsable principal: **Javier Otero**. Capas futuras: PostgreSQL, API y UI. Mockup de referencia: administración del territorio. Enlaces académicos en [trazabilidad](../../../docs/trazabilidad.md).

## Pendientes

- Verificar modelo relacional corregido y participación de entidades.
- Confirmar claves naturales y criterios de eliminación.
- Revisar los casos de prueba antes de crear `schema.sql`.
