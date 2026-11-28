# Tareas: rutas gestion

El estado de implementación se registra solo aquí. Tablas, claves y reglas: RED en PostgreSQL 18 local para el commit `ff6f1d5` (la relación `ruta_turistica` todavía no existía) y GREEN para `1925caf`. Quitar cualquiera de los diez triggers o de las seis restricciones hace fallar una prueba. Las claves foráneas hacia `hito` (Javier) y `visitante` (Valeria), y desde `sobre`, `sirve`, `contrata_ruta`, `transcurre` y `evalua_ruta`, esperan esas tablas; las rutinas y los permisos siguen pendientes.

## T-01. Capa de datos

- [x] Crear `ruta_turistica`, `ruta_fija`, `ruta_dinamica`, `conforma`, `usa`, `crea` en `database/01_tablas/rutas-gestion.sql` (GREEN, `1925caf`). `nivel_dificultad` queda sin `CHECK`: el informe no define sus valores.
- [x] Agregar las claves foráneas hacia `municipio`, `ruta_turistica`, `ruta_dinamica` y `parada_transporte` en `database/02_claves/rutas-gestion.sql` (GREEN, `1925caf`).
- [ ] Agregar `conforma` → `hito` (Javier) y `crea` → `visitante` (Valeria) cuando existan, y probarlas.
- [ ] Cuando exista `conforma` → `hito`, cambiar la prueba de HU-33.3 para que la cascada mueva el municipio del hito (hoy se hace a mano). Hasta entonces, renombrar un municipio con rutas se rechaza por RR-111.
- [x] Escribir las pruebas SQL de RR-22, RR-34, RR-35, RR-36, RR-106, RR-107, RR-108, RR-109, RR-110, RR-111 y confirmar RED (`ff6f1d5`).
- [x] Implementar RR-34, RR-35, RR-36, RR-108, RR-109, RR-110 y RR-111 (triggers diferidos; RR-111 pasó de `CHECK` a la verificación diferida en `4d004f4`, para que una cascada al renombrar un municipio no la rompa a medias) y RR-107 en `database/03_reglas/rutas-gestion.sql` (GREEN, `1925caf`).
- [ ] Escribir las rutinas de registrar, consultar, modificar y eliminar rutas, con la autorización por registro de la sección 8, y sus pruebas.
- [ ] Otorgar privilegios a `rol_visitante`, `rol_administrador` en `database/04_seguridad/rutas-gestion.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/rutas-gestion.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-03, HU-17.1, HU-17.2, HU-17.3, HU-17.4, HU-25.1, HU-25.2, HU-25.3, HU-25.4 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V02 (Explorar rutas), V17 (Rutas), V07 (Mis rutas) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-03, HU-17.1, HU-17.2, HU-17.3, HU-17.4, HU-25.1, HU-25.2, HU-25.3, HU-25.4.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
