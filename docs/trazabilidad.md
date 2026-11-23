# Mapa de trazabilidad académica

**Línea base:** primera entrega de RutasVenezuela, informe del 5 de noviembre de 2026, matriz de trazabilidad (págs. impresas 75–76), índice de interfaces (págs. 11–12) y restricciones relacionales (capítulo 7). **Pendiente de incorporar la corrección docente calificada con 17,3/20.**

Este documento es el **puente único** entre los códigos académicos (HU, RR, V, RP y VA) y las **capacidades OpenSpec**. En las especificaciones se usan nombres de dominio; aquí se conservan los códigos para la defensa.

**Lectura:** cada fila vincula una HU (o grupo CRUD) con su responsable, capacidad prevista, RR relacionadas y mockup V. La asociación HU↔RR es una **agrupación de planificación** derivada del tema de la regla: debe revisarse contra los criterios de aceptación y las correcciones. «—» significa que la matriz del informe no aporta RR específicas directamente asignables; **no** significa que el módulo carezca de restricciones.

| Código | Funcionalidad | Responsable | Capacidad OpenSpec prevista | RR relacionadas (preliminar) | Vista |
|---|---|---|---|---|---|
| HU-01 | Ficha del hito y sus rutas | Javier | `patrimonio/hitos` | RR-1, RR-2, RR-13, RR-14, RR-74-79 | V03 |
| HU-02 | Recursos 3D cercanos | Javier | `patrimonio/anclajes-3d` | RR-3, RR-15, RR-78, RR-80, RR-81 | V05 |
| HU-03 | Rutas por categoría y territorio | Sebastián | `rutas/gestion` | RR-34-36, RR-106-111 | V02 |
| HU-04 | Servicios en recorrido | Sebastián | `movilidad/servicios-y-transbordos` | RR-34, RR-45, RR-110 | V04 |
| HU-05 | Paradas operativas de transbordo | Sebastián | `movilidad/servicios-y-transbordos` | RR-20, RR-21, RR-31-33, RR-101, RR-104 | V04 |
| HU-06 | Valoraciones de rutas | Valeria | `evaluaciones/consulta` | RR-9-11, RR-19, RR-94-100 | V04 |
| HU-07 | Validar credencial | Valeria | `credenciales/gestion` | RR-55-59, RR-72, RR-73, RR-127-134 | V10 |
| HU-32 | Experiencias vigentes del recorrido | Valeria | `promociones/experiencias` | RR-52-54, RR-69-71, RR-122-126 | V04 |
| HU-09.1–09.4 | CRUD visitantes | Valeria | `actores/identidades` | RR-46, RR-61, RR-62, RR-120 | V18 |
| HU-10.1–10.4 | CRUD hitos | Javier | `patrimonio/hitos` | RR-1, RR-2, RR-13, RR-14, RR-74-79 | V14 |
| HU-11.1–11.4 | CRUD categorías de hito | Javier | `patrimonio/hitos` | RR-13 | V14 |
| HU-12.1–12.4 | CRUD estados | Javier | `territorio/catalogo` | — | V13 |
| HU-13.1–13.4 | CRUD puntos de anclaje | Javier | `patrimonio/anclajes-3d` | RR-3, RR-15, RR-78, RR-80 | V15 |
| HU-14.1–14.4 | CRUD recursos 3D | Javier | `patrimonio/anclajes-3d` | RR-3, RR-15, RR-81 | V15 |
| HU-15.1–15.4 | CRUD vías | Sebastián | `movilidad/vias-y-tramos` | RR-29, RR-30, RR-102 | V16 |
| HU-16.1–16.4 | CRUD paradas | Sebastián | `movilidad/paradas` | RR-20, RR-21, RR-31-33, RR-101, RR-104, RR-105 | V16 |
| HU-17.1–17.4 | CRUD rutas fijas | Sebastián | `rutas/gestion` | RR-34, RR-35, RR-106-111 | V17 |
| HU-18.1–18.4 | CRUD experiencias promocionales | Valeria | `promociones/experiencias` | RR-52-54, RR-69-71, RR-122-126 | V11 |
| HU-23.1–23.3 | Gestión de credenciales digitales | Valeria | `credenciales/gestion` | RR-55-59, RR-72, RR-73, RR-127-134 | V08 |
| HU-24.1–24.4 | CRUD eventos culturales | Javier | `patrimonio/eventos` | — | V14 |
| HU-25.1–25.4 | CRUD rutas dinámicas | Sebastián | `rutas/gestion` | RR-22, RR-35, RR-36, RR-106-112 | V07 |
| HU-26.1–26.4 | CRUD funcionarios | Valeria | `actores/identidades` | RR-49, RR-50, RR-64, RR-68 | V18 |
| HU-29.1–29.4 | CRUD guías | Sebastián | `guias/contrataciones` | RR-23, RR-37-40, RR-116-118 | V18 |
| HU-30.1–30.4 | CRUD comercios | Valeria | `actores/comercios` | RR-47, RR-48, RR-60, RR-63, RR-66, RR-67, RR-119, RR-121 | V18 |
| HU-31.1–31.4 | CRUD instituciones | Javier | `instituciones/entes` | RR-4, RR-12, RR-16, RR-17, RR-82 | V18 |
| HU-33.1–33.4 | CRUD municipios | Javier | `territorio/catalogo` | — | V13 |
| HU-34.1–34.4 | CRUD parroquias | Javier | `territorio/catalogo` | — | V13 |
| HU-35.1–35.4 | CRUD tramos y conexiones | Sebastián | `movilidad/vias-y-tramos` | RR-29, RR-103 | V16 |
| HU-08 | Iniciar sesión | Valeria | `actores/identidades` | RR-46, RR-47, RR-49, RR-51, RR-61-65 | V01 |
| HU-19 | Reportar incidencia | Javier | `incidencias/gestion` | RR-5, RR-6, RR-18, RR-83-88, RR-93 | V09 |
| HU-20 | Verificar incidencia | Javier | `incidencias/gestion` | RR-7, RR-86-88 | V12 |
| HU-21 | Registrar recorrido | Sebastián | `rutas/recorridos` | RR-27, RR-28, RR-44, RR-45, RR-112-115 | V06 |
| HU-22 | Publicar evaluación | Javier | `evaluaciones/publicacion` | RR-9-11, RR-19, RR-94-100 | V06 |
| HU-27 | Canjear credencial | Valeria | `credenciales/gestion` | RR-55-59, RR-72, RR-73, RR-127-134 | V10 |
| HU-28 | Asignar guía a ruta fija | Sebastián | `guias/contrataciones` | RR-40, RR-117, RR-118 | V17 |
| HU-36 | Prorrogar incidencia | Javier | `incidencias/gestion` | RR-91-93 | V12 |
| HU-37 | Cerrar incidencia | Javier | `incidencias/gestion` | RR-8, RR-89-93 | V12 |
| RP-1 | Conservación e incidencias por territorio | Javier | `reportes/conservacion` | RR-5-8, RR-18, RR-83-93 | V19 |
| RP-2 | Experiencias y credenciales | Valeria | `reportes/promociones` | RR-52-59, RR-69-73, RR-119, RR-122-134 | V20 |
| RP-3 | Afluencia y calidad por ruta | Sebastián | `reportes/afluencia` | RR-44, RR-45, RR-113-115 | V21 |
| VA-1 | Tiempos reales de ruta | Sebastián | `rutas/tiempos-y-desvios` | RR-106, RR-112-115 | V04 |
| VA-2 | Desvío por incidencia | Sebastián | `rutas/tiempos-y-desvios` | RR-83-85, RR-102, RR-103, RR-110, RR-113 | V06 |
| VA-3 | Contratación de guía | Sebastián | `guias/contrataciones` | RR-24-26, RR-41-43, RR-117, RR-118 | V04 |
| VA-4 | Semáforo de seguridad | Javier | `reportes/seguridad-rutas` | RR-83-85, RR-89-91 | V04 |

## Cobertura e interpretación

- **8 consultas, 20 grupos CRUD (79 operaciones), 9 operaciones de negocio, 3 reportes y 4 valores agregados = 103** unidades de HU/funcionalidad según la primera entrega.
- Este índice agrupa los CRUD por entidad (p. ej. `HU-10.1–10.4`); para TDD se desglosan los cuatro criterios por separado. **Credenciales** utiliza tres operaciones.
- Las 21 vistas/mocks (`V01` a `V21`) aparecen enlazadas. Una vista puede abarcar varias capacidades.
- Los 134 identificadores `RR-1`–`RR-134` están referenciados al menos una vez como **asociaciones preliminares**. La semántica exacta de cada fórmula permanece en el informe original.
- Los nombres de capacidad son rutas futuras bajo `openspec/specs/<capacidad>/spec.md`; **que una capacidad figure aquí no implica que esté aprobada o implementada**.
- **Dependencias cruzadas:** cuentas/autenticación, recorridos/evaluaciones, competencia territorial/incidencias, tramos/rutas y credenciales/experiencias. Revisar conjuntamente antes de cerrar contratos.
- Revisión pendiente: trasladar la corrección docente, confirmar variaciones de las restricciones y aprobar alcance funcional con el equipo.

## Convenciones del mapa

`docs/trazabilidad.csv` refleja las mismas filas para validación automatizada. Para añadir una funcionalidad, actualizar **ambos** archivos en el mismo PR y enlazar su `Scenario` y prueba TDD. Los identificadores de pruebas viven en [pruebas-tdd.md](pruebas-tdd.md), no se mezclan con los nombres de las capacidades.

**Fuentes:** [registro de fuentes](fuentes.md) · [SDD](sdd-openspec.md) · [TDD](pruebas-tdd.md).
