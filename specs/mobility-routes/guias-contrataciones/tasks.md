# Tareas: guias contrataciones

El estado de implementación se registra solo aquí. Tablas, claves y reglas: RED en PostgreSQL 18 local para el commit `d4d9fcc` (la relación `guia` todavía no existía) y GREEN para `35b8c57`. La prueba de mutación encontró tres casos sin cubrir (adscribir fuera de las zonas sin quitar una zona, reemplazar la ruta de una contratación y eliminar un guía solo adscrito o solo contratado); se agregaron en `d2a03ae`. Ahora quitar cualquiera de los trece triggers, los dos `CHECK`, el `UNIQUE` de RR-23 o cambiar la acción de seis claves foráneas hace fallar una prueba. Las claves foráneas hacia `cuenta` y `visitante` (Valeria), y desde `dirige` (Valeria), esperan esas tablas; las rutinas y los permisos siguen pendientes.

## T-01. Capa de datos

- [x] Crear `guia`, `cuenta_guia`, `guia_idioma`, `guia_especialidad`, `trabaja`, `sirve`, `contratacion`, `contrata_visitante`, `contrata_guia`, `contrata_ruta` en `database/01_tablas/guias-contrataciones.sql` (GREEN, `35b8c57`).
- [x] Agregar las claves foráneas hacia `guia`, `contratacion`, `municipio` y `ruta_fija` en `database/02_claves/guias-contrataciones.sql` (GREEN, `35b8c57`).
- [ ] Agregar `cuenta_guia` → `cuenta` y `contrata_visitante` → `visitante` (Valeria) cuando existan, y probarlas.
- [x] Escribir las pruebas SQL de RR-23, RR-24, RR-25, RR-26, RR-37, RR-38, RR-39, RR-40, RR-41, RR-42, RR-43, RR-116, RR-117, RR-118 y confirmar RED (`d4d9fcc`; casos agregados en `d2a03ae`).
- [x] Implementar RR-37 a RR-43, RR-117 y RR-118 (triggers diferidos) en `database/03_reglas/guias-contrataciones.sql` (GREEN, `35b8c57`).
- [ ] Escribir las rutinas de registrar, consultar, modificar y eliminar guías, adscribir y contratar (con `fn_visitante_actual()`, sección 8), y sus pruebas.
- [ ] Otorgar privilegios a `rol_visitante`, `rol_administrador` en `database/04_seguridad/guias-contrataciones.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/guias-contrataciones.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-29.1, HU-29.2, HU-29.3, HU-29.4, HU-28, VA-3 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V18 (Actores), V17 (Rutas), V04 (Detalle de ruta) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-29.1, HU-29.2, HU-29.3, HU-29.4, HU-28, VA-3.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
