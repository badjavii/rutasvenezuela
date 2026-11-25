# Tareas: reportes promociones

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Identificar las tablas de otras capacidades que se leen.
- [ ] Escribir las pruebas SQL de los criterios y confirmar RED.
- [ ] Implementar en `database/03_reglas/reportes-promociones.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_guia`, `rol_comercio` en `database/04_seguridad/reportes-promociones.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/reportes-promociones.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de RP-2 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V20 (RP-2 Experiencias y credenciales) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de RP-2.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
