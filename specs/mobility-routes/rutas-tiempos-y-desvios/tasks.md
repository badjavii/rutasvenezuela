# Tareas: rutas tiempos y desvios

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Identificar las tablas de otras capacidades que se leen.
- [ ] Escribir las pruebas SQL de los criterios y confirmar RED.
- [ ] Implementar en `database/03_reglas/rutas-tiempos-y-desvios.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_visitante`, `rol_guia` en `database/04_seguridad/rutas-tiempos-y-desvios.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/rutas-tiempos-y-desvios.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de VA-1, VA-2 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V04 (Detalle de ruta), V06 (Recorrido en curso, historial y evaluar) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de VA-1, VA-2.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
