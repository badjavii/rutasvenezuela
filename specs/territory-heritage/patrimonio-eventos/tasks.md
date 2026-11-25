# Tareas: patrimonio eventos

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Crear `evento` en `database/01_tablas/patrimonio-eventos.sql`.
- [ ] Agregar sus claves foráneas en `database/02_claves/patrimonio-eventos.sql`.
- [ ] Escribir las pruebas SQL de los criterios y confirmar RED.
- [ ] Implementar en `database/03_reglas/patrimonio-eventos.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_administrador` en `database/04_seguridad/patrimonio-eventos.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/patrimonio-eventos.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-24.1, HU-24.2, HU-24.3, HU-24.4 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V14 (Hitos y eventos) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-24.1, HU-24.2, HU-24.3, HU-24.4.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
