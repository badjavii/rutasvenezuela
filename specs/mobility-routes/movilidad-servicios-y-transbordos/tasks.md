# Tareas: movilidad servicios y transbordos

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Identificar las tablas de otras capacidades que se leen.
- [ ] Escribir las pruebas SQL de RR-20, RR-21, RR-31, RR-32, RR-33, RR-34, RR-45, RR-101, RR-104, RR-110 y confirmar RED.
- [ ] Implementar en `database/03_reglas/movilidad-servicios-y-transbordos.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_visitante` en `database/04_seguridad/movilidad-servicios-y-transbordos.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/movilidad-servicios-y-transbordos.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-04, HU-05 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V04 (Detalle de ruta) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-04, HU-05.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
