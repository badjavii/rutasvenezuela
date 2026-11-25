# Tareas: reportes conservacion

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Identificar las tablas de otras capacidades que se leen.
- [ ] Escribir las pruebas SQL de RR-5, RR-6, RR-7, RR-8, RR-18, RR-83, RR-84, RR-85, RR-86, RR-87, RR-88, RR-89, RR-90, RR-91, RR-92, RR-93 y confirmar RED.
- [ ] Implementar en `database/03_reglas/reportes-conservacion.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_ente` en `database/04_seguridad/reportes-conservacion.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/reportes-conservacion.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de RP-1 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V19 (RP-1 Conservación e incidencias) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de RP-1.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
