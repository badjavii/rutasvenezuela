# Tareas: rutas recorridos

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Crear `recorrido`, `realiza`, `sobre`, `transita` en `database/01_tablas/rutas-recorridos.sql`.
- [ ] Agregar sus claves foráneas en `database/02_claves/rutas-recorridos.sql`.
- [ ] Escribir las pruebas SQL de RR-27, RR-28, RR-44, RR-45, RR-112, RR-113, RR-114, RR-115 y confirmar RED.
- [ ] Implementar en `database/03_reglas/rutas-recorridos.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_visitante` en `database/04_seguridad/rutas-recorridos.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/rutas-recorridos.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-21 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V06 (Recorrido en curso, historial y evaluar) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-21.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
