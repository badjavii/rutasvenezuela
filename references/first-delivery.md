**UNIVERSIDAD CATÓLICA ANDRÉS BELLO**

Facultad de Ingeniería

Escuela de Informática

Asignatura: Sistemas de Bases de Datos

Profesora: Marlene Goncalves Da Silva

**Proyecto RutasVenezuela**

Primera entrega: planificación, requisitos, diseño conceptual y lógico

**Integrantes**

Javier Otero CI: 31.575.075

Sebastián Armas CI: 31.212.701

Valeria Loreto CI: 30.750.748

Caracas, 5 de noviembre de 2026

# **Contenido** {#contenido}

[**Contenido	2**](#contenido)

[**1\. Planificación y responsabilidades	4**](#1.-planificación-y-responsabilidades)

[1.1 Equipo y roles	4](#1.1-equipo-y-roles)

[1.2 Matriz de responsabilidades	4](#1.2-matriz-de-responsabilidades)

[1.3 Cronograma de la primera entrega	5](#1.3-cronograma-de-la-primera-entrega)

[1.4 Plan de la segunda entrega	5](#1.4-plan-de-la-segunda-entrega)

[**2\. Requisitos	8**](#2.-requisitos)

[2.1 Resumen	8](#2.1-resumen)

[2.2 Consultas del negocio	8](#2.2-consultas-del-negocio)

[2.3 CRUD de entidades	9](#2.3-crud-de-entidades)

[2.4 Operaciones del negocio	9](#2.4-operaciones-del-negocio)

[2.5 Reportes	10](#2.5-reportes)

[2.6 Valor agregado	10](#2.6-valor-agregado)

[**3\. Interfaces y reportes	11**](#3.-interfaces-y-reportes)

[3.1 Índice de interfaces	11](#3.1-índice-de-interfaces)

[3.2 Pantallas del visitante	13](#3.2-pantallas-del-visitante)

[**4\. Esquema entidad-relación extendido	22**](#4.-esquema-entidad-relación-extendido)

[4.1 El diagrama	22](#4.1-el-diagrama)

[4.2 Contenido del modelo	22](#4.2-contenido-del-modelo)

[4.3 Criterio de calidad	22](#4.3-criterio-de-calidad)

[4.4 Decisiones de modelado	23](#4.4-decisiones-de-modelado)

[**5\. Restricciones explícitas del ERE	25**](#5.-restricciones-explícitas-del-ere)

[5.1 Territorio, hitos y horarios	25](#5.1-territorio,-hitos-y-horarios)

[5.2 Anclajes y recursos 3D	26](#5.2-anclajes-y-recursos-3d)

[5.3 Entes públicos e incidencias	26](#5.3-entes-públicos-e-incidencias)

[5.4 Evaluaciones	28](#5.4-evaluaciones)

[5.5 Vías, tramos y paradas	29](#5.5-vías,-tramos-y-paradas)

[5.6 Rutas y recorridos	30](#5.6-rutas-y-recorridos)

[5.7 Guías y contratación	31](#5.7-guías-y-contratación)

[5.8 Visitantes y comercios	32](#5.8-visitantes-y-comercios)

[5.9 Experiencias promocionales	32](#5.9-experiencias-promocionales)

[5.10 Credenciales digitales	32](#5.10-credenciales-digitales)

[5.11 Reglas de transición	33](#5.11-reglas-de-transición)

[**6\. Esquema relacional	35**](#6.-esquema-relacional)

[6.1 Javier Otero	35](#6.1-javier-otero)

[6.2 Sebastián Armas	36](#6.2-sebastián-armas)

[6.3 Valeria Loreto	38](#6.3-valeria-loreto)

[**7\. Restricciones del esquema relacional	39**](#7.-restricciones-del-esquema-relacional)

[7.1 Javier Otero	39](#7.1-javier-otero)

[7.2 Sebastián Armas	44](#7.2-sebastián-armas)

[7.3 Valeria Loreto	49](#7.3-valeria-loreto)

[**8\. Matriz de trazabilidad	55**](#8.-matriz-de-trazabilidad)

[Bloque 1 · Consultas (8)	55](#bloque-1-·-consultas-\(8\))

[Bloque 2a · CRUD: gestión de entidades (20 CRUD, 79 HU)	55](#bloque-2a-·-crud:-gestión-de-entidades-\(20-crud,-79-hu\))

[Bloque 2b · CRUD: operaciones del negocio (9)	56](#bloque-2b-·-crud:-operaciones-del-negocio-\(9\))

[Bloque 3 · Reportes (3)	56](#bloque-3-·-reportes-\(3\))

[Bloque 4 · Valor agregado (4)	56](#bloque-4-·-valor-agregado-\(4\))

[**Anexo A. Historias de usuario completas	57**](#anexo-a.-historias-de-usuario-completas)

[Bloque 1 · Consultas (8)	57](#bloque-1-·-consultas-\(8\)-1)

[Bloque 2a · CRUD: gestión de entidades (20 CRUD)	60](#bloque-2a-·-crud:-gestión-de-entidades-\(20-crud\))

[Bloque 2b · CRUD: operaciones del negocio (9)	80](#bloque-2b-·-crud:-operaciones-del-negocio-\(9\)-1)

[Bloque 3 · Reportes (3)	83](#bloque-3-·-reportes-\(3\)-1)

[Bloque 4 · Valor agregado (4)	84](#bloque-4-·-valor-agregado-\(4\)-1)

[Notas	85](#notas)

# **1\. Planificación y responsabilidades** {#1.-planificación-y-responsabilidades}

En este capítulo explicamos cómo nos organizamos para hacer el proyecto.

## **1.1 Equipo y roles** {#1.1-equipo-y-roles}

Los tres integrantes trabajamos en todas las partes de la entrega, y cada uno desarrolla la parte que le toca según sus historias de usuario. En las partes grandes (el ERE, el modelo relacional y las restricciones), además, un integrante verifica que el conjunto completo esté correcto y coherente, y por eso lidera esa área. Cada quien también tiene un área del negocio: Javier territorio y patrimonio, Sebastián movilidad y rutas, y Valeria actores y comercio.

| Integrante | Área que lidera | De qué responde |
| :---: | :---: | :---: |
| Javier | Diagramación del ERE | Verifica que el ERE completo, con las partes que dibuja cada integrante según sus HU, cumpla la notación (min,max), esté completo y sea coherente. |
| Valeria | Interfaces y reportes | Revisa las interfaces de las pantallas y la estructura visual de los reportes con sus datos de salida. |
| Sebastián | Modelo relacional y restricciones | Verifica que el modelo relacional y las restricciones estén completos, sean coherentes con el ERE y lleven la autoría de cada integrante. |

## **1.2 Matriz de responsabilidades** {#1.2-matriz-de-responsabilidades}

La matriz dice quién es responsable de cada actividad. Usamos tres marcas: R es quien ejecuta la parte que corresponde a sus HU, V es quien revisa que el artefacto completo esté bien, y R/V es quien hace su parte y además verifica el conjunto.

| Actividad | Javier | Valeria | Sebastián |
| :---- | :---: | :---: | :---: |
| Documento de modelado — consolidación | R | V | V |
| Extraer y repartir las HU del enunciado | R | R | R |
| Completar las HU — territorio y patrimonio | R |  | V |
| Completar las HU — movilidad y rutas | V |  | R |
| Completar las HU — actores y comercio |  | R | V |
| Funcionalidades de valor agregado | R | V | R |
| Las 7 consultas obligatorias (cada dueño las de sus HU) | R | R | R/V |
| Reporte 1 y su maqueta | R | V |  |
| Reporte 2 y su maqueta |  | R | V |
| Reporte 3 y su maqueta | V |  | R |
| Interfaces de todas las pantallas | V | R | V |
| Esquema ERE en la herramienta | R/V | R | R |
| Criterio de calidad adicional | R | V | V |
| Restricciones del ERE en LPO | R | R | R/V |
| Traducción al modelo relacional | R | R | R/V |
| Restricciones del relacional en LPO | R | R | R/V |
| Cronograma, responsabilidades y trazabilidad | R | V | V |
| Consolidación y formato del documento final | R | V | V |
| Revisión final de coherencia | V | V | R |

## **1.3 Cronograma de la primera entrega** {#1.3-cronograma-de-la-primera-entrega}

| Fase | Actividad | Inicio | Fin | Responsable |
| ----- | :---- | ----- | ----- | :---- |
| F0 | Extraer las HU del enunciado y repartirlas entre los tres | 14/10 | 15/10 | Los tres |
| F0 | Reunión de arranque: confirmar roles y herramienta del ERE | 15/10 | 16/10 | Los tres |
| F1 | Documento de modelado: completar y consensuar | 16/10 | 23/10 | Los tres |
| F1 | Completar las HU: preguntas de negocio, CRUD por entidad y criterios de aceptación | 17/10 | 24/10 | Los tres |
| F2 | Dibujo del ERE a partir del modelado | 23/10 | 30/10 | Los tres |
| F2 | Criterio de calidad: aplicar y justificar | 28/10 | 31/10 | Javier |
| F3 | Interfaces de pantallas y reportes | 21/10 | 31/10 | Valeria |
| F3 | Funcionalidades de valor agregado | 23/10 | 27/10 | El equipo propone; Javier y Sebastián desarrollan |
| F4 | Restricciones del ERE en LPO | 29/10 | 02/11 | Los tres |
| F5 | Traducción al modelo relacional | 31/10 | 04/11 | Los tres |
| F5 | Restricciones del relacional en LPO | 03/11 | 04/11 | Los tres |
| F6 | Revisión cruzada y consolidación | 04/11 | 04/11 | Los tres |
| F6 | Lectura final y consignación | 05/11 | 05/11 | Los tres |

## **1.4 Plan de la segunda entrega** {#1.4-plan-de-la-segunda-entrega}

Primero, lo que exige la segunda entrega y en qué sprint lo trabajamos:

| \# | Entregable | Sprint | Responsable |
| :---- | :---- | :---- | :---- |
| 1 | Modelo Entidad Relación corregido | S2 | Los tres (R/V: Javier) |
| 2 | Scripts de creación con la autoría de cada integrante | S1 a S4 | Cada quien los de sus HU |
| 3 | Reglas de integridad automatizadas en el gestor | S1 a S3 | Cada quien las de sus HU (R/V: Sebastián) |
| 4 | CRUD, interfaces y algoritmos de la lista de requisitos acordada con la profesora | S1 a S4 | Cada quien los de sus HU |
| 5 | Tablas con paginado, ordenamiento dinámico por columnas y búsqueda avanzada | S1 | Valeria |
| 6 | Reportes con una herramienta de reportes o integrados en la aplicación | S4 | RP-1 Javier, RP-2 Valeria, RP-3 Sebastián |
| 7 | Seguridad lógica: roles, cuentas, privilegios de sistema y sobre objetos | S1 (base) y S4 (completa) | Sebastián (R/V) |
| 8 | Datos de prueba en volumen, realistas y coherentes con el contexto venezolano | S1 a S4 | Cada quien los de sus tablas (V: Valeria) |

Calendario de los sprints:

| Sprint | Fechas | Objetivo | Revisión |
| :---- | :---- | :---- | :---- |
| S1 | 06/11 a 12/11 | Base de datos creada, seguridad base y CRUD del territorio, de las vías y de los actores | 12/11 |
| S2 | 13/11 a 19/11 | CRUD de catálogo y correcciones de la Primera Entrega | 19/11 |
| S3 | 20/11 a 26/11 | Operaciones del negocio y sus reglas programadas | 26/11 |
| S4 | 27/11 a 03/12 | Consultas complejas, reportes, valor agregado y seguridad completa | 03/12 |
| Cierre | 04/12 a 07/12 | Pruebas de punta a punta, ensayo de la defensa y congelar la versión | 07/12 |
| Entrega | 08/12 | Entrega y defensa |  |

Lo que hace cada integrante en cada sprint:

**S1 · Base y territorio (06/11 a 12/11)**

| Responsable | Funcionalidades |
| ----- | :---- |
| Javier | CRUD Estados (HU-12), Municipios (HU-33), Parroquias (HU-34), Categorías (HU-11) e Instituciones (HU-31) |
| Sebastián | CRUD Vías (HU-15), Tramos (HU-35) y Guías (HU-29) |
| Valeria | Iniciar sesión (HU-08), CRUD Visitantes (HU-09) y Comercios (HU-30) |

Tareas del equipo: elegir el gestor de base de datos y el entorno de desarrollo

**S2 · Catálogo y correcciones (13/11 a 19/11)**

| Responsable | Funcionalidades |
| ----- | :---- |
| Javier | CRUD Hitos (HU-10), Puntos de anclaje (HU-13), Recursos 3D (HU-14) y Eventos (HU-24) |
| Sebastián | CRUD Paradas (HU-16) y Rutas fijas (HU-17); consulta HU-03 |
| Valeria | CRUD Funcionarios (HU-26) y Credenciales (HU-23); consulta HU-07 |

Tareas del equipo: correcciones de la Primera Entrega en clase: ERE corregido y relacional corregido.

**S3 · Operaciones del negocio y reglas (20/11 a 26/11)**

| Responsable | Funcionalidades |
| ----- | :---- |
| Javier | Reportar (HU-19), verificar (HU-20), prorrogar (HU-36) y cerrar incidencia (HU-37); publicar evaluación (HU-22) |
| Sebastián | CRUD Rutas dinámicas (HU-25); registrar recorrido (HU-21); asignar guías (HU-28); consulta HU-05 |
| Valeria | CRUD Experiencias (HU-18); canjear credencial (HU-27); consultas HU-06 y HU-32 |

Tareas del equipo: triggers, procedimientos y funciones de las reglas explícitas de sus HU; datos de prueba de las operaciones: recorridos, incidencias, credenciales y evaluaciones.

**S4 · Consultas, reportes y valor agregado (27/11 a 03/12)**

| Responsable | Funcionalidades |
| ----- | :---- |
| Javier | Consultas HU-01 y HU-02; reporte RP-1; valor agregado VA-4 |
| Sebastián | Consulta HU-04; reporte RP-3; valor agregado VA-1, VA-2 y VA-3 |
| Valeria | Reporte RP-2 |

Tareas del equipo: seguridad lógica completa

**Cierre (04/12 a 07/12):** prueba con los roles de cada actor, ensayo de la defensa donde cada integrante explica su parte, documentación de la autoría de los scripts y congelar la versión.

# **2\. Requisitos** {#2.-requisitos}

Los requisitos del sistema los escribimos como historias de usuario, siguiendo el formato de Scrum junto con unos criterios de aceptación que dicen cuándo la historia está cumplida.

## **2.1 Resumen** {#2.1-resumen}

Las historias se reparten entre los tres según el área de cada uno. Cada CRUD cuenta como un grupo de cuatro historias (tres en el caso de las credenciales, que se adquieren, se consultan y se cancelan, pero no se modifican ni se eliminan).

| Integrante | Área | CRUD | Otras HU | Total |
| :---- | :---- | :---- | :---- | :---- |
| Javier | Territorio y patrimonio | 9 CRUD (36 HU) | 9 | 45 |
| Sebastián | Movilidad y rutas | 6 CRUD (24 HU) | 9 | 33 |
| Valeria | Actores y comercio | 5 CRUD (19 HU) | 6 | 25 |

Y las agrupamos en cuatro bloques, que son los que pide el enunciado:

| Bloque | Contenido | HU |
| :---- | :---- | :---- |
| 1\. Consultas | Preguntas del negocio que el sistema responde sin cambiar datos | 8 |
| 2a. CRUD de entidades | 20 CRUD, cada uno dividido por operación | 79 |
| 2b. Operaciones del negocio | Operaciones con regla propia (reportar, canjear, registrar un recorrido) | 9 |
| 3\. Reportes | Salidas de información para un rol | 3 |
| 4\. Valor agregado | Funcionalidades propuestas por el equipo | 4 |
| Total |  | 103 |

## **2.2 Consultas del negocio** {#2.2-consultas-del-negocio}

Son las preguntas que el sistema debe responder en el momento. Salen de las consultas indispensables del enunciado.

| ID | Consulta | Responsable |
| :---- | :---- | :---- |
| HU-01 | Ficha del hito y sus rutas | Javier |
| HU-02 | Recursos 3D cercanos | Javier |
| HU-03 | Rutas por categoría y territorio | Sebastián |
| HU-04 | Servicios en un recorrido | Sebastián |
| HU-05 | Paradas de transbordo operativas | Sebastián |
| HU-06 | Valoraciones de una ruta | Valeria |
| HU-07 | Validar credencial | Valeria |
| HU-32 | Experiencias vigentes de un recorrido | Valeria |

## **2.3 CRUD de entidades** {#2.3-crud-de-entidades}

Estas son las entidades que se registran, consultan, modifican y eliminan, con las historias que forman cada CRUD.

| Historias | CRUD | Responsable |
| :---- | :---- | :---- |
| HU-09.1 a 09.4 | Visitantes | Valeria |
| HU-10.1 a 10.4 | Hitos | Javier |
| HU-11.1 a 11.4 | Categorías de hito | Javier |
| HU-12.1 a 12.4 | Estados | Javier |
| HU-13.1 a 13.4 | Puntos de anclaje de realidad aumentada | Javier |
| HU-14.1 a 14.4 | Recursos 3D | Javier |
| HU-15.1 a 15.4 | Vías | Sebastián |
| HU-16.1 a 16.4 | Paradas de transporte | Sebastián |
| HU-17.1 a 17.4 | Rutas fijas | Sebastián |
| HU-18.1 a 18.4 | Experiencias promocionales | Valeria |
| HU-23.1 a 23.3 | Credenciales digitales | Valeria |
| HU-24.1 a 24.4 | Eventos culturales | Javier |
| HU-25.1 a 25.4 | Rutas dinámicas | Sebastián |
| HU-26.1 a 26.4 | Funcionarios | Valeria |
| HU-29.1 a 29.4 | Guías | Sebastián |
| HU-30.1 a 30.4 | Comercios | Valeria |
| HU-31.1 a 31.4 | Instituciones | Javier |
| HU-33.1 a 33.4 | Municipios | Javier |
| HU-34.1 a 34.4 | Parroquias | Javier |
| HU-35.1 a 35.4 | Tramos y conexiones | Sebastián |

## **2.4 Operaciones del negocio** {#2.4-operaciones-del-negocio}

También son CRUD, pero cada una tiene una regla propia del enunciado, por eso las separamos de la gestión de entidades.

| ID | Operación | Responsable |
| :---- | :---- | :---- |
| HU-08 | Iniciar sesión | Valeria |
| HU-19 | Reportar incidencia | Javier |
| HU-20 | Verificar incidencia | Javier |
| HU-21 | Registrar recorrido | Sebastián |
| HU-22 | Publicar evaluación | Javier |
| HU-27 | Canjear credencial | Valeria |
| HU-28 | Asignar guías a una ruta fija | Sebastián |
| HU-36 | Prorrogar incidencia | Javier |
| HU-37 | Cerrar incidencia | Javier |

## **2.5 Reportes** {#2.5-reportes}

Hay un reporte por integrante. Cada uno justifica qué información necesita el rol al que va dirigido.

| ID | Reporte | Responsable |
| :---- | :---- | :---- |
| RP-1 | Estado de conservación e incidencias por territorio | Javier |
| RP-2 | Desempeño de experiencias y credenciales | Valeria |
| RP-3 | Afluencia y calidad percibida por ruta | Sebastián |

## **2.6 Valor agregado** {#2.6-valor-agregado}

Son las funcionalidades que agregamos. VA-2 y VA-3 vienen de las propuestas de Valeria, y VA-1 y VA-4 son propuestas del equipo, pensadas para el visitante.

| ID | Funcionalidad | Propone | Desarrolla |
| :---- | :---- | :---- | :---- |
| VA-1 | Tiempos reales de una ruta | el equipo | Sebastián |
| VA-2 | Desvío por incidencia | Valeria | Sebastián |
| VA-3 | Contratación de guía | Valeria | Sebastián |
| VA-4 | Semáforo de seguridad de una ruta | el equipo | Javier |

# **3\. Interfaces y reportes** {#3.-interfaces-y-reportes}

La plataforma tiene 21 interfaces (V01 a V21): 18 pantallas y 3 reportes. Cada interfaz declara qué HU cubre y se diseñó en varios estados. Aquí se muestra el estado principal de cada una.

## **3.1 Índice de interfaces** {#3.1-índice-de-interfaces}

| Vista | Interfaz | Rol | Cubre | Estados diseñados |
| :---- | :---- | :---- | :---- | :---- |
| V01 | Iniciar sesión | Acceso | HU-08 | Formulario · Datos incorrectos · Varios roles |
| V02 | Explorar rutas | Visitante | HU-03 | Con resultados · Sin resultados |
| V03 | Ficha del hito | Visitante | HU-01 | Con rutas · Sin rutas |
| V04 | Detalle de ruta | Visitante | HU-04, HU-05, HU-06, HU-32, VA-1, VA-3, VA-4 | Con datos · Sin resultados |
| V05 | Realidad aumentada (móvil) | Visitante | HU-02 | Vista única |
| V06 | Recorrido en curso, historial y evaluar | Visitante | HU-21, HU-22, VA-2 | En curso con desvío · Aviso preliminar · Sin desvío · Ruta privada · Historial · Evaluar ruta · Evaluar hito · Ruta sin completar · Recorrido ya usado |
| V07 | Mis rutas | Visitante | HU-25 | Crear ruta · Errores al guardar · Eliminación bloqueada |
| V08 | Mis credenciales | Visitante | HU-23 | Lista · Adquirir · Cancelar credencial |
| V09 | Reportar incidencia | Visitante, guía, funcionario | HU-19 | Formulario · Enviado por visitante · Enviado por funcionario |
| V10 | Validar y canjear credencial | Comercio o guía | HU-07, HU-27 | Válida · Canjeada · Ya usada · No auténtica · Fuera de horario · Otro aliado |
| V11 | Mis experiencias | Comercio o guía | HU-18 | Lista · Registrar con errores · Eliminar |
| V12 | Gestión de incidencias | Funcionario | HU-20, HU-36, HU-37 | Verificar · Activa · Prorrogar con errores · Cerrar sin competencia |
| V13 | Territorio | Administrador | HU-12, HU-33, HU-34 | Navegar · Nombres repetidos · Eliminación bloqueada |
| V14 | Hitos y eventos | Administrador | HU-10, HU-11, HU-24 | Lista · Registrar con error · Eliminación bloqueada |
| V15 | Realidad aumentada (admin) | Administrador | HU-13, HU-14 | Anclajes · Registrar anclaje · Eliminar anclaje · Recursos 3D · Recurso repetido |
| V16 | Vías y paradas | Administrador | HU-15, HU-35, HU-16 | Vías · Vía repetida · Tramos · Conexión inválida · Paradas · Parada con errores |
| V17 | Rutas | Administrador | HU-17, HU-28 | Editar ruta · Errores al guardar · Eliminación bloqueada |
| V18 | Actores | Administrador | HU-09, HU-26, HU-29, HU-30, HU-31 | Lista · Formulario con errores · Eliminar |
| V19 | RP-1 Conservación e incidencias | Institución | RP-1 | Con datos · Sin resultados |
| V20 | RP-2 Experiencias y credenciales | Comercio o guía | RP-2 | Con datos · Sin experiencias |
| V21 | RP-3 Afluencia y calidad por ruta | Institución o funcionario | RP-3 | Con datos · Sin resultados |

###

## **3.2 Pantallas del visitante** {#3.2-pantallas-del-visitante}

#### **V01 · Iniciar sesión**

Cubre HU-08. Entrada común a todos los roles: se elige el tipo de identificador (cédula o pasaporte, RIF, Registro Turístico Nacional o cédula de funcionario o administrador) y se escribe la contraseña.


####

#### **V02 · Explorar rutas**

Cubre HU-03. El visitante busca rutas por categoría de hito y por municipio o estado de origen. Cada resultado dice si es fija o dinámica pública, su origen y cuántos hitos de esa categoría tiene.


#### **V03 · Ficha del hito**

Cubre HU-01. Ficha de un hito con sus categorías, estado operativo, horario, ubicación, territorio y eventos culturales, y las rutas fijas y dinámicas públicas que lo incluyen.


#### **V04 · Detalle de ruta**

Cubre HU-04, HU-05, HU-06, HU-32, VA-1, VA-3 y VA-4. Ficha de una ruta con su secuencia de hitos y paradas, y una pestaña por consulta: servicios, paradas, valoraciones, promociones, tiempos, seguridad y guías.


#### **V05 · Realidad aumentada (móvil)**

Cubre HU-02. En el teléfono, la app envía la posición del visitante y proyecta solo los anclajes en cuyo radio está; el detalle muestra el recurso 3D, su proyección y los hipervínculos.


####

#### **V06 · Recorrido en curso, historial y evaluar**

Cubre HU-21, HU-22 y VA-2. Registra el recorrido en curso y los hitos por los que pasa el visitante, y propone un desvío si hay una incidencia activa en la ruta. Las pestañas Historial y Evaluar completan la vista.


#### **V07 · Mis rutas**

Cubre HU-25. El visitante arma sus rutas dinámicas: elige los hitos y su orden, la preferencia de transporte y si la ruta es privada o pública. Solo puede editar o eliminar las suyas.

#### ****

####

#### **V08 · Mis credenciales**

Cubre HU-23. Credenciales del visitante con su código, reserva, fecha, beneficiarios, monto y estado. Desde aquí adquiere una nueva y cancela una emitida.


####

#### **V09 · Reportar incidencia**

Cubre HU-19. Formulario común a visitante, guía y funcionario para reportar una incidencia en un hito o en tramos seguidos. Si no la reporta un funcionario, queda preliminar hasta que uno la verifique.

#

#

V10 · Validar y canjear credencial

Cubre HU-07 y HU-27. El comercio o el guía escribe el código que muestra el visitante; el sistema dice si es auténtica, su estado y si está en su fecha y horario, y solo la canjea el aliado o guía asociado.


V11 · Mis experiencias

Cubre HU-18. El comercio o el guía ve las experiencias promocionales que promueve o dirige, con su ruta, vigencia, precio, descuento, cupo, código y guía, y las registra, modifica o elimina.


V12 · Gestión de incidencias

Cubre HU-20, HU-36 y HU-37. Vista exclusiva del funcionario: verifica los reportes preliminares (los confirma como activos o los descarta), prorroga las incidencias activas y cierra las resueltas si su institución tiene competencia.


V13 · Territorio

Cubre HU-12, HU-33 y HU-34. El administrador navega estados, municipios y parroquias en tres columnas y los registra, modifica o elimina; no se elimina un territorio del que dependen otros datos.


V14 · Hitos y eventos

Cubre HU-10, HU-11 y HU-24. El administrador gestiona los hitos (categorías, estado operativo, horario y ubicación), las categorías y el cronograma de eventos culturales de cada hito.


V15 · Realidad aumentada

Cubre HU-13 y HU-14. El administrador registra los puntos de anclaje de cada hito, con su posición, orientación, radio y escala, y los recursos 3D que proyectan; un recurso sirve para varios anclajes.


V16 · Vías y paradas

Cubre HU-15, HU-35 y HU-16. El administrador gestiona la red física: las vías con sus modos permitidos y su terreno, sus tramos y las conexiones entre ellos, y las paradas de transporte de cada tramo.


V17 · Rutas

Cubre HU-17 y HU-28. El administrador arma las rutas fijas: la secuencia de hitos y paradas del origen al destino, su duración, mejor horario y dificultad, y los guías adscritos.


V18 · Actores

Cubre HU-09, HU-26, HU-29, HU-30 y HU-31. Cuentas de visitantes, guías, comercios, instituciones y funcionarios, una pestaña por tipo; el administrador las registra, consulta, modifica o elimina.


V19 · RP-1 Conservación e incidencias

Cubre RP-1. Reporte para la institución: hitos por estado operativo e incidencias activas, críticas y días promedio de resolución en cada municipio donde tiene competencia.


V20 · RP-2 Experiencias y credenciales

Cubre RP-2. Reporte para el comercio o el guía: por cada experiencia propia, su cupo, vencimiento, credenciales emitidas, canjeadas, canceladas y vencidas, y el monto abonado.


V21 · RP-3 Afluencia y calidad por ruta

Cubre RP-3. Reporte para la institución o su funcionario: recorridos iniciados, completados y abandonados por ruta, porcentaje de finalización, calificación, seguridad e hito más visitado.


#

# **4\. Esquema entidad-relación extendido** {#4.-esquema-entidad-relación-extendido}

## **4.1 El diagrama** {#4.1-el-diagrama}

El modelo completo se entrega impreso en una sola hoja, con el tamaño de entidades equivalente al del material de la profesora.


[Enlace al diagrama en lucidchart.](https://lucid.app/lucidchart/534fc3d5-6bc9-4e17-a472-d295d548f304/edit?viewport_loc=-1680%2C-1816%2C4472%2C3284%2Cp1&invitationId=inv_a96f4b48-b8e4-477c-8a29-d5ac41ae0aa3)

## **4.2 Contenido del modelo** {#4.2-contenido-del-modelo}

| Elemento | Cantidad |
| :---- | :---- |
| Entidades fuertes | 12 |
| Entidades débiles | 10 |
| Entidades que participan en la especialización o en la categorización | 9 |
| Interrelaciones no identificadoras | 43 |
| Interrelaciones identificadoras | 10 |
| Interrelaciones recursivas | 1 |
| Atributos multivaluados | 4 |
| Atributos compuestos | 6 |
| Atributos derivados | 1 |
| Especializaciones | 1 |
| Categorizaciones | 1 |

## **4.3 Criterio de calidad** {#4.3-criterio-de-calidad}

Para este proyecto se escogió la **extensibilidad** como criterio de calidad del modelo conceptual.

Un esquema es extensible cuando admite requisitos nuevos agregando elementos de forma localizada, sin obligar a modificar los que ya existen ni las interrelaciones ya definidas. La prueba es concreta: ante un requisito nuevo plausible, se cuenta cuántos elementos del modelo hay que tocar. Si la respuesta es ninguno o uno, el modelo es extensible en esa dirección.

Se escogió este criterio porque la plataforma está pensada para crecer y expandirse. Sobre la misma base de datos se van a desplegar varios módulos especializados, y cada uno trae tipos nuevos de actor, de servicio y de recurso. Un esquema que obligue a rediseñarse cada vez que aparece un tipo nuevo no sostiene ese crecimiento.

El modelo cumple el criterio en las cuatro direcciones por donde es más probable que crezca.

* **Un actor nuevo.** Si mañana el transportista tuviera que entrar a la plataforma con su propia cuenta, basta con agregarlo como una superclase más de la categoría CUENTA. No se toca ninguno de los seis actores que ya están, ni las interrelaciones que cuelgan de CUENTA, que son genera y valida. La alternativa, que era repetir el atributo de contraseña dentro de cada actor, obligaría a replicar el atributo y a reescribir todas las restricciones de autenticación cada vez que entra un actor.
* **Un tipo de ruta nueva.** La especialización se declaró sobre una superclase que tiene sus propios atributos e interrelaciones. Agregar un tercer tipo de ruta, por ejemplo una ruta institucional, es agregar una subclase. Los seis vínculos que RUTA\_TURISTICA mantiene con el resto del modelo, que son conforma, usa, delimita, sobre, transcurre y evalua\_ruta, siguen sirviendo sin cambios porque cuelgan de la superclase y no de las subclases.
* **Un formato de recurso nuevo.** RECURSO\_3D guarda el formato como un atributo y no como una subclase. Incorporar audio espacial o video de trescientos sesenta grados no agrega estructura al modelo, agrega valores al dominio de ese atributo. Si cada formato fuera una subclase, habría que tocar proyecta cada vez que apareciera uno.
* **Más datos repetidos en un hito.** Todo lo que se repite por hito y puede variar en cantidad está modelado como entidad propia o como atributo multivaluado, nunca como un conjunto fijo de atributos. Un hito puede tener cualquier número de horarios, de categorías, de eventos y de puntos de anclaje sin que el modelo imponga un tope ni haya que agregar atributos cuando ese número cambia.

La extensibilidad se paga con minimalidad, que es el criterio opuesto. Hay tres elementos que un modelo mínimo no tendría. CUENTA podría evitarse repitiendo la contraseña en cada actor. UBICACION\_GEOGRAFICA y HORARIO podrían ser atributos compuestos de cada entidad que los usa, en lugar de entidades independientes. Y la especialización de la ruta agrega dos conjuntos de entidades que un atributo de tipo evitaría. Los tres se mantienen de forma deliberada, porque son exactamente los puntos por donde el modelo tiene que poder crecer, porque un mismo horario y una misma coordenada se comparten entre hitos, paradas y comercios, y porque RUTA\_FIJA y RUTA\_DINAMICA tienen interrelaciones propias que un atributo de tipo no podría expresar.

## **4.4 Decisiones de modelado** {#4.4-decisiones-de-modelado}

Estas son las decisiones que determinaron la forma del diagrama, con el razonamiento que llevó a cada una.

* **La jerarquía territorial es una cadena de entidades débiles.** Un municipio se identifica dentro de su estado, una parroquia dentro de su municipio y un hito dentro de su parroquia. La razón es que los nombres se repiten entre territorios, es decir, hay una parroquia Catedral en varios municipios del país y una plaza Bolívar en casi todos. Si cada nivel fuera una entidad fuerte, habría que inventarle un código artificial que nadie usa en la realidad, y el sistema tendría que mantener ese código sincronizado con el nombre. Modelarlos como débiles traslada al esquema la forma en que el territorio se nombra de verdad: el nombre completo de un hito es su nombre más el de su parroquia, su municipio y su estado.

* **La vía y la ruta se identifican dentro de su municipio.** Por la misma razón que la jerarquía territorial. Existe una calle Bolívar en casi todos los municipios, así que el nombre de una vía no sirve como identificador nacional. La vía es débil de MUNICIPIO, y la ruta también, porque una ruta turística se nombra y se publica dentro del municipio donde arranca. Esto resulta en que la vía queda completa dentro de un solo municipio, lo que permite escribir restricciones de coherencia territorial sin tener que recorrer todo el país.

* **La topología de la red se modela entre tramos y no entre vías.** Una incidencia no cierra una avenida completa, sino que cierra un segmento de ella. Si la conexión se registrara a nivel de vía, el sistema sólo podría decir que dos avenidas se tocan, pero no por dónde, y sería imposible calcular un desvío cuando un tramo está bloqueado. Por eso TRAMO es una entidad débil de VIA y la interrelación conecta es recursiva sobre TRAMO, con los roles origen y destino. Esa interrelación es la que convierte la red de vías en un grafo recorrible, y es la base de la consulta de paradas de transbordo y de la propuesta de desvío.

* **El recorrido es una entidad y no un atributo.** La primera versión del modelo guardaba el recorrido como un dato dentro de la evaluación. No alcanzaba. El recorrido es el hecho que ocurre en el mundo: un visitante sale, pasa por unos hitos a unas horas determinadas y termina o abandona. De ese hecho dependen tres cosas distintas: la afluencia que necesitan los reportes, la marca de recorrido verificado que hace creíble una evaluación, y los tiempos reales entre hitos. Como entidad propia, RECORRIDO guarda su inicio, su fin, su estado y, a través de transita, la hora en que pasó por cada hito. Como atributo no podía guardar nada de eso.

* **La autenticación se resuelve con una categorización y no con una generalización.** Los seis actores de la plataforma no comparten una naturaleza común: un visitante se identifica con cédula o pasaporte, un comercio con RIF, un guía con su registro turístico y su licencia. No tienen atributos en común ni se comportan igual. Lo único que comparten es que todos entran al sistema con una contraseña. Una generalización exigiría inventar una superclase ACTOR con atributos que ninguno tiene de verdad. La categorización expresa justamente que la CUENTA es un subconjunto de la unión de los seis, y cada cuenta pertenece a uno solo de ellos. Además deja la puerta abierta para un séptimo actor sin tocar a los demás.

* **La ubicación es una entidad con clave compuesta.** El sistema no puede usar tipos de datos espaciales, así que una coordenada son tres números decimales (latitud, longitud y elevación). Esos tres valores forman la clave de UBICACION\_GEOGRAFICA. Modelarla como entidad en lugar de como atributo de cada cosa ubicable tiene dos ventajas. La primera es que un hito y un comercio pueden compartir la misma coordenada sin duplicar el dato. La segunda es que incorporar un nuevo tipo de sitio con ubicación no obliga a repetir los tres atributos otra vez.

* **La verificación de la evaluación es un atributo derivado.** Una evaluación vale más si quien la escribe efectivamente hizo el recorrido. Ese dato podría almacenarse, pero entonces nada impediría que alguien lo marcara como verificado sin que exista el recorrido detrás. Como atributo derivado, recorridoVerificado se calcula a partir del recorrido que respalda la evaluación y del visitante que lo hizo, así que no puede contradecir al vínculo que lo justifica.

* **El evento y la prórroga son entidades débiles.** Ni un evento cultural ni una prórroga tienen existencia independiente. Un evento sin el hito donde ocurre no significa nada, y una prórroga sin la incidencia que extiende tampoco. Además ninguno de los dos tiene un identificador propio en el mundo real. El evento se distingue por su nombre y su fecha de inicio dentro del hito, y la prórroga por la nueva fecha dentro de la incidencia. Son los dos criterios que definen una entidad débil, así que se modelaron de esa forma.

* **Los guías se adscriben solo a rutas fijas.** El enunciado dice que cada ruta almacena la adscripción de guías locales, pero el módulo de acompañamiento que describe es para la contratación de guías en rutas históricas y patrimoniales, que son las rutas fijas curadas por expertos. Una ruta dinámica la arma cada visitante a su medida, así que no hay una ruta estable a la que adscribir un guía. Por eso sirve une GUIA con RUTA\_FIJA.

* **El transporte especializado lo ofrece un comercio.** El enunciado dice que las credenciales sirven también para la contratación de transporte especializado, pero los comercios son solo gastronómicos, sanitarios o de alquiler de equipos. Suponemos que ese transporte lo ofrece un comercio de alquiler de equipos. Así no se inventa una categoría que el enunciado no da, y la credencial sigue reservando un hito o un comercio.

* **La zona de un guía puede abarcar varios municipios.** El enunciado habla de la zona geográfica asignada, en singular. Pero cada ruta se identifica dentro de su municipio y RE-42 exige que el guía adscrito a una ruta fija tenga asignado el municipio de esa ruta. Con un solo municipio, un guía no podría servir rutas de dos municipios vecinos, así que trabaja es N:M.

# **5\. Restricciones explícitas del ERE** {#5.-restricciones-explícitas-del-ere}

Son las reglas del negocio que el esquema entidad-relación extendido del capítulo 4 no expresa por sí solo; las que el diagrama ya expresa no se repiten. Cada una va en lenguaje natural y debajo en lógica de primer orden, con el lenguaje de restricciones del curso.

## **5.1 Territorio, hitos y horarios** {#5.1-territorio,-hitos-y-horarios}

**RE-1.** El estado operativo de todo hito es disponible, en restauración, clausurado temporalmente o cerrado permanentemente.

    (∀h \| h ∈ HITO : h.estadoOperativo \= 'disponible' ∨ h.estadoOperativo \= 'en restauración' ∨
                     h.estadoOperativo \= 'clausurado temporalmente' ∨ h.estadoOperativo \= 'cerrado permanentemente')

**RE-2.** Un hito tiene al menos un horario de visita si y solo si no es de libre acceso.

    (∀h \| h ∈ HITO :
        (h.libreAcceso \= falso → (∃a \| a ∈ abre : a\[HITO\] \= h)) ∧
        ((∃a \| a ∈ abre : a\[HITO\] \= h) → h.libreAcceso \= falso))

**RE-3.** En todo horario, el día es un día de la semana y la hora de cierre es posterior a la de apertura.

    (∀h \| h ∈ HORARIO :
        (h.idHorario.diaSemana \= 'lunes' ∨ h.idHorario.diaSemana \= 'martes' ∨ h.idHorario.diaSemana \= 'miércoles' ∨
         h.idHorario.diaSemana \= 'jueves' ∨ h.idHorario.diaSemana \= 'viernes' ∨ h.idHorario.diaSemana \= 'sábado' ∨
         h.idHorario.diaSemana \= 'domingo') ∧
        h.idHorario.horaCierre \> h.idHorario.horaApertura)

**RE-4.** Un hito, una parada o un comercio no tiene dos horarios del mismo día que se crucen.

    (∀a1, a2 \| a1 ∈ abre ∧ a2 ∈ abre ∧ a1 ≠ a2 ∧ a1\[HITO\] \= a2\[HITO\] ∧
               a1\[HORARIO\].idHorario.diaSemana \= a2\[HORARIO\].idHorario.diaSemana :
        a1\[HORARIO\].idHorario.horaCierre ≤ a2\[HORARIO\].idHorario.horaApertura ∨
        a2\[HORARIO\].idHorario.horaCierre ≤ a1\[HORARIO\].idHorario.horaApertura)
    ∧
    (∀f1, f2 \| f1 ∈ funciona ∧ f2 ∈ funciona ∧ f1 ≠ f2 ∧ f1\[PARADA\_TRANSPORTE\] \= f2\[PARADA\_TRANSPORTE\] ∧
               f1\[HORARIO\].idHorario.diaSemana \= f2\[HORARIO\].idHorario.diaSemana :
        f1\[HORARIO\].idHorario.horaCierre ≤ f2\[HORARIO\].idHorario.horaApertura ∨
        f2\[HORARIO\].idHorario.horaCierre ≤ f1\[HORARIO\].idHorario.horaApertura)
    ∧
    (∀d1, d2 \| d1 ∈ disponible ∧ d2 ∈ disponible ∧ d1 ≠ d2 ∧ d1\[COMERCIO\] \= d2\[COMERCIO\] ∧
               d1\[HORARIO\].idHorario.diaSemana \= d2\[HORARIO\].idHorario.diaSemana :
        d1\[HORARIO\].idHorario.horaCierre ≤ d2\[HORARIO\].idHorario.horaApertura ∨
        d2\[HORARIO\].idHorario.horaCierre ≤ d1\[HORARIO\].idHorario.horaApertura)

**RE-5.** Toda latitud está entre −90 y 90 grados y toda longitud entre −180 y 180, tanto en una ubicación geográfica como en la posición de un anclaje.

    (∀u \| u ∈ UBICACION\_GEOGRAFICA :
        u.coordenada.latitud ≥ −90 ∧ u.coordenada.latitud ≤ 90 ∧
        u.coordenada.longitud ≥ −180 ∧ u.coordenada.longitud ≤ 180\)
    ∧
    (∀p \| p ∈ PUNTO\_GEOESPACIAL :
        p.posicionAnclaje.latitud ≥ −90 ∧ p.posicionAnclaje.latitud ≤ 90 ∧
        p.posicionAnclaje.longitud ≥ −180 ∧ p.posicionAnclaje.longitud ≤ 180\)

**RE-6.** Si un hito se ubica sobre un tramo de vía, esa vía es del mismo municipio que la parroquia del hito.

    (∀s \| s ∈ se\_ubica\_en :
        (∃a, k, c, v \| a ∈ alberga ∧ k ∈ contiene ∧ c ∈ se\_compone ∧ v ∈ tiene\_via :
            a\[HITO\] \= s\[HITO\] ∧ k\[PARROQUIA\] \= a\[PARROQUIA\] ∧
            c\[TRAMO\] \= s\[TRAMO\] ∧ v\[VIA\] \= c\[VIA\] ∧ v\[MUNICIPIO\] \= k\[MUNICIPIO\]))

## **5.2 Anclajes y recursos 3D** {#5.2-anclajes-y-recursos-3d}

**RE-7.** En todo punto de anclaje, el radio de activación y la escala son positivos y la altitud respecto al suelo no es negativa. El azimut y la rotación están en \[0, 360\) y la inclinación en \[−90, 90\].

    (∀p \| p ∈ PUNTO\_GEOESPACIAL :
        p.radioActivacion \> 0 ∧ p.escalaVisualizacion \> 0 ∧ p.posicionAnclaje.altitudRespectoSuelo ≥ 0 ∧
        p.azimut ≥ 0 ∧ p.azimut \< 360 ∧ p.rotacion ≥ 0 ∧ p.rotacion \< 360 ∧
        p.inclinacion ≥ −90 ∧ p.inclinacion ≤ 90\)

**RE-8.** Todo recurso 3D tiene un tamaño positivo.

    (∀r \| r ∈ RECURSO\_3D : r.tamanoMB \> 0\)

## **5.3 Entes públicos e incidencias** {#5.3-entes-públicos-e-incidencias}

**RE-9.** El nivel territorial de todo ente público es nacional, estadal o municipal. Un ente municipal tiene competencia sobre exactamente un municipio. Los municipios de un ente estadal son todos del mismo estado.

    (∀e \| e ∈ ENTE\_PUBLICO :
        (e.nivelTerritorial \= 'nacional' ∨ e.nivelTerritorial \= 'estadal' ∨ e.nivelTerritorial \= 'municipal') ∧
        (e.nivelTerritorial \= 'municipal' → (∃\!₁k \| k ∈ competencia : k\[ENTE\_PUBLICO\] \= e)) ∧
        (e.nivelTerritorial \= 'estadal' →
            (∃x \| x ∈ ESTADO :
                (∀k \| k ∈ competencia ∧ k\[ENTE\_PUBLICO\] \= e :
                    (∃c \| c ∈ comprende : c\[MUNICIPIO\] \= k\[MUNICIPIO\] ∧ c\[ESTADO\] \= x)))))

**RE-10.** El estado de toda incidencia es preliminar, activa, descartada, vencida o resuelta, y su severidad es bajo, medio o crítico.

    (∀i \| i ∈ INCIDENCIA :
        (i.estadoOperativo \= 'preliminar' ∨ i.estadoOperativo \= 'activa' ∨ i.estadoOperativo \= 'descartada' ∨
         i.estadoOperativo \= 'vencida' ∨ i.estadoOperativo \= 'resuelta') ∧
        (i.nivelSeveridad \= 'bajo' ∨ i.nivelSeveridad \= 'medio' ∨ i.nivelSeveridad \= 'crítico'))

**RE-11.** Toda incidencia afecta a un hito o a uno o más tramos de vía, pero no a los dos.

    (∀i \| i ∈ INCIDENCIA : (∃a \| a ∈ afecta\_hito : a\[INCIDENCIA\] \= i) ⊕ (∃t \| t ∈ afecta\_tramo : t\[INCIDENCIA\] \= i))

**RE-12.** Si una incidencia afecta dos o más tramos, cada tramo afectado se conecta directamente con otro tramo afectado por la misma incidencia.

    (∀t1 \| t1 ∈ afecta\_tramo ∧
           (∃t2 \| t2 ∈ afecta\_tramo : t2\[INCIDENCIA\] \= t1\[INCIDENCIA\] ∧ t2\[TRAMO\] ≠ t1\[TRAMO\]) :
        (∃t3, c \| t3 ∈ afecta\_tramo ∧ c ∈ conecta ∧ t3\[INCIDENCIA\] \= t1\[INCIDENCIA\] ∧ t3\[TRAMO\] ≠ t1\[TRAMO\] ∧
            ((c\[TRAMO, origen\] \= t1\[TRAMO\] ∧ c\[TRAMO, destino\] \= t3\[TRAMO\]) ∨
             (c\[TRAMO, origen\] \= t3\[TRAMO\] ∧ c\[TRAMO, destino\] \= t1\[TRAMO\]))))

**RE-13.** Solo la cuenta de un visitante, de un guía o de un funcionario genera una incidencia.

    (∀g \| g ∈ genera : g\[CUENTA\] ∈ VISITANTE ∨ g\[CUENTA\] ∈ GUIA ∨ g\[CUENTA\] ∈ FUNCIONARIO)

**RE-14.** Solo una incidencia generada por un visitante o un guía puede estar en estado preliminar. Mientras lo está, no tiene verificación ni cierre.

    (∀i \| i ∈ INCIDENCIA ∧ i.estadoOperativo \= 'preliminar' :
        (∃g \| g ∈ genera : g\[INCIDENCIA\] \= i ∧ (g\[CUENTA\] ∈ VISITANTE ∨ g\[CUENTA\] ∈ GUIA)) ∧
        ¬(∃v \| v ∈ verifica : v\[INCIDENCIA\] \= i) ∧
        ¬(∃c \| c ∈ cierra : c\[INCIDENCIA\] \= i))

**RE-15.** Si una incidencia la generó un visitante o un guía y ya no está preliminar, un funcionario la verificó. Si la generó un funcionario, no pasa por verificación. Una incidencia descartada siempre pasó por verificación. Por eso nunca se descarta una que generó un funcionario.

    (∀g \| g ∈ genera :
        ((g\[CUENTA\] ∈ VISITANTE ∨ g\[CUENTA\] ∈ GUIA) ∧ g\[INCIDENCIA\].estadoOperativo ≠ 'preliminar'
            → (∃v \| v ∈ verifica : v\[INCIDENCIA\] \= g\[INCIDENCIA\])) ∧
        (g\[CUENTA\] ∈ FUNCIONARIO → ¬(∃v \| v ∈ verifica : v\[INCIDENCIA\] \= g\[INCIDENCIA\])))
    ∧
    (∀i \| i ∈ INCIDENCIA ∧ i.estadoOperativo \= 'descartada' : (∃v \| v ∈ verifica : v\[INCIDENCIA\] \= i))

**RE-16.** Una incidencia está resuelta si y solo si un funcionario la cerró. Tiene fecha de cierre si y solo si está resuelta.

    (∀i \| i ∈ INCIDENCIA :
        (i.estadoOperativo \= 'resuelta' → (∃c \| c ∈ cierra : c\[INCIDENCIA\] \= i)) ∧
        ((∃c \| c ∈ cierra : c\[INCIDENCIA\] \= i) → i.estadoOperativo \= 'resuelta') ∧
        (i.fechaCierre ≠ null → i.estadoOperativo \= 'resuelta') ∧
        (i.estadoOperativo \= 'resuelta' → i.fechaCierre ≠ null))

**RE-17.** Solo cierra una incidencia un funcionario de un ente público con competencia sobre el municipio del hito afectado o de alguno de los tramos afectados.

    (∀c \| c ∈ cierra :
        (∃p, k \| p ∈ pertenece\_a ∧ k ∈ competencia :
            p\[FUNCIONARIO\] \= c\[FUNCIONARIO\] ∧ k\[ENTE\_PUBLICO\] \= p\[ENTE\_PUBLICO\] ∧
            ( (∃a, al, co \| a ∈ afecta\_hito ∧ al ∈ alberga ∧ co ∈ contiene :
                  a\[INCIDENCIA\] \= c\[INCIDENCIA\] ∧ al\[HITO\] \= a\[HITO\] ∧
                  co\[PARROQUIA\] \= al\[PARROQUIA\] ∧ co\[MUNICIPIO\] \= k\[MUNICIPIO\])
            ∨ (∃t, s, v \| t ∈ afecta\_tramo ∧ s ∈ se\_compone ∧ v ∈ tiene\_via :
                  t\[INCIDENCIA\] \= c\[INCIDENCIA\] ∧ s\[TRAMO\] \= t\[TRAMO\] ∧
                  v\[VIA\] \= s\[VIA\] ∧ v\[MUNICIPIO\] \= k\[MUNICIPIO\]) )))

**RE-18.** Una incidencia confirmada (activa o vencida) está activa si y solo si su fecha estimada de resolución, o la nueva fecha de alguna de sus prórrogas, todavía no pasó. Si ya pasaron todas, está vencida. (Solo en lenguaje natural: necesita la fecha de hoy, que el lenguaje de restricciones del curso no define.)

**RE-19.** La nueva fecha de toda prórroga es posterior a la fecha estimada de resolución de su incidencia. Solo se prorroga una incidencia confirmada: una preliminar o descartada no tiene prórrogas.

    (∀s \| s ∈ se\_prorroga :
        s\[PRORROGA\].nuevaFecha \> s\[INCIDENCIA\].fechaEstimadaResolucion ∧
        s\[INCIDENCIA\].estadoOperativo ≠ 'preliminar' ∧ s\[INCIDENCIA\].estadoOperativo ≠ 'descartada')

**RE-20.** La fecha estimada de resolución y la fecha de cierre no son anteriores a la fecha de detección.

    (∀i \| i ∈ INCIDENCIA :
        i.fechaEstimadaResolucion ≥ i.fechaHoraDeteccion ∧
        (i.fechaCierre \= null ∨ i.fechaCierre ≥ i.fechaHoraDeteccion))

## **5.4 Evaluaciones** {#5.4-evaluaciones}

**RE-21.** La calificación y el índice de seguridad de toda evaluación son enteros de 1 a 5\.

    (∀e \| e ∈ EVALUACION\_EXPERIENCIA :
        (e.calificacion \= 1 ∨ e.calificacion \= 2 ∨ e.calificacion \= 3 ∨ e.calificacion \= 4 ∨ e.calificacion \= 5\) ∧
        (e.indiceSeguridad \= 1 ∨ e.indiceSeguridad \= 2 ∨ e.indiceSeguridad \= 3 ∨ e.indiceSeguridad \= 4 ∨ e.indiceSeguridad \= 5))

**RE-22.** Toda evaluación es de un hito o de una ruta, exactamente uno de los dos.

    (∀e \| e ∈ EVALUACION\_EXPERIENCIA :
        (∃h \| h ∈ evalua\_hito : h\[EVALUACION\_EXPERIENCIA\] \= e) ⊕ (∃r \| r ∈ evalua\_ruta : r\[EVALUACION\_EXPERIENCIA\] \= e))

**RE-23.** Si una evaluación es de una ruta, el recorrido que la respalda es de esa misma ruta y está completado.

    (∀r, b \| r ∈ evalua\_ruta ∧ b ∈ respaldada\_por ∧ b\[EVALUACION\_EXPERIENCIA\] \= r\[EVALUACION\_EXPERIENCIA\] :
        b\[RECORRIDO\].estadoRecorrido \= 'completado' ∧
        (∃s \| s ∈ sobre : s\[RECORRIDO\] \= b\[RECORRIDO\] ∧ s\[RUTA\_TURISTICA\] \= r\[RUTA\_TURISTICA\]))

**RE-24.** Si una evaluación es de un hito, el recorrido que la respalda ya terminó (completado o abandonado) y pasó por ese hito.

    (∀h, b \| h ∈ evalua\_hito ∧ b ∈ respaldada\_por ∧ b\[EVALUACION\_EXPERIENCIA\] \= h\[EVALUACION\_EXPERIENCIA\] :
        b\[RECORRIDO\].estadoRecorrido ≠ null ∧
        (∃t \| t ∈ transita : t\[RECORRIDO\] \= b\[RECORRIDO\] ∧ t\[HITO\] \= h\[HITO\]))

**RE-25.** La fecha de emisión de una evaluación no es anterior al fin del recorrido que la respalda.

    (∀b \| b ∈ respaldada\_por : b\[EVALUACION\_EXPERIENCIA\].fechaEmision ≥ b\[RECORRIDO\].fechaHoraFin)

**RE-26.** La marca de recorrido verificado de una evaluación es verdadera si y solo si el recorrido que la respalda está completado.

    (∀b \| b ∈ respaldada\_por :
        (b\[EVALUACION\_EXPERIENCIA\].recorridoVerificado \= verdadero → b\[RECORRIDO\].estadoRecorrido \= 'completado') ∧
        (b\[RECORRIDO\].estadoRecorrido \= 'completado' → b\[EVALUACION\_EXPERIENCIA\].recorridoVerificado \= verdadero))

**RE-27.** Un recorrido respalda a lo más una evaluación de su ruta y a lo más una por cada hito que transitó.

    (∀x \| x ∈ RECORRIDO :
        (∃¹b \| b ∈ respaldada\_por ∧ b\[RECORRIDO\] \= x :
            (∃r \| r ∈ evalua\_ruta : r\[EVALUACION\_EXPERIENCIA\] \= b\[EVALUACION\_EXPERIENCIA\])))
    ∧
    (∀x, h \| x ∈ RECORRIDO ∧ h ∈ HITO :
        (∃¹b \| b ∈ respaldada\_por ∧ b\[RECORRIDO\] \= x :
            (∃e \| e ∈ evalua\_hito : e\[EVALUACION\_EXPERIENCIA\] \= b\[EVALUACION\_EXPERIENCIA\] ∧ e\[HITO\] \= h)))

## **5.5 Vías, tramos y paradas** {#5.5-vías,-tramos-y-paradas}

**RE-28.** El tipo de toda vía es calle, avenida, bulevar, caminería, sendero, puente u otro. Cada modo permitido es a pie, bicicleta, transporte público o vehículo adaptado. Su estado es habilitada o cierre total por mantenimiento.

    (∀v \| v ∈ VIA :
        (v.tipoVia \= 'calle' ∨ v.tipoVia \= 'avenida' ∨ v.tipoVia \= 'bulevar' ∨
         v.tipoVia \= 'caminería' ∨ v.tipoVia \= 'sendero' ∨ v.tipoVia \= 'puente' ∨
         v.tipoVia \= 'otro') ∧
        (∀m \| m ∈ v.modosPermitidos : m \= 'a pie' ∨ m \= 'bicicleta' ∨ m \= 'transporte público' ∨ m \= 'vehículo adaptado') ∧
        (v.estadoVia \= 'habilitada' ∨ v.estadoVia \= 'cierre total por mantenimiento'))

**RE-29.** Un tramo no se conecta consigo mismo.

    (∀c \| c ∈ conecta : c\[TRAMO, origen\] ≠ c\[TRAMO, destino\])

**RE-30.** El estado de toda parada es activa, en mantenimiento o fuera de servicio. Su modalidad es metro, autobús, embarcadero o transporte por cable. La tarifa no es negativa. La frecuencia de paso (en minutos) y el aforo de la zona de espera son positivos.

    (∀p \| p ∈ PARADA\_TRANSPORTE :
        (p.estadoParada \= 'activa' ∨ p.estadoParada \= 'en mantenimiento' ∨ p.estadoParada \= 'fuera de servicio') ∧
        (p.modalidad \= 'metro' ∨ p.modalidad \= 'autobús' ∨ p.modalidad \= 'embarcadero' ∨ p.modalidad \= 'transporte por cable') ∧
        p.tarifaBasica ≥ 0 ∧ p.frecuenciaPaso \> 0 ∧ p.aforoMaximo \> 0\)

**RE-31.** El equipamiento de una parada es techo o marquesina, iluminación nocturna, taquilla, vigilancia, estacionamiento de transferencia o resguardo de bicicletas.

    (∀q \| q ∈ EQUIPAMIENTO\_URBANO :
        (q.tipoEquipamiento \= 'techo o marquesina' ∨ q.tipoEquipamiento \= 'iluminación nocturna' ∨ q.tipoEquipamiento \= 'taquilla' ∨
         q.tipoEquipamiento \= 'vigilancia' ∨ q.tipoEquipamiento \= 'estacionamiento de transferencia' ∨ q.tipoEquipamiento \= 'resguardo de bicicletas'))

## **5.6 Rutas y recorridos** {#5.6-rutas-y-recorridos}

**RE-32.** La duración estimada de una ruta, si la tiene, es positiva. La visibilidad de una ruta dinámica es privada o pública. Su preferencia de transporte es a pie, bicicleta, transporte público o vehículo adaptado.

    (∀r \| r ∈ RUTA\_TURISTICA : r.duracionEstimada \= null ∨ r.duracionEstimada \> 0\)
    ∧
    (∀d \| d ∈ RUTA\_DINAMICA :
        (d.visibilidad \= 'privada' ∨ d.visibilidad \= 'pública') ∧
        (d.preferenciaTransporte \= 'a pie' ∨ d.preferenciaTransporte \= 'bicicleta' ∨
         d.preferenciaTransporte \= 'transporte público' ∨ d.preferenciaTransporte \= 'vehículo adaptado'))

**RE-33.** Toda ruta fija tiene duración estimada, mejor horario de inicio y nivel de dificultad. Solo una ruta dinámica puede dejarlos vacíos.

    (∀f \| f ∈ RUTA\_FIJA : f.duracionEstimada ≠ null ∧ f.mejorHorarioInicio ≠ null ∧ f.nivelDificultad ≠ null)

**RE-34.** Dentro de una ruta, dos elementos de la secuencia (hitos o paradas) nunca comparten número de orden, y todo número de orden es positivo.

    (∀c1, c2 \| c1 ∈ conforma ∧ c2 ∈ conforma ∧ c1 ≠ c2 ∧ c1\[RUTA\_TURISTICA\] \= c2\[RUTA\_TURISTICA\] : c1.orden ≠ c2.orden)
    ∧ (∀u1, u2 \| u1 ∈ usa ∧ u2 ∈ usa ∧ u1 ≠ u2 ∧ u1\[RUTA\_TURISTICA\] \= u2\[RUTA\_TURISTICA\] : u1.orden ≠ u2.orden)
    ∧ (∀c, u \| c ∈ conforma ∧ u ∈ usa ∧ c\[RUTA\_TURISTICA\] \= u\[RUTA\_TURISTICA\] : c.orden ≠ u.orden)
    ∧ (∀c \| c ∈ conforma : c.orden ≥ 1\) ∧ (∀u \| u ∈ usa : u.orden ≥ 1\)

**RE-59.** La secuencia de una ruta empieza en el número 1 y no deja huecos: todo elemento con orden mayor que 1 tiene otro elemento de la misma ruta con el número inmediatamente anterior.

    (∀r \| r ∈ RUTA\_TURISTICA : (∃c \| c ∈ conforma : c\[RUTA\_TURISTICA\] \= r ∧ c.orden \= 1))
    ∧
    (∀c \| c ∈ conforma ∧ c.orden \> 1 :
        (∃e \| e ∈ conforma : e\[RUTA\_TURISTICA\] \= c\[RUTA\_TURISTICA\] ∧ e.orden \= c.orden − 1\) ∨
        (∃u \| u ∈ usa : u\[RUTA\_TURISTICA\] \= c\[RUTA\_TURISTICA\] ∧ u.orden \= c.orden − 1))
    ∧
    (∀u \| u ∈ usa ∧ u.orden \> 1 :
        (∃e \| e ∈ conforma : e\[RUTA\_TURISTICA\] \= u\[RUTA\_TURISTICA\] ∧ e.orden \= u.orden − 1\) ∨
        (∃v \| v ∈ usa : v\[RUTA\_TURISTICA\] \= u\[RUTA\_TURISTICA\] ∧ v.orden \= u.orden − 1))

**RE-35.** La secuencia de una ruta empieza y termina en un hito: toda parada tiene un hito de la ruta antes y otro después.

    (∀u \| u ∈ usa :
        (∃c1, c2 \| c1 ∈ conforma ∧ c2 ∈ conforma ∧
                   c1\[RUTA\_TURISTICA\] \= u\[RUTA\_TURISTICA\] ∧ c2\[RUTA\_TURISTICA\] \= u\[RUTA\_TURISTICA\] :
            c1.orden \< u.orden ∧ u.orden \< c2.orden))

**RE-36.** El municipio que delimita una ruta es el municipio de su hito de origen, que es el de menor número de orden. Como MUNICIPIO es débil de ESTADO, el estado también coincide.

    (∀d \| d ∈ delimita :
        (∃c, a, k \| c ∈ conforma ∧ a ∈ alberga ∧ k ∈ contiene :
            c\[RUTA\_TURISTICA\] \= d\[RUTA\_TURISTICA\] ∧
            c.orden \= (MIN c2 \| c2 ∈ conforma ∧ c2\[RUTA\_TURISTICA\] \= d\[RUTA\_TURISTICA\] : c2.orden) ∧
            a\[HITO\] \= c\[HITO\] ∧ k\[PARROQUIA\] \= a\[PARROQUIA\] ∧ k\[MUNICIPIO\] \= d\[MUNICIPIO\]))

**RE-37.** Un visitante solo recorre rutas fijas, rutas dinámicas públicas o rutas dinámicas que él mismo creó.

    (∀s \| s ∈ sobre :
        s\[RUTA\_TURISTICA\] ∈ RUTA\_FIJA ∨
        (∃d \| d ∈ RUTA\_DINAMICA ∧ d \= s\[RUTA\_TURISTICA\] :
            d.visibilidad \= 'pública' ∨
            (∃c, z \| c ∈ crea ∧ z ∈ realiza :
                c\[RUTA\_DINAMICA\] \= d ∧ z\[RECORRIDO\] \= s\[RECORRIDO\] ∧ c\[VISITANTE\] \= z\[VISITANTE\])))

**RE-38.** Un recorrido en curso no tiene ni fin ni estado; uno terminado tiene los dos. El estado es completado o abandonado. El fin es posterior al inicio.

    (∀x \| x ∈ RECORRIDO :
        (x.fechaHoraFin \= null → x.estadoRecorrido \= null) ∧
        (x.estadoRecorrido \= null → x.fechaHoraFin \= null) ∧
        (x.estadoRecorrido \= null ∨ x.estadoRecorrido \= 'completado' ∨ x.estadoRecorrido \= 'abandonado') ∧
        (x.fechaHoraFin \= null ∨ x.fechaHoraFin \> x.fechaHoraInicio))

**RE-39.** Los hitos que transita un recorrido son de la ruta recorrida, y cada paso ocurre entre el inicio y el fin del recorrido.

    (∀t \| t ∈ transita :
        (∃s, c \| s ∈ sobre ∧ c ∈ conforma :
            s\[RECORRIDO\] \= t\[RECORRIDO\] ∧ c\[RUTA\_TURISTICA\] \= s\[RUTA\_TURISTICA\] ∧ c\[HITO\] \= t\[HITO\]) ∧
        t.fechaHoraPaso ≥ t\[RECORRIDO\].fechaHoraInicio ∧
        (t\[RECORRIDO\].fechaHoraFin \= null ∨ t.fechaHoraPaso ≤ t\[RECORRIDO\].fechaHoraFin))

**RE-40.** Un recorrido completado pasó por todos los hitos de su ruta.

    (∀s \| s ∈ sobre ∧ s\[RECORRIDO\].estadoRecorrido \= 'completado' :
        (∀c \| c ∈ conforma ∧ c\[RUTA\_TURISTICA\] \= s\[RUTA\_TURISTICA\] :
            (∃t \| t ∈ transita : t\[RECORRIDO\] \= s\[RECORRIDO\] ∧ t\[HITO\] \= c\[HITO\])))

## **5.7 Guías y contratación** {#5.7-guías-y-contratación}

**RE-41.** Los años de trayectoria de un guía no son negativos y su tarifa horaria es positiva.

    (∀g \| g ∈ GUIA : g.aniosTrayectoria ≥ 0 ∧ g.tarifaHoraria \> 0\)

**RE-42.** Un guía adscrito a una ruta fija tiene asignada como zona el municipio de esa ruta.

    (∀s \| s ∈ sirve :
        (∃d, w \| d ∈ delimita ∧ w ∈ trabaja :
            d\[RUTA\_TURISTICA\] \= s\[RUTA\_FIJA\] ∧ w\[GUIA\] \= s\[GUIA\] ∧ w\[MUNICIPIO\] \= d\[MUNICIPIO\]))

**RE-43.** Un visitante solo contrata a un guía para una ruta a la que ese guía está adscrito.

    (∀c \| c ∈ CONTRATACION :
        (∃g, r, s \| g ∈ contrata\_guia ∧ r ∈ contrata\_ruta ∧ s ∈ sirve :
            g\[CONTRATACION\] \= c ∧ r\[CONTRATACION\] \= c ∧ s\[GUIA\] \= g\[GUIA\] ∧ s\[RUTA\_FIJA\] \= r\[RUTA\_FIJA\]))

## **5.8 Visitantes y comercios** {#5.8-visitantes-y-comercios}

**RE-44.** El grupo sanguíneo de todo visitante es uno de los ocho grupos ABO con su factor Rh.

    (∀v \| v ∈ VISITANTE : (v.grupoSanguineo \= 'A+' ∨ v.grupoSanguineo \= 'A−' ∨ v.grupoSanguineo \= 'B+' ∨
                           v.grupoSanguineo \= 'B−' ∨ v.grupoSanguineo \= 'AB+' ∨ v.grupoSanguineo \= 'AB−' ∨
                           v.grupoSanguineo \= 'O+' ∨ v.grupoSanguineo \= 'O−'))

**RE-45.** La categoría de todo comercio es gastronómico, sanitario o alquiler de equipos, y su aforo es positivo.

    (∀c \| c ∈ COMERCIO :
        (c.categoriaComercial \= 'gastronómico' ∨ c.categoriaComercial \= 'sanitario' ∨ c.categoriaComercial \= 'alquiler de equipos') ∧
        c.aforo \> 0\)

## **5.9 Experiencias promocionales** {#5.9-experiencias-promocionales}

**RE-46.** La fecha de vencimiento de toda experiencia es posterior a su fecha de activación, y su cupo máximo es de al menos una persona.

    (∀x \| x ∈ EXPERIENCIA\_TURISTICA :
        x.fechaVencimiento \> x.idExperiencia.fechaActivacion ∧ x.cupoMaximo ≥ 1\)

**RE-47.** El precio total de una experiencia es positivo y su porcentaje de descuento está entre 0 y 100\.

    (∀x \| x ∈ EXPERIENCIA\_TURISTICA : x.precioTotal \> 0 ∧ x.porcentajeDescuento ≥ 0 ∧ x.porcentajeDescuento ≤ 100\)

**RE-48.** Toda experiencia incluye al menos un hito o un comercio.

    (∀x \| x ∈ EXPERIENCIA\_TURISTICA :
        (∃i \| i ∈ incluye : i\[EXPERIENCIA\_TURISTICA\] \= x) ∨ (∃j \| j ∈ incluye\_comercio : j\[EXPERIENCIA\_TURISTICA\] \= x))

**RE-49.** Todo hito que incluye una experiencia forma parte de la ruta sobre la que transcurre.

    (∀i, t \| i ∈ incluye ∧ t ∈ transcurre ∧ i\[EXPERIENCIA\_TURISTICA\] \= t\[EXPERIENCIA\_TURISTICA\] :
        (∃c \| c ∈ conforma : c\[RUTA\_TURISTICA\] \= t\[RUTA\_TURISTICA\] ∧ c\[HITO\] \= i\[HITO\]))

**RE-50.** Una experiencia transcurre sobre una ruta fija o sobre una ruta dinámica pública.

    (∀t \| t ∈ transcurre :
        t\[RUTA\_TURISTICA\] ∈ RUTA\_FIJA ∨
        (∃d \| d ∈ RUTA\_DINAMICA ∧ d \= t\[RUTA\_TURISTICA\] : d.visibilidad \= 'pública'))

## **5.10 Credenciales digitales** {#5.10-credenciales-digitales}

**RE-51.** El estado de toda credencial es emitido, canjeado, cancelado o vencido. El monto abonado no es negativo. Incluye al menos un beneficiario.

    (∀c \| c ∈ CREDENCIAL\_DIGITAL :
        (c.estadoCredencial \= 'emitido' ∨ c.estadoCredencial \= 'canjeado' ∨
         c.estadoCredencial \= 'cancelado' ∨ c.estadoCredencial \= 'vencido') ∧
        c.montoAbonado ≥ 0 ∧ c.cantidadBeneficiarios ≥ 1\)

**RE-52.** Toda credencial reserva exactamente un hito o un comercio, no los dos.

    (∀c \| c ∈ CREDENCIAL\_DIGITAL :
        (∃r \| r ∈ reserva\_hito : r\[CREDENCIAL\_DIGITAL\] \= c) ⊕ (∃s \| s ∈ reserva\_comercio : s\[CREDENCIAL\_DIGITAL\] \= c))

**RE-53.** La cuenta que valida una credencial es la de un comercio o la de un guía.

    (∀v \| v ∈ valida : v\[CUENTA\] ∈ COMERCIO ∨ v\[CUENTA\] ∈ GUIA)

**RE-54.** Si una credencial reserva un comercio y la valida la cuenta de un comercio, es ese mismo comercio.

    (∀v, r \| v ∈ valida ∧ r ∈ reserva\_comercio ∧ v\[CREDENCIAL\_DIGITAL\] \= r\[CREDENCIAL\_DIGITAL\] ∧ v\[CUENTA\] ∈ COMERCIO :
        v\[CUENTA\] \= r\[COMERCIO\])

**RE-55.** Una credencial en estado emitido no tiene su fecha programada en el pasado. Si la fecha pasó sin canjearse, está vencida. (Solo en lenguaje natural: necesita la fecha de hoy, que el lenguaje de restricciones del curso no define.)

**RE-56.** La fecha y hora programadas de una credencial caen dentro de un horario, para ese día de la semana, del hito reservado (salvo que sea de libre acceso) o del comercio reservado. (Solo en lenguaje natural: necesita el día de la semana y la hora de una fecha, que el lenguaje de restricciones del curso no define.)

**RE-57.** Si una credencial se adquiere bajo una experiencia, el hito o comercio que reserva está incluido en esa experiencia.

    (∀a, r \| a ∈ ampara ∧ r ∈ reserva\_hito ∧ a\[CREDENCIAL\_DIGITAL\] \= r\[CREDENCIAL\_DIGITAL\] :
        (∃i \| i ∈ incluye : i\[EXPERIENCIA\_TURISTICA\] \= a\[EXPERIENCIA\_TURISTICA\] ∧ i\[HITO\] \= r\[HITO\]))
    ∧
    (∀a, r \| a ∈ ampara ∧ r ∈ reserva\_comercio ∧ a\[CREDENCIAL\_DIGITAL\] \= r\[CREDENCIAL\_DIGITAL\] :
        (∃j \| j ∈ incluye\_comercio : j\[EXPERIENCIA\_TURISTICA\] \= a\[EXPERIENCIA\_TURISTICA\] ∧ j\[COMERCIO\] \= r\[COMERCIO\]))

**RE-58.** Si una credencial se adquiere bajo una experiencia, sus beneficiarios no superan el cupo de la experiencia y su fecha programada está entre la activación y el vencimiento de la experiencia.

    (∀a \| a ∈ ampara :
        a\[CREDENCIAL\_DIGITAL\].cantidadBeneficiarios ≤ a\[EXPERIENCIA\_TURISTICA\].cupoMaximo ∧
        a\[CREDENCIAL\_DIGITAL\].fechaHoraProgramada ≥ a\[EXPERIENCIA\_TURISTICA\].idExperiencia.fechaActivacion ∧
        a\[CREDENCIAL\_DIGITAL\].fechaHoraProgramada ≤ a\[EXPERIENCIA\_TURISTICA\].fechaVencimiento)

##

## **5.11 Reglas de transición** {#5.11-reglas-de-transición}

Las restricciones anteriores describen cómo debe estar la base de datos en un instante dado, y para verificarlas basta mirar el estado de los datos en ese momento. Una regla de transición es distinta ya que no restringe un estado sino el paso de un estado al siguiente. No dice qué valor puede tener un atributo, dice a qué valor tiene derecho a cambiar desde el valor que ya tenía. Que una credencial cancelada no pueda volver a emitida es una regla de transición, porque para evaluarla hay que conocer el valor anterior.

Esa diferencia es la que impide escribirlas con el lenguaje lógico. Ese lenguaje cuantifica sobre los conjuntos de entidades e interrelaciones de un único estado del esquema, y no tiene cómo referirse al valor que un atributo tenía antes de la actualización. Por eso se enuncian aquí en lenguaje natural.

1. **La credencial solo cambia mientras está emitida.** Una credencial nace emitida y desde ahí puede pasar a canjeada, cancelada o vencida.
2. **El canje ocurre una sola vez y en su momento.** El comercio o el guía valida el código en la fecha y hora programadas y dentro del horario del lugar reservado. Como al canjearse la credencial deja de estar emitida, un segundo intento de validación la encuentra en un estado que ya no admite el cambio, y eso es justamente lo que impide que un mismo código dé acceso dos veces.
3. **La cancelación es del visitante y antes de la fecha.** Solo se cancela una credencial que siga emitida, y solo antes de que llegue la fecha programada. Después de esa fecha ya no hay nada que cancelar, porque la credencial se venció sola.
4. **La incidencia nace preliminar o activa según quién la reporte.** Si la levanta un visitante o un guía queda preliminar, porque es una observación que todavía nadie confirmó. Si la levanta un funcionario entra directamente como activa, porque su observación no necesita que otro la verifique.
5. **Solo una incidencia preliminar se verifica.** Un funcionario la revisa y la deja activa si es veraz, o descartada si es infundada. Una incidencia que ya está activa, resuelta o descartada no se verifica otra vez.
6. **Solo una incidencia activa se prorroga o se cierra.** Prorrogar una preliminar no tiene sentido, porque todavía no se sabe si el problema existe, y prorrogar una resuelta tampoco. El cierre lo hace un funcionario con competencia territorial, y al cerrarse queda registrada la fecha de cierre.
7. **Cada prórroga fija una fecha posterior a la anterior.** Una incidencia puede prorrogarse más de una vez. RE-19 ya exige que toda prórroga supere la fecha estimada de resolución original, pero esa comparación no alcanza cuando ya hay prórrogas previas; sin esta regla, una segunda prórroga podría adelantar la fecha que fijó la primera.
8. **El vencimiento lo provoca el tiempo.** Una credencial emitida pasa a vencida cuando se cumple su fecha y hora programadas sin haberse canjeado, y una incidencia activa pasa a vencida cuando se cumple su fecha estimada de resolución sin haberse cerrado ni prorrogado. Son los dos únicos cambios de estado del modelo que no dependen de que un actor haga algo.
9. **El recorrido se cierra como completado o como abandonado.** Mientras transcurre está en curso. Al terminar queda registrada la fecha y hora de fin, siempre posterior a la de inicio, y el recorrido pasa a completado si el visitante atravesó todos los hitos de la ruta, o a abandonado si no. De ahí salen dos cosas del resto del modelo: el porcentaje de finalización que reporta RP-3 y la marca de recorrido verificado de una evaluación, que según RE-26 solo vale sobre un recorrido completado.
10. **La parada se registra sobre una vía habilitada.** Al dar de alta una parada de transporte, o al cambiarla de tramo, el tramo de destino debe pertenecer a una vía habilitada, porque no tiene sentido inaugurar una parada en una vía cerrada. Si más adelante esa vía entra en cierre total, la parada no se elimina ni cambia de estado, simplemente deja de ofrecerse como opción de transbordo mientras dure el cierre. Eso no es una regla de transición sino una condición que evalúa la consulta de HU-05.


#

#

#

#

#

#

#

#

#

#

#

#

#

#

#

#

#

#

#

#

#

# **6\. Esquema relacional** {#6.-esquema-relacional}

Este capítulo traduce al modelo relacional el esquema entidad-relación extendido del capítulo 4\.

**Notación.** El atributo subrayado forma parte de la clave primaria y el que está en cursiva es clave foránea; entre paréntesis, después de la clave foránea, va la relación a la que referencia.

**Atributos opcionales.** Todos los atributos que no son clave son obligatorios, salvo HITO.alturaDentroEstructura, INCIDENCIA.fechaCierre, RECORRIDO.fechaHoraFin y RECORRIDO.estadoRecorrido, EXPERIENCIA\_TURISTICA.codigoPromocional y, solo en las rutas dinámicas, duracionEstimada, mejorHorarioInicio y nivelDificultad de RUTA\_TURISTICA.

## **6.1 Javier Otero** {#6.1-javier-otero}

ESTADO(nombreEstado)

MUNICIPIO(*nombreEstado* (ESTADO), nombreMunicipio)

PARROQUIA(*nombreEstado, nombreMunicipio* (MUNICIPIO), nombreParroquia)

HITO(*nombreEstado, nombreMunicipio, nombreParroquia* (PARROQUIA), nombreHito, descripcion, libreAcceso, estadoOperativo, alturaDentroEstructura)

CATEGORIA(denominacion)

CLASIFICA(*nombreEstado, nombreMunicipio, nombreParroquia, nombreHito* (HITO), *denominacion* (CATEGORIA))

UBICACION\_GEOGRAFICA(latitud, longitud, elevacion)

REGISTRA(*nombreEstado, nombreMunicipio, nombreParroquia, nombreHito* (HITO), *latitud, longitud, elevacion* (UBICACION\_GEOGRAFICA))

HORARIO(diaSemana, horaApertura, horaCierre)

ABRE(*nombreEstado, nombreMunicipio, nombreParroquia, nombreHito* (HITO), *diaSemana, horaApertura, horaCierre* (HORARIO))

SE\_UBICA\_EN(*estadoHito, municipioHito, parroquiaHito, nombreHito* (HITO), *estadoTramo, municipioTramo, nombreVia, numeroTramo* (TRAMO))

PUNTO\_GEOESPACIAL(*nombreEstado, nombreMunicipio, nombreParroquia, nombreHito* (HITO), latitud, longitud, altitudRespectoSuelo, azimut, inclinacion, rotacion, radioActivacion, escalaVisualizacion)

PUNTO\_HIPERVINCULO(*nombreEstado, nombreMunicipio, nombreParroquia, nombreHito, latitud, longitud, altitudRespectoSuelo* (PUNTO\_GEOESPACIAL), hipervinculo)

RECURSO\_3D(idRecurso, formato, version, tamanoMB, rutaAlmacenamiento, descripcion)

PROYECTA(*nombreEstado, nombreMunicipio, nombreParroquia, nombreHito, latitud, longitud, altitudRespectoSuelo* (PUNTO\_GEOESPACIAL), *idRecurso* (RECURSO\_3D))

EVENTO(*nombreEstado, nombreMunicipio, nombreParroquia, nombreHito* (HITO), nombreEvento, fechaInicio)

ENTE\_PUBLICO(rifInstitucional, denominacion, nivelTerritorial, funcionarioEnlace, decretoAdscripcion)

CUENTA\_ENTE\_PUBLICO(*rifInstitucional* (ENTE\_PUBLICO), *idCuenta* (CUENTA))

COMPETENCIA(*rifInstitucional* (ENTE\_PUBLICO), *nombreEstado, nombreMunicipio* (MUNICIPIO))

INCIDENCIA(numeroReporte, fechaHoraDeteccion, nivelSeveridad, narrativaEvento, estadoOperativo, fechaEstimadaResolucion, fechaCierre)

GENERA(*numeroReporte* (INCIDENCIA), *idCuenta* (CUENTA))

AFECTA\_HITO(*numeroReporte* (INCIDENCIA), *nombreEstado, nombreMunicipio, nombreParroquia, nombreHito* (HITO))

AFECTA\_TRAMO(*numeroReporte* (INCIDENCIA), *nombreEstado, nombreMunicipio, nombreVia, numeroTramo* (TRAMO))

VERIFICA(*numeroReporte* (INCIDENCIA), *cedulaFuncionario* (FUNCIONARIO))

PRORROGA(*numeroReporte* (INCIDENCIA), nuevaFecha, justificacion)

CIERRA(*numeroReporte* (INCIDENCIA), *cedulaFuncionario* (FUNCIONARIO))

EVALUACION\_EXPERIENCIA(codigoResena, calificacion, indiceSeguridad, opinionTextual, fechaEmision, recorridoVerificado)

RESPALDADA\_POR(*codigoResena* (EVALUACION\_EXPERIENCIA), *idRecorrido* (RECORRIDO))

EVALUA\_HITO(*codigoResena* (EVALUACION\_EXPERIENCIA), *nombreEstado, nombreMunicipio, nombreParroquia, nombreHito* (HITO))

EVALUA\_RUTA(*codigoResena* (EVALUACION\_EXPERIENCIA), *nombreEstado, nombreMunicipio, nombreRuta* (RUTA\_TURISTICA))

## **6.2 Sebastián Armas** {#6.2-sebastián-armas}

VIA(*nombreEstado, nombreMunicipio* (MUNICIPIO), nombreVia, tipoVia, condicionTerreno, estadoVia)

VIA\_MODO(*nombreEstado, nombreMunicipio, nombreVia* (VIA), modo)

TRAMO(*nombreEstado, nombreMunicipio, nombreVia* (VIA), numeroTramo, tieneEscalinata, tieneDesnivel)

CONECTA(*estadoOrigen, municipioOrigen, viaOrigen, tramoOrigen* (TRAMO), *estadoDestino, municipioDestino, viaDestino, tramoDestino* (TRAMO))

PARADA\_TRANSPORTE(codigoTerminal, nombreParada, modalidad, tarifaBasica, nivelAdecuacion, estadoParada, frecuenciaPaso, aforoMaximo)

EQUIPAMIENTO\_URBANO(*codigoTerminal* (PARADA\_TRANSPORTE), tipoEquipamiento)

SE\_LOCALIZA(*codigoTerminal* (PARADA\_TRANSPORTE), *latitud, longitud, elevacion* (UBICACION\_GEOGRAFICA))

ESTA\_EN(*codigoTerminal* (PARADA\_TRANSPORTE), *nombreEstado, nombreMunicipio, nombreVia, numeroTramo* (TRAMO))

FUNCIONA(*codigoTerminal* (PARADA\_TRANSPORTE), *diaSemana, horaApertura, horaCierre* (HORARIO))

CERCANA(*codigoTerminal* (PARADA\_TRANSPORTE), *nombreEstado, nombreMunicipio, nombreParroquia, nombreHito* (HITO))

RUTA\_TURISTICA(*nombreEstado, nombreMunicipio* (MUNICIPIO), nombreRuta, duracionEstimada, mejorHorarioInicio, nivelDificultad)

RUTA\_FIJA(*nombreEstado, nombreMunicipio, nombreRuta* (RUTA\_TURISTICA))

RUTA\_DINAMICA(*nombreEstado, nombreMunicipio, nombreRuta* (RUTA\_TURISTICA), visibilidad, preferenciaTransporte)

CONFORMA(*estadoRuta, municipioRuta, nombreRuta* (RUTA\_TURISTICA), *estadoHito, municipioHito, parroquiaHito, nombreHito* (HITO), orden)

USA(*codigoTerminal* (PARADA\_TRANSPORTE), *nombreEstado, nombreMunicipio, nombreRuta* (RUTA\_TURISTICA), orden)

CREA(*nombreEstado, nombreMunicipio, nombreRuta* (RUTA\_DINAMICA), *cedulaPasaporte* (VISITANTE))

GUIA(rtn, codigoLicencia, acreditacion, aniosTrayectoria, tarifaHoraria)

CUENTA\_GUIA(*rtn, codigoLicencia* (GUIA), *idCuenta* (CUENTA))

GUIA\_IDIOMA(*rtn, codigoLicencia* (GUIA), idioma)

GUIA\_ESPECIALIDAD(*rtn, codigoLicencia* (GUIA), especialidad)

TRABAJA(*rtn, codigoLicencia* (GUIA), *nombreEstado, nombreMunicipio* (MUNICIPIO))

SIRVE(*rtn, codigoLicencia* (GUIA), *nombreEstado, nombreMunicipio, nombreRuta* (RUTA\_FIJA))

CONTRATACION(nroContratacion, fechaContratacion)

CONTRATA\_VISITANTE(*nroContratacion* (CONTRATACION), *cedulaPasaporte* (VISITANTE))

CONTRATA\_GUIA(*nroContratacion* (CONTRATACION), *rtn, codigoLicencia* (GUIA))

CONTRATA\_RUTA(*nroContratacion* (CONTRATACION), *nombreEstado, nombreMunicipio, nombreRuta* (RUTA\_FIJA))

RECORRIDO(idRecorrido, fechaHoraInicio, fechaHoraFin, estadoRecorrido)

REALIZA(*idRecorrido* (RECORRIDO), *cedulaPasaporte* (VISITANTE))

SOBRE(*idRecorrido* (RECORRIDO), *nombreEstado, nombreMunicipio, nombreRuta* (RUTA\_TURISTICA))

TRANSITA(*idRecorrido* (RECORRIDO), *nombreEstado, nombreMunicipio, nombreParroquia, nombreHito* (HITO), fechaHoraPaso)

## **6.3 Valeria Loreto** {#6.3-valeria-loreto}

CUENTA(idCuenta, contrasena)

VISITANTE(cedulaPasaporte, nombres, apellidos, paisOrigen, idiomaNativo, telefonoEmergencia, grupoSanguineo, accesibilidad)

CUENTA\_VISITANTE(*cedulaPasaporte* (VISITANTE), *idCuenta* (CUENTA))

COMERCIO(rifJuridico, razonSocial, categoriaComercial, aforo, permisoSanitario, cuentaBancaria)

CUENTA\_COMERCIO(*rifJuridico* (COMERCIO), *idCuenta* (CUENTA))

UBICADO(*rifJuridico* (COMERCIO), *latitud, longitud, elevacion* (UBICACION\_GEOGRAFICA))

DISPONIBLE(*rifJuridico* (COMERCIO), *diaSemana, horaApertura, horaCierre* (HORARIO))

FUNCIONARIO(cedulaFuncionario, nombreFuncionario, cargo)

CUENTA\_FUNCIONARIO(*cedulaFuncionario* (FUNCIONARIO), *idCuenta* (CUENTA))

PERTENECE\_A(*cedulaFuncionario* (FUNCIONARIO), *rifInstitucional* (ENTE\_PUBLICO))

ADMINISTRADOR(cedulaAdmin, correo)

CUENTA\_ADMINISTRADOR(*cedulaAdmin* (ADMINISTRADOR), *idCuenta* (CUENTA))

EXPERIENCIA\_TURISTICA(titulo, fechaActivacion, descripcion, precioTotal, cupoMaximo, porcentajeDescuento, fechaVencimiento, codigoPromocional)

PROMUEVE(*titulo, fechaActivacion* (EXPERIENCIA\_TURISTICA), *rifJuridico* (COMERCIO))

DIRIGE(*titulo, fechaActivacion* (EXPERIENCIA\_TURISTICA), *rtn, codigoLicencia* (GUIA))

TRANSCURRE(*titulo, fechaActivacion* (EXPERIENCIA\_TURISTICA), *nombreEstado, nombreMunicipio, nombreRuta* (RUTA\_TURISTICA))

INCLUYE(*titulo, fechaActivacion* (EXPERIENCIA\_TURISTICA), *nombreEstado, nombreMunicipio, nombreParroquia, nombreHito* (HITO))

INCLUYE\_COMERCIO(*titulo, fechaActivacion* (EXPERIENCIA\_TURISTICA), *rifJuridico* (COMERCIO))

CREDENCIAL\_DIGITAL(codigoCredencial, fechaHoraProgramada, montoAbonado, cantidadBeneficiarios, estadoCredencial)

ADQUIERE(*codigoCredencial* (CREDENCIAL\_DIGITAL), *cedulaPasaporte* (VISITANTE))

AMPARA(*codigoCredencial* (CREDENCIAL\_DIGITAL), *titulo, fechaActivacion* (EXPERIENCIA\_TURISTICA))

RESERVA\_HITO(*codigoCredencial* (CREDENCIAL\_DIGITAL), *nombreEstado, nombreMunicipio, nombreParroquia, nombreHito* (HITO))

RESERVA\_COMERCIO(*codigoCredencial* (CREDENCIAL\_DIGITAL), *rifJuridico* (COMERCIO))

VALIDA(*codigoCredencial* (CREDENCIAL\_DIGITAL), *idCuenta* (CUENTA))

# **7\. Restricciones del esquema relacional** {#7.-restricciones-del-esquema-relacional}

Son las restricciones que el modelo relacional no expresa por sí solo. Primero van las que se pierden al traducir: los no nulos de las claves foráneas de las interrelaciones separadas, las claves alternas, las participaciones mínimas, la especialización y la categoría. Después van las restricciones del capítulo 5, reescritas sobre las tablas. Cada una va en lenguaje natural y debajo en lógica de primer orden.

## **7.1 Javier Otero** {#7.1-javier-otero}

**RR-1.** La ubicación de cada hito registrado es distinta de null.

    (∀t \| t ∈ REGISTRA : t.latitud ≠ null ∧ t.longitud ≠ null ∧ t.elevacion ≠ null)

**RR-2.** El tramo sobre el que está un hito es distinto de null.

    (∀t \| t ∈ SE\_UBICA\_EN : t.estadoTramo ≠ null ∧ t.municipioTramo ≠ null ∧ t.nombreVia ≠ null ∧ t.numeroTramo ≠ null)

**RR-3.** El recurso 3D que proyecta cada punto es distinto de null.

    (∀t \| t ∈ PROYECTA : t.idRecurso ≠ null)

**RR-4.** La cuenta de cada ente es distinta de null y es clave alterna: una cuenta es de un solo ente.

    (∀t \| t ∈ CUENTA\_ENTE\_PUBLICO : t.idCuenta ≠ null)
    ∧
    (∀t1, t2 \| t1 ∈ CUENTA\_ENTE\_PUBLICO ∧ t2 ∈ CUENTA\_ENTE\_PUBLICO ∧ t1 ≠ t2 : t1.idCuenta ≠ t2.idCuenta)

**RR-5.** La cuenta que genera cada incidencia es distinta de null.

    (∀t \| t ∈ GENERA : t.idCuenta ≠ null)

**RR-6.** El hito afectado es distinto de null.

    (∀t \| t ∈ AFECTA\_HITO : t.nombreEstado ≠ null ∧ t.nombreMunicipio ≠ null ∧ t.nombreParroquia ≠ null ∧ t.nombreHito ≠ null)

**RR-7.** El funcionario que verifica es distinto de null.

    (∀t \| t ∈ VERIFICA : t.cedulaFuncionario ≠ null)

**RR-8.** El funcionario que cierra es distinto de null.

    (∀t \| t ∈ CIERRA : t.cedulaFuncionario ≠ null)

**RR-9.** El recorrido que respalda cada evaluación es distinto de null.

    (∀t \| t ∈ RESPALDADA\_POR : t.idRecorrido ≠ null)

**RR-10.** El hito evaluado es distinto de null.

    (∀t \| t ∈ EVALUA\_HITO : t.nombreEstado ≠ null ∧ t.nombreMunicipio ≠ null ∧ t.nombreParroquia ≠ null ∧ t.nombreHito ≠ null)

**RR-11.** La ruta evaluada es distinta de null.

    (∀t \| t ∈ EVALUA\_RUTA : t.nombreEstado ≠ null ∧ t.nombreMunicipio ≠ null ∧ t.nombreRuta ≠ null)

**RR-12.** La denominación oficial es clave alterna: es distinta de null y no se repite.

    (∀e \| e ∈ ENTE\_PUBLICO : e.denominacion ≠ null)
    ∧
    (∀e1, e2 \| e1 ∈ ENTE\_PUBLICO ∧ e2 ∈ ENTE\_PUBLICO ∧ e1 ≠ e2 : e1.denominacion ≠ e2.denominacion)

**RR-13.** Todo hito tiene al menos una categoría.

    (∀h \| h ∈ HITO :
        (∃c \| c ∈ CLASIFICA :
            c.nombreEstado \= h.nombreEstado ∧ c.nombreMunicipio \= h.nombreMunicipio ∧
            c.nombreParroquia \= h.nombreParroquia ∧ c.nombreHito \= h.nombreHito))

**RR-14.** Todo hito tiene su ubicación.

    (∀h \| h ∈ HITO :
        (∃r \| r ∈ REGISTRA :
            r.nombreEstado \= h.nombreEstado ∧ r.nombreMunicipio \= h.nombreMunicipio ∧
            r.nombreParroquia \= h.nombreParroquia ∧ r.nombreHito \= h.nombreHito))

**RR-15.** Todo punto de anclaje proyecta un recurso 3D.

    (∀p \| p ∈ PUNTO\_GEOESPACIAL :
        (∃r \| r ∈ PROYECTA :
            r.nombreEstado \= p.nombreEstado ∧ r.nombreMunicipio \= p.nombreMunicipio ∧
            r.nombreParroquia \= p.nombreParroquia ∧ r.nombreHito \= p.nombreHito ∧
            r.latitud \= p.latitud ∧ r.longitud \= p.longitud ∧ r.altitudRespectoSuelo \= p.altitudRespectoSuelo))

**RR-16.** Todo ente tiene competencia sobre al menos un municipio.

    (∀e \| e ∈ ENTE\_PUBLICO : (∃c \| c ∈ COMPETENCIA : c.rifInstitucional \= e.rifInstitucional))

**RR-17.** Todo ente tiene su cuenta.

    (∀e \| e ∈ ENTE\_PUBLICO : (∃t \| t ∈ CUENTA\_ENTE\_PUBLICO : t.rifInstitucional \= e.rifInstitucional))

**RR-18.** Toda incidencia la generó una cuenta.

    (∀i \| i ∈ INCIDENCIA : (∃g \| g ∈ GENERA : g.numeroReporte \= i.numeroReporte))

**RR-19.** Toda evaluación la respalda un recorrido.

    (∀e \| e ∈ EVALUACION\_EXPERIENCIA : (∃b \| b ∈ RESPALDADA\_POR : b.codigoResena \= e.codigoResena))

**RR-74.** El estado operativo de todo hito es disponible, en restauración, clausurado temporalmente o cerrado permanentemente.

    (∀h \| h ∈ HITO : h.estadoOperativo \= 'disponible' ∨ h.estadoOperativo \= 'en restauración' ∨
                     h.estadoOperativo \= 'clausurado temporalmente' ∨ h.estadoOperativo \= 'cerrado permanentemente')

**RR-75.** Un hito tiene al menos una fila en ABRE si y solo si no es de libre acceso.

    (∀h \| h ∈ HITO :
        (h.libreAcceso \= falso →
            (∃a \| a ∈ ABRE : a.nombreEstado \= h.nombreEstado ∧ a.nombreMunicipio \= h.nombreMunicipio ∧
                             a.nombreParroquia \= h.nombreParroquia ∧ a.nombreHito \= h.nombreHito)) ∧
        ((∃a \| a ∈ ABRE : a.nombreEstado \= h.nombreEstado ∧ a.nombreMunicipio \= h.nombreMunicipio ∧
                          a.nombreParroquia \= h.nombreParroquia ∧ a.nombreHito \= h.nombreHito) →
            h.libreAcceso \= falso))

**RR-76.** En todo horario, el día es un día de la semana y la hora de cierre es posterior a la de apertura.

    (∀h \| h ∈ HORARIO :
        (h.diaSemana \= 'lunes' ∨ h.diaSemana \= 'martes' ∨ h.diaSemana \= 'miércoles' ∨ h.diaSemana \= 'jueves' ∨
         h.diaSemana \= 'viernes' ∨ h.diaSemana \= 'sábado' ∨ h.diaSemana \= 'domingo') ∧
        h.horaCierre \> h.horaApertura)

**RR-77.** Dos horarios del mismo hito y el mismo día no se cruzan.

    (∀a1, a2 \| a1 ∈ ABRE ∧ a2 ∈ ABRE ∧ a1 ≠ a2 ∧
               a1.nombreEstado \= a2.nombreEstado ∧ a1.nombreMunicipio \= a2.nombreMunicipio ∧
               a1.nombreParroquia \= a2.nombreParroquia ∧ a1.nombreHito \= a2.nombreHito ∧
               a1.diaSemana \= a2.diaSemana :
        a1.horaCierre ≤ a2.horaApertura ∨ a2.horaCierre ≤ a1.horaApertura)

**RR-78.** Toda latitud está entre −90 y 90 y toda longitud entre −180 y 180\.

    (∀u \| u ∈ UBICACION\_GEOGRAFICA :
        u.latitud ≥ −90 ∧ u.latitud ≤ 90 ∧ u.longitud ≥ −180 ∧ u.longitud ≤ 180\)
    ∧
    (∀p \| p ∈ PUNTO\_GEOESPACIAL :
        p.latitud ≥ −90 ∧ p.latitud ≤ 90 ∧ p.longitud ≥ −180 ∧ p.longitud ≤ 180\)

**RR-79.** El tramo sobre el que está un hito es de su mismo municipio.

    (∀s \| s ∈ SE\_UBICA\_EN : s.estadoTramo \= s.estadoHito ∧ s.municipioTramo \= s.municipioHito)

**RR-80.** El radio de activación y la escala son positivos, la altitud respecto al suelo no es negativa, el azimut y la rotación están en \[0, 360\) y la inclinación en \[−90, 90\].

    (∀p \| p ∈ PUNTO\_GEOESPACIAL :
        p.radioActivacion \> 0 ∧ p.escalaVisualizacion \> 0 ∧ p.altitudRespectoSuelo ≥ 0 ∧
        p.azimut ≥ 0 ∧ p.azimut \< 360 ∧ p.rotacion ≥ 0 ∧ p.rotacion \< 360 ∧
        p.inclinacion ≥ −90 ∧ p.inclinacion ≤ 90\)

**RR-81.** Todo recurso 3D tiene un tamaño positivo.

    (∀r \| r ∈ RECURSO\_3D : r.tamanoMB \> 0\)

**RR-82.** El nivel territorial es nacional, estadal o municipal. Un ente municipal tiene exactamente una fila en COMPETENCIA. Todas las filas de COMPETENCIA de un ente estadal tienen el mismo estado.

    (∀e \| e ∈ ENTE\_PUBLICO :
        (e.nivelTerritorial \= 'nacional' ∨ e.nivelTerritorial \= 'estadal' ∨ e.nivelTerritorial \= 'municipal') ∧
        (e.nivelTerritorial \= 'municipal' →
            (∃\!₁k \| k ∈ COMPETENCIA : k.rifInstitucional \= e.rifInstitucional)) ∧
        (e.nivelTerritorial \= 'estadal' →
            (∀k1, k2 \| k1 ∈ COMPETENCIA ∧ k2 ∈ COMPETENCIA ∧
                       k1.rifInstitucional \= e.rifInstitucional ∧ k2.rifInstitucional \= e.rifInstitucional :
                k1.nombreEstado \= k2.nombreEstado)))

**RR-83.** El estado es preliminar, activa, descartada, vencida o resuelta, y la severidad es bajo, medio o crítico.

    (∀i \| i ∈ INCIDENCIA :
        (i.estadoOperativo \= 'preliminar' ∨ i.estadoOperativo \= 'activa' ∨ i.estadoOperativo \= 'descartada' ∨
         i.estadoOperativo \= 'vencida' ∨ i.estadoOperativo \= 'resuelta') ∧
        (i.nivelSeveridad \= 'bajo' ∨ i.nivelSeveridad \= 'medio' ∨ i.nivelSeveridad \= 'crítico'))

**RR-84.** Toda incidencia tiene fila en AFECTA\_HITO o en AFECTA\_TRAMO, pero no en las dos.

    (∀i \| i ∈ INCIDENCIA :
        (∃a \| a ∈ AFECTA\_HITO : a.numeroReporte \= i.numeroReporte) ⊕
        (∃t \| t ∈ AFECTA\_TRAMO : t.numeroReporte \= i.numeroReporte))

**RR-85.** Si una incidencia afecta dos o más tramos, cada tramo afectado tiene una fila en CONECTA con otro tramo afectado por la misma incidencia.

    (∀t1 \| t1 ∈ AFECTA\_TRAMO ∧ (∃t2 \| t2 ∈ AFECTA\_TRAMO : t2 ≠ t1 ∧ t2.numeroReporte \= t1.numeroReporte) :
        (∃t3, c \| t3 ∈ AFECTA\_TRAMO ∧ c ∈ CONECTA ∧ t3 ≠ t1 ∧ t3.numeroReporte \= t1.numeroReporte ∧
            ((c.estadoOrigen \= t1.nombreEstado ∧ c.municipioOrigen \= t1.nombreMunicipio ∧
              c.viaOrigen \= t1.nombreVia ∧ c.tramoOrigen \= t1.numeroTramo ∧
              c.estadoDestino \= t3.nombreEstado ∧ c.municipioDestino \= t3.nombreMunicipio ∧
              c.viaDestino \= t3.nombreVia ∧ c.tramoDestino \= t3.numeroTramo)
             ∨
             (c.estadoOrigen \= t3.nombreEstado ∧ c.municipioOrigen \= t3.nombreMunicipio ∧
              c.viaOrigen \= t3.nombreVia ∧ c.tramoOrigen \= t3.numeroTramo ∧
              c.estadoDestino \= t1.nombreEstado ∧ c.municipioDestino \= t1.nombreMunicipio ∧
              c.viaDestino \= t1.nombreVia ∧ c.tramoDestino \= t1.numeroTramo))))

**RR-86.** La cuenta que genera una incidencia está en CUENTA\_VISITANTE, CUENTA\_GUIA o CUENTA\_FUNCIONARIO.

    (∀g \| g ∈ GENERA :
        (∃v \| v ∈ CUENTA\_VISITANTE : v.idCuenta \= g.idCuenta) ∨
        (∃u \| u ∈ CUENTA\_GUIA : u.idCuenta \= g.idCuenta) ∨
        (∃f \| f ∈ CUENTA\_FUNCIONARIO : f.idCuenta \= g.idCuenta))

**RR-87.** Una incidencia preliminar la generó la cuenta de un visitante o de un guía, y no tiene fila en VERIFICA ni en CIERRA.

    (∀i \| i ∈ INCIDENCIA ∧ i.estadoOperativo \= 'preliminar' :
        (∃g \| g ∈ GENERA : g.numeroReporte \= i.numeroReporte ∧
            ((∃v \| v ∈ CUENTA\_VISITANTE : v.idCuenta \= g.idCuenta) ∨
             (∃u \| u ∈ CUENTA\_GUIA : u.idCuenta \= g.idCuenta))) ∧
        ¬(∃w \| w ∈ VERIFICA : w.numeroReporte \= i.numeroReporte) ∧
        ¬(∃c \| c ∈ CIERRA : c.numeroReporte \= i.numeroReporte))

**RR-88.** Si la generó un visitante o un guía y ya no está preliminar, tiene fila en VERIFICA. Si la generó un funcionario, no la tiene. Toda incidencia descartada tiene fila en VERIFICA.

    (∀g, i \| g ∈ GENERA ∧ i ∈ INCIDENCIA ∧ i.numeroReporte \= g.numeroReporte :
        (((∃v \| v ∈ CUENTA\_VISITANTE : v.idCuenta \= g.idCuenta) ∨ (∃u \| u ∈ CUENTA\_GUIA : u.idCuenta \= g.idCuenta)) ∧
         i.estadoOperativo ≠ 'preliminar'
            → (∃w \| w ∈ VERIFICA : w.numeroReporte \= i.numeroReporte)) ∧
        ((∃f \| f ∈ CUENTA\_FUNCIONARIO : f.idCuenta \= g.idCuenta)
            → ¬(∃w \| w ∈ VERIFICA : w.numeroReporte \= i.numeroReporte)))
    ∧
    (∀i \| i ∈ INCIDENCIA ∧ i.estadoOperativo \= 'descartada' :
        (∃w \| w ∈ VERIFICA : w.numeroReporte \= i.numeroReporte))

**RR-89.** Una incidencia está resuelta si y solo si tiene fila en CIERRA. Tiene fecha de cierre si y solo si está resuelta.

    (∀i \| i ∈ INCIDENCIA :
        (i.estadoOperativo \= 'resuelta' → (∃c \| c ∈ CIERRA : c.numeroReporte \= i.numeroReporte)) ∧
        ((∃c \| c ∈ CIERRA : c.numeroReporte \= i.numeroReporte) → i.estadoOperativo \= 'resuelta') ∧
        (i.fechaCierre ≠ null → i.estadoOperativo \= 'resuelta') ∧
        (i.estadoOperativo \= 'resuelta' → i.fechaCierre ≠ null))

**RR-90.** El funcionario que cierra pertenece a un ente con competencia sobre el municipio del hito afectado o de alguno de los tramos afectados.

    (∀c \| c ∈ CIERRA :
        (∃p, k \| p ∈ PERTENECE\_A ∧ k ∈ COMPETENCIA :
            p.cedulaFuncionario \= c.cedulaFuncionario ∧ k.rifInstitucional \= p.rifInstitucional ∧
            ((∃a \| a ∈ AFECTA\_HITO : a.numeroReporte \= c.numeroReporte ∧
                    a.nombreEstado \= k.nombreEstado ∧ a.nombreMunicipio \= k.nombreMunicipio) ∨
             (∃t \| t ∈ AFECTA\_TRAMO : t.numeroReporte \= c.numeroReporte ∧
                    t.nombreEstado \= k.nombreEstado ∧ t.nombreMunicipio \= k.nombreMunicipio))))

**RR-91.** Una incidencia activa o vencida está activa si y solo si su fechaEstimadaResolucion, o la nuevaFecha de alguna fila de PRORROGA con su mismo numeroReporte, todavía no pasó. Si ya pasaron todas, está vencida. (Solo en lenguaje natural: necesita la fecha de hoy, que el lenguaje de restricciones del curso no define.)

**RR-92.** La nuevaFecha de toda prórroga es posterior a la fecha estimada de resolución de su incidencia, y esa incidencia no está preliminar ni descartada.

    (∀p, i \| p ∈ PRORROGA ∧ i ∈ INCIDENCIA ∧ p.numeroReporte \= i.numeroReporte :
        p.nuevaFecha \> i.fechaEstimadaResolucion ∧
        i.estadoOperativo ≠ 'preliminar' ∧ i.estadoOperativo ≠ 'descartada')

**RR-93.** La fecha estimada de resolución y la fecha de cierre no son anteriores a la fecha de detección.

    (∀i \| i ∈ INCIDENCIA :
        i.fechaEstimadaResolucion ≥ i.fechaHoraDeteccion ∧
        (i.fechaCierre \= null ∨ i.fechaCierre ≥ i.fechaHoraDeteccion))

**RR-94.** La calificación y el índice de seguridad son enteros de 1 a 5\.

    (∀e \| e ∈ EVALUACION\_EXPERIENCIA :
        (e.calificacion \= 1 ∨ e.calificacion \= 2 ∨ e.calificacion \= 3 ∨ e.calificacion \= 4 ∨ e.calificacion \= 5\) ∧
        (e.indiceSeguridad \= 1 ∨ e.indiceSeguridad \= 2 ∨ e.indiceSeguridad \= 3 ∨ e.indiceSeguridad \= 4 ∨ e.indiceSeguridad \= 5))

**RR-95.** Toda evaluación tiene fila en EVALUA\_HITO o en EVALUA\_RUTA, exactamente en una.

    (∀e \| e ∈ EVALUACION\_EXPERIENCIA :
        (∃h \| h ∈ EVALUA\_HITO : h.codigoResena \= e.codigoResena) ⊕
        (∃r \| r ∈ EVALUA\_RUTA : r.codigoResena \= e.codigoResena))

**RR-96.** Si una evaluación es de una ruta, el recorrido que la respalda está completado y es sobre esa misma ruta.

    (∀r, b \| r ∈ EVALUA\_RUTA ∧ b ∈ RESPALDADA\_POR ∧ b.codigoResena \= r.codigoResena :
        (∃x \| x ∈ RECORRIDO : x.idRecorrido \= b.idRecorrido ∧ x.estadoRecorrido \= 'completado') ∧
        (∃s \| s ∈ SOBRE : s.idRecorrido \= b.idRecorrido ∧
            s.nombreEstado \= r.nombreEstado ∧ s.nombreMunicipio \= r.nombreMunicipio ∧ s.nombreRuta \= r.nombreRuta))

**RR-97.** Si una evaluación es de un hito, el recorrido que la respalda ya terminó y tiene fila en TRANSITA con ese hito.

    (∀h, b \| h ∈ EVALUA\_HITO ∧ b ∈ RESPALDADA\_POR ∧ b.codigoResena \= h.codigoResena :
        (∃x \| x ∈ RECORRIDO : x.idRecorrido \= b.idRecorrido ∧ x.estadoRecorrido ≠ null) ∧
        (∃t \| t ∈ TRANSITA : t.idRecorrido \= b.idRecorrido ∧
            t.nombreEstado \= h.nombreEstado ∧ t.nombreMunicipio \= h.nombreMunicipio ∧
            t.nombreParroquia \= h.nombreParroquia ∧ t.nombreHito \= h.nombreHito))

**RR-98.** La fecha de emisión de una evaluación no es anterior al fin del recorrido que la respalda.

    (∀b, e, x \| b ∈ RESPALDADA\_POR ∧ e ∈ EVALUACION\_EXPERIENCIA ∧ x ∈ RECORRIDO ∧
                e.codigoResena \= b.codigoResena ∧ x.idRecorrido \= b.idRecorrido :
        e.fechaEmision ≥ x.fechaHoraFin)

**RR-99.** La marca recorridoVerificado es verdadera si y solo si el recorrido que respalda la evaluación está completado.

    (∀b, e, x \| b ∈ RESPALDADA\_POR ∧ e ∈ EVALUACION\_EXPERIENCIA ∧ x ∈ RECORRIDO ∧
                e.codigoResena \= b.codigoResena ∧ x.idRecorrido \= b.idRecorrido :
        (e.recorridoVerificado \= verdadero → x.estadoRecorrido \= 'completado') ∧
        (x.estadoRecorrido \= 'completado' → e.recorridoVerificado \= verdadero))

**RR-100.** Dos evaluaciones distintas de ruta no las respalda el mismo recorrido. Tampoco dos evaluaciones distintas del mismo hito.

    (∀r1, r2, b1, b2 \| r1 ∈ EVALUA\_RUTA ∧ r2 ∈ EVALUA\_RUTA ∧ r1 ≠ r2 ∧
                       b1 ∈ RESPALDADA\_POR ∧ b2 ∈ RESPALDADA\_POR ∧
                       b1.codigoResena \= r1.codigoResena ∧ b2.codigoResena \= r2.codigoResena :
        b1.idRecorrido ≠ b2.idRecorrido)
    ∧
    (∀e1, e2, b1, b2 \| e1 ∈ EVALUA\_HITO ∧ e2 ∈ EVALUA\_HITO ∧ e1 ≠ e2 ∧
                       e1.nombreEstado \= e2.nombreEstado ∧ e1.nombreMunicipio \= e2.nombreMunicipio ∧
                       e1.nombreParroquia \= e2.nombreParroquia ∧ e1.nombreHito \= e2.nombreHito ∧
                       b1 ∈ RESPALDADA\_POR ∧ b2 ∈ RESPALDADA\_POR ∧
                       b1.codigoResena \= e1.codigoResena ∧ b2.codigoResena \= e2.codigoResena :
        b1.idRecorrido ≠ b2.idRecorrido)

## **7.2 Sebastián Armas** {#7.2-sebastián-armas}

**RR-20.** La ubicación de cada parada es distinta de null.

    (∀t \| t ∈ SE\_LOCALIZA : t.latitud ≠ null ∧ t.longitud ≠ null ∧ t.elevacion ≠ null)

**RR-21.** El tramo donde está cada parada es distinto de null.

    (∀t \| t ∈ ESTA\_EN : t.nombreEstado ≠ null ∧ t.nombreMunicipio ≠ null ∧ t.nombreVia ≠ null ∧ t.numeroTramo ≠ null)

**RR-22.** El visitante que crea cada ruta dinámica es distinto de null.

    (∀t \| t ∈ CREA : t.cedulaPasaporte ≠ null)

**RR-23.** La cuenta de cada guía es distinta de null y es clave alterna: una cuenta es de un solo guía.

    (∀t \| t ∈ CUENTA\_GUIA : t.idCuenta ≠ null)
    ∧
    (∀t1, t2 \| t1 ∈ CUENTA\_GUIA ∧ t2 ∈ CUENTA\_GUIA ∧ t1 ≠ t2 : t1.idCuenta ≠ t2.idCuenta)

**RR-24.** El visitante de cada contratación es distinto de null.

    (∀t \| t ∈ CONTRATA\_VISITANTE : t.cedulaPasaporte ≠ null)

**RR-25.** El guía de cada contratación es distinto de null.

    (∀t \| t ∈ CONTRATA\_GUIA : t.rtn ≠ null ∧ t.codigoLicencia ≠ null)

**RR-26.** La ruta de cada contratación es distinta de null.

    (∀t \| t ∈ CONTRATA\_RUTA : t.nombreEstado ≠ null ∧ t.nombreMunicipio ≠ null ∧ t.nombreRuta ≠ null)

**RR-27.** El visitante de cada recorrido es distinto de null.

    (∀t \| t ∈ REALIZA : t.cedulaPasaporte ≠ null)

**RR-28.** La ruta de cada recorrido es distinta de null.

    (∀t \| t ∈ SOBRE : t.nombreEstado ≠ null ∧ t.nombreMunicipio ≠ null ∧ t.nombreRuta ≠ null)

**RR-29.** Toda vía tiene al menos un tramo.

    (∀v \| v ∈ VIA :
        (∃t \| t ∈ TRAMO : t.nombreEstado \= v.nombreEstado ∧ t.nombreMunicipio \= v.nombreMunicipio ∧ t.nombreVia \= v.nombreVia))

**RR-30.** Toda vía tiene al menos un modo permitido.

    (∀v \| v ∈ VIA :
        (∃m \| m ∈ VIA\_MODO : m.nombreEstado \= v.nombreEstado ∧ m.nombreMunicipio \= v.nombreMunicipio ∧ m.nombreVia \= v.nombreVia))

**RR-31.** Toda parada tiene su ubicación.

    (∀p \| p ∈ PARADA\_TRANSPORTE : (∃s \| s ∈ SE\_LOCALIZA : s.codigoTerminal \= p.codigoTerminal))

**RR-32.** Toda parada está en un tramo.

    (∀p \| p ∈ PARADA\_TRANSPORTE : (∃e \| e ∈ ESTA\_EN : e.codigoTerminal \= p.codigoTerminal))

**RR-33.** Toda parada tiene al menos un horario.

    (∀p \| p ∈ PARADA\_TRANSPORTE : (∃f \| f ∈ FUNCIONA : f.codigoTerminal \= p.codigoTerminal))

**RR-34.** Toda ruta tiene al menos dos hitos: el de origen y el de destino.

    (∀r \| r ∈ RUTA\_TURISTICA :
        (∃₂c \| c ∈ CONFORMA :
            c.estadoRuta \= r.nombreEstado ∧ c.municipioRuta \= r.nombreMunicipio ∧ c.nombreRuta \= r.nombreRuta))

**RR-35.** Toda ruta es fija o dinámica, exactamente una de las dos.

    (∀r \| r ∈ RUTA\_TURISTICA :
        (∃f \| f ∈ RUTA\_FIJA : f.nombreEstado \= r.nombreEstado ∧ f.nombreMunicipio \= r.nombreMunicipio ∧ f.nombreRuta \= r.nombreRuta)
        ⊕
        (∃d \| d ∈ RUTA\_DINAMICA : d.nombreEstado \= r.nombreEstado ∧ d.nombreMunicipio \= r.nombreMunicipio ∧ d.nombreRuta \= r.nombreRuta))

**RR-36.** Toda ruta dinámica la creó un visitante.

    (∀d \| d ∈ RUTA\_DINAMICA :
        (∃c \| c ∈ CREA : c.nombreEstado \= d.nombreEstado ∧ c.nombreMunicipio \= d.nombreMunicipio ∧ c.nombreRuta \= d.nombreRuta))

**RR-37.** Todo guía tiene su cuenta.

    (∀g \| g ∈ GUIA : (∃t \| t ∈ CUENTA\_GUIA : t.rtn \= g.rtn ∧ t.codigoLicencia \= g.codigoLicencia))

**RR-38.** Todo guía habla al menos un idioma.

    (∀g \| g ∈ GUIA : (∃i \| i ∈ GUIA\_IDIOMA : i.rtn \= g.rtn ∧ i.codigoLicencia \= g.codigoLicencia))

**RR-39.** Todo guía tiene al menos una especialidad.

    (∀g \| g ∈ GUIA : (∃e \| e ∈ GUIA\_ESPECIALIDAD : e.rtn \= g.rtn ∧ e.codigoLicencia \= g.codigoLicencia))

**RR-40.** Todo guía tiene al menos una zona asignada.

    (∀g \| g ∈ GUIA : (∃w \| w ∈ TRABAJA : w.rtn \= g.rtn ∧ w.codigoLicencia \= g.codigoLicencia))

**RR-41.** Toda contratación la hace un visitante.

    (∀c \| c ∈ CONTRATACION : (∃v \| v ∈ CONTRATA\_VISITANTE : v.nroContratacion \= c.nroContratacion))

**RR-42.** Toda contratación es de un guía.

    (∀c \| c ∈ CONTRATACION : (∃g \| g ∈ CONTRATA\_GUIA : g.nroContratacion \= c.nroContratacion))

**RR-43.** Toda contratación es para una ruta fija.

    (∀c \| c ∈ CONTRATACION : (∃r \| r ∈ CONTRATA\_RUTA : r.nroContratacion \= c.nroContratacion))

**RR-44.** Todo recorrido lo hace un visitante.

    (∀x \| x ∈ RECORRIDO : (∃r \| r ∈ REALIZA : r.idRecorrido \= x.idRecorrido))

**RR-45.** Todo recorrido es sobre una ruta.

    (∀x \| x ∈ RECORRIDO : (∃s \| s ∈ SOBRE : s.idRecorrido \= x.idRecorrido))

**RR-101.** Dos horarios de la misma parada y el mismo día no se cruzan.

    (∀f1, f2 \| f1 ∈ FUNCIONA ∧ f2 ∈ FUNCIONA ∧ f1 ≠ f2 ∧
               f1.codigoTerminal \= f2.codigoTerminal ∧ f1.diaSemana \= f2.diaSemana :
        f1.horaCierre ≤ f2.horaApertura ∨ f2.horaCierre ≤ f1.horaApertura)

**RR-102.** El tipo de vía es calle, avenida, bulevar, caminería, sendero, puente u otro, y su estado es habilitada o cierre total por mantenimiento. Cada modo permitido es a pie, bicicleta, transporte público o vehículo adaptado.

    (∀v \| v ∈ VIA :
        (v.tipoVia \= 'calle' ∨ v.tipoVia \= 'avenida' ∨ v.tipoVia \= 'bulevar' ∨ v.tipoVia \= 'caminería' ∨
         v.tipoVia \= 'sendero' ∨ v.tipoVia \= 'puente' ∨ v.tipoVia \= 'otro') ∧
        (v.estadoVia \= 'habilitada' ∨ v.estadoVia \= 'cierre total por mantenimiento'))
    ∧
    (∀m \| m ∈ VIA\_MODO :
        m.modo \= 'a pie' ∨ m.modo \= 'bicicleta' ∨ m.modo \= 'transporte público' ∨ m.modo \= 'vehículo adaptado')

**RR-103.** Un tramo no se conecta consigo mismo.

    (∀c \| c ∈ CONECTA :
        c.estadoOrigen ≠ c.estadoDestino ∨ c.municipioOrigen ≠ c.municipioDestino ∨
        c.viaOrigen ≠ c.viaDestino ∨ c.tramoOrigen ≠ c.tramoDestino)

**RR-104.** El estado es activa, en mantenimiento o fuera de servicio; la modalidad es metro, autobús, embarcadero o transporte por cable; la tarifa no es negativa; la frecuencia y el aforo son positivos.

    (∀p \| p ∈ PARADA\_TRANSPORTE :
        (p.estadoParada \= 'activa' ∨ p.estadoParada \= 'en mantenimiento' ∨ p.estadoParada \= 'fuera de servicio') ∧
        (p.modalidad \= 'metro' ∨ p.modalidad \= 'autobús' ∨ p.modalidad \= 'embarcadero' ∨ p.modalidad \= 'transporte por cable') ∧
        p.tarifaBasica ≥ 0 ∧ p.frecuenciaPaso \> 0 ∧ p.aforoMaximo \> 0\)

**RR-105.** El equipamiento es techo o marquesina, iluminación nocturna, taquilla, vigilancia, estacionamiento de transferencia o resguardo de bicicletas.

    (∀q \| q ∈ EQUIPAMIENTO\_URBANO :
        q.tipoEquipamiento \= 'techo o marquesina' ∨ q.tipoEquipamiento \= 'iluminación nocturna' ∨
        q.tipoEquipamiento \= 'taquilla' ∨ q.tipoEquipamiento \= 'vigilancia' ∨
        q.tipoEquipamiento \= 'estacionamiento de transferencia' ∨ q.tipoEquipamiento \= 'resguardo de bicicletas')

**RR-106.** La duración estimada, si la hay, es positiva. La visibilidad de una ruta dinámica es privada o pública, y su preferencia de transporte es a pie, bicicleta, transporte público o vehículo adaptado.

    (∀r \| r ∈ RUTA\_TURISTICA : r.duracionEstimada \= null ∨ r.duracionEstimada \> 0\)
    ∧
    (∀d \| d ∈ RUTA\_DINAMICA :
        (d.visibilidad \= 'privada' ∨ d.visibilidad \= 'pública') ∧
        (d.preferenciaTransporte \= 'a pie' ∨ d.preferenciaTransporte \= 'bicicleta' ∨
         d.preferenciaTransporte \= 'transporte público' ∨ d.preferenciaTransporte \= 'vehículo adaptado'))

**RR-107.** Toda ruta fija tiene en RUTA\_TURISTICA su duración estimada, su mejor horario de inicio y su nivel de dificultad.

    (∀f, r \| f ∈ RUTA\_FIJA ∧ r ∈ RUTA\_TURISTICA ∧
             r.nombreEstado \= f.nombreEstado ∧ r.nombreMunicipio \= f.nombreMunicipio ∧ r.nombreRuta \= f.nombreRuta :
        r.duracionEstimada ≠ null ∧ r.mejorHorarioInicio ≠ null ∧ r.nivelDificultad ≠ null)

**RR-108.** Dentro de una ruta, dos filas de CONFORMA o de USA nunca comparten número de orden, y todo orden es positivo.

    (∀c1, c2 \| c1 ∈ CONFORMA ∧ c2 ∈ CONFORMA ∧ c1 ≠ c2 ∧
               c1.estadoRuta \= c2.estadoRuta ∧ c1.municipioRuta \= c2.municipioRuta ∧ c1.nombreRuta \= c2.nombreRuta :
        c1.orden ≠ c2.orden)
    ∧
    (∀u1, u2 \| u1 ∈ USA ∧ u2 ∈ USA ∧ u1 ≠ u2 ∧
               u1.nombreEstado \= u2.nombreEstado ∧ u1.nombreMunicipio \= u2.nombreMunicipio ∧ u1.nombreRuta \= u2.nombreRuta :
        u1.orden ≠ u2.orden)
    ∧
    (∀c, u \| c ∈ CONFORMA ∧ u ∈ USA ∧
             c.estadoRuta \= u.nombreEstado ∧ c.municipioRuta \= u.nombreMunicipio ∧ c.nombreRuta \= u.nombreRuta :
        c.orden ≠ u.orden)
    ∧
    (∀c \| c ∈ CONFORMA : c.orden ≥ 1\) ∧ (∀u \| u ∈ USA : u.orden ≥ 1\)

**RR-109.** La secuencia de una ruta empieza en 1 con un hito y no deja huecos: toda fila con orden mayor que 1 tiene otra de la misma ruta con el orden anterior.

    (∀r \| r ∈ RUTA\_TURISTICA :
        (∃c \| c ∈ CONFORMA : c.estadoRuta \= r.nombreEstado ∧ c.municipioRuta \= r.nombreMunicipio ∧
                             c.nombreRuta \= r.nombreRuta ∧ c.orden \= 1))
    ∧
    (∀c \| c ∈ CONFORMA ∧ c.orden \> 1 :
        (∃e \| e ∈ CONFORMA : e.estadoRuta \= c.estadoRuta ∧ e.municipioRuta \= c.municipioRuta ∧
                             e.nombreRuta \= c.nombreRuta ∧ e.orden \= c.orden − 1\) ∨
        (∃u \| u ∈ USA : u.nombreEstado \= c.estadoRuta ∧ u.nombreMunicipio \= c.municipioRuta ∧
                        u.nombreRuta \= c.nombreRuta ∧ u.orden \= c.orden − 1))
    ∧
    (∀u \| u ∈ USA ∧ u.orden \> 1 :
        (∃e \| e ∈ CONFORMA : e.estadoRuta \= u.nombreEstado ∧ e.municipioRuta \= u.nombreMunicipio ∧
                             e.nombreRuta \= u.nombreRuta ∧ e.orden \= u.orden − 1\) ∨
        (∃v \| v ∈ USA : v.nombreEstado \= u.nombreEstado ∧ v.nombreMunicipio \= u.nombreMunicipio ∧
                        v.nombreRuta \= u.nombreRuta ∧ v.orden \= u.orden − 1))

**RR-110.** Toda parada de una ruta tiene un hito de la misma ruta antes y otro después.

    (∀u \| u ∈ USA :
        (∃c1, c2 \| c1 ∈ CONFORMA ∧ c2 ∈ CONFORMA ∧
                   c1.estadoRuta \= u.nombreEstado ∧ c1.municipioRuta \= u.nombreMunicipio ∧ c1.nombreRuta \= u.nombreRuta ∧
                   c2.estadoRuta \= u.nombreEstado ∧ c2.municipioRuta \= u.nombreMunicipio ∧ c2.nombreRuta \= u.nombreRuta :
            c1.orden \< u.orden ∧ u.orden \< c2.orden))

**RR-111.** El hito de orden 1 de una ruta, que es su origen, está en el municipio de la ruta.

    (∀c \| c ∈ CONFORMA ∧ c.orden \= 1 : c.estadoHito \= c.estadoRuta ∧ c.municipioHito \= c.municipioRuta)

**RR-112.** Un recorrido es sobre una ruta fija, una ruta dinámica pública o una ruta dinámica que creó el mismo visitante que hace el recorrido.

    (∀s \| s ∈ SOBRE :
        (∃f \| f ∈ RUTA\_FIJA : f.nombreEstado \= s.nombreEstado ∧ f.nombreMunicipio \= s.nombreMunicipio ∧
                              f.nombreRuta \= s.nombreRuta) ∨
        (∃d \| d ∈ RUTA\_DINAMICA :
            d.nombreEstado \= s.nombreEstado ∧ d.nombreMunicipio \= s.nombreMunicipio ∧ d.nombreRuta \= s.nombreRuta ∧
            (d.visibilidad \= 'pública' ∨
             (∃c, z \| c ∈ CREA ∧ z ∈ REALIZA :
                 c.nombreEstado \= d.nombreEstado ∧ c.nombreMunicipio \= d.nombreMunicipio ∧ c.nombreRuta \= d.nombreRuta ∧
                 z.idRecorrido \= s.idRecorrido ∧ c.cedulaPasaporte \= z.cedulaPasaporte))))

**RR-113.** Un recorrido en curso no tiene ni fin ni estado; uno terminado tiene los dos. El estado es completado o abandonado, y el fin es posterior al inicio.

    (∀x \| x ∈ RECORRIDO :
        (x.fechaHoraFin \= null → x.estadoRecorrido \= null) ∧
        (x.estadoRecorrido \= null → x.fechaHoraFin \= null) ∧
        (x.estadoRecorrido \= null ∨ x.estadoRecorrido \= 'completado' ∨ x.estadoRecorrido \= 'abandonado') ∧
        (x.fechaHoraFin \= null ∨ x.fechaHoraFin \> x.fechaHoraInicio))

**RR-114.** Los hitos que transita un recorrido están en CONFORMA para la ruta de su fila en SOBRE, y cada paso ocurre entre el inicio y el fin del recorrido.

    (∀t, x \| t ∈ TRANSITA ∧ x ∈ RECORRIDO ∧ x.idRecorrido \= t.idRecorrido :
        (∃s, c \| s ∈ SOBRE ∧ c ∈ CONFORMA :
            s.idRecorrido \= t.idRecorrido ∧
            c.estadoRuta \= s.nombreEstado ∧ c.municipioRuta \= s.nombreMunicipio ∧ c.nombreRuta \= s.nombreRuta ∧
            c.estadoHito \= t.nombreEstado ∧ c.municipioHito \= t.nombreMunicipio ∧
            c.parroquiaHito \= t.nombreParroquia ∧ c.nombreHito \= t.nombreHito) ∧
        t.fechaHoraPaso ≥ x.fechaHoraInicio ∧
        (x.fechaHoraFin \= null ∨ t.fechaHoraPaso ≤ x.fechaHoraFin))

**RR-115.** Si un recorrido está completado, tiene fila en TRANSITA con cada hito de su ruta.

    (∀s, x \| s ∈ SOBRE ∧ x ∈ RECORRIDO ∧ x.idRecorrido \= s.idRecorrido ∧ x.estadoRecorrido \= 'completado' :
        (∀c \| c ∈ CONFORMA ∧ c.estadoRuta \= s.nombreEstado ∧ c.municipioRuta \= s.nombreMunicipio ∧
                             c.nombreRuta \= s.nombreRuta :
            (∃t \| t ∈ TRANSITA : t.idRecorrido \= s.idRecorrido ∧
                t.nombreEstado \= c.estadoHito ∧ t.nombreMunicipio \= c.municipioHito ∧
                t.nombreParroquia \= c.parroquiaHito ∧ t.nombreHito \= c.nombreHito)))

**RR-116.** Los años de trayectoria no son negativos y la tarifa horaria es positiva.

    (∀g \| g ∈ GUIA : g.aniosTrayectoria ≥ 0 ∧ g.tarifaHoraria \> 0\)

**RR-117.** Un guía adscrito a una ruta fija tiene fila en TRABAJA con el municipio de esa ruta.

    (∀s \| s ∈ SIRVE :
        (∃w \| w ∈ TRABAJA : w.rtn \= s.rtn ∧ w.codigoLicencia \= s.codigoLicencia ∧
                            w.nombreEstado \= s.nombreEstado ∧ w.nombreMunicipio \= s.nombreMunicipio))

**RR-118.** El guía de una contratación tiene fila en SIRVE con la ruta de esa contratación.

    (∀c \| c ∈ CONTRATACION :
        (∃g, r, s \| g ∈ CONTRATA\_GUIA ∧ r ∈ CONTRATA\_RUTA ∧ s ∈ SIRVE :
            g.nroContratacion \= c.nroContratacion ∧ r.nroContratacion \= c.nroContratacion ∧
            s.rtn \= g.rtn ∧ s.codigoLicencia \= g.codigoLicencia ∧
            s.nombreEstado \= r.nombreEstado ∧ s.nombreMunicipio \= r.nombreMunicipio ∧ s.nombreRuta \= r.nombreRuta))

## **7.3 Valeria Loreto** {#7.3-valeria-loreto}

**RR-46.** La cuenta de cada visitante es distinta de null y es clave alterna: una cuenta es de un solo visitante.

    (∀t \| t ∈ CUENTA\_VISITANTE : t.idCuenta ≠ null)
    ∧
    (∀t1, t2 \| t1 ∈ CUENTA\_VISITANTE ∧ t2 ∈ CUENTA\_VISITANTE ∧ t1 ≠ t2 : t1.idCuenta ≠ t2.idCuenta)

**RR-47.** La cuenta de cada comercio es distinta de null y es clave alterna: una cuenta es de un solo comercio.

    (∀t \| t ∈ CUENTA\_COMERCIO : t.idCuenta ≠ null)
    ∧
    (∀t1, t2 \| t1 ∈ CUENTA\_COMERCIO ∧ t2 ∈ CUENTA\_COMERCIO ∧ t1 ≠ t2 : t1.idCuenta ≠ t2.idCuenta)

**RR-48.** La ubicación de cada comercio es distinta de null.

    (∀t \| t ∈ UBICADO : t.latitud ≠ null ∧ t.longitud ≠ null ∧ t.elevacion ≠ null)

**RR-49.** La cuenta de cada funcionario es distinta de null y es clave alterna: una cuenta es de un solo funcionario.

    (∀t \| t ∈ CUENTA\_FUNCIONARIO : t.idCuenta ≠ null)
    ∧
    (∀t1, t2 \| t1 ∈ CUENTA\_FUNCIONARIO ∧ t2 ∈ CUENTA\_FUNCIONARIO ∧ t1 ≠ t2 : t1.idCuenta ≠ t2.idCuenta)

**RR-50.** El ente al que pertenece cada funcionario es distinto de null.

    (∀t \| t ∈ PERTENECE\_A : t.rifInstitucional ≠ null)

**RR-51.** La cuenta de cada administrador es distinta de null y es clave alterna: una cuenta es de un solo administrador.

    (∀t \| t ∈ CUENTA\_ADMINISTRADOR : t.idCuenta ≠ null)
    ∧
    (∀t1, t2 \| t1 ∈ CUENTA\_ADMINISTRADOR ∧ t2 ∈ CUENTA\_ADMINISTRADOR ∧ t1 ≠ t2 : t1.idCuenta ≠ t2.idCuenta)

**RR-52.** El comercio que promueve cada experiencia es distinto de null.

    (∀t \| t ∈ PROMUEVE : t.rifJuridico ≠ null)

**RR-53.** El guía que dirige cada experiencia es distinto de null.

    (∀t \| t ∈ DIRIGE : t.rtn ≠ null ∧ t.codigoLicencia ≠ null)

**RR-54.** La ruta de cada experiencia es distinta de null.

    (∀t \| t ∈ TRANSCURRE : t.nombreEstado ≠ null ∧ t.nombreMunicipio ≠ null ∧ t.nombreRuta ≠ null)

**RR-55.** El visitante que adquiere cada credencial es distinto de null.

    (∀t \| t ∈ ADQUIERE : t.cedulaPasaporte ≠ null)

**RR-56.** La experiencia que ampara cada credencial es distinta de null.

    (∀t \| t ∈ AMPARA : t.titulo ≠ null ∧ t.fechaActivacion ≠ null)

**RR-57.** El hito reservado es distinto de null.

    (∀t \| t ∈ RESERVA\_HITO : t.nombreEstado ≠ null ∧ t.nombreMunicipio ≠ null ∧ t.nombreParroquia ≠ null ∧ t.nombreHito ≠ null)

**RR-58.** El comercio reservado es distinto de null.

    (∀t \| t ∈ RESERVA\_COMERCIO : t.rifJuridico ≠ null)

**RR-59.** La cuenta que valida cada credencial es distinta de null.

    (∀t \| t ∈ VALIDA : t.idCuenta ≠ null)

**RR-60.** La razón social es clave alterna: es distinta de null y no se repite.

    (∀m \| m ∈ COMERCIO : m.razonSocial ≠ null)
    ∧
    (∀m1, m2 \| m1 ∈ COMERCIO ∧ m2 ∈ COMERCIO ∧ m1 ≠ m2 : m1.razonSocial ≠ m2.razonSocial)

**RR-61.** Cada cuenta es de exactamente un actor: está en al menos una de las seis relaciones CUENTA\_\<ACTOR\> y nunca en dos a la vez.

    (∀k \| k ∈ CUENTA :
        (∃v \| v ∈ CUENTA\_VISITANTE : v.idCuenta \= k.idCuenta) ∨
        (∃g \| g ∈ CUENTA\_GUIA : g.idCuenta \= k.idCuenta) ∨
        (∃m \| m ∈ CUENTA\_COMERCIO : m.idCuenta \= k.idCuenta) ∨
        (∃e \| e ∈ CUENTA\_ENTE\_PUBLICO : e.idCuenta \= k.idCuenta) ∨
        (∃f \| f ∈ CUENTA\_FUNCIONARIO : f.idCuenta \= k.idCuenta) ∨
        (∃a \| a ∈ CUENTA\_ADMINISTRADOR : a.idCuenta \= k.idCuenta)) ∧
    (∀v, g \| v ∈ CUENTA\_VISITANTE ∧ g ∈ CUENTA\_GUIA : v.idCuenta ≠ g.idCuenta) ∧
    (∀v, m \| v ∈ CUENTA\_VISITANTE ∧ m ∈ CUENTA\_COMERCIO : v.idCuenta ≠ m.idCuenta) ∧
    (∀v, e \| v ∈ CUENTA\_VISITANTE ∧ e ∈ CUENTA\_ENTE\_PUBLICO : v.idCuenta ≠ e.idCuenta) ∧
    (∀v, f \| v ∈ CUENTA\_VISITANTE ∧ f ∈ CUENTA\_FUNCIONARIO : v.idCuenta ≠ f.idCuenta) ∧
    (∀v, a \| v ∈ CUENTA\_VISITANTE ∧ a ∈ CUENTA\_ADMINISTRADOR : v.idCuenta ≠ a.idCuenta) ∧
    (∀g, m \| g ∈ CUENTA\_GUIA ∧ m ∈ CUENTA\_COMERCIO : g.idCuenta ≠ m.idCuenta) ∧
    (∀g, e \| g ∈ CUENTA\_GUIA ∧ e ∈ CUENTA\_ENTE\_PUBLICO : g.idCuenta ≠ e.idCuenta) ∧
    (∀g, f \| g ∈ CUENTA\_GUIA ∧ f ∈ CUENTA\_FUNCIONARIO : g.idCuenta ≠ f.idCuenta) ∧
    (∀g, a \| g ∈ CUENTA\_GUIA ∧ a ∈ CUENTA\_ADMINISTRADOR : g.idCuenta ≠ a.idCuenta) ∧
    (∀m, e \| m ∈ CUENTA\_COMERCIO ∧ e ∈ CUENTA\_ENTE\_PUBLICO : m.idCuenta ≠ e.idCuenta) ∧
    (∀m, f \| m ∈ CUENTA\_COMERCIO ∧ f ∈ CUENTA\_FUNCIONARIO : m.idCuenta ≠ f.idCuenta) ∧
    (∀m, a \| m ∈ CUENTA\_COMERCIO ∧ a ∈ CUENTA\_ADMINISTRADOR : m.idCuenta ≠ a.idCuenta) ∧
    (∀e, f \| e ∈ CUENTA\_ENTE\_PUBLICO ∧ f ∈ CUENTA\_FUNCIONARIO : e.idCuenta ≠ f.idCuenta) ∧
    (∀e, a \| e ∈ CUENTA\_ENTE\_PUBLICO ∧ a ∈ CUENTA\_ADMINISTRADOR : e.idCuenta ≠ a.idCuenta) ∧
    (∀f, a \| f ∈ CUENTA\_FUNCIONARIO ∧ a ∈ CUENTA\_ADMINISTRADOR : f.idCuenta ≠ a.idCuenta)

**RR-62.** Todo visitante tiene su cuenta.

    (∀v \| v ∈ VISITANTE : (∃t \| t ∈ CUENTA\_VISITANTE : t.cedulaPasaporte \= v.cedulaPasaporte))

**RR-63.** Todo comercio tiene su cuenta.

    (∀m \| m ∈ COMERCIO : (∃t \| t ∈ CUENTA\_COMERCIO : t.rifJuridico \= m.rifJuridico))

**RR-64.** Todo funcionario tiene su cuenta.

    (∀f \| f ∈ FUNCIONARIO : (∃t \| t ∈ CUENTA\_FUNCIONARIO : t.cedulaFuncionario \= f.cedulaFuncionario))

**RR-65.** Todo administrador tiene su cuenta.

    (∀a \| a ∈ ADMINISTRADOR : (∃t \| t ∈ CUENTA\_ADMINISTRADOR : t.cedulaAdmin \= a.cedulaAdmin))

**RR-66.** Todo comercio tiene su ubicación.

    (∀m \| m ∈ COMERCIO : (∃u \| u ∈ UBICADO : u.rifJuridico \= m.rifJuridico))

**RR-67.** Todo comercio tiene al menos un horario.

    (∀m \| m ∈ COMERCIO : (∃d \| d ∈ DISPONIBLE : d.rifJuridico \= m.rifJuridico))

**RR-68.** Todo funcionario pertenece a un ente.

    (∀f \| f ∈ FUNCIONARIO : (∃p \| p ∈ PERTENECE\_A : p.cedulaFuncionario \= f.cedulaFuncionario))

**RR-69.** Toda experiencia la promueve un comercio.

    (∀x \| x ∈ EXPERIENCIA\_TURISTICA : (∃p \| p ∈ PROMUEVE : p.titulo \= x.titulo ∧ p.fechaActivacion \= x.fechaActivacion))

**RR-70.** Toda experiencia la dirige un guía.

    (∀x \| x ∈ EXPERIENCIA\_TURISTICA : (∃d \| d ∈ DIRIGE : d.titulo \= x.titulo ∧ d.fechaActivacion \= x.fechaActivacion))

**RR-71.** Toda experiencia transcurre sobre una ruta.

    (∀x \| x ∈ EXPERIENCIA\_TURISTICA : (∃t \| t ∈ TRANSCURRE : t.titulo \= x.titulo ∧ t.fechaActivacion \= x.fechaActivacion))

**RR-72.** Toda credencial la adquirió un visitante.

    (∀c \| c ∈ CREDENCIAL\_DIGITAL : (∃a \| a ∈ ADQUIERE : a.codigoCredencial \= c.codigoCredencial))

**RR-73.** Toda credencial tiene la cuenta que la valida.

    (∀c \| c ∈ CREDENCIAL\_DIGITAL : (∃v \| v ∈ VALIDA : v.codigoCredencial \= c.codigoCredencial))

**RR-119.** Dos horarios del mismo comercio y el mismo día no se cruzan.

    (∀d1, d2 \| d1 ∈ DISPONIBLE ∧ d2 ∈ DISPONIBLE ∧ d1 ≠ d2 ∧
               d1.rifJuridico \= d2.rifJuridico ∧ d1.diaSemana \= d2.diaSemana :
        d1.horaCierre ≤ d2.horaApertura ∨ d2.horaCierre ≤ d1.horaApertura)

**RR-120.** El grupo sanguíneo es uno de los ocho grupos ABO con su factor Rh.

    (∀v \| v ∈ VISITANTE :
        v.grupoSanguineo \= 'A+' ∨ v.grupoSanguineo \= 'A−' ∨ v.grupoSanguineo \= 'B+' ∨ v.grupoSanguineo \= 'B−' ∨
        v.grupoSanguineo \= 'AB+' ∨ v.grupoSanguineo \= 'AB−' ∨ v.grupoSanguineo \= 'O+' ∨ v.grupoSanguineo \= 'O−')

**RR-121.** La categoría es gastronómico, sanitario o alquiler de equipos, y el aforo es positivo.

    (∀c \| c ∈ COMERCIO :
        (c.categoriaComercial \= 'gastronómico' ∨ c.categoriaComercial \= 'sanitario' ∨
         c.categoriaComercial \= 'alquiler de equipos') ∧
        c.aforo \> 0\)

**RR-122.** La fecha de vencimiento es posterior a la de activación y el cupo máximo es de al menos una persona.

    (∀x \| x ∈ EXPERIENCIA\_TURISTICA : x.fechaVencimiento \> x.fechaActivacion ∧ x.cupoMaximo ≥ 1\)

**RR-123.** El precio total es positivo y el descuento está entre 0 y 100\.

    (∀x \| x ∈ EXPERIENCIA\_TURISTICA : x.precioTotal \> 0 ∧ x.porcentajeDescuento ≥ 0 ∧ x.porcentajeDescuento ≤ 100\)

**RR-124.** Toda experiencia tiene al menos una fila en INCLUYE o en INCLUYE\_COMERCIO.

    (∀x \| x ∈ EXPERIENCIA\_TURISTICA :
        (∃i \| i ∈ INCLUYE : i.titulo \= x.titulo ∧ i.fechaActivacion \= x.fechaActivacion) ∨
        (∃j \| j ∈ INCLUYE\_COMERCIO : j.titulo \= x.titulo ∧ j.fechaActivacion \= x.fechaActivacion))

**RR-125.** Todo hito que incluye una experiencia está en CONFORMA para la ruta de su fila en TRANSCURRE.

    (∀i, t \| i ∈ INCLUYE ∧ t ∈ TRANSCURRE ∧ t.titulo \= i.titulo ∧ t.fechaActivacion \= i.fechaActivacion :
        (∃c \| c ∈ CONFORMA :
            c.estadoRuta \= t.nombreEstado ∧ c.municipioRuta \= t.nombreMunicipio ∧ c.nombreRuta \= t.nombreRuta ∧
            c.estadoHito \= i.nombreEstado ∧ c.municipioHito \= i.nombreMunicipio ∧
            c.parroquiaHito \= i.nombreParroquia ∧ c.nombreHito \= i.nombreHito))

**RR-126.** Una experiencia transcurre sobre una ruta fija o sobre una ruta dinámica pública.

    (∀t \| t ∈ TRANSCURRE :
        (∃f \| f ∈ RUTA\_FIJA : f.nombreEstado \= t.nombreEstado ∧ f.nombreMunicipio \= t.nombreMunicipio ∧
                              f.nombreRuta \= t.nombreRuta) ∨
        (∃d \| d ∈ RUTA\_DINAMICA : d.nombreEstado \= t.nombreEstado ∧ d.nombreMunicipio \= t.nombreMunicipio ∧
                                  d.nombreRuta \= t.nombreRuta ∧ d.visibilidad \= 'pública'))

**RR-127.** El estado es emitido, canjeado, cancelado o vencido; el monto abonado no es negativo; hay al menos un beneficiario.

    (∀c \| c ∈ CREDENCIAL\_DIGITAL :
        (c.estadoCredencial \= 'emitido' ∨ c.estadoCredencial \= 'canjeado' ∨
         c.estadoCredencial \= 'cancelado' ∨ c.estadoCredencial \= 'vencido') ∧
        c.montoAbonado ≥ 0 ∧ c.cantidadBeneficiarios ≥ 1\)

**RR-128.** Toda credencial tiene fila en RESERVA\_HITO o en RESERVA\_COMERCIO, exactamente en una.

    (∀c \| c ∈ CREDENCIAL\_DIGITAL :
        (∃r \| r ∈ RESERVA\_HITO : r.codigoCredencial \= c.codigoCredencial) ⊕
        (∃s \| s ∈ RESERVA\_COMERCIO : s.codigoCredencial \= c.codigoCredencial))

**RR-129.** La cuenta que valida una credencial está en CUENTA\_COMERCIO o en CUENTA\_GUIA.

    (∀v \| v ∈ VALIDA :
        (∃m \| m ∈ CUENTA\_COMERCIO : m.idCuenta \= v.idCuenta) ∨
        (∃g \| g ∈ CUENTA\_GUIA : g.idCuenta \= v.idCuenta))

**RR-130.** Si una credencial reserva un comercio y la valida la cuenta de un comercio, esa cuenta es la del comercio reservado.

    (∀v, r, m \| v ∈ VALIDA ∧ r ∈ RESERVA\_COMERCIO ∧ m ∈ CUENTA\_COMERCIO ∧
                r.codigoCredencial \= v.codigoCredencial ∧ m.idCuenta \= v.idCuenta :
        m.rifJuridico \= r.rifJuridico)

**RR-131.** Una credencial con estadoCredencial \= 'emitido' no tiene su fechaHoraProgramada en el pasado. Si la fecha pasó sin canjearse, está vencida. (Solo en lenguaje natural: necesita la fecha de hoy, que el lenguaje de restricciones del curso no define.)

**RR-132.** Si una credencial tiene fila en RESERVA\_COMERCIO, hay una fila de DISPONIBLE del mismo rifJuridico cuyo diaSemana es el día de la semana de fechaHoraProgramada y cuyo rango de horaApertura a horaCierre contiene su hora. Lo mismo con RESERVA\_HITO y ABRE, salvo que el hito tenga libreAcceso verdadero. (Solo en lenguaje natural: necesita el día de la semana y la hora de una fecha, que el lenguaje de restricciones del curso no define.)

**RR-133.** Si una credencial se adquiere bajo una experiencia, el hito o el comercio que reserva está en INCLUYE o en INCLUYE\_COMERCIO para esa experiencia.

    (∀a, r \| a ∈ AMPARA ∧ r ∈ RESERVA\_HITO ∧ r.codigoCredencial \= a.codigoCredencial :
        (∃i \| i ∈ INCLUYE : i.titulo \= a.titulo ∧ i.fechaActivacion \= a.fechaActivacion ∧
            i.nombreEstado \= r.nombreEstado ∧ i.nombreMunicipio \= r.nombreMunicipio ∧
            i.nombreParroquia \= r.nombreParroquia ∧ i.nombreHito \= r.nombreHito))
    ∧
    (∀a, s \| a ∈ AMPARA ∧ s ∈ RESERVA\_COMERCIO ∧ s.codigoCredencial \= a.codigoCredencial :
        (∃j \| j ∈ INCLUYE\_COMERCIO : j.titulo \= a.titulo ∧ j.fechaActivacion \= a.fechaActivacion ∧
            j.rifJuridico \= s.rifJuridico))

**RR-134.** Si una credencial se adquiere bajo una experiencia, sus beneficiarios no superan el cupo de la experiencia y su fecha programada está entre la activación y el vencimiento de la experiencia.

    (∀a, c, x \| a ∈ AMPARA ∧ c ∈ CREDENCIAL\_DIGITAL ∧ x ∈ EXPERIENCIA\_TURISTICA ∧
                c.codigoCredencial \= a.codigoCredencial ∧ x.titulo \= a.titulo ∧ x.fechaActivacion \= a.fechaActivacion :
        c.cantidadBeneficiarios ≤ x.cupoMaximo ∧
        c.fechaHoraProgramada ≥ x.fechaActivacion ∧ c.fechaHoraProgramada ≤ x.fechaVencimiento)

# **8\. Matriz de trazabilidad** {#8.-matriz-de-trazabilidad}

La matriz relaciona cada historia con quién la desarrolla, la pantalla que la cubre y el sprint en que se implementa. Así se puede ir de una historia a su responsable y a su fecha, y al revés. En los CRUD, cada fila agrupa las historias de las cuatro operaciones.

## **Bloque 1 · Consultas (8)** {#bloque-1-·-consultas-(8)}

| ID | Funcionalidad | Responsable | Interfaz | Sprint |
| :---- | :---- | :---- | :---- | :---- |
| HU-01 | Ficha de un hito y en qué rutas aparece | Javier | V03 | S4 |
| HU-02 | Recursos 3D de hitos cercanos a una coordenada | Javier | V05 | S4 |
| HU-03 | Rutas por categoría en un municipio o estado | Sebastián | V02 | S2 |
| HU-04 | Servicios en un recorrido y tiempo estimado de llegada | Sebastián | V04 | S4 |
| HU-05 | Paradas de una ruta con vías adyacentes operativas | Sebastián | V04 | S3 |
| HU-06 | Valoraciones y comentarios de una ruta | Valeria | V04 | S3 |
| HU-07 | Validar una credencial digital | Valeria | V10 | S2 |
| HU-32 | Experiencias vigentes de un recorrido | Valeria | V04 | S3 |

## **Bloque 2a · CRUD: gestión de entidades (20 CRUD, 79 HU)** {#bloque-2a-·-crud:-gestión-de-entidades-(20-crud,-79-hu)}

| ID | Funcionalidad | Responsable | Interfaz | Sprint |
| :---- | :---- | :---- | :---- | :---- |
| HU-09.1 a 09.4 | CRUD Visitantes | Valeria | V18 | S1 |
| HU-10.1 a 10.4 | CRUD Hitos | Javier | V14 | S2 |
| HU-11.1 a 11.4 | CRUD Categorías de hito | Javier | V14 | S1 |
| HU-12.1 a 12.4 | CRUD Estados | Javier | V13 | S1 |
| HU-13.1 a 13.4 | CRUD Puntos de anclaje de realidad aumentada | Javier | V15 | S2 |
| HU-14.1 a 14.4 | CRUD Recursos 3D | Javier | V15 | S2 |
| HU-15.1 a 15.4 | CRUD Vías | Sebastián | V16 | S1 |
| HU-16.1 a 16.4 | CRUD Paradas de transporte | Sebastián | V16 | S2 |
| HU-17.1 a 17.4 | CRUD Rutas fijas | Sebastián | V17 | S2 |
| HU-18.1 a 18.4 | CRUD Experiencias promocionales | Valeria | V11 | S3 |
| HU-23.1 a 23.3 | CRUD Credenciales digitales | Valeria | V08 | S2 |
| HU-24.1 a 24.4 | CRUD Eventos culturales | Javier | V14 | S2 |
| HU-25.1 a 25.4 | CRUD Rutas dinámicas | Sebastián | V07 | S3 |
| HU-26.1 a 26.4 | CRUD Funcionarios | Valeria | V18 | S2 |
| HU-29.1 a 29.4 | CRUD Guías | Sebastián | V18 | S1 |
| HU-30.1 a 30.4 | CRUD Comercios | Valeria | V18 | S1 |
| HU-31.1 a 31.4 | CRUD Instituciones | Javier | V18 | S1 |
| HU-33.1 a 33.4 | CRUD Municipios | Javier | V13 | S1 |
| HU-34.1 a 34.4 | CRUD Parroquias | Javier | V13 | S1 |
| HU-35.1 a 35.4 | CRUD Tramos y conexiones | Sebastián | V16 | S1 |

## **Bloque 2b · CRUD: operaciones del negocio (9)** {#bloque-2b-·-crud:-operaciones-del-negocio-(9)}

| ID | Funcionalidad | Responsable | Interfaz | Sprint |
| :---- | :---- | :---- | :---- | :---- |
| HU-08 | Iniciar sesión | Valeria | V01 | S1 |
| HU-19 | Reportar incidencia | Javier | V09 | S3 |
| HU-20 | Verificar incidencia | Javier | V12 | S3 |
| HU-21 | Registrar recorrido | Sebastián | V06 | S3 |
| HU-22 | Publicar evaluación | Javier | V06 | S3 |
| HU-27 | Canjear credencial | Valeria | V10 | S3 |
| HU-28 | Asignar guías a una ruta fija | Sebastián | V17 | S3 |
| HU-36 | Prorrogar incidencia | Javier | V12 | S3 |
| HU-37 | Cerrar incidencia | Javier | V12 | S3 |

## **Bloque 3 · Reportes (3)** {#bloque-3-·-reportes-(3)}

| ID | Funcionalidad | Responsable | Interfaz | Sprint |
| :---- | :---- | :---- | :---- | :---- |
| RP-1 | Estado de conservación e incidencias por territorio | Javier | V19 | S4 |
| RP-2 | Desempeño de experiencias y credenciales | Valeria | V20 | S4 |
| RP-3 | Afluencia y calidad percibida por ruta | Sebastián | V21 | S4 |

## **Bloque 4 · Valor agregado (4)** {#bloque-4-·-valor-agregado-(4)}

| ID | Funcionalidad | Responsable | Interfaz | Sprint |
| :---- | :---- | :---- | :---- | :---- |
| VA-1 | Tiempos reales de una ruta | Sebastián | V04 | S4 |
| VA-2 | Desvío por incidencia | Sebastián | V06 | S4 |
| VA-3 | Contratación de guía | Sebastián | V04 | S4 |
| VA-4 | Semáforo de seguridad | Javier | V04 | S4 |

# **Anexo A. Historias de usuario completas** {#anexo-a.-historias-de-usuario-completas}

Aquí están las 103 historias con todos sus criterios de aceptación, organizadas en cuatro bloques.

## **Bloque 1 · Consultas (8)** {#bloque-1-·-consultas-(8)-1}

Preguntas que el sistema responde en el momento, sin cambiar datos.

### **HU-01 · Ficha del hito y sus rutas (Javier)**

Como visitante quiero ver la ficha integral de un hito y en qué rutas está incluido, para decidir cuál recorrer.

**Criterios de aceptación**

1. El visitante elige un hito y el sistema muestra su ficha: nombre, categorías, estado operativo, horario de visita o libre acceso, ubicación (latitud, longitud y elevación), estado, municipio y parroquia, y sus eventos culturales.

2. El sistema lista las rutas fijas y dinámicas que incluyen ese hito.

3. Las rutas dinámicas privadas de otros visitantes no aparecen.

4. Si el hito no está en ninguna ruta, el sistema lo indica.

### **HU-02 · Recursos 3D cercanos (Javier)**

Como visitante quiero recuperar los recursos 3D de los hitos cercanos a mi posición, para ver los elementos virtuales en la cámara.

**Criterios de aceptación**

1. La app envía la latitud, la longitud y la elevación de origen del visitante.

2. Un punto de anclaje se considera cercano si el origen está dentro de su radio efectivo de activación.

3. La distancia se calcula con funciones trigonométricas sobre los decimales, sin tipos espaciales.

4. Para cada anclaje cercano devuelve su recurso 3D y los parámetros para proyectarlo: altitud, azimut, inclinación, rotación y escala.

5. Para cada recurso devuelve su formato y su ruta de almacenamiento, para que la app lo descargue.

6. Para cada anclaje devuelve también sus hipervínculos informativos.

7. Si no hay anclajes cercanos, el sistema lo indica.

### **HU-03 · Rutas por categoría y territorio (Sebastián)**

Como visitante quiero listar las rutas urbanas de una categoría en un municipio o en un estado, para elegir qué recorrer en esa zona.

**Criterios de aceptación**

1. El visitante elige una categoría y un municipio o un estado.

2. El sistema lista las rutas que incluyen al menos un hito de esa categoría y cuyo origen está en el municipio o el estado elegido.

3. Aparecen las rutas fijas y las rutas dinámicas públicas; las dinámicas privadas no aparecen.

4. Si no hay rutas que cumplan el filtro, el sistema lo indica.

### **HU-04 · Servicios en un recorrido (Sebastián)**

Como visitante quiero ver los servicios de una tipología disponibles a lo largo de una ruta y el tiempo estimado para llegar a cada uno, para planificar mis paradas.

**Criterios de aceptación**

1. El visitante elige una ruta y una tipología de servicio, que es la categoría comercial del comercio: gastronómico, sanitario o alquiler de equipos.

2. El sistema lista los comercios de esa tipología que están a 500 m o menos de algún hito o parada de la ruta.

3. Para cada comercio muestra el tiempo estimado de llegada, calculado desde el inicio de la ruta o desde la posición actual del visitante, según elija.

4. Desde el inicio, la distancia es la suma de las distancias entre los hitos y paradas consecutivos de la secuencia hasta el hito o parada más cercano al comercio, más la distancia de ese punto al comercio; desde la posición actual, es la distancia en línea recta.

5. El tiempo es la distancia dividida entre la velocidad fija del modo de transporte del visitante: a pie 5 km/h, bicicleta 15 km/h, transporte público 20 km/h y vehículo adaptado 20 km/h.

6. La distancia se calcula con latitud, longitud y elevación en decimales, con funciones trigonométricas y sin tipos espaciales.

7. Si no hay comercios de esa tipología en la ruta, el sistema lo indica.

### **HU-05 · Paradas de transbordo operativas (Sebastián)**

Como visitante quiero ver las paradas de transporte de una ruta y saber si sus vías adyacentes están operativas, para hacer transbordo con seguridad.

**Criterios de aceptación**

1. El visitante elige una ruta y el sistema lista las paradas que forman parte de su secuencia.

2. Para cada parada muestra su estado (activa, en mantenimiento o fuera de servicio) y si el tramo de vía donde está, o los tramos conectados a él, tienen incidencias activas. Las incidencias preliminares (aún sin verificar) se muestran como aviso.

3. Una parada cuya vía tiene cierre total por mantenimiento no se ofrece como opción de transbordo.

4. Una incidencia que afecta solo un tramo no marca como afectada toda la vía.

### **HU-06 · Valoraciones de una ruta (Valeria)**

Como visitante quiero ver las valoraciones, las observaciones de seguridad y los comentarios de una ruta, para saber si me conviene.

**Criterios de aceptación**

1. El visitante elige una ruta y el sistema lista sus evaluaciones con la calificación, la seguridad percibida, la fecha y la opinión.

2. Cada evaluación indica si tiene la marca de recorrido verificado. En las evaluaciones de una ruta la marca siempre es sí, porque exigen un recorrido completado.

3. Si la ruta no tiene evaluaciones, el sistema lo indica.

4. Un mismo visitante puede aparecer varias veces en la lista, porque publica una evaluación por cada recorrido.

### **HU-07 · Validar credencial (Valeria)**

Como comercio o guía quiero validar la autenticidad de una credencial digital, para saber si puedo darle acceso al visitante.

**Criterios de aceptación**

1. Al ingresar un código de credencial, el sistema indica si existe y en qué estado está: emitido, canjeado, cancelado o vencido.

2. La credencial solo se considera válida si está emitida y la fecha y hora programadas corresponden al horario autorizado.

3. Si el código no existe, el sistema indica que la credencial no es auténtica.

### **HU-32 · Experiencias vigentes de un recorrido (Valeria)**

Como visitante quiero ver las experiencias promocionales vigentes de una ruta, para aprovechar las promociones durante el recorrido.

**Criterios de aceptación**

1. El visitante elige una ruta y el sistema lista sus experiencias vigentes: las que tienen la fecha actual entre su fecha de activación y su fecha de vencimiento.

2. Para cada experiencia muestra título, descripción, precio, porcentaje de descuento, cupo y código promocional si lo tiene.

3. Si la ruta no tiene experiencias vigentes, el sistema lo indica.

## **Bloque 2a · CRUD: gestión de entidades (20 CRUD)** {#bloque-2a-·-crud:-gestión-de-entidades-(20-crud)}

Cada CRUD es un grupo con una HU por operación: *Registrar*, *Consultar*, *Modificar* y *Eliminar* (HU-n.1 a HU-n.4). Enunciado §2.1: *"todos los requisitos que permitan la Creación, Lectura, Actualización y Borrado de datos"*. Las credenciales (CRUD Credenciales) tienen *Adquirir*, *Consultar* y *Cancelar* en lugar de modificar y eliminar.

### **CRUD Visitantes (Valeria)**

HU-09.1 Registrar, HU-09.2 Consultar, HU-09.3 Modificar, HU-09.4 Eliminar.

#### **HU-09.1 · Registrar visitante (Valeria)**

Como administrador quiero registrar visitantes, para que puedan usar la plataforma.

**Criterios de aceptación**

1. Se identifica por su cédula de identidad o pasaporte; si ya existe, el sistema lo rechaza.

2. Tiene nombres, apellidos, país de origen, idioma nativo, teléfono de emergencia, grupo sanguíneo y especificaciones de accesibilidad física o sensorial.

3. Tiene una contraseña para entrar con su identificador.

4. Una misma persona puede ser visitante y también tener otro rol, por ejemplo guía.

#### **HU-09.2 · Consultar visitante (Valeria)**

Como administrador quiero consultar los visitantes registrados, para revisar quiénes usan la plataforma.

**Criterios de aceptación**

1. Puedo ver el listado de todos los visitantes.

2. Puedo abrir un visitante y ver todos sus datos.

#### **HU-09.3 · Modificar visitante (Valeria)**

Como administrador quiero modificar los datos de un visitante, para mantenerlos al día.

**Criterios de aceptación**

1. Puedo cambiar cualquier dato del visitante.

2. Si cambio su cédula o pasaporte por uno que ya existe, el sistema lo rechaza.

#### **HU-09.4 · Eliminar visitante (Valeria)**

Como administrador quiero eliminar visitantes, para quitar los registros que ya no corresponden.

**Criterios de aceptación**

1. Si el visitante no tiene recorridos, evaluaciones, credenciales, rutas propias ni contrataciones de guía, se elimina.

2. Si tiene recorridos, evaluaciones, credenciales, rutas propias o contrataciones de guía, el sistema no lo elimina y me indica qué lo impide.

### **CRUD Hitos (Javier)**

HU-10.1 Registrar, HU-10.2 Consultar, HU-10.3 Modificar, HU-10.4 Eliminar.

#### **HU-10.1 · Registrar hito (Javier)**

Como administrador quiero registrar hitos, para que los visitantes encuentren los puntos de interés.

**Criterios de aceptación**

1. Cada hito tiene nombre, al menos una categoría, estado operativo y horario de visita o la marca de libre acceso.

2. El estado operativo es uno de estos: disponible, en restauración, clausurado temporalmente o cerrado permanentemente.

3. La ubicación se guarda como latitud, longitud y elevación en decimales; si el hito está dentro de una estructura (por ejemplo, un piso de un edificio), también su altura dentro de ella.

4. El hito se ubica en una parroquia, con su municipio y su estado.

5. El hito puede ubicarse sobre un tramo de vía (es opcional: un hito en un sendero sin registrar queda sin tramo).

6. Si registro un hito con un nombre que ya existe en la misma parroquia, el mismo municipio y el mismo estado, el sistema lo rechaza.

7. Si registro un hito con la misma latitud, longitud y elevación que otro, el sistema lo acepta.

#### **HU-10.2 · Consultar hito (Javier)**

Como administrador quiero consultar los hitos registrados, para revisar qué hay cargado y con qué datos.

**Criterios de aceptación**

1. Puedo ver el listado de todos los hitos.

2. Puedo abrir un hito y ver todos sus datos: nombre, categorías, estado operativo, horario o libre acceso, ubicación, parroquia, municipio, estado y tramo si lo tiene.

#### **HU-10.3 · Modificar hito (Javier)**

Como administrador quiero modificar los datos de un hito, para mantener la información al día, por ejemplo cuando cambia su estado operativo.

**Criterios de aceptación**

1. Puedo cambiar cualquier dato del hito: nombre, categorías, estado operativo, horario o libre acceso, ubicación, parroquia y tramo.

2. El nuevo estado operativo es uno de los cuatro permitidos: disponible, en restauración, clausurado temporalmente o cerrado permanentemente.

3. Si dejo el hito sin ninguna categoría, el sistema lo rechaza.

4. Si cambio el nombre o la parroquia y el hito queda con el mismo nombre que otro de la misma parroquia, municipio y estado, el sistema lo rechaza.

5. Si cambio la ubicación a la misma latitud, longitud y elevación que otro hito, el sistema lo acepta.

#### **HU-10.4 · Eliminar hito (Javier)**

Como administrador quiero eliminar hitos, para quitar los que se cargaron por error.

**Criterios de aceptación**

1. Si el hito no forma parte de ninguna ruta y no tiene anclajes, eventos, evaluaciones ni incidencias, se elimina.

2. Si el hito forma parte de una ruta o tiene anclajes, eventos, evaluaciones o incidencias, el sistema no lo elimina y me indica qué lo impide.

3. En ese caso puedo marcar el hito como cerrado permanentemente.

### **CRUD Categorías de hito (Javier)**

HU-11.1 Registrar, HU-11.2 Consultar, HU-11.3 Modificar, HU-11.4 Eliminar.

#### **HU-11.1 · Registrar categoría de hito (Javier)**

Como administrador quiero registrar categorías de hito, para clasificar los puntos de interés.

**Criterios de aceptación**

1. Si registro una categoría con una denominación que ya existe, el sistema la rechaza.

2. Un hito se puede asociar a una o varias categorías.

#### **HU-11.2 · Consultar categoría de hito (Javier)**

Como administrador quiero consultar las categorías de hito, para saber con cuáles se clasifican los puntos de interés.

**Criterios de aceptación**

1. Puedo ver el listado de las categorías.

#### **HU-11.3 · Modificar categoría de hito (Javier)**

Como administrador quiero modificar una categoría de hito, para corregir su denominación.

**Criterios de aceptación**

1. Puedo cambiar la denominación de la categoría.

2. Si cambio la denominación por una que ya existe, el sistema lo rechaza.

#### **HU-11.4 · Eliminar categoría de hito (Javier)**

Como administrador quiero eliminar categorías de hito, para quitar las que ya no se usan.

**Criterios de aceptación**

1. Si la categoría no es la única de ningún hito, se elimina y deja de aparecer en los hitos que la tenían.

2. Si la categoría es la única de algún hito, el sistema no la elimina.

### **CRUD Estados (Javier)**

HU-12.1 Registrar, HU-12.2 Consultar, HU-12.3 Modificar, HU-12.4 Eliminar.

#### **HU-12.1 · Registrar estado (Javier)**

Como administrador quiero registrar los estados del país, para ubicar en el territorio los hitos, las rutas y las vías.

**Criterios de aceptación**

1. Si registro un estado con un nombre que ya existe, el sistema lo rechaza.

#### **HU-12.2 · Consultar estado (Javier)**

Como administrador quiero consultar los estados registrados, para ver qué territorio está cargado.

**Criterios de aceptación**

1. Puedo ver el listado de los estados.

#### **HU-12.3 · Modificar estado (Javier)**

Como administrador quiero modificar un estado, para corregir su nombre.

**Criterios de aceptación**

1. Puedo cambiar el nombre del estado.

2. Si cambio el nombre por uno que ya existe, el sistema lo rechaza.

#### **HU-12.4 · Eliminar estado (Javier)**

Como administrador quiero eliminar estados, para quitar los que se cargaron por error.

**Criterios de aceptación**

1. Si el estado no tiene municipios, se elimina.

2. Si tiene municipios, el sistema no lo elimina.

### **CRUD Puntos de anclaje de realidad aumentada (Javier)**

HU-13.1 Registrar, HU-13.2 Consultar, HU-13.3 Modificar, HU-13.4 Eliminar.

#### **HU-13.1 · Registrar punto de anclaje (Javier)**

Como administrador quiero registrar puntos de anclaje de un hito, para que la app sobreponga los elementos 3D cuando el usuario enfoca la cámara.

**Criterios de aceptación**

1. Cada anclaje tiene latitud, longitud, altitud respecto al suelo, azimut, inclinación, rotación, radio de activación en metros y escala, todos como decimales.

2. El anclaje pertenece a un hito y se identifica dentro de ese hito.

3. Cada anclaje usa exactamente un recurso 3D ya registrado.

4. La altitud del anclaje se guarda aparte de la elevación del hito y no se calcula a partir de ella.

5. Cada anclaje puede tener uno o varios hipervínculos informativos.

####

#### **HU-13.2 · Consultar punto de anclaje (Javier)**

Como administrador quiero consultar los puntos de anclaje de un hito, para revisar cómo se proyecta su contenido 3D.

**Criterios de aceptación**

1. Puedo ver los anclajes de un hito con su recurso 3D.

2. Puedo abrir un anclaje y ver todos sus parámetros y sus hipervínculos.

#### **HU-13.3 · Modificar punto de anclaje (Javier)**

Como administrador quiero modificar un punto de anclaje, para ajustar su posición, sus parámetros o su recurso 3D.

**Criterios de aceptación**

1. Puedo cambiar sus parámetros (latitud, longitud, altitud respecto al suelo, azimut, inclinación, rotación, radio de activación y escala) y sus hipervínculos, siempre como decimales.

2. Puedo cambiar su recurso 3D por otro ya registrado; el anclaje sigue usando exactamente uno.

3. La altitud del anclaje sigue guardándose aparte de la elevación del hito.

#### **HU-13.4 · Eliminar punto de anclaje (Javier)**

Como administrador quiero eliminar puntos de anclaje, para quitar los que ya no se usan.

**Criterios de aceptación**

1. Al eliminar un anclaje se eliminan también sus hipervínculos.

2. Al eliminar un anclaje, su recurso 3D no se elimina.

### **CRUD Recursos 3D (Javier)**

HU-14.1 Registrar, HU-14.2 Consultar, HU-14.3 Modificar, HU-14.4 Eliminar.

#### **HU-14.1 · Registrar recurso 3D (Javier)**

Como administrador quiero registrar recursos tridimensionales, para proyectarlos en la realidad aumentada.

**Criterios de aceptación**

1. Cada recurso tiene su identificador (el código del archivo digital), formato, versión, tamaño en MB, descripción y ruta de almacenamiento.

2. Si registro un recurso con un identificador que ya existe, el sistema lo rechaza.

#### **HU-14.2 · Consultar recurso 3D (Javier)**

Como administrador quiero consultar los recursos tridimensionales, para saber cuáles hay y dónde se usan.

**Criterios de aceptación**

1. Puedo ver el listado de los recursos.

2. Puedo ver en qué anclajes se usa cada recurso.

#### **HU-14.3 · Modificar recurso 3D (Javier)**

Como administrador quiero modificar un recurso tridimensional, para actualizar su versión o su ruta de almacenamiento.

**Criterios de aceptación**

1. Puedo cambiar sus datos, por ejemplo la versión o la ruta de almacenamiento.

2. Si cambio el identificador por uno que ya existe, el sistema lo rechaza.

#### **HU-14.4 · Eliminar recurso 3D (Javier)**

Como administrador quiero eliminar recursos tridimensionales, para quitar los que ya no se usan.

**Criterios de aceptación**

1. Si ningún anclaje usa el recurso, se elimina.

2. Si algún anclaje lo usa, el sistema no lo elimina.

### **CRUD Vías (Sebastián)**

HU-15.1 Registrar, HU-15.2 Consultar, HU-15.3 Modificar, HU-15.4 Eliminar.

#### **HU-15.1 · Registrar vía (Sebastián)**

Como administrador quiero registrar vías, para tener la red física sobre la que pasan las rutas.

**Criterios de aceptación**

1. Cada vía tiene nombre, tipo (calle, avenida, bulevar, caminería, sendero, puente u otro), modos de recorrido permitidos (a pie, bicicleta, transporte público o vehículo adaptado) y condiciones del terreno.

2. La vía se ubica en un municipio y un estado.

3. Si registro una vía con el mismo nombre en el mismo municipio y estado que otra, el sistema la rechaza.

4. La vía tiene un estado que indica si está habilitada o tiene cierre total por mantenimiento.

#### **HU-15.2 · Consultar vía (Sebastián)**

Como administrador quiero consultar las vías registradas, para revisar la red física y su estado.

**Criterios de aceptación**

1. Puedo ver las vías de un municipio con su estado.

2. Puedo abrir una vía y ver su tipo, sus modos de recorrido permitidos y las condiciones del terreno.

#### **HU-15.3 · Modificar vía (Sebastián)**

Como administrador quiero modificar los datos y el estado de una vía, para mantener la red al día.

**Criterios de aceptación**

1. Puedo cambiar sus datos y su estado (habilitada o con cierre total por mantenimiento).

2. Si cambio el nombre, el municipio o el estado y la vía queda con el mismo nombre que otra del mismo municipio y estado, el sistema lo rechaza.

3. El tipo y los modos de recorrido siguen siendo de los valores permitidos.

#### **HU-15.4 · Eliminar vía (Sebastián)**

Como administrador quiero eliminar vías, para quitar las que se cargaron por error.

**Criterios de aceptación**

1. Si la vía no tiene paradas asociadas, se elimina junto con sus tramos, siempre que ningún tramo tenga incidencias o hitos.

2. Si la vía tiene paradas asociadas, el sistema no la elimina.

### **CRUD Paradas de transporte (Sebastián)**

HU-16.1 Registrar, HU-16.2 Consultar, HU-16.3 Modificar, HU-16.4 Eliminar.

#### **HU-16.1 · Registrar parada de transporte (Sebastián)**

Como administrador quiero registrar paradas de transporte, para que los visitantes sepan dónde hacer transbordo.

**Criterios de aceptación**

1. Si registro una parada con un código oficial de terminal que ya existe, el sistema la rechaza.

2. Cada parada tiene nombre, modalidad, tarifa básica en moneda nacional, nivel de adecuación para discapacidad, horario de apertura y cierre, frecuencia de paso en minutos y aforo máximo.

3. Su estado es uno de estos: activa, en mantenimiento o fuera de servicio.

4. Se indica si tiene techo, iluminación nocturna, taquilla, vigilancia y estacionamiento o resguardo de bicicletas.

5. La ubicación se guarda como latitud, longitud y elevación en decimales.

6. No se puede registrar una parada sin asociarla a una vía habilitada, indicando el tramo de esa vía donde está.

7. Se puede asociar la parada con los hitos cercanos y con las rutas que usan su modalidad.

#### **HU-16.2 · Consultar parada de transporte (Sebastián)**

Como administrador quiero consultar las paradas de transporte, para revisar dónde están y en qué estado.

**Criterios de aceptación**

1. Puedo ver las paradas de una vía con su estado.

2. Puedo abrir una parada y ver todos sus datos, su tramo, los hitos cercanos y las rutas asociadas.

#### **HU-16.3 · Modificar parada de transporte (Sebastián)**

Como administrador quiero modificar los datos y el estado de una parada, para mantenerla al día.

**Criterios de aceptación**

1. Puedo cambiar sus datos y su estado: activa, en mantenimiento o fuera de servicio.

2. Si cambio el código oficial de terminal por uno que ya existe, el sistema lo rechaza.

3. La parada sigue asociada a una vía habilitada, con el tramo donde está; si la cambio de vía, también indico el tramo.

4. Puedo cambiar los hitos cercanos y las rutas asociadas.

#### **HU-16.4 · Eliminar parada de transporte (Sebastián)**

Como administrador quiero eliminar paradas de transporte, para quitar las que ya no existen.

**Criterios de aceptación**

1. Si la parada no forma parte de ninguna ruta, se elimina.

2. Si forma parte de una ruta, el sistema no la elimina.

### **CRUD Rutas fijas (Sebastián)**

HU-17.1 Registrar, HU-17.2 Consultar, HU-17.3 Modificar, HU-17.4 Eliminar.

#### **HU-17.1 · Registrar ruta fija (Sebastián)**

Como administrador quiero registrar rutas fijas, para ofrecer recorridos prediseñados por expertos.

**Criterios de aceptación**

1. La ruta es una secuencia ordenada de hitos y paradas con número de orden; el primero es el origen y el último el destino.

2. La ruta tiene al menos un hito de origen y uno de destino.

3. No hay dos elementos con el mismo número de orden en la ruta.

4. La ruta tiene duración estimada, mejor horario de inicio y nivel de dificultad.

5. Si registro una ruta con el mismo nombre en el mismo municipio y estado de origen que otra, el sistema la rechaza. El mismo nombre sí se acepta en otro municipio o estado.

#### **HU-17.2 · Consultar ruta fija (Sebastián)**

Como administrador quiero consultar las rutas fijas, para revisar qué recorridos se ofrecen.

**Criterios de aceptación**

1. Puedo ver el listado de las rutas fijas.

2. Puedo abrir una ruta y ver su secuencia, su duración, su horario, su dificultad y sus guías.

#### **HU-17.3 · Modificar ruta fija (Sebastián)**

Como administrador quiero modificar una ruta fija, para corregir sus datos o su secuencia.

**Criterios de aceptación**

1. Puedo cambiar sus datos y su secuencia de hitos y paradas.

2. La ruta sigue teniendo al menos un hito de origen y uno de destino.

3. No puede haber dos elementos con el mismo número de orden.

4. La ruta sigue teniendo duración estimada, mejor horario de inicio y nivel de dificultad.

5. Si el nombre queda igual al de otra ruta del mismo municipio y estado de origen, el sistema lo rechaza; en otro municipio o estado se acepta.

#### **HU-17.4 · Eliminar ruta fija (Sebastián)**

Como administrador quiero eliminar rutas fijas, para quitar las que se cargaron por error.

**Criterios de aceptación**

1. Si la ruta no tiene recorridos, experiencias ni contrataciones de guía, se elimina.

2. Si tiene recorridos, experiencias o contrataciones de guía, no se borra, porque se conserva su historial.

### **CRUD Experiencias promocionales (Valeria)**

HU-18.1 Registrar, HU-18.2 Consultar, HU-18.3 Modificar, HU-18.4 Eliminar.

#### **HU-18.1 · Registrar experiencia promocional (Valeria)**

Como comercio o guía quiero registrar experiencias promocionales, para atraer visitantes a mis servicios.

**Criterios de aceptación**

1. Si registro una experiencia con el mismo título y la misma fecha de activación que otra, el sistema la rechaza.

2. Cada experiencia tiene descripción, precio total, cupo máximo por grupo, porcentaje de descuento y fecha de vencimiento; el código promocional es opcional.

3. Si la fecha de vencimiento no es posterior a la de activación, el sistema la rechaza.

4. Si el cupo es menor que una persona, el sistema la rechaza.

5. La experiencia se vincula al comercio que la promueve, al guía certificado que la dirige, a la ruta del recorrido y a los hitos o comercios (servicios) que incluye.

#### **HU-18.2 · Consultar experiencia promocional (Valeria)**

Como comercio o guía quiero consultar mis experiencias promocionales, para saber cuáles tengo publicadas.

**Criterios de aceptación**

1. Veo la lista de mis experiencias.

2. Puedo abrir una experiencia y ver sus datos y sus vínculos.

#### **HU-18.3 · Modificar experiencia promocional (Valeria)**

Como comercio o guía quiero modificar mis experiencias promocionales, para ajustar su oferta.

**Criterios de aceptación**

1. Solo el comercio que promueve la experiencia o el guía que la dirige puede modificarla.

2. Si el título y la fecha de activación quedan iguales a los de otra experiencia, el sistema lo rechaza.

3. Si la fecha de vencimiento no es posterior a la de activación, el sistema lo rechaza.

4. Si el cupo queda menor que una persona, el sistema lo rechaza.

#### **HU-18.4 · Eliminar experiencia promocional (Valeria)**

Como comercio o guía quiero eliminar mis experiencias promocionales, para retirar las que ya no ofrezco.

**Criterios de aceptación**

1. Solo el comercio que promueve la experiencia o el guía que la dirige puede eliminarla.

2. Si ninguna credencial se adquirió bajo la experiencia, se elimina.

3. Si hay credenciales adquiridas bajo la experiencia, el sistema no la elimina y me indica qué lo impide.

### **CRUD Credenciales digitales (Valeria)**

HU-23.1 Adquirir, HU-23.2 Consultar, HU-23.3 Cancelar.

#### **HU-23.1 · Adquirir credencial digital (Valeria)**

Como visitante quiero adquirir una credencial digital, para entrar a un recinto pagado o reservar un servicio.

**Criterios de aceptación**

1. El sistema genera un código alfanumérico de verificación único.

2. La credencial tiene fecha y hora programadas para la visita, monto abonado y cantidad de beneficiarios.

3. Se vincula al visitante que la adquiere, al hito o comercio (servicio) reservado y al aliado comercial o guía que validará la entrada.

4. Si la credencial se adquiere bajo una experiencia promocional, queda vinculada a ella; si no, queda sin experiencia.

5. Al emitirse queda en estado emitido.

#### **HU-23.2 · Consultar credencial digital (Valeria)**

Como visitante quiero consultar mis credenciales digitales, para saber cuáles tengo y en qué estado están.

**Criterios de aceptación**

1. Veo la lista de mis credenciales con su estado.

2. Si pasa la fecha programada sin canjearse, la credencial aparece como vencida.

#### **HU-23.3 · Cancelar credencial digital (Valeria)**

Como visitante quiero cancelar una credencial digital, para no usar una reserva que ya no necesito. Este es el borrado del CRUD: la credencial no se modifica ni se elimina, se cancela.

**Criterios de aceptación**

1. Puedo cancelar una credencial emitida; pasa a estado cancelado y ya no se puede canjear.

2. Si la credencial ya fue canjeada, está vencida o ya está cancelada, el sistema no me deja cancelarla.

### **CRUD Eventos culturales (Javier)**

HU-24.1 Registrar, HU-24.2 Consultar, HU-24.3 Modificar, HU-24.4 Eliminar.

#### **HU-24.1 · Registrar evento cultural (Javier)**

Como administrador quiero registrar los eventos culturales de un hito, para que los visitantes conozcan su cronograma.

**Criterios de aceptación**

1. Cada evento pertenece a un hito y tiene nombre y fecha de inicio, y nada más: no lleva fecha de fin ni horario.

2. Si registro en el mismo hito un evento con el mismo nombre y la misma fecha de inicio que otro, el sistema lo rechaza.

3. Se acepta el mismo nombre de evento en otra fecha o en otro hito.

#### **HU-24.2 · Consultar evento cultural (Javier)**

Como administrador quiero consultar los eventos culturales de un hito, para revisar su cronograma.

**Criterios de aceptación**

1. Puedo ver los eventos de un hito, que forman su cronograma.

#### **HU-24.3 · Modificar evento cultural (Javier)**

Como administrador quiero modificar un evento cultural, para corregir su nombre o su fecha de inicio.

**Criterios de aceptación**

1. Puedo cambiar el nombre o la fecha de inicio del evento.

2. Si el evento queda con el mismo nombre y la misma fecha de inicio que otro del mismo hito, el sistema lo rechaza.

3. El evento sigue sin fecha de fin ni horario.

#### **HU-24.4 · Eliminar evento cultural (Javier)**

Como administrador quiero eliminar eventos culturales, para quitar los que ya no se realizan.

**Criterios de aceptación**

1. Puedo eliminar un evento sin afectar al hito.

### **CRUD Rutas dinámicas (Sebastián)**

HU-25.1 Registrar, HU-25.2 Consultar, HU-25.3 Modificar, HU-25.4 Eliminar.

#### **HU-25.1 · Registrar ruta dinámica (Sebastián)**

Como visitante quiero registrar mis propias rutas, eligiendo hitos, orden de visita y transporte, para recorrer lo que me interesa.

**Criterios de aceptación**

1. El visitante elige los hitos, el orden de visita y su preferencia de transporte.

2. La ruta tiene al menos un hito de origen y uno de destino.

3. El visitante marca la ruta como privada o pública; la privada solo la ve él y la pública aparece en el catálogo.

4. Si registro una ruta con el mismo nombre en el mismo municipio y estado de origen que otra, el sistema la rechaza.

5. La ruta tiene duración estimada, mejor horario de inicio y nivel de dificultad, como toda ruta; el visitante puede dejarlos en blanco.

#### **HU-25.2 · Consultar ruta dinámica (Sebastián)**

Como visitante quiero consultar mis rutas, para reutilizarlas cuando quiera.

**Criterios de aceptación**

1. Veo la lista de mis rutas, privadas y públicas.

2. Puedo abrir una ruta y ver sus hitos, su orden y mi preferencia de transporte.

#### **HU-25.3 · Modificar ruta dinámica (Sebastián)**

Como visitante quiero modificar mis rutas, para ajustarlas a lo que quiero recorrer.

**Criterios de aceptación**

1. Solo el visitante que creó la ruta puede modificarla.

2. Puedo cambiar los hitos, el orden de visita y la preferencia de transporte.

3. Puedo pasar la ruta de privada a pública o al revés.

4. La ruta sigue teniendo al menos un hito de origen y uno de destino.

5. Si el nombre queda igual al de otra ruta del mismo municipio y estado de origen, el sistema lo rechaza.

#### **HU-25.4 · Eliminar ruta dinámica (Sebastián)**

Como visitante quiero eliminar mis rutas, para quitar las que ya no uso.

**Criterios de aceptación**

1. Solo el visitante que creó la ruta puede eliminarla.

2. Si la ruta no tiene recorridos ni experiencias, se elimina.

3. Si la ruta ya tiene recorridos o una experiencia transcurre sobre ella, no se borra, porque se conserva su historial.

### **CRUD Funcionarios (Valeria)**

HU-26.1 Registrar, HU-26.2 Consultar, HU-26.3 Modificar, HU-26.4 Eliminar.

#### **HU-26.1 · Registrar funcionario (Valeria)**

Como administrador quiero registrar las cuentas de los funcionarios públicos, para que las autoridades puedan verificar y cerrar incidencias.

**Criterios de aceptación**

1. Cada funcionario se identifica por su cédula y tiene nombre, cargo y una contraseña.

2. Cada funcionario queda asociado a la institución a la que pertenece.

#### **HU-26.2 · Consultar funcionario (Valeria)**

Como administrador quiero consultar los funcionarios, para saber quiénes representan a cada institución.

**Criterios de aceptación**

1. Puedo ver los funcionarios de una institución.

#### **HU-26.3 · Modificar funcionario (Valeria)**

Como administrador quiero modificar las cuentas de los funcionarios, para mantener sus datos al día.

**Criterios de aceptación**

1. Puedo cambiar los datos del funcionario y su institución.

2. El funcionario sigue asociado a una institución.

#### **HU-26.4 · Eliminar funcionario (Valeria)**

Como administrador quiero eliminar cuentas de funcionarios, para quitar las de quienes ya no participan.

**Criterios de aceptación**

1. Si el funcionario no verificó ni cerró ninguna incidencia, se elimina su cuenta.

2. Si verificó o cerró alguna incidencia, el sistema no lo elimina y me indica qué lo impide.

### **CRUD Guías (Sebastián)**

HU-29.1 Registrar, HU-29.2 Consultar, HU-29.3 Modificar, HU-29.4 Eliminar.

#### **HU-29.1 · Registrar guía (Sebastián)**

Como administrador quiero registrar guías y baquianos comunitarios, para que puedan acompañar las rutas.

**Criterios de aceptación**

1. Se identifica por su número de Registro Turístico Nacional junto con su código de licencia; si esa combinación ya existe, el sistema lo rechaza.

2. Tiene acreditación oficial, años de trayectoria, especialidades temáticas, idiomas, tarifa horaria y zona geográfica asignada.

3. Tiene una contraseña para entrar con su identificador.

4. Una misma persona puede ser guía y también visitante.

#### **HU-29.2 · Consultar guía (Sebastián)**

Como administrador quiero consultar los guías registrados, para saber quiénes pueden acompañar las rutas.

**Criterios de aceptación**

1. Puedo ver el listado de los guías.

2. Puedo abrir un guía y ver todos sus datos.

#### **HU-29.3 · Modificar guía (Sebastián)**

Como administrador quiero modificar los datos de un guía, para mantenerlos al día.

**Criterios de aceptación**

1. Puedo cambiar cualquier dato del guía.

2. Si cambio el número de Registro Turístico Nacional o el código de licencia y esa combinación ya existe, el sistema lo rechaza.

#### **HU-29.4 · Eliminar guía (Sebastián)**

Como administrador quiero eliminar guías, para quitar los registros que ya no corresponden.

**Criterios de aceptación**

1. Si el guía no está adscrito a ninguna ruta, no dirige experiencias, no tiene contrataciones y no valida credenciales, se elimina.

2. Si tiene alguna de esas, el sistema no lo elimina.

### **CRUD Comercios (Valeria)**

HU-30.1 Registrar, HU-30.2 Consultar, HU-30.3 Modificar, HU-30.4 Eliminar.

#### **HU-30.1 · Registrar comercio (Valeria)**

Como administrador quiero registrar comercios y aliados de servicio, para que puedan ofrecer sus servicios en las rutas.

**Criterios de aceptación**

1. Se identifica por su RIF jurídico; si ya existe, el sistema lo rechaza.

2. Tiene razón social, categoría comercial (gastronómico, sanitario o alquiler de equipos), aforo, número de permiso sanitario, horario de atención y cuenta bancaria.

3. Si la razón social ya existe, el sistema lo rechaza.

4. Tiene una contraseña para entrar con su RIF.

5. La ubicación del comercio se guarda como latitud, longitud y elevación en decimales.

#### **HU-30.2 · Consultar comercio (Valeria)**

Como administrador quiero consultar los comercios registrados, para saber quiénes ofrecen servicios.

**Criterios de aceptación**

1. Puedo ver el listado de los comercios.

2. Puedo abrir un comercio y ver todos sus datos.

#### **HU-30.3 · Modificar comercio (Valeria)**

Como administrador quiero modificar los datos de un comercio, para mantenerlos al día.

**Criterios de aceptación**

1. Puedo cambiar cualquier dato del comercio.

2. Si cambio el RIF por uno que ya existe, el sistema lo rechaza.

3. Si cambio la razón social por una que ya existe, el sistema lo rechaza.

4. La ubicación sigue guardándose como latitud, longitud y elevación en decimales.

#### **HU-30.4 · Eliminar comercio (Valeria)**

Como administrador quiero eliminar comercios, para quitar los que ya no participan.

**Criterios de aceptación**

1. Si el comercio no tiene experiencias ni credenciales asociadas, se elimina.

2. Si tiene experiencias o credenciales asociadas, el sistema no lo elimina.

### **CRUD Instituciones (Javier)**

HU-31.1 Registrar, HU-31.2 Consultar, HU-31.3 Modificar, HU-31.4 Eliminar.

#### **HU-31.1 · Registrar institución (Javier)**

Como administrador quiero registrar instituciones y entes públicos patrimoniales, para que participen en la verificación de incidencias y el mantenimiento.

**Criterios de aceptación**

1. Se identifica por su RIF institucional; si ya existe, el sistema la rechaza.

2. Tiene denominación oficial, nivel territorial de competencia, nombre del funcionario enlace y decreto oficial de adscripción patrimonial.

3. Si la denominación oficial ya existe, el sistema la rechaza.

4. Tiene una contraseña para entrar con su RIF.

5. Se registran los municipios sobre los que tiene competencia, uno o varios.

#### **HU-31.2 · Consultar institución (Javier)**

Como administrador quiero consultar las instituciones registradas, para saber qué entes participan.

**Criterios de aceptación**

1. Puedo ver el listado de las instituciones.

2. Puedo abrir una institución y ver todos sus datos y los municipios sobre los que tiene competencia.

#### **HU-31.3 · Modificar institución (Javier)**

Como administrador quiero modificar los datos de una institución, para mantenerlos al día.

**Criterios de aceptación**

1. Puedo cambiar cualquier dato de la institución y sus municipios de competencia.

2. Si cambio el RIF por uno que ya existe, el sistema lo rechaza.

3. Si cambio la denominación oficial por una que ya existe, el sistema lo rechaza.

#### **HU-31.4 · Eliminar institución (Javier)**

Como administrador quiero eliminar instituciones, para quitar las que ya no participan.

**Criterios de aceptación**

1. Si la institución no tiene funcionarios asociados, se elimina.

2. Si tiene funcionarios asociados, el sistema no la elimina.

### **CRUD Municipios (Javier)**

HU-33.1 Registrar, HU-33.2 Consultar, HU-33.3 Modificar, HU-33.4 Eliminar.

#### **HU-33.1 · Registrar municipio (Javier)**

Como administrador quiero registrar los municipios de cada estado, para ubicar en el territorio los hitos, las rutas y las vías.

**Criterios de aceptación**

1. Cada municipio pertenece a un estado.

2. Se acepta el mismo nombre de municipio en estados distintos (por ejemplo, Sucre o Libertador).

3. Si registro un municipio con un nombre que ya existe en el mismo estado, el sistema lo rechaza.

#### **HU-33.2 · Consultar municipio (Javier)**

Como administrador quiero consultar los municipios, para ver qué territorio está cargado en cada estado.

**Criterios de aceptación**

1. Puedo ver los municipios de un estado.

#### **HU-33.3 · Modificar municipio (Javier)**

Como administrador quiero modificar un municipio, para corregir su nombre o su estado.

**Criterios de aceptación**

1. Puedo cambiar el nombre o el estado del municipio.

2. Si el municipio queda con el mismo nombre que otro del mismo estado, el sistema lo rechaza.

3. Se acepta el mismo nombre en estados distintos.

#### **HU-33.4 · Eliminar municipio (Javier)**

Como administrador quiero eliminar municipios, para quitar los que se cargaron por error.

**Criterios de aceptación**

1. Si el municipio no tiene parroquias, rutas, vías, instituciones con competencia sobre él ni guías asignados, se elimina.

2. Si tiene alguna de esas, el sistema no lo elimina.

### **CRUD Parroquias (Javier)**

HU-34.1 Registrar, HU-34.2 Consultar, HU-34.3 Modificar, HU-34.4 Eliminar.

#### **HU-34.1 · Registrar parroquia (Javier)**

Como administrador quiero registrar las parroquias de cada municipio, para ubicar los hitos en el territorio.

**Criterios de aceptación**

1. Cada parroquia pertenece a un municipio.

2. Se acepta el mismo nombre de parroquia en municipios distintos (por ejemplo, San José).

3. Si registro una parroquia con un nombre que ya existe en el mismo municipio, el sistema la rechaza.

#### **HU-34.2 · Consultar parroquia (Javier)**

Como administrador quiero consultar las parroquias, para ver qué territorio está cargado en cada municipio.

**Criterios de aceptación**

1. Puedo ver las parroquias de un municipio.

#### **HU-34.3 · Modificar parroquia (Javier)**

Como administrador quiero modificar una parroquia, para corregir su nombre o su municipio.

**Criterios de aceptación**

1. Puedo cambiar el nombre o el municipio de la parroquia.

2. Si la parroquia queda con el mismo nombre que otra del mismo municipio, el sistema lo rechaza.

3. Se acepta el mismo nombre en municipios distintos.

#### **HU-34.4 · Eliminar parroquia (Javier)**

Como administrador quiero eliminar parroquias, para quitar las que se cargaron por error.

**Criterios de aceptación**

1. Si la parroquia no tiene hitos, se elimina.

2. Si tiene hitos, el sistema no la elimina.

### **CRUD Tramos y conexiones (Sebastián)**

HU-35.1 Registrar, HU-35.2 Consultar, HU-35.3 Modificar, HU-35.4 Eliminar.

#### **HU-35.1 · Registrar tramo (Sebastián)**

Como administrador quiero registrar los tramos de cada vía y cómo se conectan entre sí, para poder calcular desplazamientos y desvíos.

**Criterios de aceptación**

1. Cada tramo pertenece a una vía, y una vía tiene uno o más tramos.

2. Para cada tramo se registra si tiene desniveles o escalinatas.

3. Se registra con qué otros tramos se conecta, también de vías distintas.

4. Un tramo no se puede conectar consigo mismo.

#### **HU-35.2 · Consultar tramo (Sebastián)**

Como administrador quiero consultar los tramos de una vía y sus conexiones, para revisar la topología de la red.

**Criterios de aceptación**

1. Puedo ver los tramos de una vía y sus conexiones.

#### **HU-35.3 · Modificar tramo (Sebastián)**

Como administrador quiero modificar un tramo y sus conexiones, para mantener la topología al día.

**Criterios de aceptación**

1. Puedo cambiar los datos del tramo: si tiene desniveles o escalinatas.

2. Puedo agregar o quitar conexiones con otros tramos.

3. Un tramo no se puede conectar consigo mismo.

#### **HU-35.4 · Eliminar tramo (Sebastián)**

Como administrador quiero eliminar tramos, para quitar los que se cargaron por error.

**Criterios de aceptación**

1. Si el tramo no tiene incidencias, paradas ni hitos, se elimina.

2. Si tiene incidencias, paradas o hitos, el sistema no lo elimina.

## **Bloque 2b · CRUD: operaciones del negocio (9)** {#bloque-2b-·-crud:-operaciones-del-negocio-(9)-1}

También crean, leen o actualizan datos, pero con una regla propia del enunciado (reportar, verificar, prorrogar, cerrar, canjear, registrar un recorrido, evaluar, adscribir, entrar). Por eso cuentan como CRUD (§2.1) y van aparte de la gestión de entidades.

### **HU-08 · Iniciar sesión (Valeria)**

Como actor del sistema quiero entrar con mi identificador y mi contraseña, para usar la plataforma según mi rol.

**Criterios de aceptación**

1. El actor entra con su identificador (cédula o pasaporte del visitante, RIF del comercio o de la institución, registro del guía, o cédula del funcionario o del administrador) y su contraseña.

2. Si el identificador o la contraseña no coinciden, el sistema rechaza la entrada.

3. Si la persona tiene varios roles, usa la plataforma con el rol de la interacción que esté haciendo.

### **HU-19 · Reportar incidencia (Javier)**

Como visitante, guía o funcionario quiero reportar una incidencia en un hito o en un tramo de vía, para avisar a los demás usuarios.

**Criterios de aceptación**

1. El sistema asigna un número de reporte correlativo.

2. Se registran la fecha y hora de detección, la fecha estimada de resolución, la narrativa y la severidad: bajo, medio o crítico.

3. La incidencia se asocia a un hito o a un tramo de vía, o a una secuencia de tramos.

4. Se guarda el usuario que la reporta: visitante, guía o funcionario.

5. Si la reporta un visitante o un guía, queda en estado preliminar hasta que un funcionario la verifique.

6. Si la reporta un funcionario, queda activa sin pasar por verificación.

### **HU-20 · Verificar incidencia (Javier)**

Como funcionario quiero verificar las incidencias preliminares, para que solo se publiquen hechos confirmados.

**Criterios de aceptación**

1. Solo un funcionario o autoridad competente puede verificar una incidencia.

2. El funcionario ve la lista de incidencias en estado preliminar.

3. Si el hecho es veraz, la confirma: queda activa y el funcionario ratifica o cambia su severidad.

4. Si el hecho no es veraz, la descarta: la incidencia pasa a estado descartada y no afecta al hito ni al tramo.

### **HU-21 · Registrar recorrido (Sebastián)**

Como visitante quiero que se registre cada recorrido que hago de una ruta, para tener mi historial y poder evaluarla.

**Criterios de aceptación**

1. Al iniciar, el sistema crea un recorrido nuevo con su identificador, el visitante, la ruta y la marca de tiempo de inicio.

2. Solo se pueden recorrer rutas fijas, rutas dinámicas públicas o las rutas propias del visitante.

3. Durante el recorrido se registran los hitos por los que el visitante pasa, cada uno con su fecha y hora.

4. Al terminar se guarda la marca de tiempo de fin, que debe ser posterior a la de inicio, y el estado: completado o abandonado.

5. Si el visitante repite la ruta, se crea un registro nuevo y no se modifica el anterior.

6. Los recorridos quedan en el historial de la ruta.

7. El visitante puede ver la lista de sus recorridos, con su ruta, fechas y estado.

### **HU-22 · Publicar evaluación (Javier)**

Como visitante quiero calificar una ruta o un hito que recorrí, para orientar a otros visitantes.

**Criterios de aceptación**

1. Cada evaluación tiene un código de reseña único.

2. La calificación y la seguridad percibida van de 1 a 5 estrellas; el sistema rechaza valores fuera de ese rango.

3. Se guardan la fecha de emisión y la opinión textual. La marca de recorrido verificado no se escribe a mano: es sí cuando el recorrido que respalda la evaluación está completado, y no cuando está abandonado (solo posible al evaluar un hito).

4. La evaluación se liga a un visitante registrado y a una ruta o a un hito.

5. Para evaluar una ruta, el visitante debe tener un recorrido completado de esa ruta; para evaluar un hito, un recorrido (completado o abandonado) que haya pasado por ese hito. Si no, el sistema rechaza la evaluación.

6. Cada evaluación queda ligada al recorrido que la respalda.

7. El visitante publica una evaluación nueva por cada viaje y las anteriores se conservan: no se actualiza la anterior. Un recorrido respalda como máximo una evaluación de su ruta y una por cada hito que transitó.

### **HU-27 · Canjear credencial (Valeria)**

Como comercio o guía quiero canjear la credencial de un visitante, para darle acceso.

**Criterios de aceptación**

1. Solo puede canjearla el aliado comercial o el guía asociado a esa credencial.

2. Si la credencial ya fue canjeada, está cancelada o está vencida, el sistema rechaza el canje.

3. Si se intenta canjear fuera del horario operativo autorizado para su fecha, el sistema lo rechaza.

4. Al canjearse, la credencial pasa a estado canjeado.

### **HU-28 · Asignar guías a una ruta fija (Sebastián)**

Como administrador quiero adscribir guías locales a una ruta fija, para ofrecer acompañamiento y narración histórica.

**Criterios de aceptación**

1. A una ruta fija se le pueden adscribir uno o más guías.

2. Solo se pueden adscribir guías que ya están registrados en el sistema.

3. Se puede quitar la adscripción de un guía.

4. La ficha de la ruta fija muestra sus guías adscritos.

### **HU-36 · Prorrogar incidencia (Javier)**

Como funcionario quiero prorrogar la fecha estimada de resolución de una incidencia, para que siga activa mientras se resuelve.

**Criterios de aceptación**

1. Solo un funcionario o autoridad competente puede prorrogar una incidencia.

2. La prórroga exige una justificación; sin ella, el sistema la rechaza.

3. La nueva fecha estimada debe ser posterior a la anterior.

4. Se guarda la prórroga con su nueva fecha y su justificación.

5. Una incidencia activa pasa a estado vencida si se supera su fecha estimada de resolución sin una prórroga justificada, y deja de afectar al hito o al tramo.

### **HU-37 · Cerrar incidencia (Javier)**

Como funcionario de la institución responsable quiero cerrar una incidencia resuelta, para que deje de afectar al hito o al tramo.

**Criterios de aceptación**

1. Solo la autoridad institucional responsable puede cerrar la incidencia: un funcionario de una institución con competencia sobre el municipio del hito o del tramo afectado.

2. Solo se cierran incidencias en estado activa: una preliminar primero se verifica, y las descartadas o vencidas no se cierran.

3. Al cerrarse, la incidencia pasa a estado resuelta y se guarda la fecha de cierre.

## **Bloque 3 · Reportes (3)** {#bloque-3-·-reportes-(3)-1}

Salidas de información estratégica para un rol. Enunciado §2.1: *"deben redactarse como requisitos que justifiquen qué información estratégica necesita el rol interesado"*. Hay al menos un reporte por integrante.

### **RP-1 · Estado de conservación e incidencias por territorio (Javier)**

Como institución quiero ver el estado de conservación de los hitos y sus incidencias por territorio, para tomar decisiones de mantenimiento.

**Criterios de aceptación**

1. Se puede filtrar por estado y por municipio.

2. Muestra cuántos hitos hay en cada estado operativo: disponible, en restauración, clausurado temporalmente y cerrado permanentemente.

3. Muestra cuántas incidencias en estado activa hay, sin contar las descartadas ni las vencidas, y cuántas son críticas.

4. Muestra los días promedio de resolución, calculados entre la fecha de detección y la fecha de cierre, sobre las incidencias en estado resuelta del territorio filtrado.

### **RP-2 · Desempeño de experiencias y credenciales (Valeria)**

Como comercio o guía quiero ver los cupos usados, las credenciales canjeadas y el monto de cada experiencia, para medir mis ventas.

**Criterios de aceptación**

1. Cada comercio o guía ve solo sus propias experiencias.

2. Para cada experiencia muestra su cupo máximo y los días que faltan para su vencimiento.

3. Muestra cuántas credenciales amparadas por la experiencia se emitieron, canjearon, cancelaron y vencieron, y el monto total abonado, sin contar las credenciales canceladas.

### **RP-3 · Afluencia y calidad percibida por ruta (Sebastián)**

Como institución turística, o como funcionario de ella, quiero ver la afluencia y la calificación de cada ruta, para tomar decisiones de planificación.

**Criterios de aceptación**

1. Para cada ruta muestra cuántos recorridos se iniciaron, cuántos se completaron y cuántos se abandonaron, y el porcentaje de finalización.

2. Muestra la calificación promedio y la seguridad percibida promedio de todas sus evaluaciones, incluidas las de un mismo visitante en viajes distintos.

3. Se puede filtrar por rango de fechas.

4. Muestra el hito más visitado de la ruta, según los hitos por los que pasaron sus recorridos.

5. La institución o su funcionario ven las rutas de los municipios donde la institución tiene competencia, y pueden filtrar por estado y municipio.

6. No se listan las rutas dinámicas privadas de los visitantes.

## **Bloque 4 · Valor agregado (4)** {#bloque-4-·-valor-agregado-(4)-1}

Enunciado §2.1: *"propongan interacciones innovadoras que enriquezcan la experiencia de la plataforma"*.

### **VA-1 · Tiempos reales de una ruta (Sebastián)**

Como visitante quiero ver cuánto tardaron en promedio otros visitantes entre los hitos de una ruta y en qué hito suelen abandonarla, para planificar mi tiempo.

*Propone: el equipo. Desarrolla: Sebastián.*

**Criterios de aceptación**

1. Al elegir una ruta, el sistema muestra su secuencia de hitos y, por cada hito, el porcentaje de recorridos que pasó por él.

2. Indica el hito después del cual más recorridos se abandonan.

3. Muestra el tiempo promedio entre hitos consecutivos, calculado con la fecha y hora en que cada recorrido pasó por cada hito.

4. Se puede filtrar por rango de fechas.

5. Si la ruta no tiene recorridos registrados, el sistema lo indica.

**Por qué es propia:** depende de que RECORRIDO sea una entidad con los hitos transitados y su fecha y hora, una corrección que este equipo hizo. No usa el módulo de recomendación del enunciado §1.

### **VA-2 · Desvío por incidencia (Sebastián)**

Como visitante o guía quiero que el sistema me proponga un desvío cuando un tramo de mi ruta tiene una incidencia, para poder seguir el recorrido.

*Propone: Valeria. Desarrolla: Sebastián.*

**Criterios de aceptación**

1. Si un tramo de la ruta tiene una incidencia en estado activa, el sistema avisa y propone el desvío al visitante o al guía; si está en estado preliminar, solo muestra un aviso informativo y no desvía.

2. El sistema muestra los tramos conectados al tramo afectado que no tienen incidencias activas y cuya vía permite el modo de transporte de quien recorre: en una ruta dinámica, su preferencia de transporte; en una ruta fija, el modo que elige el visitante o el guía.

3. Si ningún tramo conectado cumple las condiciones, el sistema lo indica.

### **VA-3 · Contratación de guía (Sebastián)**

Como visitante quiero contratar un guía local para una ruta fija, para recorrerla acompañado y con narración histórica.

*Propone: Valeria. Desarrolla: Sebastián.*

**Criterios de aceptación**

1. Al elegir una ruta fija, el visitante ve los guías adscritos a ella con sus idiomas, especialidades y tarifa horaria.

2. Solo se pueden contratar guías adscritos a esa ruta fija.

3. La contratación queda registrada con el visitante, el guía, la ruta y la fecha.

### **VA-4 · Semáforo de seguridad de una ruta (Javier)**

Como visitante quiero ver un nivel de seguridad de cada ruta antes de elegirla, combinando la seguridad que percibieron otros visitantes con las incidencias activas en sus hitos y tramos, para evitar rutas riesgosas.

*Propone: el equipo. Desarrolla: Javier.*

**Criterios de aceptación**

1. Al ver una ruta, el sistema muestra su nivel de seguridad: verde, amarillo o rojo.

2. El nivel sale del promedio de la seguridad percibida de las evaluaciones de la ruta y de las incidencias en estado activa en sus hitos y en los tramos donde están sus hitos y paradas.

3. Es verde si el promedio es 4 o más y no hay incidencias activas; rojo si el promedio es menor de 3 o hay alguna incidencia crítica activa; amarillo en los demás casos.

4. Si la ruta no tiene evaluaciones, el nivel se calcula solo con sus incidencias y el sistema indica que aún no hay valoraciones.

5. El visitante puede ver las incidencias activas que explican el nivel.

**Por qué es propia:** el enunciado da la seguridad percibida como un dato más de la evaluación. Cruzarla con las incidencias para dar un nivel al visitante no está en ningún módulo de §1.

## **Notas** {#notas}

* **La institución también entra a la plataforma:** el enunciado dice que *"cada actor del sistema se autenticará mediante… su identificador (Cédula, RIF, etc) y una contraseña"*, y la institución es un actor (HU-31). Además entran sus funcionarios (HU-26).

* **Cuentas de administrador:** crearlas es parte de la seguridad lógica (roles, cuentas y privilegios), que es de la Entrega 2\.

* **Lo que no entra:** la seguridad lógica es de la Entrega 2\.
