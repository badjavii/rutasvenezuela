# Tareas: movilidad paradas

El estado de implementación se registra solo aquí. Tablas, claves y reglas: RED en PostgreSQL 18 local para el commit `51374d9` (la relación `parada_transporte` todavía no existía) y GREEN para `6fab451`. Quitar cualquiera de los ocho triggers, o la excepción de `ON UPDATE CASCADE` de la vía habilitada, hace fallar una prueba. Las claves foráneas hacia `ubicacion_geografica`, `horario` e `hito` (Javier) y desde `usa` esperan esas tablas; las rutinas y los permisos siguen pendientes.

## T-01. Capa de datos

- [x] Crear `parada_transporte`, `equipamiento_urbano`, `se_localiza`, `esta_en`, `funciona`, `cercana` en `database/01_tablas/movilidad-paradas.sql` (GREEN, `6fab451`). `nivel_adecuacion` queda sin `CHECK`: el informe no define sus valores.
- [x] Agregar las claves foráneas hacia `parada_transporte` y `tramo` en `database/02_claves/movilidad-paradas.sql` (GREEN, `6fab451`).
- [ ] Agregar `se_localiza` → `ubicacion_geografica`, `funciona` → `horario` y `cercana` → `hito` cuando existan (Javier), y probarlas.
- [x] Escribir las pruebas SQL de RR-20, RR-21, RR-31, RR-32, RR-33, RR-101, RR-104, RR-105 y de la vía habilitada (HU-16.1, criterio 6) y confirmar RED (`51374d9`).
- [ ] Probar HU-16.4, criterio 2, cuando exista `usa` (rutas-gestion).
- [x] Implementar RR-31, RR-32 y RR-33 (triggers diferidos), RR-101 y la vía habilitada en `database/03_reglas/movilidad-paradas.sql` (GREEN, `6fab451`).
- [ ] Escribir las rutinas de registrar, consultar, modificar y eliminar paradas, con sus pruebas.
- [ ] Otorgar privilegios a `rol_administrador` en `database/04_seguridad/movilidad-paradas.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/movilidad-paradas.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-16.1, HU-16.2, HU-16.3, HU-16.4 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V16 (Vías y paradas) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-16.1, HU-16.2, HU-16.3, HU-16.4.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
