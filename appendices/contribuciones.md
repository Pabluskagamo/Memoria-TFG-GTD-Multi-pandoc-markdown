# Contribución de cada miembro del equipo

Desde el inicio del curso escolar 23/24 y con ello, desde el inicio de este trabajo de fin de grado, cada miembro del grupo ha ido aportando una serie de características que han sido cruciales para el desarollo de la aplicación. A continuación se precisa la contribución de cada integrante a las fases del proyecto, destacando cómo la coordinacion grupal ha permitido el objetivo final.s

## Alejandro del Río Caballero

### Puesta en escena: Aprendizaje 

Tras la primera reunión con el tutor y con los objetivos estipulados, Alejandro asumió la responsabilidad inicial de familiarizarse con la metodología *GTD* con "THE MAIN IDEA" (REF: https://saanys.org/wp-content/uploads/2020/10/The-Main-Idea-Getting-Things-Done-August-2017.pdf), un resumen de apenas 12 páginas donde explicaban los fundamentos de *GTD*.  De esta forma pudo comenzar a escribir en la motivación en el capítulo \ref{sec:intro}.

Por otro lado, me documenté sobre las tecnologías que íbamos a utilizar, tales como *Node.js* y *React Native* para el desarrollo de Backend y Frontend. Además de Figma para el diseño de interfaces de usuario. 



### Documentación de la metodología

Una vez conocida la metodología y las tecnologías que íbamos a utilizar,  Alejandro, a modo de analizar la competencia a la que nos enfrentábamos, investigó las aplicaciones más populares de la *AppStore y Google Play Store* que implementan *GTD*, sacando sus ventajas y desventajas. De esta forma, podíamos comprender que puntos fuertes queríamos destacar y que puntos débiles debíamos evitar para desarrollar *SwiftDo*. 

Por otro lado, al ver las aplicaciones más populares, Alejandro leyó el libro de David Allen, [@gtd-boook], pudiendo retener el conocimiento para comunicárselo a los demás integrantes del equipo. Este estudio permitió enfatizar los aspectos y características que debían estar en el diseño final de la aplicación, además de poder utilizarlo para poder escribir el capítulo \ref{sec:metodologia}.

### Diseño: Desarrollo de la Interfaz de Usuario (UI)

El diseño de la interfaz de usuario fue hecha por Alejandro, asegurándose que el diseño fuera atractivo y coherente con la metodología. Para ello utilizó Figma como herramienta de diseño lo que facilitó la creación de los prototipos y componentes que conforman *SwiftDo*. 

Para desarrollar la interfaz de usuario, Alejandro se guió por los principios de diseño que establece Donald Norman en su libro [@design-book], y en el diseño de aplicaciones ya exitosas como Things^[[Things](https://culturedcode.com/things/)] , dado su enfoque minimalista. De esta forma permitimos un diseño centrado en el usuario, permitiendo centrarse en las acciones del método *GTD*, eliminando las distracciones y facilitando la gestión de tareas.

El uso de los principios de diseño, sumado a la capacidad de identificar y aplicar características ya exitosas de otras aplicaciones, contribuyó a que Alejandro pudiese escribir el capítulo \ref{sec:frontend}.

### Desarrollo

#### Backend

Al inicio de la aplicación nos centramos fundamentalmente en el desarrollo del backend, concretamente en las acciones *CRUD*, "Crear, Leer, Actualizar y Borrar" (del inglés: *Create, Read, Update and Delete*). Una vez repartidas las *CRUD* mas relevantes de la aplicación, Alejandro se encargó de la sección de Proyectos. 

Para ello, Alejandro definió un "validador de datos" a modo de esquema en un archivo "<u>projectValidator.js</u>", asegurándose que los campos título y descripción de un proyecto se crearan y modificaran correctamente en la base de datos. Luego, implementó las rutas necesarias mediante el framework de *Node.js* y *Express*, manejando así las solicitudes HTTP correspondientes para <u>crear</u>, <u>completar</u>, <u>mostrar</u> y <u>actualizar</u> los campos de un proyecto. Así como la adición de los códigos de estado HTTP para notificar al usuario en caso de error.

Para llevar a cabo los aspectos de Backend, Alejandro aprendió las bases de*Node.js y Express.js* en un curso de FreeCodeCamp (https://www.youtube.com/watch?v=Oe421EPjeBE) , ya que la titulación de Ingeniería Informática carece de asignaturas en las que se imparta dicho framework en profundidad. También aprendió mediante otro curso en FreeCodeCamp (https://www.youtube.com/watch?v=VywxIQ2ZXw4), el funcionamiento de Postman, para probar y verificar la API que íbamos creando.

####  Frontend

En cuanto al Frontend, hemos mantenido un desarrollo consistente y cohesionado gracias a la participación activa de todos los integrantes del equipo en todos las áreas de la aplicación. 

En un primer lugar, Alejandro contribuyó en gran parte al diseño e implementación de componentes reutilizables de manera que las pantallas y la navegación de la aplicación, reduciendo significativamente el numero de archivos creados y el numero de lineas de código por archivo.

Uno de los componentes principales de los que se encargó Alejandro fue de la *<u>sidebar</u>*, proporcionando una navegación rápida a diversas secciones y funcionalidades de la aplicación. Ya que como vimos en el capítulo \ref{sec:frontend} está cargada de varios elementos, tales como el nombre de usuario en la parte superior de la misma (subcomponente que se encargó de implementar Carlos Gómez), las acciones de *GTD* explicadas en \ref{sec:metodologia} junto al numero de tareas asociadas, además de los proyectos creados por el usuario y la representación del porcentaje de completitud de estos. Así como un archivo a modo de esquema reutilizable que utilizarían todas las pantallas  que implementan las acciones de *GTD*. 

En cuanto a otros aspectos, Alejandro se encargó de implementar las interfaces de inicio y registro de sesión, la pantalla para agregar detalles en las tareas y la previsualización de dichos detalles en *markdown*. Además de adaptar varios estilos de la aplicación para hacerlo compatible con el modo oscuro.

Para llevar a cabo el desarrollo de la aplicación en React Native, Alejandro se documentó mediante el libro [@rn-book] además de la documentación de la página oficial de React Native(https://reactnative.dev) y React Navigation (https://reactnavigation.org/docs/drawer-based-navigation/). Además de realizar un curso en FreeCodeCamp (https://www.youtube.com/watch?v=obH0Po_RdWk) para entender el funcionamiento de *React Native y Expo* .

---

(ADAPTAR ESTE PARRAFO) En resumen, la contribución de Alejandro abarcó desde la creacion de componentes reutilizables para optimizar el código de la aplicación como de componentes claves como son la Sidebar, y diversas pantallas proporcionando una visión coherente de la aplicación.

---





## Carlos Gómez López



## Pablo Gamo González



## Javier Gil Caballero

 #### Puesta en escena: Aprendizaje

 Con el comienzo del curso y con el tema ya seleccionado del TFG, iniciamos una labor de búsqueda para familiarizarnos con la metodología *GTD*. Durante esta investigación nos surgieron varias dudas de conceptos las cuales fuimos resolviendo con nuestro tutor en diversas reuniones, esto nos ha permitido desarrollar nuestra aplicación siguiendo los principios que se establecen en *GTD*.
 
 Una vez decididas las tecnologías que íbamos a utilizar para el desarrollo de la aplicación que en nuestro caso ha sido *Express.js* y *React Native*, comenzamos una labor de aprendizaje de las mismas. Aprender *Express.js* fue más sencillo ya que varios miembros del equipo lo habíamos utilizado en la carrera y *React Native* fue todo un desafío ya que nadie conocía este *framework* y nos tocó aprenderlo desde cero.

 #### Documentación

 Al finalizar esta investigación y conociendo los principales aspectos de *GTD*, Javier buscó información sobre distintas aplicaciones que implementan esta tecnología tanto en dispositivos móviles como en ordenadores, aportando datos como los sistemas operativos que permiten instalar cada aplicación, sus funcionalidades y sus puntos fuertes y débiles con el propósito de realizar un primer diseño de *SwiftDo* utilizando las características más útiles, mejorando aquellas que no nos convencieron en el resto de aplicaciones e implementando nuevas funcionalidades para desarrollar una aplicación más completa que cualquiera de la competencia. 

 #### Desarollo: Backend y Frontend


## Conclusiones finales

La participación de cada miembro del grupo ha sido fundamental para el desarrollo de la aplicación. Demostrando la cohesión y consistencia de los conocimientos adquiridos tanto en ingeniería de software como en informática, así como la importancia del trabajo en equipo, pudiendo destacar las habilidades y destrezas adquiridas.

