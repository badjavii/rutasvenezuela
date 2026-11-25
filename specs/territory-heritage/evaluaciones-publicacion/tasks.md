# Tareas: evaluaciones publicacion

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Crear `evaluacion_experiencia`, `respaldada_por`, `evalua_hito`, `evalua_ruta` en `database/01_tablas/evaluaciones-publicacion.sql`.
- [ ] Agregar sus claves foráneas en `database/02_claves/evaluaciones-publicacion.sql`.
- [ ] Escribir las pruebas SQL de RR-9, RR-10, RR-11, RR-19, RR-94, RR-95, RR-96, RR-97, RR-98, RR-99, RR-100 y confirmar RED.
- [ ] Implementar en `database/03_reglas/evaluaciones-publicacion.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_visitante` en `database/04_seguridad/evaluaciones-publicacion.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/evaluaciones-publicacion.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-22 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V06 (Recorrido en curso, historial y evaluar) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-22.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
