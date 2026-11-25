# Tareas: promociones experiencias

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Crear `experiencia_turistica`, `promueve`, `dirige`, `transcurre`, `incluye`, `incluye_comercio` en `database/01_tablas/promociones-experiencias.sql`.
- [ ] Agregar sus claves foráneas en `database/02_claves/promociones-experiencias.sql`.
- [ ] Escribir las pruebas SQL de RR-52, RR-53, RR-54, RR-69, RR-70, RR-71, RR-122, RR-123, RR-124, RR-125, RR-126 y confirmar RED.
- [ ] Implementar en `database/03_reglas/promociones-experiencias.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_visitante`, `rol_guia`, `rol_comercio` en `database/04_seguridad/promociones-experiencias.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/promociones-experiencias.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V04 (Detalle de ruta), V11 (Mis experiencias) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-32, HU-18.1, HU-18.2, HU-18.3, HU-18.4.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
