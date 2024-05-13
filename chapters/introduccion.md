# Introducción

La metodología *GTD*(*Getting Things Done*) tiene como objetivo ayudar a las personas a realizar sus tareas del día a día de manera que no dependan de su memoria y se centren en el ahora, sin estar pendiente de futuras tareas. Este método fue creado por David Allen, quien lo recogío en su libro que recibe el mismo nombre [@gtd-book] y fue traducido al español como "Organízate con eficacia".

El flujo de trabajo que establece *GTD* pasa por diversas etapas cada una con una finalidad específica que da validez a la efectividad del método. También propone definir en cada tarea el lugar físico donde se realizará, con el fin de asociar los distintos lugares que una persona visita durante el día a tus tareas pendientes. En la sección 2.1 se explica la idea con más detalle.

## Motivación

Inmersos en plena era digital, caracterizada por la cultura de la inmediatez, no resulta tarea fácil mantener el enfoque y evitar distracciones en medio de una vorágine de información y estímulos. Sin embargo, es precisamente en ese entorno donde la productividad personal, guiada por la metodología *GTD*, se vuelve una herramienta fundamental para poder combatir ésta problemática. 

El sistema *GTD* (*Getting Things Done*), es conocido por su eficacia tanto a nivel personal como profesional en la organización, planificación y administración de tareas y proyectos. Sin embargo, algunas de las aplicaciones que lo implementan tienen varios inconvenientes. 

En primer lugar, muchas de estas aplicaciones carecen de un enfoque en materia de protección de datos, ya sea por falta de transparencia de los mismos, pues no especifican cómo es el tratamiento y procesamiento de los mismos. O porque las medidas que han llegado a poner en práctica, no son lo suficientemente robustas para proteger la información que alojan sus usuarios (p.e: los datos son alojados en servidores de terceros y no sabemos los protocolos de seguridad que tienen éstos)

Por otro lado, muchas de estas aplicaciones tienen una alta curva de aprendizaje o son compatibles con un parque de dispositivos limitado. Condicionando de esta forma el acceso de esta metodología a un público más generalista.

Por ello, motivados por poner solución a esta problemática, buscamos desarrollar una aplicación multiplataforma que además de implementar la metodología *GTD*, destaque por su interfaz intuitiva y amigable, guiada por una infraestructura *REST*, con el objetivo de permitir al usuario tener el control de sus datos, garantizando la privacidad y la transparencia de los mismos.

## Objetivos

El objetivo central de este proyecto es desarrollar una aplicación multiplataforma *GTD*. Para ello hemos utilizado el framework *React Native* que permite crear una interfaz de usuario coherente que funcione en todos los sistemas operativos principales, como *Android*, *iOS*, *MacOS*, *GNU/Linux* y *Windows*, y garantiza que los usuarios puedan gestionar sus tareas y proyectos de manera eficiente desde cualquier dispositivo, sin importar la plataforma que utilicen. 

La utilización de *React Native* simplifica el desarrollo, mantenimiento y escalabilidad del proyecto, lo que resulta en una aplicación ágil y adaptable a futuras actualizaciones y cambios en las plataformas de destino.

Nuestra aplicación *GTD* destaca por su modo offline, que permite a los usuarios gestionar tareas incluso sin conexión a Internet (como puede darse el caso en dispositivos móviles). A diferencia de otras alternativas, nuestra app garantiza una experiencia ininterrumpida al almacenar datos localmente y sincronizar automáticamente con el servidor cuando se recupera la conexión, asegurando la disponibilidad constante de la información en todos los dispositivos del usuario.

En el desarrollo de nuestra aplicación *GTD*, la *API REST* desempeña un papel crucial al proporcionar *endpoints* para la comunicación cliente-servidor, permitiendo operaciones *CRUD* en los datos, como por ejemplo, tener un _endpoint_ '/tareas' para la creación y lectura de tareas. De esta manera, la _API REST_ proporciona una interfaz estandarizada y eficiente para la manipulación de datos en nuestra plataforma _GTD_. Además, la implementación de sólidas prácticas de seguridad, como autenticación y cifrado de datos, asegura la integridad y confidencialidad de la información, garantizando una experiencia segura para nuestros usuarios.

Al desarrollar nuestra aplicación perseguimos una serie de objetivos específicos que quedaron representados mediantes los siguientes requisitos de alto nivel:

- **Gestión de tareas centralizadas:**
  
  La aplicación debe permitir a los usuarios crear nuevas tareas, las cuales por defecto se agregarán al *Inbox* (almacén de tareas sin organizar dentro de la metodología _GTD_). Desde allí, los usuarios podrán asignarles etiquetas, vincularlas a proyectos o áreas específicas, y moverlas entre diferentes secciones.

- **Flexibilidad en la Organización:**
  
  Los usuarios deben tener la capacidad de organizar sus tareas de manera flexible, añadiéndolas a proyectos o áreas relevantes, y asignándoles etiquetas para una clasificación más detallada. Además, la aplicación debe permitir la edición y eliminación de tareas según sea necesario

- **Seguimiento y Priorización:**
  
  La aplicación debe proporcionar una serie de funcionalidades para el seguimiento y la priorización de las tareas de manera eficiente y efectiva. Los usuarios deben tener la capacidad de completar tareas y asignarles una importancia relativa. Además, la aplicación debe facilitar el acceso a información detallada sobre cada tarea, incluyendo su estado actual, fecha de vencimiento y cualquier nota asociada. Es crucial que las tareas se prioricen automáticamente según su relevancia para el usuario.

- **Seguridad:**
  
  Nuestra aplicación GTD debe implementar un robusto sistema de autenticación y autorización para garantizar que solo usuarios autorizados puedan acceder y manipular los datos a través de la *API REST*. Además, se requiere cifrado de extremo a extremo para proteger la confidencialidad de la información durante su transmisión y almacenamiento, asegurando así una experiencia segura para todos los usuarios.

- **Funcionalidades de Búsqueda y Filtrado:**
  
  Los usuarios deben poder buscar y filtrar sus tareas según etiquetas, áreas, proyectos u otros criterios relevantes, lo que facilita la gestión y visualización de las tareas.

- **Usabilidad:**
  
  La aplicación proporciona un modo *offline* que permite gestionar tareas sin conexión almacenando los datos localmente en el dispositivo del usuario y asegurando la continuidad del trabajo sin importar la disponibilidad de conexión.

- **Integración con agentes conversacionales:**
  
  La aplicación se integra con agentes conversacionales como _Alexa_ y _Google Assistant_ ofreciendo una experiencia más versátil, permitiendo así a los usuarios interactuar con la aplicación mediante comandos de voz, simplificando aún más la entrada y gestión de tareas de forma intuitiva y sin esfuerzo.

Estos requisitos proporcionan una base sólida para el desarrollo de la aplicación *GTD*, garantizando una experiencia integral que cumpla con los principios fundamentales de la metodología *GTD* y satisfaga las necesidades de los usuarios en la gestión efectiva de sus tareas y proyectos.

### Arquitectura del sistema { #sec:arqui }

![Diagrama de bloques del sistema](img/diagramabloques.png){width=100% #fig:bloqusis}

La figura \ref{fig:bloqusis} muestra el diagrama de bloques del sistema, que está compuesto principalmente por 2 componentes principales, una aplicación cliente, disponible para diversos dispositivos y un *backend* el cual cuenta con una *API Rest* con un sistema de autorización seguro.

La aplicación cliente está implementada con el framework multiplataforma *React Native*, pudiendo ser ejecutada en diversos dispositivos. Los clientes interactúan mediante *REST* sobre *HTTPS* con el *backend*.

El *backend* implementa 2 componentes principales e incluye una base de datos. Por una parte está el módulo *OAuth 2.0* el cual se encarga de gestionar el flujo de autenticación y autorización, es decir gestiona el acceso de los usuarios de las aplicaciones cliente a la información y a los servicios que proporciona el *backend*. Por otra parte, el *backend* también está compuesto por una *API* que sigue la arquitectura *REST* e implementa y expone mediante diversos *endpoint*s los diferentes servicios de la aplicación. Por último el *backend* contiene también la base de datos de la aplicación, la cual contiene tanto las tablas que utiliza el módulo *API Rest* como el módulo *OAuth 2.0*. Todos los servicios que contiene el *backend* están gestionados mediante contenedores *Docker*, de esta manera es posible arrancar, conectar y configurar los diversos módulos de manera sencilla y ágil, con el fin de poder desplegar dichos servicios en cualquier máquina sin necesidad de más configuración particular a cada entorno.

Por último, el sistema contiene un tercer componente el cual permite conectar algunos agentes conversacionales con la aplicación. Desde los clientes es posible realizar dicha configuración de agentes mediante la generación de una clave especial para estos, de manera que los agentes una vez configurados puedan acceder a los servicios del *backend* mediante comandos de voz.

## Plan de Trabajo

### Tareas

Para llevar a cabo el desarrollo del proyecto hemos dividido las tareas a realizar en varias fases que se comentan a continuación.

En primer lugar y de manera individual, realizamos una labor de búsqueda comparando nuestro modelo de proyecto con otras aplicaciones existentes en el mercado para posteriormente poner en común las distintas ideas. Cada miembro del equipo se instaló una de estas aplicaciones y fue apuntando las posibles mejoras que podríamos implementar para aportar más valor a nuestro producto. Gracias a este ejercicio, llegamos a muchas de las conclusiones explicadas en la **sección 1.1**.

Posteriormente, hubo una fase de diseño en la cual realizamos un *mockup* de como nos gustaría que fuese nuestra aplicación.

A continuación, tuvimos una fase de aprendizaje en la cual buscamos información y experimentamos con las distintas herramientas y componentes necesarios para montar nuestra aplicación. Entre estos componentes buscamos familiarizarnos con *express*, *docker*, *AWS*, *React Native*, *firebase* entre otros para realizar una comparación y escoger las tecnologías que mejor se adaptaban a nuestras necesidades para el futuro desarrollo de nuestra aplicación.

Una vez terminadas las distintas tareas previas al desarrollo comentadas anteriormente, comenzamos con la programación del *backend* que nos llevó aproximadamente cuatro meses, durante este tiempo estuvimos implementando los servicios principales de la aplicación además del sistema de autenticación y autorización. Una vez terminada la parte esencial del *backend*, comenzamos con el desarrollo del *frontend*, que ha sido la fase más costosa en tiempo y esfuerzo, ya que hemos dedicado un gran trabajo a crear una interfaz amigable y usable además de funcionalidad extensa (filtrado, búsqueda, edición…). Es por ello que hemos ido realizando actualizaciones necesarias en *backend* para el correcto funcionamiento de la aplicación.

### Diagramas de Gantt

#### Backend

![Diagrama de Gantt backend](img/backendgantt.png){width=100% #fig:ganttback}

#### Frontend

![Diagrama de Gantt frontend](img/frontendgantt.png){width=100% #fig:ganttfront}

### Estructura de la memoria

El resto de memoria se organiza como sigue:

 - En el **capitulo 2** se realiza un análisis sobre qué es *GTD*, cual es su método y técnica y también se describen las distintas aplicaciones que implementan *GTD*.
 - En el **capitulo 3** se discute sobre la planificación del proyecto, tratando puntos como el sistema de control de versiones, los entornos de desarrollo e integración utilizados y el sistema de despliegue.
 - En el **capitulo 4** mostramos el modelo de datos y la implementación de la base de datos. Aquí se describen las entidades, el modelo físico de la base de datos, su rendimiento y escalabilidad y la seguridad de la misma.
 - En el **capitulo 5** se introduce el diseño e implementación del *backend*, explicando el uso que hacemos de *REST*, el diseño de la *API*, los *endpoints* de la aplicación, los aspectos de seguridad de la *API* y la implementación de *OAuth 2.0*.
 - En el **capitulo 6** se detallan los principios de diseño que han guiado la creación de la *app*, junto a las distintas tecnologías empleadas en el desarrollo de la misma, desde la etapa inicial del prototipado hasta su implementación. Explorando como los fundamentos del método GTD se han ido plasmando en *SwiftDo*.
 - En el **capitulo 7** se describe la integración de nuestra aplicación GTD con agentes conversacionales, en nuestro caso con Alexa. Explicaremos como hemos configurado la *skill* de alexa, como hemos vinculado nuestra cuenta de usuario, la implementación del flujo de autorización *OAuth 2.0* y los problemas que nos han surgido en este proceso.
 - En el **capitulo 8** se encuentra el manual  de usuario, mostrando la funcionalidad al completo de nuestra aplicación de manera fácil e intuitiva.
 - En el **capitulo 9** se recogen las principales conclusiones a las que hemos llegado y se discuten lineas de trabajo futuras.
 - Esta memoria consta también de cuatro apéndices. Los dos primeros (apéndices A y B) corresponden a la traducción al inglés de la introducción y la conclusión, el tercero (apéndice C) hace referencia a las contribuciones que ha hecho cada miembro del equipo al proyecto y el cuarto (apéndice D) es una guía de despliegue para que cualquiera que quiera utilizar nuestra aplicación pueda hacerlo.
