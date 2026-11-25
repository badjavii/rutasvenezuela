# Tareas: reportes afluencia

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Identificar las tablas de otras capacidades que se leen.
- [ ] Escribir las pruebas SQL de RR-44, RR-45, RR-113, RR-114, RR-115 y confirmar RED.
- [ ] Implementar en `database/03_reglas/reportes-afluencia.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_ente`, `rol_funcionario` en `database/04_seguridad/reportes-afluencia.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/reportes-afluencia.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de RP-3 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V21 (RP-3 Afluencia y calidad por ruta) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de RP-3.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
