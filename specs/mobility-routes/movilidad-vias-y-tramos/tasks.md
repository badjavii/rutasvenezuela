# Tareas: movilidad vias y tramos

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Crear `via`, `via_modo`, `tramo`, `conecta` en `database/01_tablas/movilidad-vias-y-tramos.sql`.
- [ ] Agregar sus claves foráneas en `database/02_claves/movilidad-vias-y-tramos.sql`.
- [ ] Escribir las pruebas SQL de RR-29, RR-30, RR-102, RR-103 y confirmar RED.
- [ ] Implementar en `database/03_reglas/movilidad-vias-y-tramos.sql` hasta GREEN y refactorizar.
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
