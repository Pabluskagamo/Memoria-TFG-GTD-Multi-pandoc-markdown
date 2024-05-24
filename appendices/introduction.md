# Introduction

## Motivation

Immersed in the digital age, characterized by the culture of immediacy, it's not an easy task to keep focus and avoid distractions in the middle of a maelstorm of information and stimuli. The *GTD* (Getting Things Done) methodology aims to help people perform their daily tasks in a way that they do not depend on their memory and focus on the now, without being aware of future tasks. This method was created by David Allen, who collected it in his book entitled "Getting Things Done" [@gtd-book] and was translated into Spanish as "Organízate con eficacia".

Likewise, the *GTD* system is known for its effectiveness both personally and professionally in planning, organizing and managing tasks. However, some of the apps that implement it have several problems. First of all, many of these applications do not clearly inform about the process of processing their users' data. (e.g., the data is hosted on third-party servers and their security protocols are unknown).

On the other hand, many of these apps have a high learning curve or are compatible with a small number of operating systems. A clear example of this is Things ^[[Things](https://culturedcode.com/things/)] which, despite being a very good application, is only available for Apple devices. This conditions the access of this methodology to a more general public.

Therefore, motivated to solve this problem, we seek to develop a multiplatform application that, in addition to implementing the *GTD* methodology, stands out for its intuitive and friendly interface, guided by a *REST* architecture, with the aim of allowing the user to have control of their data, guaranteeing their privacy and transparency. This application, called *SwiftDo*, aims to offer an accessible and versatile alternative for the efficient management of daily tasks.


## Goals

The main objective of this project is to develop a cross-platform *GTD* application. To do this, we have used the *React Native* framework that allows us to create a consistent user interface that works on all major operating systems, such as *Android*, *iOS*, *MacOS*, *GNU/Linux* and *Windows*, and ensures that users can manage their tasks and projects efficiently from any device, no matter what platform they use.

The use of *React Native* simplifies the development, manteinance, and scalability of the project, resulting in an agile application that is adaptable to future updates and changes in the target platforms.

*SwiftDo* stands out for its offline mode, which allows users to manage tasks even without an internet connection (as can be the case on mobile devices). Unlike other alternatives, our app ensures an uninterrupted experience by storing data locally and automatically synchronizing with the server when the connection is restored, ensuring the constant availability of information on all the user's devices.

In the development of *SwiftDo*, the REST API plays a crucial role as it provides endpoints for the client-server communication, enabling CRUD operations on data, such as having an *endpoint* '/tareas' for creating and reading tasks. In this way, the REST API provides a standardized and efficient interface for data manipulation on out *GTD* platform. In addition, implementing solid security practices, such as authentication and data encryption, ensures the integrity and confidenciality of information, guaranteeing a secure experience for our users.

When developing our application, we pursue a series of specific objectives that were represented by the following high-level requirements.

- **Gestión de tareas centralizada:**
  
  La aplicación debe permitir a los usuarios crear nuevas tareas, las cuales por defecto se agregarán al *Inbox* (almacén de tareas sin organizar dentro de la metodología _GTD_). Desde allí, los usuarios podrán asignarles etiquetas, vincularlas a proyectos o áreas específicas, y moverlas entre diferentes secciones.

- **Flexibilidad en la Organización:**
  
  Los usuarios deben tener la capacidad de organizar sus tareas de manera flexible, añadiéndolas a proyectos o áreas relevantes, y asignándoles etiquetas para una clasificación más detallada. Además, la aplicación debe permitir la edición y eliminación de tareas según sea necesario

- **Seguimiento y Priorización:**
  
  La aplicación debe proporcionar una serie de funcionalidades para el seguimiento y la priorización de las tareas de manera eficiente y efectiva. Los usuarios deben tener la capacidad de completar tareas y asignarles una importancia relativa. Además, la aplicación debe facilitar el acceso a información detallada sobre cada tarea, incluyendo su estado actual, fecha de vencimiento y cualquier nota asociada. Es crucial que las tareas se prioricen automáticamente según su relevancia para el usuario.

- **Seguridad:**
  
  Nuestra aplicación *SwiftDo* debe implementar un robusto sistema de autenticación y autorización para garantizar que solo usuarios autorizados puedan acceder y manipular los datos a través de la *API REST*. Además, se requiere cifrado de extremo a extremo para proteger la confidencialidad de la información durante su transmisión y almacenamiento, asegurando así una experiencia segura para todos los usuarios.

- **Funcionalidades de Búsqueda y Filtrado:**
  
  Los usuarios deben poder buscar y filtrar sus tareas según etiquetas, áreas, proyectos u otros criterios relevantes, lo que facilita la gestión y visualización de las tareas.

- **Usabilidad:**
  
  La aplicación proporciona un modo *offline* que permite gestionar tareas sin conexión almacenando los datos localmente en el dispositivo del usuario y asegurando la continuidad del trabajo sin importar la disponibilidad de conexión.

- **Integración con agentes conversacionales:**
  
  La aplicación se integra con agentes conversacionales como *Alexa* ofreciendo una experiencia más versátil, permitiendo así a los usuarios interactuar con la aplicación mediante comandos de voz, simplificando aún más la entrada y gestión de tareas de forma intuitiva y sin esfuerzo.

Estos requisitos proporcionan una base sólida para el desarrollo de la aplicación *SwiftDo*, garantizando una experiencia integral que cumpla con los principios fundamentales de la metodología *GTD* y satisfaga las necesidades de los usuarios en la gestión efectiva de sus tareas y proyectos.

### Arquitectura del sistema { #sec:arqui }

![Diagrama de bloques del sistema](img/diagramabloques.png){width=100% #fig:bloqusis}

La figura \ref{fig:bloqusis} muestra el diagrama de bloques del sistema, que está compuesto por 2 componentes principales: una aplicación cliente, formado esencialmente para diversos dispositivos y un *backend* el cual cuenta con una *API REST* con un sistema de autorización seguro.

La aplicación cliente está implementada con el framework multiplataforma *React Native*, pudiendo ser ejecutada en diversos dispositivos. Los clientes interactúan mediante *REST* sobre *HTTPS* con el *backend*.

El *backend* implementa 2 componentes principales e incluye una base de datos. Por una parte está el módulo *OAuth 2.0* el cual se encarga de gestionar el flujo de autenticación y autorización, es decir gestiona el acceso de los usuarios de las aplicaciones cliente a la información y a los servicios que proporciona el *backend*. Por otra parte, el *backend* también está compuesto por una *API* que sigue la arquitectura *REST* e implementa y expone mediante diversos *endpoint*s los diferentes servicios de la aplicación. Por último el *backend* contiene también la base de datos de la aplicación, la cual contiene tanto las tablas que utiliza el módulo *API Rest* como el módulo *OAuth 2.0*. Todos los servicios que contiene el *backend* están gestionados mediante contenedores *Docker*, de esta manera es posible arrancar, conectar y configurar los diversos módulos de manera sencilla y ágil, con el fin de poder desplegar dichos servicios en cualquier máquina sin necesidad de más configuración particular a cada entorno.

Por último, el sistema contiene un tercer componente el cual permite conectar algunos agentes conversacionales con la aplicación. Desde los clientes es posible realizar dicha configuración de agentes mediante la generación de una clave especial para estos, de manera que los agentes una vez configurados puedan acceder a los servicios del *backend* mediante comandos de voz.

## Plan de Trabajo

### Tareas

Para llevar a cabo el desarrollo del proyecto hemos dividido las tareas a realizar en varias fases que se comentan a continuación.

En primer lugar y de manera individual, realizamos una labor de búsqueda comparando nuestro modelo de proyecto con otras aplicaciones existentes en el mercado para posteriormente poner en común las distintas ideas. Cada miembro del equipo instaló y analizó una de estas aplicaciones y fue apuntando las posibles mejoras que podríamos implementar para aportar más valor a nuestro producto. Gracias a este ejercicio, llegamos a muchas de las conclusiones explicadas en la **sección 1.1**.

Posteriormente, hubo una fase de diseño en la cual realizamos un *mockup* de cómo nos gustaría que fuese nuestra aplicación.

A continuación, tuvimos una fase de aprendizaje en la cual buscamos información y experimentamos con las distintas herramientas y componentes necesarios para montar nuestra aplicación. Entre estos componentes buscamos familiarizarnos con *Express*, *Docker*, *AWS*, *React Native*, *firebase* entre otros para realizar una comparativa y escoger las tecnologías que mejor se adaptaban a nuestras necesidades para el futuro desarrollo de nuestra aplicación.

Una vez terminadas las distintas tareas previas al desarrollo comentadas anteriormente, comenzamos con la programación del *backend* que nos llevó aproximadamente cuatro meses. Durante este tiempo estuvimos implementando los servicios principales de la aplicación además del sistema de autenticación y autorización. Una vez terminada la parte esencial del *backend*, comenzamos con el desarrollo del *frontend*, que ha sido la fase más costosa en tiempo y esfuerzo, ya que hemos dedicado un gran trabajo a crear una interfaz amigable y usable además de funcionalidad extensa (filtrado, búsqueda, edición…). Es por ello que hemos ido realizando actualizaciones necesarias en *backend* para el correcto funcionamiento de la aplicación.

### Planificación temporal

Las figuras \ref{fig:ganttback} y \ref{fig:ganttfront} muestran las tareas asociadas al desarrollo del backend y del frontend respectivamente, así como la fecha de inicio, la fecha de fin y la duración de cada tarea:

#### Backend {.unnumbered}

![Diagrama de Gantt backend](img/backendgantt.png){width=100% #fig:ganttback}

#### Frontend {.unnumbered}

![Diagrama de Gantt frontend](img/frontendgantt.png){width=100% #fig:ganttfront}

### Estructura de la memoria

El resto de memoria se organiza como sigue:

- En el **capítulo 2** se realiza un análisis sobre qué es *GTD*, cuál es su método y técnica. También se describen las distintas aplicaciones en el mercado que implementan *GTD*.
- En el **capítulo 3** se discute la planificación del proyecto, tratando puntos como el sistema de control de versiones, los entornos de desarrollo e integración utilizados y el sistema de despliegue.
- En el **capítulo 4** presentamos el modelo de datos y la implementación de la base de datos. Aquí se describen las entidades, el modelo físico de la base de datos, su rendimiento y escalabilidad y la seguridad de la misma.
- En el **capítulo 5** se introduce el diseño e implementación del *backend*, explicando el uso que hacemos de *REST*, el diseño de la *API*, los *endpoints* de la aplicación, los aspectos de seguridad de la *API* y la implementación de *OAuth 2.0*.
- En el **capítulo 6** se detallan los principios de diseño que han guiado la creación de la *app*, junto a las distintas tecnologías empleadas en el desarrollo de la misma, desde la etapa inicial del prototipado hasta su implementación, explorando cómo los fundamentos del método GTD se han ido plasmando en *SwiftDo*.
- En el **capítulo 7** se describe la integración de nuestra aplicación GTD con agentes conversacionales, en nuestro caso con *Alexa*. Explicaremos cómo hemos configurado la *skill* de *Alexa*, cómo hemos vinculado nuestra cuenta de usuario, la implementación del flujo de autorización *OAuth 2.0* y los problemas que nos han surgido en este proceso.
- En el **capítulo 8** se encuentra el manual  de usuario, mostrando la funcionalidad al completo de nuestra aplicación de manera fácil e intuitiva.
- En el **capítulo 9** se recogen las principales conclusiones a las que hemos llegado y se discuten líneas de trabajo futuras.
- Esta memoria consta también de cuatro apéndices. Los dos primeros (apéndices A y B) corresponden a la traducción al inglés de la introducción y las conclusiones, el tercero (apéndice C) enumera las contribuciones que ha hecho cada miembro del equipo al proyecto, y el último, (apéndice D) proporciona una guía de despliegue para que cualquiera que quiera utilizar nuestra aplicación pueda hacerlo.
