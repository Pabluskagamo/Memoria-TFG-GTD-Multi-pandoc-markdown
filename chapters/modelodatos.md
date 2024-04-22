# Modelo de datos e implementación de la Base de datos

La presente sección tiene como objetivo explorar en detalle el modelo de datos utilizado en nuestra aplicación de gestión de tareas (GTD), proporcionando una visión exhaustiva de cómo se organizan y relacionan los datos esenciales para su funcionamiento.

En primer lugar, presentaremos las principales entidades que componen nuestro modelo, incluyendo tareas, usuarios, proyectos, áreas, etiquetas y las relaciones asociadas a la autorización _OAuth_. Cada entidad es examinada en profundidad, detallando sus atributos y el propósito que cumplen dentro del contexto de la aplicación _GTD_.

Posteriormente, analizaremos las relaciones entre estas entidades, destacando cómo se conectan y cómo estas conexiones facilitan el flujo de información y la interacción dentro de la aplicación.

Además, discutiremos la implementación física del modelo de datos en la base de datos. Nuestra base de datos está alojada en un entorno _Docker_ en _AWS_ (_Amazon Web Services_ ), utilizando _PostgreSQL_ como sistema de gestión de bases de datos. Describiremos la estructura de tablas, índices y restricciones de integridad referencial, resaltando cómo estas decisiones de diseño se traducen en la configuración final de la base de datos.

Por último, analizaremos aspectos críticos como la seguridad de la base de datos, las consideraciones de rendimiento y escalabilidad. Estos temas son esenciales para garantizar la integridad, confidencialidad y disponibilidad de los datos, así como para mantener la aplicación en un estado óptimo a lo largo del tiempo.

## Descripción de entidades

A continuación, desarrollaremos las principales entidades de nuestra aplicación, junto con sus atributos y funciones dentro del sistema:

- **Tareas:** Representa las actividades a realizar dentro de la aplicación. Cada tarea es creada por un usuario y puede contener atributos como título, descripción, fecha límite y prioridad. Además, las tareas pueden ser modificadas en cualquier momento por el usuario propietario, completadas cuando se finalicen, ser asignadas a proyectos específicos o etiquetadas con etiquetas relevantes para una mejor organización.

- **Usuarios:** Los usuarios tienen un rol central en la organización y gestión de la aplicación, ya que tienen la capacidad de crear, modificar y eliminar tanto tareas como proyectos. Pueden también crear y gestionar áreas para una organización más eficiente de su espacio de trabajo. Además, tienen el control sobre aspectos de personalización de la aplicación, junto con la capacidad de modificar su propio perfil.

- **Proyectos:** Permite a los usuarios organizar sus tareas en conjuntos más amplios relacionados con un objetivo común. Los proyectos pueden ser creados, editados y eliminados por los usuarios, y las tareas pueden ser asignadas a proyectos específicos para una gestión más eficiente.

- **Áreas:** También conocida como "Contextos",ofrece una forma adicional de categorizar las tareas. Los usuarios pueden crear, modificar y eliminar áreas según sus necesidades, y asignar tareas a áreas específicas para una mejor organización y seguimiento.

- **Etiquetas:** La entidad etiquetas permite etiquetar las tareas con palabras clave relevantes para una clasificación más detallada. Los usuarios pueden crear, editar y eliminar etiquetas, y asignarlas a tareas individuales para una organización más flexible y personalizada.

- **Relaciones de _OAuth_:** Las entidades *oauth_authcode*, *oauth_clients *y *oauth_tokens* están relacionadas con el proceso de autorización _OAuth_ para la utenticación de usuarios en la aplicación, facilitando la seguridad y la gestión de accesos.

## Relaciones entre entidades

En esta sección, exploraremos las relaciones entre las diferentes entidades dentro del Modelo de Datos de nuestra aplicación. Estas relaciones son fundamentales para comprender cómo interactúan los distintos componentes del sistema y cómo se organiza la información.

- **Tareas y Usuarios:**

Cada tarea de la aplicación está asociada a un usuario que la crea y gestiona. Esta relación permite a los usuarios tener control total sobre sus propias tareas, incluyendo la creación, modificación y eliminación.

- **Tareas y Proyectos:**

Las tareas pueden estar vinculadas a proyectos específicos, lo que facilita la organización y seguimiento de las actividades dentro de entornos más amplios. Esta relación permite a los usuarios agrupar las tareas relacionadas bajo un objetivo común y gestionarlas de manera eficiente.

- **Tareas y Áreas:**

Las tareas también pueden estar asociadas a áreas o contextos específicos, lo que proporciona una categorización adicional para una mejor organización. Los usuarios pueden asignar tareas a áreas relevantes según entorno en el que deben realizarse, lo que facilita la priorización y gestión de estas.

- **Tareas y Etiquetas:**

Las etiquetas se utilizan para clasificar y categorizar las tareas según temas o características comunes. Las tareas pueden estar etiquetadas con una o más etiquetas, lo que permite una organización más detallada y organizada. Esta relación permite a los usuario filtrar y buscar tareas según etiquetas específicas para una gestión más eficiente.

- **Usuarios y Proyectos/Áreas:**

Los usuarios tienen la capacidad de crear, modificar y eliminar tanto proyectos como áreas dentro de la aplicación. Esta relación permite a los usuario organizar y personalizar su espacio de trabajo de acuerdo con sus necesidades y preferencias.

## Modelo físico de la BD

A continuación, vamos a detallar la implementación concreta del Modelo de Datos en la base de datos real que respalda nuestra aplicación. Describimos la estructura de tablas, los tipos de datos utilizados, así como las relaciones y restricciones de integridad referencial.

Empezamos con las descripciones detalladas de las tablas que componen la base de datos:

- **tasks:**
    - "task_id": Identificador único de la tarea
    - "user_id": Identificador del usuario al que pertenece la tarea (obligatorio).
    - "context_id": Identificador del área/contexto en el que puede estar una tarea (opcional).
    - "project_id": Identificador del proyecto al que pertenece la tarea (opcional).
    - "title": Título de la tarea (obligatorio).
    - "description": Descripción de la tarea (opcional).
    - "state": Sección en la que se encuentra la tarea (Inbox, Cuanto Antes, Programadas, etc.).
    - "completed": Booleano que indica si la tarea está completa o no.
    - "important_fixed": Booleano que indica si la tarea es importante (prioridad a la hora de hacer tareas).
    - "date_added": Fecha en la que se añade la tarea.
    - "date_completed": Fecha en la que se completa la tarea.
    - "date_limit": Fecha límite para realizar la tarea (opcional).
    - "date_changed": Fecha en la que se realiza algún cambio en la tarea.
    - "num_version": Número de versión por la que se va en la tarea (por cada cambio).
- **users:**
    - "user_id": Identificador del usuario
    - "name": Nombre del usuario
    - "email": Correo del usuario
    - "password": Contraseña del usuario
- **projects:**
   - "project_id": Identificador del proyecto
   - "title": Título del proyecto
   - "description": Descripción del proyecto
   - "user_id": Identificador del usuario al que pertenece el proyecto
   - "completed": Boolean que indica si está completo el proyecto o no
   - "date_added": Fecha en la que se añade el proyecto
   - "date_changed": Fecha en la que se modifica el proyecto
   - "date_completed": Fecha en la que el proyecto ha sido completado
   - "num_version": Número de version en la que se encuentra el proyecto
   - "colour": Color que corresponde al proyecto (EN LA BD ESTA PUESTO color no COLOUR, INCONCLUENCIA)
- **areas_contexts:**
   - "context_id": Identificador del área/contexto
   - "name": Nombre del área
   - "user_id": Identificador del usuario al que corresponde el área
- **tags:**
   - "name": Nombre de la tag
   - "colour": Color de la tag
- **tagstotask:**
   - "task_id": Identificador de la tarea a la que pertenece la tag
   - "nametag": Nombre de la tag
- **oauth_authcode:**
   - "authorization_code": Código de autorización
   - "expires_at": Fecha de expiración del código
   - "redirect_uri": Dirección a la que te redirige si la obtención del código de autenticación es correcto.
   - "client_id": Identificador del cliente
   - "user_id": Identificador del usuario que recibe el código
- **oauth_clients:**
   - "client_id": Identificador del cliente
   - "client_secret": Número secreto del cliente
   - "redirect_uri": Dirección a la que te redirige si la obtención del código de autenticación es correcto.
   - "grants": Indica los flujos de Oauth configurados para el cliente.
- **oauth_tokens:**
   - "access_token": Token de acceso
   - "access_token_expires_at":  Fecha de expiración del token
   - "refresh_token": Token refrescado
   - "refresh_token_expires_at": Fecha de expiración del token refrescado
   - "client_id": Identificador del cliente
   - "user_id": Identificador del usuario
A continuación, comentamos cómo se establecen las relaciones entre las tablas para mantener la coherencia de los datos y garantizar su integridad:

- Usuarios con Tareas/Proyectos/Áreas:
La tabla de "users" con las tablas "tasks", "projects", "areas_contexts" tiene una relación uno a muchos. (Creo que se podría quitar) Un usuario puede tener muchas tareas, proyectos y áreas, pero cada una de ellas pertenece a un solo usuario. Esta relación uno a muchos se establece mediante la clave foránea "user_id" en las tablas "tasks", "projects" y "areas_contexts", que referencia al identificador único del usuario en la tabla "users".

- Proyectos y Tareas:
La tabla "projects" tiene una relación uno a muchos con la tabla "tasks". Un proyecto puede tener muchas tareas, pero cada tarea pertenece solo a un proyecto. Esta relación uno a muchos se establece mediante la clave foránea "project_id" en la tabla "tasks", que referencia al identificador único del proyeto en la tabla "projects".

- Áreas y Tareas:
La tabla "areas_contexts" tiene una relación uno a muchos con la tabla "tasks". Un área puede tener muchas tareas, pero cada tarea pertenece solo a un área. Esta relación uno a muchos se establece mediante la clave foránea "context_id" en la tabla "tasks", que referencia al identificador único del área en la tabla "areas_contexts.

- Tareas y Tags:
Una tarea puede tener muchas etiquetas, y una etiqueta puede estar asociada a muchas tareas. Esta relación muchos a muchos se implementa mediante una tabla intermedia "tagstotask", que contiene las claves foráneas "task_id" y "nametag" que relacionan las "tasks" con las "tags".


## Rendimiento y Escalabilidad de la Base de Datos
En esta sección, detallamos la estructura y el desempeño de la base de datos implementada. Describimos las acciones concretas llevadas a cabo para mejorar la eficiencia y capacidad de respuesta del sistema ante un crecimiento progresivo de carga de trabajo.

Para mejorar el rendimiento de la base de datos hemos realizado una optimización de consultas, definiendo claves primarias en las tablas pertinentes para garantizar la unicidad de las filas y mejorar el rendimiento de las consultas. Además de diseñar consultas eficientes para minimizar la carga en el servidor de la base de datos.

Con respecto a la escalabilidad, hemos diseñado la base de datos para ser escalable tanto vertical como horizontal. Hemos optimizado el hardware del servidor de la base de datos para aumentar la capacidad de procesamiento, memoria y almacenamiento según sea necesario. Además, se ha considerado la posibilidad de distribuir la carga de trabajo entre múltiples sevidores o nodos en el futuro para escalar horizontalmente.

## Seguridad de la Base de Datos
La seguridad de la base de datos es un componente fundamental para proteger la integridad, confidencialidad y disponibilidad de los datos almacenados. En esta implementación, hemos adoptado diversas medidas para garantizar un entorno seguro:
- Autenticación y Autorización: Hemos implementado un sistema de autenticación robusto que requiere credenciales válidas para acceder a la base de datos. Se hablará de este sistema en los siguientes apartados. 

- Encriptación de datos: Aplicamos técnicas de encriptación para proteger la información sensible almacenada en la base de datos que pueda ser vulnerable a accesos no autorizados (contraseñas).

- Registro de actividades: Hemos llevado a cabo un seguimiento detallado de todas las actividades realizadas en la base de datos mediante la implementación de registros.

Para finalizar este capítulo, es crucial destacar la importancia del diseño y la implementación eficientes del modelo de datos en nuestra aplicación de Gestión de Tareas. A través de un análisis exhaustivo de las entidades, relaciones y consideraciones técnicas, hemos establecido una base sólida para el funcionamiento óptimo de nuestra base de datos. Al comprender la estructura subyacente y las decisiones de diseño, estamos mejor preparados para abordar los desafíos futuros y garantizar la integridad, seguridad y escalabilidad continuas de nuestra aplicación *GTD*.



