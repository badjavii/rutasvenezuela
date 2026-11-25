# Tareas: movilidad paradas

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Crear `parada_transporte`, `equipamiento_urbano`, `se_localiza`, `esta_en`, `funciona`, `cercana` en `database/01_tablas/movilidad-paradas.sql`.
- [ ] Agregar sus claves foráneas en `database/02_claves/movilidad-paradas.sql`.
- [ ] Escribir las pruebas SQL de RR-20, RR-21, RR-31, RR-32, RR-33, RR-101, RR-104, RR-105 y confirmar RED.
- [ ] Implementar en `database/03_reglas/movilidad-paradas.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_administrador` en `database/04_seguridad/movilidad-paradas.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/movilidad-paradas.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-16.1, HU-16.2, HU-16.3, HU-16.4 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V16 (Vías y paradas) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-16.1, HU-16.2, HU-16.3, HU-16.4.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
