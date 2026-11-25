# Tareas: actores identidades

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Crear `cuenta`, `visitante`, `funcionario`, `pertenece_a`, `administrador` en `database/01_tablas/actores-identidades.sql`.
- [ ] Agregar sus claves foráneas en `database/02_claves/actores-identidades.sql`.
- [ ] Escribir las pruebas SQL de RR-46, RR-47, RR-49, RR-50, RR-51, RR-61, RR-62, RR-63, RR-64, RR-65, RR-68, RR-120 y confirmar RED.
- [ ] Implementar en `database/03_reglas/actores-identidades.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_visitante`, `rol_guia`, `rol_comercio`, `rol_ente`, `rol_funcionario`, `rol_administrador` en `database/04_seguridad/actores-identidades.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/actores-identidades.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-09.1, HU-09.2, HU-09.3, HU-09.4, HU-26.1, HU-26.2, HU-26.3, HU-26.4, HU-08 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V18 (Actores), V01 (Iniciar sesión) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-09.1, HU-09.2, HU-09.3, HU-09.4, HU-26.1, HU-26.2, HU-26.3, HU-26.4, HU-08.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
