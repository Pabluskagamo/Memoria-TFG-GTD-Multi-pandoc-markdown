# Diseño e Implementacion del Frontend {#sec:frontend}

En este capítulo ahondaremos en varias de las técnicas de diseño de software que hemos usado para bocetar el conjunto de interfaces de usuario que conforman *SwiftDo*. Además, explicaremos las herramientas que hemos utilizado para prototipar e implementar el Frontend de la app. Para que una aplicación llegue a ser utilizada de manera cotidiana, deberá cumplir con los criterios y objetivos para los que fue concebida, así como disponer de un buen diseño que lo complemente. 

— ¿Qué hace que una aplicación esté bien diseñada? — Para responder a esta pregunta hemos explorado algunos libros y/o asignaturas cursadas en la universidad y, después de una exhaustiva búsqueda, hemos encontrado “The Design of Everyday Things” de *D. Norman*, uno de los libros más importantes que relaciona el diseño de producto y la cognición humana. A continuación proporcionaremos de manera desglosada las técnicas en las que nos apoyamos: 

## Percepción del funcionamiento del sistema

Para empezar a diseñar la app, investigamos, no solo como funciona el método explicado en el capítulo 2 **<(Hacer referencia)>,** sino también como trasladar esa experiencia fielmente al software. La percepción de la filosofía GTD puede variar según cada usuario, sin embargo, la esencia principal de ésta debe ser la misma. Para ello debemos meditar qué tipo de elementos deben estar o no presentes en la app. De esta forma conseguimos que coincidan el **modelo mental**, es decir, cómo el usuario piensa que funciona la aplicación, y el **modelo tecnológico**, que representa el funcionamiento interno.

<IMAGEN DE UN MINDMAP CON LOS DETALLES PRINCIPALES DE LA APP>

Al haber reunido los conceptos fundamentales en el mapa mental de la figura \ref{fig:mindmap} conseguimos reducir la fricción cognitiva, es decir, reducir la fatiga visual mediante la simplificación de conceptos y hacer que su uso sea intuitivo y eficiente.

## Metáforas, Expresiones y Conceptos de diseño

Con la finalidad de hacer que el usuario se vea familiarizado con los conceptos empleados en la app, nos hemos visto envueltos en un conjunto de metáforas y expresiones. 

En primer lugar, usamos metáforas para asociar cada “acción” del método *GTD* con un icono que exprese fielmente lo que realiza esa categoría. Ejemplo de ello, pueden ser la “entrada”, representada por una bandeja de entrada de mensajes, la bandera roja indicando la urgencia o el símbolo de progreso de cada proyecto, tal y como se puede observar en las figura \ref{fig:menulateral}:

![Menu lateral](img/menu_lateral.png){width=35% #fig:menulateral}

Por otro lado, tenemos las expresiones, éstas son un concepto fundamental, ya que ayudan a definir como interactúa el usuario con la aplicación, haciéndola mas eficiente y consistente. Éstas las podemos ver en el menú lateral, con las secciones \ref{fig:accionesBarraLateral} de “Entrada”, “Hoy”, “Cuanto antes”, “Programadas”, etc.

<Figura4>![barra lateral](img/accionesBarraLateral.png){width=80% #fig:accionesBarraLateral}

Finalmente, hemos optado por un diseño plano y elegante, con pocas trazas de esqueuomorfismo, evitando sobrecargar con detalles superfluos la interfaz. Para ello nos hemos basado en el concepto de *affordance*, haciendo que cada componente que se encuentre en la app sea autoexplicativo, como por ejemplo, el botón de añadir tarea y/o proyecto \ref{fig:addbutton} Para explorar con mayor detalle estos aspectos, nos hemos basado en varios principios de diseño que describiremos a continuación.

![Boton para añadir tarea/proyecto](img/addbutton.png){#fig:addbutton}

### Proximidad y Consistencia

Estos principios se encuentran relacionados con la coherencia con la que diseñamos la interfaz. El primero de estos principios, **proximidad**, indica que todos los elementos que se encuentren relacionados entre sí deben agruparse visualmente, familiarizándolo y simplificando el proceso de aprendizaje del usuario con los conceptos tratados, como se observa en la figura \ref{fig:accionesBarraLateral}

En segundo lugar, detallamos el principio de **consistencia,** que ha sido fundamental tanto para el diseño como para la implementación. Siendo de gran utilidad para la optimización del código, diseño \ref{fig:actionScreen} y aprendizaje de la interfaz por parte del usuario final.

![Prototipo de Bandeja de entrada, Cuanto antes, Programadas y Archivadas](img/componentes/actions.png){width=70% #fig:actionScreen}

### Visibilidad

D. Norman en su libro **<REFERENCIA AL LIBRO>** explica que todo componente debe proporcionar una representación clara, tanto de su estado como de las funciones que éstas desempeñan. Tanto es así, que explica que cuanto mas visible sea un objeto, mayor será la interacción que tendrá el usuario con él.

Por esto, hemos usado un diseño plano y minimalista, donde los detalles que tienen alta relevancia y que se relacionan con el método GTD, pasan a un primer plano, como son las "acciones"  \ref{fig:actionScreen} , mientras los demás ocupan un segundo plano. 

Por último, es conveniente gestionar el estado visible de los componentes de la app, es decir, que el usuario pueda observar claramente el estado actual del sistema. Ejemplo de ello son los detalles en el menú lateral, como el nombre de usuario, que le informa que ha iniciado sesión en la app, así como la fecha actual, que puede ser de especial relevancia para la creación de tareas \ref{fig:nombre_fecha} Por otro lado, las etiquetas y el contexto asociado a cada tarea en la pantalla de “detalles” \ref{fig:details} dirigen la atención a lo que realmente importa.

![nombre de usuario y fecha](img/nombre_fecha.png){#fig:nombre_fecha}

![Detalles](img/componentes/details.png){width=50% #fig:details.png}

Por esto, hemos usado un diseño plano y minimalista, donde los detalles que tienen alta relevancia y que se relacionan con el método GTD, pasan a un primer plano, como son las "acciones" \ref{fig:accionesBarraLateral} y el número de tareas que tienen tanto, mientras los demás ocupan un segundo plano. 

**<REFERENCIA A NUMEROS DE TAREAS EN ACCIONES; ACCIONES Y PROYECTOS Y TAREAS>**  

Por último, es conveniente gestionar el estado visible de los componentes de la app, es decir, que el usuario pueda observar claramente el estado actual del sistema. Ejemplo de ello son los detalles en el menú lateral, como el nombre de usuario, que le informa que ha iniciado sesión en la app, así como la fecha actual, que puede ser de especial relevancia para la creación de tareas **<REFERENCIA>**. Por otro lado, las etiquetas y el contexto asociado a cada tarea en la pantalla de “detalles” **<REFERENCIA>,** dirigen la atención a lo que realmente importa.

## Prototipos e Interfaces

Durante el desarrollo prematuro de la app exploramos diferentes herramientas de diseño para poder elaborar varios de los mockups que componen la app, entre ellas destacamos **Balsamiq** y **Figma**. Sin embargo, nos decantamos por Figma, ya que es una herramienta más versátil y con mayores opciones de personalización, abarcando desde modelos de baja a alta fidelidad. 

Figma es una plataforma de diseño colaborativo que permite desde la creación de prototipos interactivos hasta interfaces de usuario con alto nivel de detalle. Además de permitir diseñar fácilmente las interfaces, habilita a otros miembros del grupo a colaborar y compartir el contenido que se está diseñando, lo que ha ayudado, en gran parte, a la pronta implementación del Frontend del proyecto.

Asimismo, usamos gran parte de las opciones que ofrece para probar varios de los principios de diseño que hemos logrado implementar en la aplicación final, además de las fuentes y colores utilizados en la misma.

Finalmente, una vez creados todos los prototipos junto a sus componentes, probamos el flujo de diseño que habíamos creado inicialmente, mediante el uso de la aplicación movil, llegando a emular fielmente 1:1 el comportamiento final de la app.

A continuación presentamos todos las interfaces que componen SwiftDo, junto a una breve explicación que las relaciona con el método GTD 

En primer lugar tenemos las interfaces relacionadas con el registro e inicio de sesión:

![Inicio de sesión y Registro](img/componentes/inicio-registro.png){width=50%}

En segundo lugar tenemos las tareas relacionadas con la gestion del flujo de *GTD* y sus acciones en dispositivos móviles \ref{fig:actionScreen}, además del prototipo de escritorio: 

![escritorio](img/componentes/escritorio.png){width=50%}

En adición a las categorias de *GTD* mencionadas en el capítulo 2, hemos querido añadir una nueva categoría "**Hoy**" \ref{fig:hoy} que actúe como resumen diario inteligente. Éste detectará cuyas tareas pertenecen al día de "hoy",  tareas atrasadas cuya finalización ha expirado y por último, en caso de tener pocas tareas para realizar en el día, se irán adjuntando, otras pertenecientes a la categoría "**cuanto antes**".

![Pantalla de sección "hoy"](img/componentes/Hoy_Screen.png){width=50% #Fig:hoy}

En tercer lugar tenemos interfaces relacionadas con el menú o barra lateral y ajustes tanto en formato escritorio como en dispositivos móviles: 

![Barra lateral](img/componentes/menu.png){width=50%}

![Ajustes - Movil](img/componentes/Ajustes - Movil.png){width=50%}

![Ajustes - Escritorio](img/componentes/Group 41.png){width=50%}

![Opciones de ajustes](img/componentes/OptionSettings.png){width=50%}

Por último tenemos interfaces más detalladas como son la de añadir tarea/proyecto, interfaz de añadir detalles a la tarea, pudiendo insertar markdown texto en formato markdown y distintos modales para la creacion o edicion de tareas.

![Detalles](img/componentes/details.png){width=50%}

![Editor de tareas](img/componentes/editTask.png){width=50%}

![Añadir tareas o proyectos](img/componentes/addProyectOrTask.png){width=50%}

![Menu para añadir tareas](img/componentes/Menu add task - Light (old).png){width=50%}

![Visualización de tarea](img/componentes/visualizacionTarea.png){width=50%}

## Implementación: ¿Qué es React Native?

Para implementar el Frontend de la app junto a las interfaces de usuario anteriormente descritas, necesitábamos hacer uso de un framework que pudiera adaptarse no solo a interfaces táctiles sino también a interfaces de escritorio. Para lograrlo hemos hecho uso de ***React Native\*** *y* ***Expo\***. 

Expo se trata de una plataforma que agiliza el desarrollo y despliegue de aplicaciones en React Native sin la necesidad de lidiar con configuraciones complejas.

Por otro lado, React Native se trata de un framework desarrollado por Facebook que tiene por lema “*Learn once, write anywhere*”, ya que mediante el uso de React y JavaScript, permite la creación de aplicaciones multiplataforma, ya sea en *MacOS*, *iOS*, *Windows* o *Android*.

Éste framework no solo destaca por la capacidad de reutilización de código sino por ofrecer un comportamiento nativo de los componentes utilizados, es decir, permitir un rendimiento similar al de las aplicaciones desarrolladas con lenguajes nativos (*Swift* para *IOS* o *Kotlin* para *Android*).

Por último, destacar la gran comunidad que tiene, ya que además de la documentación que podemos consultar en la pagina web oficial de React Native, disponemos de bibliotecas externas que se detallan en otras páginas web que son útiles para la implementación de otros componentes que no se encuentran en las fuentes oficiales. Las bibliotecas externas que hemos empleado son las siguientes: 

- **React Navigation** ^[[React Navigation](https://reactnavigation.org/)]: Esta librería permite definir y enrrutar las diferentes pantallas de la aplicación para poder navegar entre ellas. Ha sido de gran importancia en la aplicación ya que la navegación es un aspecto clave en cualquier aplicación. Además este paquete es muy sencillo de entender y usar gracias a su buena documentación.

- **Drawer Navigation** ^[[Drawer Navigation](https://reactnavigation.org/docs/drawer-navigator)]: Muestra un cajón de navegación en el costado de la pantalla que se puede abrir y cerrar mediante gestos. 

- **Axios** ^[[Axios](https://axios-http.com/es/docs/intro)]: Librería de *JavaScript* que se utiliza para hacer solicitudes *HTTP* desde el navegador. Este paquete facilita la gestión y el envio de *requests* y *respones*, esto nos ha servido para gestionar los *headers* de autorización.

- **React Native Calendars** ^[[React Native Calendars](https://github.com/wix/react-native-calendars)]: Un componente de calendario declarativo multiplataforma *React Native* para *iOS* y *Android*. Se ha utilizado para implementar la pantalla de Programadas.

- **React Native Async Storage** ^[[React Native Async Storage](https://www.npmjs.com/package/@react-native-async-storage/async-storage)]: Este paquete ha sido de gran importancia en el desarrollo ya que permite guardar información en el dispositivo. Se ha utilizado para almacenar la información de las sesiones iniciadas como los *tokens* de acceso o la configuración aplicada como el tema seleccionado o los servidores configurados.

- **Markdown Display** ^[[Markdown Display](https://www.npmjs.com/package/react-native-markdown-display)]: Renderizador de *Markdown*. 

- **Modern Datepicker** ^[[Modern Datepicker](https://kiarash-z.github.io/react-modern-calendar-datepicker/)]: Se ha utilizado este paquete para implementar el selector de fecha para una tarea.

- **Swipeable** ^[[Swipeable](https://docs.swmansion.com/react-native-gesture-handler/docs/components/swipeable/)]: Componente el cual permite implementar filas deslizables o interacción similar. Representa a sus hijos dentro de un contenedor panable que permite el deslizamiento horizontal hacia la izquierda y hacia la derecha.

- **Wheel Color Picker** ^[[Wheel Color Picker](https://www.npmjs.com/package/react-native-wheel-color-picker)]: Componente seleccionador de colores. Se ha utilizado en el modal de crear proyecto para seleccionar el color del mismo.
