# Tareas: movilidad vias y tramos

El estado de implementación se registra solo aquí. Pruebas estructurales: RED en PostgreSQL 18 local para el commit `3e4ea47` (la relación `via` todavía no existía) y GREEN para `be59af0`, confirmado también en PostgreSQL 17 por el [CI del PR #14](https://github.com/badjavii/rutasvenezuela/actions/runs/46111936506). El CI solo corre en el PR, sobre su último commit. RR-29 y RR-30: RED en PostgreSQL 18 local para `6f5dfce` (se aceptó una vía sin tramos) y GREEN para `e95b135`; quitar cualquiera de los cuatro triggers hace fallar una prueba, y un `COMMIT` real de una vía sin tramo se rechaza. Las rutinas y los permisos siguen pendientes.

## T-01. Capa de datos

- [x] Crear `via`, `via_modo`, `tramo`, `conecta` en `database/01_tablas/movilidad-vias-y-tramos.sql` (GREEN, `be59af0`).
- [x] Agregar sus claves foráneas en `database/02_claves/movilidad-vias-y-tramos.sql` (GREEN, `be59af0`).
- [x] Escribir las pruebas estructurales (RR-102, RR-103, claves y acciones referenciales de HU-15.4 y HU-35.4, criterio 1) y confirmar RED (`3e4ea47`).
- [x] Escribir las pruebas SQL de RR-29 y RR-30 y confirmar RED (`6f5dfce`).
- [ ] Escribir las pruebas SQL de las rutinas (registrar, consultar, modificar y eliminar vías y tramos) y confirmar RED.
- [x] Probar HU-15.4 y HU-35.4, criterio 2, para paradas (`esta_en`, en las pruebas de movilidad-paradas, `6fab451`).
- [ ] Probar HU-15.4 y HU-35.4, criterio 2, para incidencias e hitos cuando existan `afecta_tramo` y `se_ubica_en` (Javier).
- [x] Implementar RR-29 y RR-30 en `database/03_reglas/movilidad-vias-y-tramos.sql` con triggers de restricción diferidos (GREEN, `e95b135`).
- [ ] Implementar las rutinas en `database/03_reglas/movilidad-vias-y-tramos.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_administrador` en `database/04_seguridad/movilidad-vias-y-tramos.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/movilidad-vias-y-tramos.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-15.1, HU-15.2, HU-15.3, HU-15.4, HU-35.1, HU-35.2, HU-35.3, HU-35.4 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V16 (Vías y paradas) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-15.1, HU-15.2, HU-15.3, HU-15.4, HU-35.1, HU-35.2, HU-35.3, HU-35.4.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
