# Diseño de implementación futura — Movilidad, rutas, recorridos, guías y contratación

**Responsable funcional:** Sebastián. **Estado:** planificación completa a nivel de criterios, pendiente de revisión humana.

## Base de datos (prioritaria)

Aplicar fielmente las relaciones y las claves de la primera entrega aprobada. Identificar PK, FK, CHECK, UNIQUE, restricciones explícitas y las invariantes transaccionales que requieran procedimientos, funciones o triggers; sin crear objetos nuevos por suposición. Derivar casos positivos y negativos en [el catálogo TDD](../../../docs/development/tdd-guide.md).

## Aplicación / API

Contrato neutral al framework hasta decidir FastAPI/Python frente a la alternativa Node.js. Validar formatos, permisos y límites; delegar invariantes al gestor y mapear errores PostgreSQL a respuestas de API consistentes.

## Interfaz

Implementar los mockups vinculados por [trazabilidad](../../../docs/requirements/traceability.md), incluyendo estados vacíos, errores, búsqueda, ordenamiento y paginación. React es provisional.

## Integración

Verificar de extremo a extremo las operaciones que cruzan módulos, mantener transacciones atómicas y no exponer secretos de Supabase en el navegador.

## Capacidad y dependencias

- `rutas-gestion`
- `movilidad-servicios-y-transbordos`
- `movilidad-vias-y-tramos`
- `movilidad-paradas`
- `guias-contrataciones`
- `rutas-recorridos`
- `reportes-afluencia`
- `rutas-tiempos-y-desvios`

Las dependencias se resuelven con revisión de otro integrante cuando se afectan relaciones compartidas.
