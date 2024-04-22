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

Los usuarios tienen la capacidad de crear, modificar y eliminar tanto proyectos como áreas dentro de la aplicación. (AHORA MISMO ÁREAS CREO QUE NO SE PUEDEN MODIFICAR NO?) Esta relación permite a los usuario organizar y personalizar su espacio de trabajo de acuerdo con sus necesidades y preferencias.

## Modelo físico de la BD

A continuación, vamos a detallar la implementación concreta del Modelo de Datos en la base de datos real que respalda nuestra aplicación. Describimos la estructura de tablas, los tipos de datos utilizados, así como las relaciones y restricciones de integridad referencial.

Empezamos con las descripciones detalladas de las tablas que componen la base de datos:

