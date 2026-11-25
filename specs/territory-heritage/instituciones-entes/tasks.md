# Tareas: instituciones entes

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Crear `ente_publico`, `competencia` en `database/01_tablas/instituciones-entes.sql`.
- [ ] Agregar sus claves foráneas en `database/02_claves/instituciones-entes.sql`.
- [ ] Escribir las pruebas SQL de RR-4, RR-12, RR-16, RR-17, RR-82 y confirmar RED.
- [ ] Implementar en `database/03_reglas/instituciones-entes.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_administrador` en `database/04_seguridad/instituciones-entes.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/instituciones-entes.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-31.1, HU-31.2, HU-31.3, HU-31.4 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V18 (Actores) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-31.1, HU-31.2, HU-31.3, HU-31.4.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
