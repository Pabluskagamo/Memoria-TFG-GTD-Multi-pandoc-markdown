# Introducción

Explicar que es GTD y el proyecto introductoriamente.

## Motivación

Inmersos en plena era digital, caracterizada por la cultura de la inmediatez, no resulta tarea fácil mantener el enfoque y evitar distracciones en medio de una vorágine de información y estímulos. Sin embargo, es precisamente en ese entorno donde la productividad personal, guiada por la metodología *GTD*, se vuelve una herramienta fundamental para poder combatir ésta problemática. 

El sistema *GTD* (*Getting Things Done*), es conocido por su eficacia tanto a nivel personal como profesional en la organización, planificación y administración de tareas y proyectos. Sin embargo, algunas de las aplicaciones que lo implementan tienen varios inconvenientes. 

En primer lugar, muchas de estas aplicaciones carecen de un enfoque en materia de protección de datos, ya sea por falta de transparencia de los mismos, pues no especifican cómo es el tratamiento y procesamiento de los mismos. O porque las medidas que han llegado a poner en práctica, no son lo suficientemente robustas para proteger la información que alojan sus usuarios (p.e: los datos son alojados en servidores de terceros y no sabemos los protocolos de seguridad que tienen éstos)

Por otro lado, muchas de estas aplicaciones tienen una alta curva de aprendizaje o son compatibles con un parque de dispositivos limitado. Condicionando de esta forma el acceso de esta metodología a un público más generalista.

Por ello, motivados por poner solución a esta problemática, buscamos desarrollar una aplicación multiplataforma que además de implementar la metodología *GTD*, destaque por su interfaz intuitiva y amigable, guiada por una infraestructura *REST*, con el objetivo de permitir al usuario tener el control de sus datos, garantizando la privacidad y la transparencia de los mismos.

## Objetivos

El objetivo central de este proyecto es desarrollar una aplicación multiplataforma GTD. Para ello hemos utilizado el framework React Native que permite crear una interfaz de usuario coherente que funcione en todos los sistemas operativos principales, como Android, iOS, MacOS y Windows, y garantiza que los usuarios puedan gestionar sus tareas y proyectos de manera eficiente desde cualquier dispositivo, sin importar la plataforma que utilicen. 

La utilización de React Native simplifica el desarrollo, mantenimiento y escalabilidad del proyecto, lo que resulta en una aplicación ágil y adaptable a futuras actualizaciones y cambios en las plataformas de destino.

Nuestra aplicación GTD destaca gracias a su modo offline, que permite a los usuarios gestionar tareas incluso sin conexión a Internet. A diferencia de otras alternativas, nuestra app garantiza una experiencia ininterrumpida al almacenar datos localmente y sincronizar automáticamente con el servidor cuando se recupera la conexión, asegurando la disponibilidad constante de la información en todos los dispositivos del usuario.

En el desarrollo de nuestra aplicación GTD, la API REST desempeña un papel crucial al proporcionar puntos finales para la comunicación cliente-servidor, permitiendo operaciones CRUD en los datos. Además, la implementación de sólidas prácticas de seguridad, como autenticación y cifrado de datos, asegura la integridad y confidencialidad de la información, garantizando una experiencia segura para nuestros usuarios.

### Requisitos de alto nivel

#### Gestión de tareas centralizadas

La aplicación debe permitir a los usuarios crear nuevas tareas, las cuales por defecto se agregarán al Inbox. Desde allí, los usuarios podrán asignarles etiquetas, vincularlas a proyectos o áreas específicas, y moverlas entre diferentes secciones.

#### Flexibilidad en la Organización

Los usuarios deben tener la capacidad de organizar sus tareas de manera flexible, añadiéndolas a proyectos o áreas relevantes, y asignándoles etiquetas para una clasificación más detallada. Además, la aplicación debe permitir la edición y eliminación de tareas según sea necesario

#### Seguimiento y Priorización

La aplicación debe proporcionar una serie de funcionalidades para el seguimiento y la priorización de las tareas de manera eficiente y efectiva. Los usuarios deben tener la capacidad de completar tareas y asignarles una importancia relativa.Además, la aplicación debe facilitar el acceso a información detallada sobre cada tarea, incluyendo su estado actual, fecha de vencimiento y cualquier nota asociada. Es crucial que las tareas se prioricen automáticamente según su relevancia para el usuario. La priorización se manifiesta en la gestión efectiva de las fechas de vencimiento, destacando las tareas relevantes para el día actual. Las tareas sin fecha asignada se seleccionan y resaltan automáticamente, optimizando la gestión diaria del usuario

### Diagrama de bloques del sistema

![Diagrama de bloques del sistema](img/diagramabloques.png){width=100% #fig:bloqusis}

El sistema está compuesto principalmente por 2 módulos principales, Una aplicación cliente, disponible para diversos dispositivos y un backend el cual cuenta con una *API Rest* con un sistema de autorización seguro.

En primer lugar tenemos la aplicación cliente la cual está implementada con el framework multiplataforma *React Native*, pudiendo ser ejecutada en diversos clientes. Los clientes interactúan mediante el protocolo *HTTPS* con el backend.

El backend implementa 2 módulos principales y una base de datos. Por una parte está el módulo *OAuth 2.0* el cual se encarga de gestionar el flujo de autenticación y autorización, es decir gestiona el acceso de los usuarios de las aplicaciones cliente a la información y a los servicios que proporciona el backend. Por otra parte, el backend también está compuesto por una *API* que sigue la arquitectura *REST* e implementa y expone mediante diversos endpoints los diferentes servicios de la aplicación. Por último el Backend contiene también la base de datos de la aplicación, la cual contiene tanto las tablas que utiliza el módulo *API Rest* como el módulo *OAuth 2.0*. Todos los servicios que contiene el backend están gestionados mediante contenedores *Docker*, de esta manera es posible arrancar, conectar y configurar los diversos módulos de manera sencilla y ágil, con el fin de poder desplegar dichos servicios en cualquier máquina sin necesidad de más configuración particular a cada entorno.

Por último, el sistema también dispone de la posibilidad de conectar algunos agentes conversacionales con la aplicación. Desde los clientes es posible realizar dicha configuración de agentes mediante la generación de una clave especial para estos, de manera que los agentes una vez configurados puedan acceder a los servicios del backend mediante comandos de voz.

## Plan de Trabajo
