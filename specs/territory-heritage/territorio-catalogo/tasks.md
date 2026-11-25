# Tareas: territorio catalogo

El estado de implementación se registra solo aquí. RED observado en CI: commit `ef17348`, la relación estado todavía no existía. La fase estructural espera verificación GREEN; las pruebas de rutinas y permisos siguen pendientes.

## T-01. Capa de datos

- [ ] Verificar en GREEN la creación de `estado`, `municipio`, `parroquia` en `database/01_tablas/territorio-catalogo.sql`.
- [ ] Verificar en GREEN las claves foráneas en `database/02_claves/territorio-catalogo.sql`.
- [x] Escribir pruebas estructurales y confirmar RED (commit `ef17348`, [CI](https://github.com/badjavii/rutasvenezuela/actions/runs/45542856563)).
- [ ] Escribir las pruebas SQL de rutinas y criterios restantes, y confirmar RED.
- [ ] Implementar en `database/03_reglas/territorio-catalogo.sql` hasta GREEN y refactorizar.
- [ ] Otorgar privilegios a `rol_administrador` en `database/04_seguridad/territorio-catalogo.sql`.
- [ ] Cargar datos de prueba en `database/05_datos/territorio-catalogo.sql`.

## T-02. Capa de aplicación

- [ ] Escribir las server actions de HU-12.1, HU-12.2, HU-12.3, HU-12.4, HU-33.1, HU-33.2, HU-33.3, HU-33.4, HU-34.1, HU-34.2, HU-34.3, HU-34.4 con `SET LOCAL ROLE`.
- [ ] Probar que un rol sin privilegio recibe el rechazo del gestor.

## T-03. Capa de presentación

- [ ] Construir V13 (Territorio) con sus estados de la [matriz de interfaz](../../../docs/testing/interface-cases.csv).

## T-04. Integración y regresión

- [ ] Ejecutar los casos de aceptación de HU-12.1, HU-12.2, HU-12.3, HU-12.4, HU-33.1, HU-33.2, HU-33.3, HU-33.4, HU-34.1, HU-34.2, HU-34.3, HU-34.4.
- [ ] Ejecutar la regresión y actualizar `specs/memory.md` tras verificar.
