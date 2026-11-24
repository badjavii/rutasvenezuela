# Plan de implementación y cierre

Consulta la fecha oficial de entrega y el estado de la aplicación en el [README principal](../../README.md). Este documento define dependencias técnicas sin repetir el calendario académico.

## Etapas de trabajo

| Etapa | Entregable | Validación esperada |
|---|---|---|
| Base territorial y actores | Estructuras SQL, claves, restricciones y roles | Integridad del esquema y accesos |
| Patrimonio y movilidad | Hitos, anclajes, vías, tramos, paradas y rutas | Integridad referencial y topología |
| Operaciones del negocio | Recorridos, incidencias, evaluaciones, promociones y credenciales | Procedimientos, triggers y transacciones |
| API e interfaz | Formularios, consultas y operaciones conectadas a PostgreSQL | Validación, paginado, búsqueda y ordenamiento |
| Integración y entrega | Seeds, reportes, seguridad, despliegue y guía de ejecución | Reproducción en un único equipo y defensa |

## Responsabilidad funcional

- **Javier:** territorio, patrimonio, instituciones, incidencias, evaluaciones y seguridad de rutas.
- **Sebastián:** vías, tramos, paradas, rutas, guías, recorridos y movilidad.
- **Valeria:** visitantes, cuentas, comercios, experiencias y credenciales.

Cada integrante implementa su alcance en base de datos, aplicación e interfaz cuando corresponda. Los contratos cruzados requieren revisión del módulo afectado.

## Lista de verificación

- [ ] Scripts SQL completos y reproducibles: estructura, migraciones de modificación, rutinas, triggers y eliminación.
- [ ] Datos de prueba para todas las entidades y reglas del negocio.
- [ ] Roles, privilegios y seguridad lógica del gestor.
- [ ] CRUD, consultas, reportes y operaciones transaccionales.
- [ ] Tablas web paginadas, buscables y ordenables.
- [ ] Tests positivos, negativos, integración y autorización con evidencia.
- [ ] README de instalación y despliegue reproducible desde cero.
- [ ] Commits progresivos reales de cada integrante.
- [ ] Integración verificada en `develop`, release hacia `main` con tag cuando el equipo lo autorice.

Los [casos TDD](../development/tdd-guide.md) son planificados, no ejecutados. No declarar funcionalidades terminadas basándose exclusivamente en documentación.
