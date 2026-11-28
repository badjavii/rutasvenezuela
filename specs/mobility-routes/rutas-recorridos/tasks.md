# Tareas: rutas recorridos

El estado de implementación se registra solo aquí. Tablas, claves y reglas: RED en PostgreSQL 18 local para el commit `5929e31` (la relación `recorrido` todavía no existía) y GREEN para `a83eb99`. Ajuste a la sección 8: los renombres que llegan por `ON UPDATE CASCADE` re-verificaban RR-112, RR-114 y RR-115 contra la ruta actual; ahora las reglas se revisan solo al iniciar, registrar un paso o terminar (RED `9cd94c3`, GREEN `56ba4a3`). Quitar cualquiera de los nueve triggers o de los tres `CHECK` hace fallar una prueba. Las claves foráneas hacia `visitante` (Valeria) y `hito` (Javier), y desde `respaldada_por` (Javier), esperan esas tablas; las rutinas y los permisos siguen pendientes.

## T-01. Capa de datos

- [x] Crear `recorrido`, `realiza`, `sobre`, `transita` en `database/01_tablas/rutas-recorridos.sql` (GREEN, `a83eb99`).
- [x] Agregar las claves foráneas hacia `recorrido` y `ruta_turistica` en `database/02_claves/rutas-recorridos.sql` (GREEN, `a83eb99`).
- [ ] Agregar `realiza` → `visitante` (Valeria) y `transita` → `hito` (Javier) cuando existan, y probarlas. La prueba de renombrar un hito hace hoy la cascada a mano.
- [x] Escribir las pruebas SQL de RR-27, RR-28, RR-44, RR-45, RR-112, RR-113, RR-114, RR-115 y confirmar RED (`5929e31`).
- [x] Implementar RR-44, RR-45, RR-112 y RR-115 (triggers diferidos) y RR-114 en `database/03_reglas/rutas-recorridos.sql` (GREEN, `a83eb99`; solo al escribir el recorrido, `56ba4a3`).
- [ ] Escribir las rutinas de iniciar, registrar un paso, terminar y listar recorridos, con la hora del gestor y la autorización por registro de la sección 8, y sus pruebas.
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
