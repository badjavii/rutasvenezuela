# Diseño previsto — Territorio

**Estado:** pendiente de validación documental. Responsable: Javier.

- **PostgreSQL:** identificar relaciones ESTADO, MUNICIPIO y PARROQUIA conforme al esquema relacional corregido; PK/FK e integridad sin claves ajenas inventadas.
- **API propuesta:** contratos para listar y gestionar el catálogo; framework sin cerrar por alternativa Node.js.
- **UI propuesta:** navegación territorial, paginación, búsqueda y ordenamiento por columnas, en coherencia con los mockups de administración.
- **TDD:** casos positivos y negativos de identificación compuesta, referencias inexistentes y conflictos de unicidad. Ver [estrategia](../../../docs/pruebas-tdd.md).
- **Dependencias:** patrimonio/hitos, movilidad/rutas e instituciones.

El diseño no incluye SQL ni endpoints definitivos.
