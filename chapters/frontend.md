## Diseño e Implementacion del Frontend

En este capítulo ahondaremos en varias de las técnicas de diseño de software que hemos usado para bocetar el conjunto de interfaces de usuario que conforman *SwiftDo*. Además, explicaremos las herramientas que hemos utilizado para prototipar e implementar el Frontend de la app. Para que una aplicación llegue a ser utilizada de manera cotidiana, deberá cumplir con los criterios y objetivos para los que fue concebida, así como disponer de un buen diseño que lo complemente. 

— ¿Qué hace que una aplicación esté bien diseñada? — Para responder a esta pregunta hemos explorado algunos libros y/o asignaturas cursadas en la universidad y, después de una exhaustiva búsqueda, hemos encontrado “The Design of Everyday Things” de *D. Norman*, uno de los libros más importantes que relaciona el diseño de producto y la cognición humana. A continuación proporcionaremos de manera desglosada las técnicas en las que nos apoyamos: 

## Percepción del funcionamiento del sistema

Para empezar a diseñar la app, investigamos, no solo como funciona el método explicado en el capítulo 2 **<(Hacer referencia)>,** sino también como trasladar esa experiencia fielmente al software. La percepción de la filosofía GTD puede variar según cada usuario, sin embargo, la esencia principal de ésta debe ser la misma. Para ello debemos meditar qué tipo de elementos deben estar o no presentes en la app. De esta forma conseguimos que coincidan el **modelo mental**, es decir, cómo el usuario piensa que funciona la aplicación, y el **modelo tecnológico**, que representa el funcionamiento interno.

<IMAGEN DE UN MINDMAP CON LOS DETALLES PRINCIPALES DE LA APP>

Al haber reunido los conceptos fundamentales en el mapa mental de la figura**<REFERENCIAR FIGURA>** conseguimos reducir la fricción cognitiva, es decir, reducir la fatiga visual mediante la simplificación de conceptos y hacer que su uso sea intuitivo y eficiente.



## Metáforas, Expresiones y Conceptos de diseño

Con la finalidad de hacer que el usuario se vea familiarizado con los conceptos empleados en la app, nos hemos visto envueltos en un conjunto de metáforas y expresiones. 

En primer lugar, usamos metáforas para asociar cada “acción” del método *GTD* con un icono que exprese fielmente lo que realiza esa categoría. Ejemplo de ello, pueden ser la “entrada”, representada por una bandeja de entrada de mensajes, la bandera roja indicando la urgencia o el símbolo de progreso de cada proyecto, tal y como se puede observar en las siguientes figuras:



**<FIGURA1>![bandeja de entrada](/Users/alejandro/Developer/Memoria-TFG-GTD-Multi-pandoc-markdown/img/seccionEntrada.png)**

**<FIGURA2>**![bandera roja indicando urgencia](/Users/alejandro/Developer/Memoria-TFG-GTD-Multi-pandoc-markdown/img/tareaPrioridad.png)

**<FIGURA3>**

![simbolo de progreso al 50%](/Users/alejandro/Developer/Memoria-TFG-GTD-Multi-pandoc-markdown/img/progresoProyecto.png)

Por otro lado, tenemos las expresiones, éstas son un concepto fundamental, ya que ayudan a definir como interactúa el usuario con la aplicación, haciéndola mas eficiente y consistente. Éstas las podemos ver en el menú lateral, con las secciones de “Entrada”, “Hoy”, “Cuanto antes”, “Programadas”, etc.



**<Figura4>**

![barra lateral](/Users/alejandro/Developer/Memoria-TFG-GTD-Multi-pandoc-markdown/img/accionesBarraLateral.png) 

Finalmente, hemos optado por un diseño plano y elegante, con pocas trazas de esqueuomorfismo, evitando sobrecargar con detalles superfluos la interfaz. Para ello nos hemos basado en el concepto de *affordance*, haciendo que cada componente que se encuentre en la app sea autoexplicativo, como por ejemplo, el botón de añadir tarea y/o proyecto **<Figura 5>.** Para explorar con mayor detalle estos aspectos, nos hemos basado en varios principios de diseño que describiremos a continuación.



### Proximidad y Consistencia

Estos principios se encuentran relacionados con la coherencia con la que diseñamos la interfaz. El primero de estos principios, **proximidad**, indica que todos los elementos que se encuentren relacionados entre sí deben agruparse visualmente, familiarizándolo y simplificando el proceso de aprendizaje del usuario con los conceptos tratados, como se observa en la figura…

 

**<Figura de las acciones en la sidebar>**



En segundo lugar, detallamos el principio de **consistencia,** que ha sido fundamental tanto para el diseño como para la implementación. Siendo de gran utilidad para la optimización del código, diseño y aprendizaje de la interfaz por parte del usuario final.



<Figura de todas las acciones>



### Visibilidad

D. Norman en su libro **<REFERENCIA AL LIBRO>** explica que todo componente debe proporcionar una representación clara, tanto de su estado como de las funciones que éstas desempeñan. Tanto es así, que explica que cuanto mas visible sea un objeto, mayor será la interacción que tendrá el usuario con él.



Por esto, hemos usado un diseño plano y minimalista, donde los detalles que tienen alta relevancia y que se relacionan con el método GTD, pasan a un primer plano, mientras los demás ocupan un segundo plano. 



**<REFERENCIA A NUMEROS DE TAREAS EN ACCIONES; ACCIONES Y PROYECTOS Y TAREAS>**  



Por último, es conveniente gestionar el estado visible de los componentes de la app, es decir, que el usuario pueda observar claramente el estado actual del sistema. Ejemplo de ello son los detalles en el menú lateral, como el nombre de usuario, que le informa que ha iniciado sesión en la app, así como la fecha actual, que puede ser de especial relevancia para la creación de tareas **<REFERENCIA>**. Por otro lado, las etiquetas y el contexto asociado a cada tarea en la pantalla de “detalles” **<REFERENCIA>,** dirigen la atención a lo que realmente importa.



## ## Prototipos e Interfaces

Durante el desarrollo prematuro de la app exploramos diferentes herramientas de diseño para poder elaborar varios de los mockups que componen la app, entre ellas destacamos **Balsamiq** y **Figma**. Sin embargo, nos decantamos por Figma, ya que es una herramienta más versátil y con mayores opciones de personalización, abarcando desde modelos de baja a alta fidelidad. 



Figma es una plataforma de diseño colaborativo que permite desde la creación de prototipos interactivos hasta interfaces de usuario con alto nivel de detalle. Además de permitir diseñar fácilmente las interfaces, habilita a otros miembros del grupo a colaborar y compartir el contenido que se está diseñando, lo que ha ayudado, en gran parte, a la pronta implementación del Frontend del proyecto.



Asimismo, usamos gran parte de las opciones que ofrece para probar varios de los principios de diseño que hemos logrado implementar en la aplicación final, además de las fuentes y colores utilizados en la misma.



Finalmente, una vez creados todos los prototipos junto a sus componentes, probamos el flujo de diseño que habíamos creado inicialmente, mediante el uso de la aplicación movil, llegando a emular fielmente 1:1 el comportamiento final de la app.



A continuación presentamos todos las interfaces que componen SwiftDo, junto a una breve explicación que las relaciona con el método GTD 



<>

Explicación de la pantalla HOY.

<>



## Implementación: ¿Qué es react native?

Para implementar el Frontend de la app junto a las interfaces de usuario anteriormente descritas, necesitábamos hacer uso de un framework que pudiera adaptarse no solo a interfaces táctiles sino también a interfaces de escritorio. Para lograrlo hemos hecho uso de ***React Native\*** *y* ***Expo\***. 

Expo se trata de una plataforma que agiliza el desarrollo y despliegue de aplicaciones en React Native sin la necesidad de lidiar con configuraciones complejas.

Por otro lado, React Native se trata de un framework desarrollado por Facebook que tiene por lema “*Learn once, write anywhere*”, ya que mediante el uso de React y JavaScript, permite la creación de aplicaciones multiplataforma, ya sea en MacOS, iOS, Windows o Android.

Éste framework no solo destaca por la capacidad de reutilización de código sino por ofrecer un comportamiento nativo de los componentes utilizados, es decir, permitir un rendimiento similar al de las aplicaciones desarrolladas con lenguajes nativos (Swift para IOS o Kotlin para Android).

Por último, destacar la gran comunidad que tiene, ya que además de la documentación que podemos consultar en la pagina web oficial de React Native, disponemos de bibliotecas externas que se detallan en otras páginas web que son útiles para la implementación de otros componentes que no se encuentran en las fuentes oficiales. Las bibliotecas externas que hemos empleado son las siguientes: 

- …
- …
