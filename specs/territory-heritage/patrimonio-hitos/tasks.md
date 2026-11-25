# Tareas: patrimonio hitos

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Crear `hito`, `categoria`, `clasifica`, `ubicacion_geografica`, `registra`, `horario`, `abre`, `se_ubica_en` en `database/01_tablas/patrimonio-hitos.sql`.
- [ ] Agregar sus claves foráneas en `database/02_claves/patrimonio-hitos.sql`.
- [ ] Escribir las pruebas SQL de RR-1, RR-2, RR-13, RR-14, RR-74, RR-75, RR-76, RR-77, RR-78, RR-79 y confirmar RED.
- [ ] Implementar en `database/03_reglas/patrimonio-hitos.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_visitante`, `rol_administrador` en `database/04_seguridad/patrimonio-hitos.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/patrimonio-hitos.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-01, HU-10.1, HU-10.2, HU-10.3, HU-10.4, HU-11.1, HU-11.2, HU-11.3, HU-11.4 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V03 (Ficha del hito), V14 (Hitos y eventos) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-01, HU-10.1, HU-10.2, HU-10.3, HU-10.4, HU-11.1, HU-11.2, HU-11.3, HU-11.4.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
