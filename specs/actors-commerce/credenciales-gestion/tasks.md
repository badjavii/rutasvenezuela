# Tareas: credenciales gestion

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Crear `credencial_digital`, `adquiere`, `ampara`, `reserva_hito`, `reserva_comercio`, `valida` en `database/01_tablas/credenciales-gestion.sql`.
- [ ] Agregar sus claves foráneas en `database/02_claves/credenciales-gestion.sql`.
- [ ] Escribir las pruebas SQL de RR-55, RR-56, RR-57, RR-58, RR-59, RR-72, RR-73, RR-127, RR-128, RR-129, RR-130, RR-131, RR-132, RR-133, RR-134 y confirmar RED.
- [ ] Implementar en `database/03_reglas/credenciales-gestion.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_visitante`, `rol_guia`, `rol_comercio` en `database/04_seguridad/credenciales-gestion.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/credenciales-gestion.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V10 (Validar y canjear credencial), V08 (Mis credenciales) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-07, HU-23.1, HU-23.2, HU-23.3, HU-27.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
