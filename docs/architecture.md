# Arquitectura de RutasVenezuela

## Estado de las decisiones

| Decisión | Estado | Fundamento |
|---|---|---|
| PostgreSQL como SGBDR OLTP | Confirmada verbalmente | Aprobación presencial de la profesora |
| Modelo relacional de primera entrega | Validado, sin cambios solicitados | Aclaración del equipo tras la devolución calificada con 17,3/20 |
| Observaciones de ERE | Mejoras conceptuales, sin rediseño obligatorio del relacional | Técnicas alternativas y oportunidades de generalización, legibilidad y extensibilidad |
| Supabase para alojamiento de PostgreSQL | Confirmada verbalmente | Propuesta aprobada |
| Reglas de negocio en el gestor | Confirmada | Procedimientos, funciones, triggers y restricciones |
| Arquitectura web de tres capas | Confirmada | Recomendación presencial de la profesora |
| Backend Python + FastAPI | Propuesta provisional | Javier; pendiente de discutir alternativa de backend en evaluación |
| Frontend React.js | Propuesta provisional | Javier; revisar junto con la alternativa de Sebastián |
| Librerías de pruebas de API y UI | Propuestas | Condicionadas a la tecnología finalmente acordada |
| Roles y autenticación específicos | Pendiente | Se debe conciliar autenticación de la aplicación y privilegios de PostgreSQL |

## Separación de responsabilidades

```text
Navegador (React propuesto)
  └─ Interfaz, estados y formularios
       ↓ API HTTP
Servidor (FastAPI propuesto)
  └─ Autorización y validación de entrada; adaptación de contratos
       ↓ SQL / procedimientos y funciones
PostgreSQL (Supabase)
  └─ Transacciones, reglas, integridad, triggers, datos y permisos
```

La base de datos determina las invariantes incluso si la API o la interfaz omiten validaciones. No replicar reglas críticas como única validación del frontend ni del backend. La capa de API normaliza datos, aplica controles de acceso, maneja errores y ejecuta la operación transaccional correspondiente. Los reportes consultan datos reales.

Ver [contratos técnicos por capa](development/layer-contracts.md) y el [plan de implementación](project/delivery-plan.md), con responsabilidades compartidas y dependencias.

## Convenciones

- El alcance académico y la semántica se consultan en [el mapa de trazabilidad](requirements/traceability.md) y las fuentes originales.
- No utilizar tipos o extensiones espaciales incompatibles con el enunciado; las coordenadas se representan mediante tipos numéricos primitivos.
- No permitir acceso directo del navegador con credenciales de servicio.
- Distinguir usuarios/roles del dominio de roles/privilegios del gestor.
- Las decisiones que afecten a las tres capas requieren revisión entre integrantes.
- Se mantienen contratos de API neutrales al framework hasta que Sebastián detalle su alternativa Node.js. Se puede comenzar a planificar las tablas, restricciones y procedimientos PostgreSQL de Javier sin esperar esa decisión.

## Decisiones abiertas prioritarias

1. Acordar FastAPI frente a Node.js: framework concreto, librerías, justificación académica y tiempo de implementación.
2. Definir gestión de conexiones, transacciones y seguridad en Supabase.
3. Respetar los nombres y claves del modelo relacional entregado; registrar las observaciones del ERE como posibles mejoras conceptuales, sin bloquear la planificación de PostgreSQL.
4. Acordar despliegue reproducible desde una sola computadora y mecanismo de datos de prueba.
5. Confirmar número de grupo/NRC para el correo obligatorio.

## Fechas

**8 de diciembre de 2026:** entrega y comienzo de defensas. **17 de diciembre de 2026:** segundo examen. El repositorio debe exhibir historial progresivo real de los tres autores.
