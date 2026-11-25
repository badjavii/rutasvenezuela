# Tareas: patrimonio anclajes 3d

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Crear `punto_geoespacial`, `punto_hipervinculo`, `recurso_3d`, `proyecta` en `database/01_tablas/patrimonio-anclajes-3d.sql`.
- [ ] Agregar sus claves foráneas en `database/02_claves/patrimonio-anclajes-3d.sql`.
- [ ] Escribir las pruebas SQL de RR-3, RR-15, RR-78, RR-80, RR-81 y confirmar RED.
- [ ] Implementar en `database/03_reglas/patrimonio-anclajes-3d.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_visitante`, `rol_administrador` en `database/04_seguridad/patrimonio-anclajes-3d.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/patrimonio-anclajes-3d.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-02, HU-13.1, HU-13.2, HU-13.3, HU-13.4, HU-14.1, HU-14.2, HU-14.3, HU-14.4 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V05 (Realidad aumentada (móvil)), V15 (Realidad aumentada (admin)) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-02, HU-13.1, HU-13.2, HU-13.3, HU-13.4, HU-14.1, HU-14.2, HU-14.3, HU-14.4.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
