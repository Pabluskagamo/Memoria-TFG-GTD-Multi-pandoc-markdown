# Introducción

## Motivación

Inmersos en plena era digital, caracterizada por la cultura de la inmediatez, no resulta tarea fácil mantener el enfoque y evitar distracciones en medio de una vorágine de información y estímulos. Sin embargo, es precisamente en ese entorno donde la productividad personal, guiada por la metodología GTD, se vuelve una herramienta fundamental para poder combatir ésta problemática. 

El sistema GTD (Getting Things Done), es conocido por su eficacia tanto a nivel personal como profesional en la organización, planificación y administración de tareas y proyectos. Sin embargo, algunas de las aplicaciones que lo implementan tienen varios inconvenientes. 

En primer lugar, muchas de estas aplicaciones carecen de un enfoque en materia de protección de datos, ya sea por falta de transparencia de los mismos, pues no especifican cómo es el tratamiento y procesamiento de los mismos. O porque las medidas que han llegado a poner en práctica, no son lo suficientemente robustas para proteger la información que alojan sus usuarios (p.e: los datos son alojados en servidores de terceros y no sabemos los protocolos de seguridad que tienen éstos)

Por otro lado, muchas de estas aplicaciones tienen una alta curva de aprendizaje o son compatibles con un parque de dispositivos limitado. Condicionando de esta forma el acceso de esta metodología a un público más generalista.

Por ello, motivados por poner solución a esta problemática, buscamos desarrollar una aplicación multiplataforma que además de implementar la metodología GTD, destaque por su interfaz intuitiva y amigable, guiada por una infraestructura REST, con el objetivo de permitir al usuario tener el control de sus datos, garantizando la privacidad y la transparencia de los mismos.

## Objetivos

El objetivo central de este proyecto es desarrollar una aplicación multiplataforma GTD. Para ello hemos utilizado el framework *React Native* que permite crear una interfaz de usuario coherente que funcione en todos los sistemas operativos principales, como *Android*, *iOS*, *MacOS *y *Windows*, y garantiza que los usuarios puedan gestionar sus tareas y proyectos de manera eficiente desde cualquier dispositivo, sin importar la plataforma que utilicen. 

La utilización de *React Native* simplifica el desarrollo, mantenimiento y escalabilidad del proyecto, lo que resulta en una aplicación ágil y adaptable a futuras actualizaciones y cambios en las plataformas de destino.

Nuestra aplicación GTD destaca gracias a su modo offline, que permite a los usuarios gestionar tareas incluso sin conexión a Internet. A diferencia de otras alternativas, nuestra app garantiza una experiencia ininterrumpida al almacenar datos localmente y sincronizar automáticamente con el servidor cuando se recupera la conexión, asegurando la disponibilidad constante de la información en todos los dispositivos del usuario.

En el desarrollo de nuestra aplicación GTD, la *API REST* desempeña un papel crucial al proporcionar puntos finales para la comunicación cliente-servidor, permitiendo operaciones *CRUD* en los datos. Además, la implementación de sólidas prácticas de seguridad, como autenticación y cifrado de datos, asegura la integridad y confidencialidad de la información, garantizando una experiencia segura para nuestros usuarios.

### Requisitos de alto nivel

#### Gestión de tareas centralizadas

La aplicación debe permitir a los usuarios crear nuevas tareas, las cuales por defecto se agregarán al *Inbox*. Desde allí, los usuarios podrán asignarles etiquetas, vincularlas a proyectos o áreas específicas, y moverlas entre diferentes secciones.

#### Flexibilidad en la Organización

Los usuarios deben tener la capacidad de organizar sus tareas de manera flexible, añadiéndolas a proyectos o áreas relevantes, y asignándoles etiquetas para una clasificación más detallada. Además, la aplicación debe permitir la edición y eliminación de tareas según sea necesario

#### Seguimiento y Priorización

La aplicación debe proporcionar una serie de funcionalidades para el seguimiento y la priorización de las tareas de manera eficiente y efectiva. Los usuarios deben tener la capacidad de completar tareas y asignarles una importancia relativa. Además, la aplicación debe facilitar el acceso a información detallada sobre cada tarea, incluyendo su estado actual, fecha de vencimiento y cualquier nota asociada. Es crucial que las tareas se prioricen automáticamente según su relevancia para el usuario. La priorización se manifiesta en la gestión efectiva de las fechas de vencimiento, destacando las tareas relevantes para el día actual. Las tareas sin fecha asignada se seleccionan y resaltan automáticamente, optimizando la gestión diaria del usuario

#### Registro y Personalización

La aplicación requiere un sistema de registro e inicio de sesión para los usuarios, con la capacidad de personalizar sus etiquetas, tareas, proyectos y áreas. Esto garantiza una experiencia personalizada y segura para cada usuario.

#### Seguridad

Nuestra aplicación GTD debe implementar un robusto sistema de autenticación y autorización para garantizar que solo usuarios autorizados puedan acceder y manipular los datos a través de la *API REST*. Además, se requiere cifrado de extremo a extremo para proteger la confidencialidad de la información durante su transmisión y almacenamiento, asegurando así una experiencia segura para todos los usuarios.

#### Funcionalidades de Búsqueda y Filtrado

Los usuarios deben poder buscar y filtrar sus tareas según etiquetas, áreas, proyectos u otros criterios relevantes, lo que facilita la gestión y visualización de las tareas.

#### Usabilidad y accesibilidad

La aplicación proporciona un modo offline que permite gestionar tareas sin conexión almacenando los datos localmente en el dispositivo del usuario y asegurando la continuidad del trabajo sin importar la disponibilidad de conexión. También integra agentes conversacionales como *Alexa* y *Google Assistant* ofreciendo una experiencia más versátil, permitiendo así a los usuarios interactuar con la aplicación mediante comandos de voz, simplificando aún más la entrada y gestión de tareas de forma intuitiva y sin esfuerzo.

### Diagrama de bloques del sistema

## Plan de Trabajo

#### Tareas

Para el correcto desarrollo del proyecto hemos dividido las tareas realizadas en varias fases que se comentan a continuación.

En primer lugar y de manera individual, realizamos una labor de búsqueda comparando nuestro modelo de proyecto con otras aplicaciones existentes en el mercado para posteriormente poner en común las distintas ideas. Cada uno se instaló una de estas aplicaciones y fue apuntando las posibles mejoras que podríamos implementar para mejorar nuestro producto. Gracias a este ejercicio, llegamos a muchas de las conclusiones explicadas en el apartado de motivación.

Posteriormente, hubo una fase de diseño en la cual realizamos un *mockup* de como nos gustaría que fuese nuestra aplicación.

A continuación, tuvimos una fase de aprendizaje en la cual buscamos información y experimentamos con las distintas herramientas y componentes necesarios para montar nuestra aplicación, entre estos componentes buscamos familiarizarnos con *express*, *docker*, *AWS*, *React Native*, *firebase* entre otros para realizar una comparación y escoger las tecnologías que mejor se adaptaban a nuestras necesidades para el futuro desarrollo de nuestra aplicación.

Una vez terminadas las distintas tareas previas al desarrollo comentadas anteriormente, comenzamos con la programación del backend que nos llevó aproximadamente cuatro meses, durante este tiempo estuvimos implementando los servicios principales de la aplicación además del sistema de autenticación y autorización. Una vez terminada la parte esencial del backend, comenzamos con el desarrollo del frontend, que ha sido la fase más costosa en tiempo y esfuerzo ya que hemos querido implementar con énfasis una interfaz amigable y usable además de funcionalidad extensa (filtrado, búsqueda, edición…) y es por ello que hemos ido realizando actualizaciones necesarias en backend para el correcto funcionamiento de la aplicación.

#### Diagramas de Gantt

##### Backend

![Diagrama de Gantt backend] (img/backendgantt){width=100%}

##### Frontend

![Diagrama de Gantt frontend] (img/frontendgantt){width=100%}
