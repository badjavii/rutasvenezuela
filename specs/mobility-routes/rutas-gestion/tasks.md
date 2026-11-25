# Tareas: rutas gestion

El estado de implementación se registra solo aquí. No existen pruebas ejecutadas de esta capacidad.

## T-01. Capa de datos

- [ ] Crear `ruta_turistica`, `ruta_fija`, `ruta_dinamica`, `conforma`, `usa`, `crea` en `database/01_tablas/rutas-gestion.sql`.
- [ ] Agregar sus claves foráneas en `database/02_claves/rutas-gestion.sql`.
- [ ] Escribir las pruebas SQL de RR-22, RR-34, RR-35, RR-36, RR-106, RR-107, RR-108, RR-109, RR-110, RR-111, RR-112 y confirmar RED.
- [ ] Implementar en `database/03_reglas/rutas-gestion.sql` hasta GREEN y refactorizar.
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
