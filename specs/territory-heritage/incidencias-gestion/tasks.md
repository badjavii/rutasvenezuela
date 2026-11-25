# Tareas: incidencias gestion

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Crear `incidencia`, `genera`, `afecta_hito`, `afecta_tramo`, `verifica`, `prorroga`, `cierra` en `database/01_tablas/incidencias-gestion.sql`.
- [ ] Agregar sus claves foráneas en `database/02_claves/incidencias-gestion.sql`.
- [ ] Escribir las pruebas SQL de RR-5, RR-6, RR-7, RR-8, RR-18, RR-83, RR-84, RR-85, RR-86, RR-87, RR-88, RR-89, RR-90, RR-91, RR-92, RR-93 y confirmar RED.
- [ ] Implementar en `database/03_reglas/incidencias-gestion.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_visitante`, `rol_guia`, `rol_ente`, `rol_funcionario` en `database/04_seguridad/incidencias-gestion.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/incidencias-gestion.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-19, HU-20, HU-36, HU-37 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V09 (Reportar incidencia), V12 (Gestión de incidencias) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-19, HU-20, HU-36, HU-37.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
