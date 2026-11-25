# Tareas: actores comercios

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Crear `comercio`, `ubicado`, `disponible` en `database/01_tablas/actores-comercios.sql`.
- [ ] Agregar sus claves foráneas en `database/02_claves/actores-comercios.sql`.
- [ ] Escribir las pruebas SQL de RR-47, RR-48, RR-60, RR-63, RR-66, RR-67, RR-119, RR-121 y confirmar RED.
- [ ] Implementar en `database/03_reglas/actores-comercios.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_administrador` en `database/04_seguridad/actores-comercios.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/actores-comercios.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-30.1, HU-30.2, HU-30.3, HU-30.4 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V18 (Actores) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-30.1, HU-30.2, HU-30.3, HU-30.4.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
