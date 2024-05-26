# Contribución de cada miembro del equipo

Desde el inicio del curso escolar 23/24 y con ello, desde el inicio de este trabajo de fin de grado, cada miembro del grupo ha ido aportando una serie de características que han sido cruciales para el desarollo de la aplicación. A continuación se precisa la contribución de cada integrante a las fases del proyecto, destacando cómo la coordinación grupal ha permitido el objetivo final.

## Alejandro del Río Caballero

### Puesta en escena: Aprendizaje

Tras la primera reunión con el tutor y con los objetivos estipulados, Alejandro asumió la responsabilidad inicial de familiarizarse con la metodología *GTD* con "THE MAIN IDEA" [@gtd-tmi], un resumen de apenas 12 páginas donde explicaban los fundamentos de *GTD*. De esta forma, comenzó a escribir la motivación en el Capítulo \ref{sec:intro}.

Por otro lado, Alejandro se documentó sobre las tecnologías que íbamos a utilizar, tales como *Node.js* y *React Native* para el desarrollo de *backend* y *frontend*. Además de Figma para el diseño de interfaces de usuario. 

### Documentación de la metodología

Una vez conocida la metodología y las tecnologías que íbamos a utilizar, Alejandro, con el objetivo de analizar la competencia a la que nos enfrentábamos, investigó las aplicaciones más populares de la *AppStore y Google Play Store* que implementan *GTD*, sacando sus ventajas y desventajas. De esta forma, pudimos comprender los puntos fuertes que queríamos destacar y los puntos débiles que debíamos evitar para el desarrollo de *SwiftDo*. 

Por otro lado, al ver las aplicaciones más populares, Alejandro leyó el libro de David Allen, [@gtd-boook], pudiendo retener el conocimiento para comunicárselo a los demás integrantes del equipo. Este estudio permitió enfatizar los aspectos y características que debían estar en el diseño final de la aplicación, además de poder utilizarlo para poder escribir el Capítulo \ref{sec:metodologia}.

### Diseño: Desarrollo de la Interfaz de Usuario (UI)

El diseño de la interfaz de usuario fue hecha por Alejandro, asegurándose que el diseño fuera atractivo y coherente con la metodología. Para ello utilizó Figma como herramienta de diseño lo que facilitó la creación de los prototipos y componentes que conforman *SwiftDo*. 

Para desarrollar la interfaz de usuario, Alejandro se guió por los principios de diseño que establece Donald Norman en su libro [@design-book], y en el diseño de aplicaciones ya exitosas como Things^[[Things](https://culturedcode.com/things/)] , dado su enfoque minimalista. De esta forma permitimos un diseño centrado en el usuario, permitiendo centrarse en las acciones del método *GTD*, eliminando las distracciones y facilitando la gestión de tareas.

El uso de los principios de diseño, sumado a la capacidad de identificar y aplicar características ya exitosas de otras aplicaciones, contribuyó a que Alejandro pudiese escribir el Capítulo \ref{sec:frontend}.

### Desarrollo

#### Backend {.unnumbered}

Al inicio de la aplicación nos centramos fundamentalmente en el desarrollo del *backend*, concretamente en las acciones *CRUD*, "Crear, Leer, Actualizar y Borrar" (del inglés: *Create, Read, Update and Delete*). Una vez repartidas las *CRUD* mas relevantes de la aplicación entre todos los integrantes del grupo, Alejandro se encargó de la sección de Proyectos. 

Para ello, Alejandro definió un "validador de datos" a modo de esquema en un archivo "<u>projectValidator.js</u>", asegurándose que los campos "título" y "descripción" de un proyecto se crearan y modificaran correctamente en la base de datos. Luego, implementó las rutas necesarias mediante el framework de *Node.js* y *Express*, manejando así las solicitudes HTTP correspondientes para <u>crear</u>, <u>completar</u>, <u>mostrar</u> y <u>actualizar</u> los campos de un proyecto. Así como la adición de los códigos de estado HTTP para notificar al usuario en caso de error.

Para llevar a cabo los aspectos de *backend*, Alejandro aprendió las bases de *Node.js y Express.js* en un curso de freeCodeCamp [@fcc-node] , ya que la titulación de Ingeniería Informática carece de asignaturas en las que se imparta dicho framework en profundidad. También aprendió mediante el mismo curso [@fcc-node]  el funcionamiento de Postman, para probar y verificar la API que íbamos creando.

#### Frontend {.unnumbered}

En cuanto al *frontend*, hemos mantenido un desarrollo consistente y cohesionado gracias a la participación activa de todos los integrantes del equipo en todos las áreas de la aplicación.  

En un primer lugar, Alejandro contribuyó en gran parte al diseño e implementación de componentes reutilizables como las pantallas principales, así como con la navegación de la aplicación, reduciendo significativamente el número de archivos creados y el número de líneas de código por archivo.

Uno de los componentes principales de los que se encargó Alejandro fue de la *<u>sidebar</u>*, proporcionando una navegación rápida a diversas secciones y funcionalidades de la aplicación. Ya que como vimos en el Capítulo \ref{sec:frontend} está cargada de varios elementos, tales como el nombre de usuario en la parte superior de la misma (subcomponente que se encargó de implementar Carlos Gómez), las acciones de *GTD* explicadas en el Capítulo \ref{sec:metodologia} junto al número de tareas asociadas, además de los proyectos creados por el usuario y la representación del porcentaje de completitud de estos. Así como un archivo a modo de esquema reutilizable que utilizarían todas las pantallas que implementan las acciones de *GTD*. 

En cuanto a otros aspectos, Alejandro se encargó de implementar las interfaces de inicio y registro de sesión, el rediseño e implementación al completar tareas, así como la pantalla para agregar detalles en las tareas y la previsualización de dichos detalles en *markdown*. Además de adaptar los estilos de la aplicación para hacerlo compatible con el modo oscuro.

Para llevar a cabo el desarrollo de la aplicación en React Native, Alejandro se documentó mediante el libro [@rn-book] además de la documentación de la página oficial de React Native [@rn-website] y React Navigation [@drawer-navigation]. Además de realizar un curso en FreeCodeCamp [@fcc-rn] para entender el funcionamiento de *React Native y Expo* .



## Carlos Gómez López

### Puesta en escena: Aprendizaje

El desarrollo de *SwiftDo*, nuestra aplicación basada en la metodología *GTD*, comenzó con una fase de búsqueda y familiarización con esta metodología. Nos sumergimos en la literatura y recursos disponibles sobre *GTD* para entender mejor sus principios y cómo podríamos aplicarlos a nuestra aplicación. Además, nos inspiramos en otras aplicaciones existentes que implementan la metodología *GTD*, lo que ayudó a visualizar cómo estructurar las funcionalidades y la interfaz de usuario. Durante esta etapa, surgieron muchas dudas sobre la arquitectura de la aplicación y las "acciones" específicas que necesitábamos implementar. Estas dudas las fuimos resolviendo con la orientación de nuestro profesor y mediante investigaciones exhaustivas.

Paralelamente, dedicamos tiempo a investigar las tecnologías que utilizaríamos para el desarrollo. Decidimos optar por *React Native* y *Express.js*. Aunque algunos ya teníamos experiencia previa con *Express.js* de una asignatura en el grado universitario, *React Native* representó un nuevo desafío. A pesar de que algunos miembros del equipo tenían conocimientos de *React*, nos dimos cuenta de que *React Native* presentaba diferencias significativas y requería un enfoque de estudio y aprendizaje específico. Esta fase inicial fue crucial para sentar las bases técnicas y conceptuales de *SwiftDo* y preparar a nuestro equipo para el entorno de desarrollo.

### Documentación

Después de familiarizarnos con la metodología *GTD* y las tecnologías que íbamos a utilizar, nos enfocamos en identificar aplicaciones similares a las que queríamos desarrollar, con especial atención en aquellas que también implementaban la metodología *GTD*. Para llevar a cabo esta investigación, dividimos la tareas entre los miembros del equipo, asignando a cada uno la responsabilidad de analizar diferentes aplicaciones.

Durante esta fase, recopilamos información sobre las ventajas y desventajas de cada aplicación, lo que nos permitió desarrollar una visión clara de qué características eran esenciales para nuestra aplicación. A partir de este análisis, obtuvimos ideas tanto de funcionalidades como diseño de la interfaz de usuario, que consideramos importantes integrar en *SwiftDo*.

Paralelamente, dado que una de nuestras metas era integrar nuestra aplicación con agentes conversacionales, Carlos se encargó de investigar las opciones disponibles para esta integración. Exploró la viabilidad de trabajar con agentes como *Alexa* y *Google Assistant*, evaluando cuál de ellos ofrecía mejores características y facilidades para su integración.

### Diseño: Desarrollo de la Interfaz de Usuario (UI)

Para desarrollar la interfaz de usuario de *SwiftDo*, Alejandro y Carlos lideraron respectivamente el diseño para dispositivos móviles y web/aplicación. Si bien se evaluaron ambas propuestas, se destacaron y se incorporaron más ideas provenientes del diseño de Alejandro. La colaboración resultó en una interfaz equilibrada que reflejaba la visión del equipo y satisfacía las necesidades de los usuarios.

### Desarrollo

#### Base de datos {.unnumbered}

En el desarrollo de la base de datos, Javier asumió principalmente la responsabilidad, aunque Carlos realizó ajustes específicos en las relaciones entre las entidades "Tasks" y "Tags", incluyendo la creación de una tabla nueva llamada "TagToTask".

#### Backend {.unnumbered}

En el desarrollo del *backend*, Carlos asumió varias responsabilidades. Inicialmente, se encargó de la configuración de los *routes* y *services* de la entidad "Task", así como en la implementación del *CRUD* para esta entidad. Además, desarrolló la funcionalidad para la creación de áreas/contextos y un buscador de etiquetas, tanto específicas como para obtener todas.

Carlos también realizó modificaciones significativas en la sección de filtros previamente creada por Pablo, adaptándola para generar filtros específicos para la acción "Hoy". Por último, cabe mencionar su contribución en la personalización del diseño predeterminado de *OAuth* para la integración con *Alexa*.

#### Frontend {.unnumbered}

En el *frontend*, Carlos lideró una serie de cambios y diseños significativos. En la sección de "Inbox", se enfocó en desarrollar la interfaz de usuario, integrando funciones clave como la adición y edición de tareas. Diseñó varios modales, incluyendo los de adición, edición, completado, movimiento y selección de tareas, así como el selector entre tarea o proyecto. También implementó la integración de etiquetas en las tareas, contando con la colaboración de Javier.

Para la mejora de la experiencia del usuario, se llevó a cabo la introducción de funcionalidades de desplazamiento y la capacidad de seleccionar tareas. Además, Carlos se encargó de la visualización de etiquetas y la importancia de las tareas en las vistas de las "acciones", lo que proporcionó una mejora significativa en esta sección de la aplicación.

En el "Sidebar", Carlos diseñó el perfil, la funcionalidad para añadir y listar "áreas", y los indicadores de las tareas disponibles en cada "acción".

Carlos trabajó en el diseño la sección "Hoy" junto con Javier, aunque las funcionalidades las desarrolló de manera individual. Esta parte de la aplicación resultó ser una de las más tediosas debido a la complejidad de las adaptaciones necesarias para garantizar el funcionamiento como en el resto de la aplicación.

Además, Carlos también realizó adaptaciones para web y escritorio, y se ocupó de implementar el apartado de "Tutorial" y "Vincular con Alexa" en el menú de configuración.

Finalmente, se dedicó a realizar ajustes finos y correcciones de errores en toda la aplicación.

### Vinculación con Alexa

Carlos fue el encargado de desarrollar la skill de *SwiftDo* desde cero para la integración con Alexa, partiendo de una plantilla base proporcionada por Amazon Developer. En esta fase, el hecho de que la plantilla base ofreciera la opción de elegir entre Node.js y Python facilitó el proceso para Carlos, ya que contaba con conocimientos sólidos en Node.js. Después de estudiar en solitario el funcionamiento del agente conversacional, enfrentó los desafíos técnicos que surgieron en el desarrollo de la skill. Una vez que logró tener todo funcional, solicitó la ayuda de Pablo para poner en marcha la integración, ya que requería de sus conocimientos en OAuth. Tras un arduo trabajo y pruebas exhaustivas, lograron la vinculación y el correcto funcionamiento de la skill, realizando pruebas Carlos desde su propio dispositivo Alexa.

### Memoria

La redacción de la memoria se organizó distribuyendo el trabajo en capítulos, a excepción de los capitulos de "Introducción" y "Conclusiones". Una vez terminado cada capítulo, este era revisado por los miembros del equipo, tras lo cual se agendaba una reunión con el profesor para obtener su *feedback* y realizar las correcciones necesarias.

Para la "Introducción", se siguieron las indicaciones del profesor y Carlos se encargó de redactar la sección de "Objetivos" (sección \ref{sec:objetivos}). Además, Carlos fue responsable de los capítulos sobre el "Modelo de datos e implementación de la base de datos" (sección \ref{sec:modeloBD}), así como de la "Integración con agentes conversacionales" (sección \ref{sec:agentesConver}).

El capítulo de "Conclusiones" se elaboró mediante una sesión de *brainstorming*, donde discutimos qué aspectos destacar y cómo reflejar mejor nuestras experiencias y aprendizajes. Finalmente, tras completar todos los capítulos, se llevó a cabo una revisión conjunta del documento completo antes de la entrega final.

### Conclusiones

La experiencia de llevar a cabo este proyecto nos ha brindado valiosas oportunidades para crecer y mejorar nuestras habilidades en diversas áreas, desde la programación hasta el diseño de interfaces de usuario y la gestión de proyectos. Afrontar los obstáculos nos ha permitido desarrollar soluciones prácticas y ganar confianza en nuestras capacidades técnicas y de trabajo en equipo.

## Pablo Gamo González

## Javier Gil Caballero

### Puesta en escena: Aprendizaje

Con el comienzo del curso y con el tema ya seleccionado del TFG, iniciamos una labor de búsqueda para familiarizarnos con la metodología *GTD*. Durante esta investigación nos surgieron varias dudas de conceptos las cuales fuimos resolviendo con nuestro tutor en diversas reuniones, esto nos ha permitido desarrollar nuestra aplicación siguiendo los principios que se establecen en *GTD*.

 Una vez decididas las tecnologías que íbamos a utilizar para el desarrollo de la aplicación que en nuestro caso ha sido *Express.js* y *React Native*, comenzamos una labor de aprendizaje de las mismas. Aprender *Express.js* fue más sencillo ya que varios miembros del equipo lo habíamos utilizado en la carrera y *React Native* fue todo un desafío ya que nadie conocía este *framework* y nos tocó aprenderlo desde cero.

### Documentación

Al finalizar esta investigación y conociendo los principales aspectos de *GTD*, Javier buscó información sobre distintas aplicaciones que implementan esta tecnología tanto en dispositivos móviles como en ordenadores, aportando datos como los sistemas operativos que permiten instalar cada aplicación, sus funcionalidades y sus puntos fuertes y débiles con el propósito de realizar un primer diseño de *SwiftDo* utilizando las características más útiles, mejorando aquellas que no nos convencieron en el resto de aplicaciones e implementando nuevas funcionalidades para desarrollar una aplicación más completa que cualquiera de la competencia. 

### Desarollo:

En este apartado distinguiremos las aportaciones de Javier al proyecto en relación con la base de datos, el *backend* y el *frontend*.

#### Base de datos {.unnumbered}

 Javier se encargó de crear la primera versión de la base de datos, creando las tablas "users", "projects", "tags", "contexts", y "tasks" con sus respectivos atributos. Además definió las claves primarias de cada tabla e incluyó las relaciones con el resto de entidades añadiendo sus *foreign keys*. Carlos y Pablo se encargaron de modificar la base de datos a medida que avanzaba el proyecto y surgían nuevas necesidades.


#### Backend {.unnumbered}

En cuanto al desarrollo de la aplicación, decidimos comenzar por el *backend*. Javier inició la configuración del *backend* desarrollando el archivo “app.js” para organizar y estructurar el código y las distintas rutas que se utilizarían a lo largo de este proyecto. Como equipo, distribuimos el trabajo del *backend* asignando cada entidad a un miembro del equipo. Javier se encargó de desarrollar la entidad “contexto”, implementando las operaciones *CRUD* y funciones complementarias.

Además, Javier creó un validador de datos para los contextos, garantizando que los nuevos contextos esten vacíos y tengan una longitud máxima de 50 caracteres. También desarrolló las rutas necesarias para manejar las solicitudes *HTTP*, permitiendo crear, modificar, eliminar, mostrar un contexto y mostrar todos los contextos asociados a un usuario, gestionando los errores en caso de fallos en las rutas. 

Por último, Javier sirvió de apoyo en otras entidades, desarrollando la ruta principal de la aplicación, rutas de usuarios y las funciones de buscar tareas por su ID y por el ID del usuario.


#### Frontend {.unnumbered}
Respecto al *frontend*, hemos distribuido las tareas de forma diferente, manteniendo un orden de prioridad. De este modo, todos los miembros del equipo hemos participado en todas las áreas de la aplicación.

Para empezar, Javier ha desarrollado todas las funcionalidades relacionadas con proyectos. Esto incluye el servicio de proyectos que permite crear, mostrar, modificar, completar un proyecto y mostrar los proyectos de un usuario, así como el diseño de la pantalla de proyectos.

Además, ha diseñado el modal de selección para la creación de tareas o proyectos, y el modal específico para crear proyectos, el cual permite asignar un nombre, una descripcion y un color al proyecto.

También colaboró con Carlos en el desarrollo de las etiquetas y del diseño de la pantalla de “hoy” y trabajó junto a Alejandro en el desarrollo de la barra lateral, especialmente en el apartado de proyectos y la representación del porcentaje de completitud de los mismos, así como en la numeración de las tareas para cada acción de la barra lateral.

Por último, se encargó de diseñar el modal de configuración y de implementar varias de las funcionalidades que este ofrece. Específicamente, trabajó en los apartados de datos personales, gestión de contextos y etiquetas, tareas completadas y acerca de GTD.

### Memoria

Para la realización de la memoria, organizamos el trabajo por capítulos. Sin embargo, para la introducción, debido a su extensión, cada miembro del equipo contribuyó con una parte. En cuanto al apartado de conclusiones y trabajo futuro,hicimos un brainstorming entre todos y lo redactamos de manera conjunta.

Javier fue el encargado de realizar las secciones \ref{sec:workplan} "Plan de Trabajo" y \ref{sec:estruct} "Estructura de la memoria" en la parte de introducción y redactó los capítulos \ref{sec:plan} \ref{sec:manualusuario}

## Conclusiones finales

La participación de cada miembro del grupo ha sido fundamental para el desarrollo de la aplicación. Demostrando la cohesión y consistencia de los conocimientos adquiridos tanto en ingeniería de software como en informática, así como la importancia del trabajo en equipo, pudiendo destacar las habilidades y destrezas adquiridas.
