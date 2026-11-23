# Historias de usuario y criterios de aceptación — primera entrega

Material extraído de **RutasVenezuela_Entrega1 (2).pdf**, Anexo A. Se conserva el contenido de los criterios sin introducir cambios de comportamiento; se suprimen saltos de página y encabezados editoriales. **103 historias, 324 criterios**. No incluye datos personales de los integrantes.

La relación HU↔capacidad↔mockup↔RR está en [trazabilidad detallada](../trazabilidad-detallada.csv). Este archivo es referencia académica y evita copiar los códigos HU a cada especificación del dominio.

## HU-01 — Ficha del hito y sus rutas (Javier)

Como visitante quiero ver la ficha integral de un hito y en qué rutas está incluido, para decidir cuál recorrer.

1. El visitante elige un hito y el sistema muestra su ficha: nombre, categorías, estado operativo, horario de visita o libre acceso, ubicación (latitud, longitud y elevación), estado, municipio y parroquia, y sus eventos culturales.
2. El sistema lista las rutas fijas y dinámicas que incluyen ese hito.
3. Las rutas dinámicas privadas de otros visitantes no aparecen.
4. Si el hito no está en ninguna ruta, el sistema lo indica.

---

## HU-02 — Recursos 3D cercanos (Javier)

Como visitante quiero recuperar los recursos 3D de los hitos cercanos a mi posición, para ver los elementos virtuales en la cámara.

1. La app envía la latitud, la longitud y la elevación de origen del visitante.
2. Un punto de anclaje se considera cercano si el origen está dentro de su radio efectivo de activación.
3. La distancia se calcula con funciones trigonométricas sobre los decimales, sin tipos espaciales.
4. Para cada anclaje cercano devuelve su recurso 3D y los parámetros para proyectarlo: altitud, azimut, inclinación, rotación y escala.
5. Para cada recurso devuelve su formato y su ruta de almacenamiento, para que la app lo descargue.
6. Para cada anclaje devuelve también sus hipervínculos informativos.
7. Si no hay anclajes cercanos, el sistema lo indica.

---

## HU-03 — Rutas por categoría y territorio (Sebastián)

Como visitante quiero listar las rutas urbanas de una categoría en un municipio o en un estado, para elegir qué recorrer en esa zona.

1. El visitante elige una categoría y un municipio o un estado.
2. El sistema lista las rutas que incluyen al menos un hito de esa categoría y cuyo origen está en el municipio o el estado elegido.
3. Aparecen las rutas fijas y las rutas dinámicas públicas; las dinámicas privadas no aparecen.
4. Si no hay rutas que cumplan el filtro, el sistema lo indica.

---

## HU-04 — Servicios en un recorrido (Sebastián)

Como visitante quiero ver los servicios de una tipología disponibles a lo largo de una ruta y el tiempo estimado para llegar a cada uno, para planificar mis paradas.

1. El visitante elige una ruta y una tipología de servicio, que es la categoría comercial del comercio: gastronómico, sanitario o alquiler de equipos.
2. El sistema lista los comercios de esa tipología que están a 500 m o menos de algún hito o parada de la ruta.
3. Para cada comercio muestra el tiempo estimado de llegada, calculado desde el inicio de la ruta o desde la posición actual del visitante, según elija.
4. Desde el inicio, la distancia es la suma de las distancias entre los hitos y paradas consecutivos de la secuencia hasta el hito o parada más cercano al comercio, más la distancia de ese punto al comercio; desde la posición actual, es la distancia en línea recta.
5. El tiempo es la distancia dividida entre la velocidad fija del modo de transporte del visitante: a pie 5 km/h, bicicleta 15 km/h, transporte público 20 km/h y vehículo adaptado 20 km/h.
6. La distancia se calcula con latitud, longitud y elevación en decimales, con funciones trigonométricas y sin tipos espaciales.
7. Si no hay comercios de esa tipología en la ruta, el sistema lo indica.

---

## HU-05 — Paradas de transbordo operativas (Sebastián)

Como visitante quiero ver las paradas de transporte de una ruta y saber si sus vías adyacentes están operativas, para hacer transbordo con seguridad.

1. El visitante elige una ruta y el sistema lista las paradas que forman parte de su secuencia.
2. Para cada parada muestra su estado (activa, en mantenimiento o fuera de servicio) y si el tramo de vía donde está, o los tramos conectados a él, tienen incidencias activas. Las incidencias preliminares (aún sin verificar) se muestran como aviso.
3. Una parada cuya vía tiene cierre total por mantenimiento no se ofrece como opción de transbordo.
4. Una incidencia que afecta solo un tramo no marca como afectada toda la vía.

---

## HU-06 — Valoraciones de una ruta (Valeria)

Como visitante quiero ver las valoraciones, las observaciones de seguridad y los comentarios de una ruta, para saber si me conviene.

1. El visitante elige una ruta y el sistema lista sus evaluaciones con la calificación, la seguridad percibida, la fecha y la opinión.
2. Cada evaluación indica si tiene la marca de recorrido verificado. En las evaluaciones de una ruta la marca siempre es sí, porque exigen un recorrido completado.
3. Si la ruta no tiene evaluaciones, el sistema lo indica.
4. Un mismo visitante puede aparecer varias veces en la lista, porque publica una evaluación por cada recorrido.

---

## HU-07 — Validar credencial (Valeria)

Como comercio o guía quiero validar la autenticidad de una credencial digital, para saber si puedo darle acceso al visitante.

1. Al ingresar un código de credencial, el sistema indica si existe y en qué estado está: emitido, canjeado, cancelado o vencido.
2. La credencial solo se considera válida si está emitida y la fecha y hora programadas corresponden al horario autorizado.
3. Si el código no existe, el sistema indica que la credencial no es auténtica.

---

## HU-32 — Experiencias vigentes de un recorrido (Valeria)

Como visitante quiero ver las experiencias promocionales vigentes de una ruta, para aprovechar las promociones durante el recorrido.

1. El visitante elige una ruta y el sistema lista sus experiencias vigentes: las que tienen la fecha actual entre su fecha de activación y su fecha de vencimiento.
2. Para cada experiencia muestra título, descripción, precio, porcentaje de descuento, cupo y código promocional si lo tiene.
3. Si la ruta no tiene experiencias vigentes, el sistema lo indica.

---

## HU-09.1 — Registrar visitante (Valeria)

Como administrador quiero registrar visitantes, para que puedan usar la plataforma.

1. Se identifica por su cédula de identidad o pasaporte; si ya existe, el sistema lo rechaza.
2. Tiene nombres, apellidos, país de origen, idioma nativo, teléfono de emergencia, grupo sanguíneo y especificaciones de accesibilidad física o sensorial.
3. Tiene una contraseña para entrar con su identificador.
4. Una misma persona puede ser visitante y también tener otro rol, por ejemplo guía.

---

## HU-09.2 — Consultar visitante (Valeria)

Como administrador quiero consultar los visitantes registrados, para revisar quiénes usan la plataforma.

1. Puedo ver el listado de todos los visitantes.
2. Puedo abrir un visitante y ver todos sus datos.

---

## HU-09.3 — Modificar visitante (Valeria)

Como administrador quiero modificar los datos de un visitante, para mantenerlos al día.

1. Puedo cambiar cualquier dato del visitante.
2. Si cambio su cédula o pasaporte por uno que ya existe, el sistema lo rechaza.

---

## HU-09.4 — Eliminar visitante (Valeria)

Como administrador quiero eliminar visitantes, para quitar los registros que ya no corresponden.

1. Si el visitante no tiene recorridos, evaluaciones, credenciales, rutas propias ni contrataciones de guía, se elimina.
2. Si tiene recorridos, evaluaciones, credenciales, rutas propias o contrataciones de guía, el sistema no lo elimina y me indica qué lo impide.

---

## HU-10.1 — Registrar hito (Javier)

Como administrador quiero registrar hitos, para que los visitantes encuentren los puntos de interés.

1. Cada hito tiene nombre, al menos una categoría, estado operativo y horario de visita o la marca de libre acceso.
2. El estado operativo es uno de estos: disponible, en restauración, clausurado temporalmente o cerrado permanentemente.
3. La ubicación se guarda como latitud, longitud y elevación en decimales; si el hito está dentro de una estructura (por ejemplo, un piso de un edificio), también su altura dentro de ella.
4. El hito se ubica en una parroquia, con su municipio y su estado.
5. El hito puede ubicarse sobre un tramo de vía (es opcional: un hito en un sendero sin registrar queda sin tramo).
6. Si registro un hito con un nombre que ya existe en la misma parroquia, el mismo municipio y el mismo estado, el sistema lo rechaza.
7. Si registro un hito con la misma latitud, longitud y elevación que otro, el sistema lo acepta.

---

## HU-10.2 — Consultar hito (Javier)

Como administrador quiero consultar los hitos registrados, para revisar qué hay cargado y con qué datos.

1. Puedo ver el listado de todos los hitos.
2. Puedo abrir un hito y ver todos sus datos: nombre, categorías, estado operativo, horario o libre acceso, ubicación, parroquia, municipio, estado y tramo si lo tiene.

---

## HU-10.3 — Modificar hito (Javier)

Como administrador quiero modificar los datos de un hito, para mantener la información al día, por ejemplo cuando cambia su estado operativo.

1. Puedo cambiar cualquier dato del hito: nombre, categorías, estado operativo, horario o libre acceso, ubicación, parroquia y tramo.
2. El nuevo estado operativo es uno de los cuatro permitidos: disponible, en restauración, clausurado temporalmente o cerrado permanentemente.
3. Si dejo el hito sin ninguna categoría, el sistema lo rechaza.
4. Si cambio el nombre o la parroquia y el hito queda con el mismo nombre que otro de la misma parroquia, municipio y estado, el sistema lo rechaza.
5. Si cambio la ubicación a la misma latitud, longitud y elevación que otro hito, el sistema lo acepta.

---

## HU-10.4 — Eliminar hito (Javier)

Como administrador quiero eliminar hitos, para quitar los que se cargaron por error.

1. Si el hito no forma parte de ninguna ruta y no tiene anclajes, eventos, evaluaciones ni incidencias, se elimina.
2. Si el hito forma parte de una ruta o tiene anclajes, eventos, evaluaciones o incidencias, el sistema no lo elimina y me indica qué lo impide.
3. En ese caso puedo marcar el hito como cerrado permanentemente.

---

## HU-11.1 — Registrar categoría de hito (Javier)

Como administrador quiero registrar categorías de hito, para clasificar los puntos de interés.

1. Si registro una categoría con una denominación que ya existe, el sistema la rechaza.
2. Un hito se puede asociar a una o varias categorías.

---

## HU-11.2 — Consultar categoría de hito (Javier)

Como administrador quiero consultar las categorías de hito, para saber con cuáles se clasifican los puntos de interés.

1. Puedo ver el listado de las categorías.

---

## HU-11.3 — Modificar categoría de hito (Javier)

Como administrador quiero modificar una categoría de hito, para corregir su denominación.

1. Puedo cambiar la denominación de la categoría.
2. Si cambio la denominación por una que ya existe, el sistema lo rechaza.

---

## HU-11.4 — Eliminar categoría de hito (Javier)

Como administrador quiero eliminar categorías de hito, para quitar las que ya no se usan.

1. Si la categoría no es la única de ningún hito, se elimina y deja de aparecer en los hitos que la tenían.
2. Si la categoría es la única de algún hito, el sistema no la elimina.

---

## HU-12.1 — Registrar estado (Javier)

Como administrador quiero registrar los estados del país, para ubicar en el territorio los hitos, las rutas y las vías.

1. Si registro un estado con un nombre que ya existe, el sistema lo rechaza.

---

## HU-12.2 — Consultar estado (Javier)

Como administrador quiero consultar los estados registrados, para ver qué territorio está cargado.

1. Puedo ver el listado de los estados.

---

## HU-12.3 — Modificar estado (Javier)

Como administrador quiero modificar un estado, para corregir su nombre.

1. Puedo cambiar el nombre del estado.
2. Si cambio el nombre por uno que ya existe, el sistema lo rechaza.

---

## HU-12.4 — Eliminar estado (Javier)

Como administrador quiero eliminar estados, para quitar los que se cargaron por error.

1. Si el estado no tiene municipios, se elimina.
2. Si tiene municipios, el sistema no lo elimina.

---

## HU-13.1 — Registrar punto de anclaje (Javier)

Como administrador quiero registrar puntos de anclaje de un hito, para que la app sobreponga los elementos 3D cuando el usuario enfoca la cámara.

1. Cada anclaje tiene latitud, longitud, altitud respecto al suelo, azimut, inclinación, rotación, radio de activación en metros y escala, todos como decimales.
2. El anclaje pertenece a un hito y se identifica dentro de ese hito.
3. Cada anclaje usa exactamente un recurso 3D ya registrado.
4. La altitud del anclaje se guarda aparte de la elevación del hito y no se calcula a partir de ella.
5. Cada anclaje puede tener uno o varios hipervínculos informativos.

---

## HU-13.2 — Consultar punto de anclaje (Javier)

Como administrador quiero consultar los puntos de anclaje de un hito, para revisar cómo se proyecta su contenido 3D.

1. Puedo ver los anclajes de un hito con su recurso 3D.
2. Puedo abrir un anclaje y ver todos sus parámetros y sus hipervínculos.

---

## HU-13.3 — Modificar punto de anclaje (Javier)

Como administrador quiero modificar un punto de anclaje, para ajustar su posición, sus parámetros o su recurso 3D.

1. Puedo cambiar sus parámetros (latitud, longitud, altitud respecto al suelo, azimut, inclinación, rotación, radio de activación y escala) y sus hipervínculos, siempre como decimales.
2. Puedo cambiar su recurso 3D por otro ya registrado; el anclaje sigue usando exactamente uno.
3. La altitud del anclaje sigue guardándose aparte de la elevación del hito.

---

## HU-13.4 — Eliminar punto de anclaje (Javier)

Como administrador quiero eliminar puntos de anclaje, para quitar los que ya no se usan.

1. Al eliminar un anclaje se eliminan también sus hipervínculos.
2. Al eliminar un anclaje, su recurso 3D no se elimina.

---

## HU-14.1 — Registrar recurso 3D (Javier)

Como administrador quiero registrar recursos tridimensionales, para proyectarlos en la realidad aumentada.

1. Cada recurso tiene su identificador (el código del archivo digital), formato, versión, tamaño en MB, descripción y ruta de almacenamiento.
2. Si registro un recurso con un identificador que ya existe, el sistema lo rechaza.

---

## HU-14.2 — Consultar recurso 3D (Javier)

Como administrador quiero consultar los recursos tridimensionales, para saber cuáles hay y dónde se usan.

1. Puedo ver el listado de los recursos.
2. Puedo ver en qué anclajes se usa cada recurso.

---

## HU-14.3 — Modificar recurso 3D (Javier)

Como administrador quiero modificar un recurso tridimensional, para actualizar su versión o su ruta de almacenamiento.

1. Puedo cambiar sus datos, por ejemplo la versión o la ruta de almacenamiento.
2. Si cambio el identificador por uno que ya existe, el sistema lo rechaza.

---

## HU-14.4 — Eliminar recurso 3D (Javier)

Como administrador quiero eliminar recursos tridimensionales, para quitar los que ya no se usan.

1. Si ningún anclaje usa el recurso, se elimina.
2. Si algún anclaje lo usa, el sistema no lo elimina.

---

## HU-15.1 — Registrar vía (Sebastián)

Como administrador quiero registrar vías, para tener la red física sobre la que pasan las rutas.

1. Cada vía tiene nombre, tipo (calle, avenida, bulevar, caminería, sendero, puente u otro), modos de recorrido permitidos (a pie, bicicleta, transporte público o vehículo adaptado) y condiciones del terreno.
2. La vía se ubica en un municipio y un estado.
3. Si registro una vía con el mismo nombre en el mismo municipio y estado que otra, el sistema la rechaza.
4. La vía tiene un estado que indica si está habilitada o tiene cierre total por mantenimiento.

---

## HU-15.2 — Consultar vía (Sebastián)

Como administrador quiero consultar las vías registradas, para revisar la red física y su estado.

1. Puedo ver las vías de un municipio con su estado.
2. Puedo abrir una vía y ver su tipo, sus modos de recorrido permitidos y las condiciones del terreno.

---

## HU-15.3 — Modificar vía (Sebastián)

Como administrador quiero modificar los datos y el estado de una vía, para mantener la red al día.

1. Puedo cambiar sus datos y su estado (habilitada o con cierre total por mantenimiento).
2. Si cambio el nombre, el municipio o el estado y la vía queda con el mismo nombre que otra del mismo municipio y estado, el sistema lo rechaza.
3. El tipo y los modos de recorrido siguen siendo de los valores permitidos.

---

## HU-15.4 — Eliminar vía (Sebastián)

Como administrador quiero eliminar vías, para quitar las que se cargaron por error.

1. Si la vía no tiene paradas asociadas, se elimina junto con sus tramos, siempre que ningún tramo tenga incidencias o hitos.
2. Si la vía tiene paradas asociadas, el sistema no la elimina.

---

## HU-16.1 — Registrar parada de transporte (Sebastián)

Como administrador quiero registrar paradas de transporte, para que los visitantes sepan dónde hacer transbordo.

1. Si registro una parada con un código oficial de terminal que ya existe, el sistema la rechaza.
2. Cada parada tiene nombre, modalidad, tarifa básica en moneda nacional, nivel de adecuación para discapacidad, horario de apertura y cierre, frecuencia de paso en minutos y aforo máximo.
3. Su estado es uno de estos: activa, en mantenimiento o fuera de servicio.
4. Se indica si tiene techo, iluminación nocturna, taquilla, vigilancia y estacionamiento o resguardo de bicicletas.
5. La ubicación se guarda como latitud, longitud y elevación en decimales.
6. No se puede registrar una parada sin asociarla a una vía habilitada, indicando el tramo de esa vía donde está.
7. Se puede asociar la parada con los hitos cercanos y con las rutas que usan su modalidad.

---

## HU-16.2 — Consultar parada de transporte (Sebastián)

Como administrador quiero consultar las paradas de transporte, para revisar dónde están y en qué estado.

1. Puedo ver las paradas de una vía con su estado.
2. Puedo abrir una parada y ver todos sus datos, su tramo, los hitos cercanos y las rutas asociadas.

---

## HU-16.3 — Modificar parada de transporte (Sebastián)

Como administrador quiero modificar los datos y el estado de una parada, para mantenerla al día.

1. Puedo cambiar sus datos y su estado: activa, en mantenimiento o fuera de servicio.
2. Si cambio el código oficial de terminal por uno que ya existe, el sistema lo rechaza.
3. La parada sigue asociada a una vía habilitada, con el tramo donde está; si la cambio de vía, también indico el tramo.
4. Puedo cambiar los hitos cercanos y las rutas asociadas.

---

## HU-16.4 — Eliminar parada de transporte (Sebastián)

Como administrador quiero eliminar paradas de transporte, para quitar las que ya no existen.

1. Si la parada no forma parte de ninguna ruta, se elimina.
2. Si forma parte de una ruta, el sistema no la elimina.

---

## HU-17.1 — Registrar ruta fija (Sebastián)

Como administrador quiero registrar rutas fijas, para ofrecer recorridos prediseñados por expertos.

1. La ruta es una secuencia ordenada de hitos y paradas con número de orden; el primero es el origen y el último el destino.
2. La ruta tiene al menos un hito de origen y uno de destino.
3. No hay dos elementos con el mismo número de orden en la ruta.
4. La ruta tiene duración estimada, mejor horario de inicio y nivel de dificultad.
5. Si registro una ruta con el mismo nombre en el mismo municipio y estado de origen que otra, el sistema la rechaza. El mismo nombre sí se acepta en otro municipio o estado.

---

## HU-17.2 — Consultar ruta fija (Sebastián)

Como administrador quiero consultar las rutas fijas, para revisar qué recorridos se ofrecen.

1. Puedo ver el listado de las rutas fijas.
2. Puedo abrir una ruta y ver su secuencia, su duración, su horario, su dificultad y sus guías.

---

## HU-17.3 — Modificar ruta fija (Sebastián)

Como administrador quiero modificar una ruta fija, para corregir sus datos o su secuencia.

1. Puedo cambiar sus datos y su secuencia de hitos y paradas.
2. La ruta sigue teniendo al menos un hito de origen y uno de destino.
3. No puede haber dos elementos con el mismo número de orden.
4. La ruta sigue teniendo duración estimada, mejor horario de inicio y nivel de dificultad.
5. Si el nombre queda igual al de otra ruta del mismo municipio y estado de origen, el sistema lo rechaza; en otro municipio o estado se acepta.

---

## HU-17.4 — Eliminar ruta fija (Sebastián)

Como administrador quiero eliminar rutas fijas, para quitar las que se cargaron por error.

1. Si la ruta no tiene recorridos, experiencias ni contrataciones de guía, se elimina.
2. Si tiene recorridos, experiencias o contrataciones de guía, no se borra, porque se conserva su historial.

---

## HU-18.1 — Registrar experiencia promocional (Valeria)

Como comercio o guía quiero registrar experiencias promocionales, para atraer visitantes a mis servicios.

1. Si registro una experiencia con el mismo título y la misma fecha de activación que otra, el sistema la rechaza.
2. Cada experiencia tiene descripción, precio total, cupo máximo por grupo, porcentaje de descuento y fecha de vencimiento; el código promocional es opcional.
3. Si la fecha de vencimiento no es posterior a la de activación, el sistema la rechaza.
4. Si el cupo es menor que una persona, el sistema la rechaza.
5. La experiencia se vincula al comercio que la promueve, al guía certificado que la dirige, a la ruta del recorrido y a los hitos o comercios (servicios) que incluye.

---

## HU-18.2 — Consultar experiencia promocional (Valeria)

Como comercio o guía quiero consultar mis experiencias promocionales, para saber cuáles tengo publicadas.

1. Veo la lista de mis experiencias.
2. Puedo abrir una experiencia y ver sus datos y sus vínculos.

---

## HU-18.3 — Modificar experiencia promocional (Valeria)

Como comercio o guía quiero modificar mis experiencias promocionales, para ajustar su oferta.

1. Solo el comercio que promueve la experiencia o el guía que la dirige puede modificarla.
2. Si el título y la fecha de activación quedan iguales a los de otra experiencia, el sistema lo rechaza.
3. Si la fecha de vencimiento no es posterior a la de activación, el sistema lo rechaza.
4. Si el cupo queda menor que una persona, el sistema lo rechaza.

---

## HU-18.4 — Eliminar experiencia promocional (Valeria)

Como comercio o guía quiero eliminar mis experiencias promocionales, para retirar las que ya no ofrezco.

1. Solo el comercio que promueve la experiencia o el guía que la dirige puede eliminarla.
2. Si ninguna credencial se adquirió bajo la experiencia, se elimina.
3. Si hay credenciales adquiridas bajo la experiencia, el sistema no la elimina y me indica qué lo impide.

---

## HU-23.1 — Adquirir credencial digital (Valeria)

Como visitante quiero adquirir una credencial digital, para entrar a un recinto pagado o reservar un servicio.

1. El sistema genera un código alfanumérico de verificación único.
2. La credencial tiene fecha y hora programadas para la visita, monto abonado y cantidad de beneficiarios.
3. Se vincula al visitante que la adquiere, al hito o comercio (servicio) reservado y al aliado comercial o guía que validará la entrada.
4. Si la credencial se adquiere bajo una experiencia promocional, queda vinculada a ella; si no, queda sin experiencia.
5. Al emitirse queda en estado emitido.

---

## HU-23.2 — Consultar credencial digital (Valeria)

Como visitante quiero consultar mis credenciales digitales, para saber cuáles tengo y en qué estado están.

1. Veo la lista de mis credenciales con su estado.
2. Si pasa la fecha programada sin canjearse, la credencial aparece como vencida.

---

## HU-23.3 — Cancelar credencial digital (Valeria)

Como visitante quiero cancelar una credencial digital, para no usar una reserva que ya no necesito. Este es el borrado del CRUD: la credencial no se modifica ni se elimina, se cancela.

1. Puedo cancelar una credencial emitida; pasa a estado cancelado y ya no se puede canjear.
2. Si la credencial ya fue canjeada, está vencida o ya está cancelada, el sistema no me deja cancelarla.

---

## HU-24.1 — Registrar evento cultural (Javier)

Como administrador quiero registrar los eventos culturales de un hito, para que los visitantes conozcan su cronograma.

1. Cada evento pertenece a un hito y tiene nombre y fecha de inicio, y nada más: no lleva fecha de fin ni horario.
2. Si registro en el mismo hito un evento con el mismo nombre y la misma fecha de inicio que otro, el sistema lo rechaza.
3. Se acepta el mismo nombre de evento en otra fecha o en otro hito.

---

## HU-24.2 — Consultar evento cultural (Javier)

Como administrador quiero consultar los eventos culturales de un hito, para revisar su cronograma.

1. Puedo ver los eventos de un hito, que forman su cronograma.

---

## HU-24.3 — Modificar evento cultural (Javier)

Como administrador quiero modificar un evento cultural, para corregir su nombre o su fecha de inicio.

1. Puedo cambiar el nombre o la fecha de inicio del evento.
2. Si el evento queda con el mismo nombre y la misma fecha de inicio que otro del mismo hito, el sistema lo rechaza.
3. El evento sigue sin fecha de fin ni horario.

---

## HU-24.4 — Eliminar evento cultural (Javier)

Como administrador quiero eliminar eventos culturales, para quitar los que ya no se realizan.

1. Puedo eliminar un evento sin afectar al hito.

---

## HU-25.1 — Registrar ruta dinámica (Sebastián)

Como visitante quiero registrar mis propias rutas, eligiendo hitos, orden de visita y transporte, para recorrer lo que me interesa.

1. El visitante elige los hitos, el orden de visita y su preferencia de transporte.
2. La ruta tiene al menos un hito de origen y uno de destino.
3. El visitante marca la ruta como privada o pública; la privada solo la ve él y la pública aparece en el catálogo.
4. Si registro una ruta con el mismo nombre en el mismo municipio y estado de origen que otra, el sistema la rechaza.
5. La ruta tiene duración estimada, mejor horario de inicio y nivel de dificultad, como toda ruta; el visitante puede dejarlos en blanco.

---

## HU-25.2 — Consultar ruta dinámica (Sebastián)

Como visitante quiero consultar mis rutas, para reutilizarlas cuando quiera.

1. Veo la lista de mis rutas, privadas y públicas.
2. Puedo abrir una ruta y ver sus hitos, su orden y mi preferencia de transporte.

---

## HU-25.3 — Modificar ruta dinámica (Sebastián)

Como visitante quiero modificar mis rutas, para ajustarlas a lo que quiero recorrer.

1. Solo el visitante que creó la ruta puede modificarla.
2. Puedo cambiar los hitos, el orden de visita y la preferencia de transporte.
3. Puedo pasar la ruta de privada a pública o al revés.
4. La ruta sigue teniendo al menos un hito de origen y uno de destino.
5. Si el nombre queda igual al de otra ruta del mismo municipio y estado de origen, el sistema lo rechaza.

---

## HU-25.4 — Eliminar ruta dinámica (Sebastián)

Como visitante quiero eliminar mis rutas, para quitar las que ya no uso.

1. Solo el visitante que creó la ruta puede eliminarla.
2. Si la ruta no tiene recorridos ni experiencias, se elimina.
3. Si la ruta ya tiene recorridos o una experiencia transcurre sobre ella, no se borra, porque se conserva su historial.

---

## HU-26.1 — Registrar funcionario (Valeria)

Como administrador quiero registrar las cuentas de los funcionarios públicos, para que las autoridades puedan verificar y cerrar incidencias.

1. Cada funcionario se identifica por su cédula y tiene nombre, cargo y una contraseña.
2. Cada funcionario queda asociado a la institución a la que pertenece.

---

## HU-26.2 — Consultar funcionario (Valeria)

Como administrador quiero consultar los funcionarios, para saber quiénes representan a cada institución.

1. Puedo ver los funcionarios de una institución.

---

## HU-26.3 — Modificar funcionario (Valeria)

Como administrador quiero modificar las cuentas de los funcionarios, para mantener sus datos al día.

1. Puedo cambiar los datos del funcionario y su institución.
2. El funcionario sigue asociado a una institución.

---

## HU-26.4 — Eliminar funcionario (Valeria)

Como administrador quiero eliminar cuentas de funcionarios, para quitar las de quienes ya no participan.

1. Si el funcionario no verificó ni cerró ninguna incidencia, se elimina su cuenta.
2. Si verificó o cerró alguna incidencia, el sistema no lo elimina y me indica qué lo impide.

---

## HU-29.1 — Registrar guía (Sebastián)

Como administrador quiero registrar guías y baquianos comunitarios, para que puedan acompañar las rutas.

1. Se identifica por su número de Registro Turístico Nacional junto con su código de licencia; si esa combinación ya existe, el sistema lo rechaza.
2. Tiene acreditación oficial, años de trayectoria, especialidades temáticas, idiomas, tarifa horaria y zona geográfica asignada.
3. Tiene una contraseña para entrar con su identificador.
4. Una misma persona puede ser guía y también visitante.

---

## HU-29.2 — Consultar guía (Sebastián)

Como administrador quiero consultar los guías registrados, para saber quiénes pueden acompañar las rutas.

1. Puedo ver el listado de los guías.
2. Puedo abrir un guía y ver todos sus datos.

---

## HU-29.3 — Modificar guía (Sebastián)

Como administrador quiero modificar los datos de un guía, para mantenerlos al día.

1. Puedo cambiar cualquier dato del guía.
2. Si cambio el número de Registro Turístico Nacional o el código de licencia y esa combinación ya existe, el sistema lo rechaza.

---

## HU-29.4 — Eliminar guía (Sebastián)

Como administrador quiero eliminar guías, para quitar los registros que ya no corresponden.

1. Si el guía no está adscrito a ninguna ruta, no dirige experiencias, no tiene contrataciones y no valida credenciales, se elimina.
2. Si tiene alguna de esas, el sistema no lo elimina.

---

## HU-30.1 — Registrar comercio (Valeria)

Como administrador quiero registrar comercios y aliados de servicio, para que puedan ofrecer sus servicios en las rutas.

1. Se identifica por su RIF jurídico; si ya existe, el sistema lo rechaza.
2. Tiene razón social, categoría comercial (gastronómico, sanitario o alquiler de equipos), aforo, número de permiso sanitario, horario de atención y cuenta bancaria.
3. Si la razón social ya existe, el sistema lo rechaza.
4. Tiene una contraseña para entrar con su RIF.
5. La ubicación del comercio se guarda como latitud, longitud y elevación en decimales.

---

## HU-30.2 — Consultar comercio (Valeria)

Como administrador quiero consultar los comercios registrados, para saber quiénes ofrecen servicios.

1. Puedo ver el listado de los comercios.
2. Puedo abrir un comercio y ver todos sus datos.

---

## HU-30.3 — Modificar comercio (Valeria)

Como administrador quiero modificar los datos de un comercio, para mantenerlos al día.

1. Puedo cambiar cualquier dato del comercio.
2. Si cambio el RIF por uno que ya existe, el sistema lo rechaza.
3. Si cambio la razón social por una que ya existe, el sistema lo rechaza.
4. La ubicación sigue guardándose como latitud, longitud y elevación en decimales.

---

## HU-30.4 — Eliminar comercio (Valeria)

Como administrador quiero eliminar comercios, para quitar los que ya no participan.

1. Si el comercio no tiene experiencias ni credenciales asociadas, se elimina.
2. Si tiene experiencias o credenciales asociadas, el sistema no lo elimina.

---

## HU-31.1 — Registrar institución (Javier)

Como administrador quiero registrar instituciones y entes públicos patrimoniales, para que participen en la verificación de incidencias y el mantenimiento.

1. Se identifica por su RIF institucional; si ya existe, el sistema la rechaza.
2. Tiene denominación oficial, nivel territorial de competencia, nombre del funcionario enlace y decreto oficial de adscripción patrimonial.
3. Si la denominación oficial ya existe, el sistema la rechaza.
4. Tiene una contraseña para entrar con su RIF.
5. Se registran los municipios sobre los que tiene competencia, uno o varios.

---

## HU-31.2 — Consultar institución (Javier)

Como administrador quiero consultar las instituciones registradas, para saber qué entes participan.

1. Puedo ver el listado de las instituciones.
2. Puedo abrir una institución y ver todos sus datos y los municipios sobre los que tiene competencia.

---

## HU-31.3 — Modificar institución (Javier)

Como administrador quiero modificar los datos de una institución, para mantenerlos al día.

1. Puedo cambiar cualquier dato de la institución y sus municipios de competencia.
2. Si cambio el RIF por uno que ya existe, el sistema lo rechaza.
3. Si cambio la denominación oficial por una que ya existe, el sistema lo rechaza.

---

## HU-31.4 — Eliminar institución (Javier)

Como administrador quiero eliminar instituciones, para quitar las que ya no participan.

1. Si la institución no tiene funcionarios asociados, se elimina.
2. Si tiene funcionarios asociados, el sistema no la elimina.

---

## HU-33.1 — Registrar municipio (Javier)

Como administrador quiero registrar los municipios de cada estado, para ubicar en el territorio los hitos, las rutas y las vías.

1. Cada municipio pertenece a un estado.
2. Se acepta el mismo nombre de municipio en estados distintos (por ejemplo, Sucre o Libertador).
3. Si registro un municipio con un nombre que ya existe en el mismo estado, el sistema lo rechaza.

---

## HU-33.2 — Consultar municipio (Javier)

Como administrador quiero consultar los municipios, para ver qué territorio está cargado en cada estado.

1. Puedo ver los municipios de un estado.

---

## HU-33.3 — Modificar municipio (Javier)

Como administrador quiero modificar un municipio, para corregir su nombre o su estado.

1. Puedo cambiar el nombre o el estado del municipio.
2. Si el municipio queda con el mismo nombre que otro del mismo estado, el sistema lo rechaza.
3. Se acepta el mismo nombre en estados distintos.

---

## HU-33.4 — Eliminar municipio (Javier)

Como administrador quiero eliminar municipios, para quitar los que se cargaron por error.

1. Si el municipio no tiene parroquias, rutas, vías, instituciones con competencia sobre él ni guías asignados, se elimina.
2. Si tiene alguna de esas, el sistema no lo elimina.

---

## HU-34.1 — Registrar parroquia (Javier)

Como administrador quiero registrar las parroquias de cada municipio, para ubicar los hitos en el territorio.

1. Cada parroquia pertenece a un municipio.
2. Se acepta el mismo nombre de parroquia en municipios distintos (por ejemplo, San José).
3. Si registro una parroquia con un nombre que ya existe en el mismo municipio, el sistema la rechaza.

---

## HU-34.2 — Consultar parroquia (Javier)

Como administrador quiero consultar las parroquias, para ver qué territorio está cargado en cada municipio.

1. Puedo ver las parroquias de un municipio.

---

## HU-34.3 — Modificar parroquia (Javier)

Como administrador quiero modificar una parroquia, para corregir su nombre o su municipio.

1. Puedo cambiar el nombre o el municipio de la parroquia.
2. Si la parroquia queda con el mismo nombre que otra del mismo municipio, el sistema lo rechaza.
3. Se acepta el mismo nombre en municipios distintos.

---

## HU-34.4 — Eliminar parroquia (Javier)

Como administrador quiero eliminar parroquias, para quitar las que se cargaron por error.

1. Si la parroquia no tiene hitos, se elimina.
2. Si tiene hitos, el sistema no la elimina.

---

## HU-35.1 — Registrar tramo (Sebastián)

Como administrador quiero registrar los tramos de cada vía y cómo se conectan entre sí, para poder calcular desplazamientos y desvíos.

1. Cada tramo pertenece a una vía, y una vía tiene uno o más tramos.
2. Para cada tramo se registra si tiene desniveles o escalinatas.
3. Se registra con qué otros tramos se conecta, también de vías distintas.
4. Un tramo no se puede conectar consigo mismo.

---

## HU-35.2 — Consultar tramo (Sebastián)

Como administrador quiero consultar los tramos de una vía y sus conexiones, para revisar la topología de la red.

1. Puedo ver los tramos de una vía y sus conexiones.

---

## HU-35.3 — Modificar tramo (Sebastián)

Como administrador quiero modificar un tramo y sus conexiones, para mantener la topología al día.

1. Puedo cambiar los datos del tramo: si tiene desniveles o escalinatas.
2. Puedo agregar o quitar conexiones con otros tramos.
3. Un tramo no se puede conectar consigo mismo.

---

## HU-35.4 — Eliminar tramo (Sebastián)

Como administrador quiero eliminar tramos, para quitar los que se cargaron por error.

1. Si el tramo no tiene incidencias, paradas ni hitos, se elimina.
2. Si tiene incidencias, paradas o hitos, el sistema no lo elimina.

---

## HU-08 — Iniciar sesión (Valeria)

Como actor del sistema quiero entrar con mi identificador y mi contraseña, para usar la plataforma según mi rol.

1. El actor entra con su identificador (cédula o pasaporte del visitante, RIF del comercio o de la institución, registro del guía, o cédula del funcionario o del administrador) y su contraseña.
2. Si el identificador o la contraseña no coinciden, el sistema rechaza la entrada.
3. Si la persona tiene varios roles, usa la plataforma con el rol de la interacción que esté haciendo.

---

## HU-19 — Reportar incidencia (Javier)

Como visitante, guía o funcionario quiero reportar una incidencia en un hito o en un tramo de vía, para avisar a los demás usuarios.

1. El sistema asigna un número de reporte correlativo.
2. Se registran la fecha y hora de detección, la fecha estimada de resolución, la narrativa y la severidad: bajo, medio o crítico.
3. La incidencia se asocia a un hito o a un tramo de vía, o a una secuencia de tramos.
4. Se guarda el usuario que la reporta: visitante, guía o funcionario.
5. Si la reporta un visitante o un guía, queda en estado preliminar hasta que un funcionario la verifique.
6. Si la reporta un funcionario, queda activa sin pasar por verificación.

---

## HU-20 — Verificar incidencia (Javier)

Como funcionario quiero verificar las incidencias preliminares, para que solo se publiquen hechos confirmados.

1. Solo un funcionario o autoridad competente puede verificar una incidencia.
2. El funcionario ve la lista de incidencias en estado preliminar.
3. Si el hecho es veraz, la confirma: queda activa y el funcionario ratifica o cambia su severidad.
4. Si el hecho no es veraz, la descarta: la incidencia pasa a estado descartada y no afecta al hito ni al tramo.

---

## HU-21 — Registrar recorrido (Sebastián)

Como visitante quiero que se registre cada recorrido que hago de una ruta, para tener mi historial y poder evaluarla.

1. Al iniciar, el sistema crea un recorrido nuevo con su identificador, el visitante, la ruta y la marca de tiempo de inicio.
2. Solo se pueden recorrer rutas fijas, rutas dinámicas públicas o las rutas propias del visitante.
3. Durante el recorrido se registran los hitos por los que el visitante pasa, cada uno con su fecha y hora.
4. Al terminar se guarda la marca de tiempo de fin, que debe ser posterior a la de inicio, y el estado: completado o abandonado.
5. Si el visitante repite la ruta, se crea un registro nuevo y no se modifica el anterior.
6. Los recorridos quedan en el historial de la ruta.
7. El visitante puede ver la lista de sus recorridos, con su ruta, fechas y estado.

---

## HU-22 — Publicar evaluación (Javier)

Como visitante quiero calificar una ruta o un hito que recorrí, para orientar a otros visitantes.

1. Cada evaluación tiene un código de reseña único.
2. La calificación y la seguridad percibida van de 1 a 5 estrellas; el sistema rechaza valores fuera de ese rango.
3. Se guardan la fecha de emisión y la opinión textual. La marca de recorrido verificado no se escribe a mano: es sí cuando el recorrido que respalda la evaluación está completado, y no cuando está abandonado (solo posible al evaluar un hito).
4. La evaluación se liga a un visitante registrado y a una ruta o a un hito.
5. Para evaluar una ruta, el visitante debe tener un recorrido completado de esa ruta; para evaluar un hito, un recorrido (completado o abandonado) que haya pasado por ese hito. Si no, el sistema rechaza la evaluación.
6. Cada evaluación queda ligada al recorrido que la respalda.
7. El visitante publica una evaluación nueva por cada viaje y las anteriores se conservan: no se actualiza la anterior. Un recorrido respalda como máximo una evaluación de su ruta y una por cada hito que transitó.

---

## HU-27 — Canjear credencial (Valeria)

Como comercio o guía quiero canjear la credencial de un visitante, para darle acceso.

1. Solo puede canjearla el aliado comercial o el guía asociado a esa credencial.
2. Si la credencial ya fue canjeada, está cancelada o está vencida, el sistema rechaza el canje.
3. Si se intenta canjear fuera del horario operativo autorizado para su fecha, el sistema lo rechaza.
4. Al canjearse, la credencial pasa a estado canjeado.

---

## HU-28 — Asignar guías a una ruta fija (Sebastián)

Como administrador quiero adscribir guías locales a una ruta fija, para ofrecer acompañamiento y narración histórica.

1. A una ruta fija se le pueden adscribir uno o más guías.
2. Solo se pueden adscribir guías que ya están registrados en el sistema.
3. Se puede quitar la adscripción de un guía.
4. La ficha de la ruta fija muestra sus guías adscritos.

---

## HU-36 — Prorrogar incidencia (Javier)

Como funcionario quiero prorrogar la fecha estimada de resolución de una incidencia, para que siga activa mientras se resuelve.

1. Solo un funcionario o autoridad competente puede prorrogar una incidencia.
2. La prórroga exige una justificación; sin ella, el sistema la rechaza.
3. La nueva fecha estimada debe ser posterior a la anterior.
4. Se guarda la prórroga con su nueva fecha y su justificación.
5. Una incidencia activa pasa a estado vencida si se supera su fecha estimada de resolución sin una prórroga justificada, y deja de afectar al hito o al tramo.

---

## HU-37 — Cerrar incidencia (Javier)

Como funcionario de la institución responsable quiero cerrar una incidencia resuelta, para que deje de afectar al hito o al tramo.

1. Solo la autoridad institucional responsable puede cerrar la incidencia: un funcionario de una institución con competencia sobre el municipio del hito o del tramo afectado.
2. Solo se cierran incidencias en estado activa: una preliminar primero se verifica, y las descartadas o vencidas no se cierran.
3. Al cerrarse, la incidencia pasa a estado resuelta y se guarda la fecha de cierre.

---

## RP-1 — Estado de conservación e incidencias por territorio (Javier)

Como institución quiero ver el estado de conservación de los hitos y sus incidencias por territorio, para tomar decisiones de mantenimiento.

1. Se puede filtrar por estado y por municipio.
2. Muestra cuántos hitos hay en cada estado operativo: disponible, en restauración, clausurado temporalmente y cerrado permanentemente.
3. Muestra cuántas incidencias en estado activa hay, sin contar las descartadas ni las vencidas, y cuántas son críticas.
4. Muestra los días promedio de resolución, calculados entre la fecha de detección y la fecha de cierre, sobre las incidencias en estado resuelta del territorio filtrado.

---

## RP-2 — Desempeño de experiencias y credenciales (Valeria)

Como comercio o guía quiero ver los cupos usados, las credenciales canjeadas y el monto de cada experiencia, para medir mis ventas.

1. Cada comercio o guía ve solo sus propias experiencias.
2. Para cada experiencia muestra su cupo máximo y los días que faltan para su vencimiento.
3. Muestra cuántas credenciales amparadas por la experiencia se emitieron, canjearon, cancelaron y vencieron, y el monto total abonado, sin contar las credenciales canceladas.

---

## RP-3 — Afluencia y calidad percibida por ruta (Sebastián)

Como institución turística, o como funcionario de ella, quiero ver la afluencia y la calificación de cada ruta, para tomar decisiones de planificación.

1. Para cada ruta muestra cuántos recorridos se iniciaron, cuántos se completaron y cuántos se abandonaron, y el porcentaje de finalización.
2. Muestra la calificación promedio y la seguridad percibida promedio de todas sus evaluaciones, incluidas las de un mismo visitante en viajes distintos.
3. Se puede filtrar por rango de fechas.
4. Muestra el hito más visitado de la ruta, según los hitos por los que pasaron sus recorridos.
5. La institución o su funcionario ven las rutas de los municipios donde la institución tiene competencia, y pueden filtrar por estado y municipio.
6. No se listan las rutas dinámicas privadas de los visitantes.

---

## VA-1 — Tiempos reales de una ruta (Sebastián)

Como visitante quiero ver cuánto tardaron en promedio otros visitantes entre los hitos de una ruta y en qué hito suelen abandonarla, para planificar mi tiempo.

1. Al elegir una ruta, el sistema muestra su secuencia de hitos y, por cada hito, el porcentaje de recorridos que pasó por él.
2. Indica el hito después del cual más recorridos se abandonan.
3. Muestra el tiempo promedio entre hitos consecutivos, calculado con la fecha y hora en que cada recorrido pasó por cada hito.
4. Se puede filtrar por rango de fechas.
5. Si la ruta no tiene recorridos registrados, el sistema lo indica. Por qué es propia: depende de que RECORRIDO sea una entidad con los hitos transitados y su fecha y hora, una corrección que este equipo hizo. No usa el módulo de recomendación del enunciado §1.

---

## VA-2 — Desvío por incidencia (Sebastián)

Como visitante o guía quiero que el sistema me proponga un desvío cuando un tramo de mi ruta tiene una incidencia, para poder seguir el recorrido.

1. Si un tramo de la ruta tiene una incidencia en estado activa, el sistema avisa y propone el desvío al visitante o al guía; si está en estado preliminar, solo muestra un aviso informativo y no desvía.
2. El sistema muestra los tramos conectados al tramo afectado que no tienen incidencias activas y cuya vía permite el modo de transporte de quien recorre: en una ruta dinámica, su preferencia de transporte; en una ruta fija, el modo que elige el visitante o el guía.
3. Si ningún tramo conectado cumple las condiciones, el sistema lo indica.

---

## VA-3 — Contratación de guía (Sebastián)

Como visitante quiero contratar un guía local para una ruta fija, para recorrerla acompañado y con narración histórica.

1. Al elegir una ruta fija, el visitante ve los guías adscritos a ella con sus idiomas, especialidades y tarifa horaria.
2. Solo se pueden contratar guías adscritos a esa ruta fija.
3. La contratación queda registrada con el visitante, el guía, la ruta y la fecha.

---

## VA-4 — Semáforo de seguridad de una ruta (Javier)

Como visitante quiero ver un nivel de seguridad de cada ruta antes de elegirla, combinando la seguridad que percibieron otros visitantes con las incidencias activas en sus hitos y tramos, para evitar rutas riesgosas.

1. Al ver una ruta, el sistema muestra su nivel de seguridad: verde, amarillo o rojo.
2. El nivel sale del promedio de la seguridad percibida de las evaluaciones de la ruta y de las incidencias en estado activa en sus hitos y en los tramos donde están sus hitos y paradas.
3. Es verde si el promedio es 4 o más y no hay incidencias activas; rojo si el promedio es menor de 3 o hay alguna incidencia crítica activa; amarillo en los demás casos.
4. Si la ruta no tiene evaluaciones, el nivel se calcula solo con sus incidencias y el sistema indica que aún no hay valoraciones.
5. El visitante puede ver las incidencias activas que explican el nivel. Por qué es propia: el enunciado da la seguridad percibida como un dato más de la evaluación. Cruzarla con las incidencias para dar un nivel al visitante no está en ningún módulo de §1.
