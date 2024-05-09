# Diseño e implementación del Backend

La arquitectura cliente-servidor es una de las más usadas a día de hoy y por lo tanto tener un *backend* robusto es de vital importancia en cualquier aplicación. Por ello hemos invertido gran cantidad de esfuerzo en el diseño y la implementación del *backend* para asegurar un correcto funcionamiento de la aplicación a nivel de lógica de negocio además de garantizar seguridad en la comunicación con los clientes a la hora de acceder a datos y operaciones.

## Uso de REST

Una de las características a destacar es el uso de la arquitectura *REST* para nuestra *API*. La clave de esta arquitectura es el uso del protocolo *HTTP* para el acceso a una interfaz de operaciones bien definidas. Además la arquitectura *REST* busca definir una sintaxis para identificar los recursos y sus diferentes operaciones consiguiendo así una organización clara y mantenible de los diferentes elementos de nuestra aplicación para facilitar el acceso desde los clientes. El uso de esta arquitectura en nuestro proyecto viene dada por la necesidad de organizar los distintos recursos a los que puede acceder la aplicación cliente con el objetivo de estandarizar el servicio y facilitar la comunicación y evolución de este.

Por otro lado aunque *REST* permite la comunicación entre el cliente y el servidor mediante cualquier formato usamos el formato *JSON* ya que es un formato muy sencillo de comprender y manipular en comparación a otros como por ejemplo *XML* donde además *JSON* es mucho más ligero en cuanto a demanda de ancho de banda respecto a este.

## Descripción tecnologías: Node JS + Express

Para el desarrollo del *backend* nos hemos decantado por el uso del entorno *Node.js* en conjunto con el *framework* de este mismo llamado *Express.js* el cual proporciona una manera muy sencilla de implementar gran cantidad de servicios de aplicaciones web.

*Node.js* es una entorno de ejecución multiplataforma basado en el lenguaje de programación *JavaScript* para la capa del servidor. Este entorno utiliza el motor de *JavaScript V8* utilizado en el navegador *Google Chrome* pero en este caso se utiliza fuera de un navegador lo cual incrementa el rendimiento considerablemente. Una aplicación con *Node.js* se ejecuta en un mismo proceso, es decir no crea un proceso para cada *request* y es por ello que este entorno provee de un conjunto de estándares asíncronos para prevenir que el código *JavaScript* tenga bloqueos. Cuando *Node.js* realiza operaciones de entrada/salida como acceder a una base de datos o leer del sistema de ficheros en vez de bloquear el hilo y perder ciclos de *CPU* lo que hará será reanudar las operaciones cuando vuelva la respuesta a la lectura/escritura. En resumen *Node.js* permite realizar gran cantidad de conexiones en el servidor sin emplear concurrencia entre hilos. Otra de las principales características de *Node.js* es el lenguaje *JavaScript* el cual es ampliamente utilizado por desarrolladores de *front-end* en la web y que con *Node.js* tienen la posibilidad de escribir código de parte del servidor sin necesidad de aprender otros lenguajes.

Desarrollar en el entorno *Node.js* permite además utilizar gran cantidad de paquetes que se gestionan a través de la herramienta *npm*. Con esta herramienta, que se incluye con la instalación del entorno, puedes descargar e instalar paquetes de los repositorios de *npm* con gran facilidad ya que gestiona de manera automática todas las dependencias. Una vez instalas paquetes, *npm* genera el fichero *package.json* y *package-lock.json* el cual contiene información sobre todos los paquetes instalados y sus dependencias, de esta manera el proyecto puede ser instalado y ejecutado en cualquier máquina resolviendo *npm* todo el proceso de instalación. Esta característica de *Node.js* nos ha facilitado bastante la colaboración en el proceso de desarrollo de la *API* ya que en nuestros repositorios hemos incluido los ficheros mencionados previamente y *npm* ha gestionado completamente la instalación del entorno.

## Express.js

Para la implementación de la *API* hemos utilizado el *framework Express.js* el cual proporciona herramientas para implementar gran variedad de servicios de *backend* de una manera muy minimalista y sencilla. Express proporciona principalmente herramientas para gestionar el enrutamiento en tu aplicación web, facilita el manejo de *requests* y *responses* de *HTTP* y la implementación de *middlewares* entre otras características. La razón por la que hemos escogido este *framework* es su sencillez para definir manejadores de ruta con los cuales podíamos implementar los diferentes *endpoints* de nuestra *API* además de las facilidades que te proporciona para gestionar tanto *requests* como *responses* lo que nos ha servido para gestionar la de entrada de datos y los errores. 

Como hemos mencionado anteriormente gracias a la facilidad con la que puedes gestionar la instalación de paquetes en un entorno *Node.js* hemos hecho uso de varios que complementan a *Express.js* para el desarrollo de la *API*, entre ellos destacan el paquete *express-validator* para facilitar la validación sintáctica de los valores de entrada a los *endpoints*. También otros paquetes como *pg* que es el módulo para conectar un sistema de *Node* a una base de datos *PostgreSQL*, el paquete *bcrypt* que hemos utilizado para cifrar las contraseñas de los usuarios cuando se registran en la aplicación y el modulo de *OAuth 2.0* para *Node.js* del cual hablaremos más en profundidad en el apartado \ref{sec:secdb}. 

## Diseño de la API

La arquitectura *REST* tiene como principal característica el empleo de una sintaxis para identificar los diferentes *endpoints*. Como se ha mencionado anteriormente esta sintaxis busca relacionar de manera clara los *endpoints* con los recursos a los que accede y sus operaciones, definiendo una serie de reglas a la hora de diseñar la *API*. 

Entre estas prácticas que hemos seguido para nombrar los *endpoints*, están utilizar el nombre del recurso al que se accede sin utilizar verbos, es decir, sin utilizar por ejemplo el nombre de la operación (crear, borrar, modificar…) ya que esta información ya la proporciona el método de *HTTP* utilizado. Precisamente esta última apreciación también la hemos tenido en cuenta ya que hemos sacado partido de los diferentes métodos de *HTTP* para definir de manera clara y organizada las operaciones. También hemos hecho uso de rutas parametrizadas, es decir el uso de parámetros directamente en la *uri*, por ejemplo */example/:example_id*. Otros de los aspectos de gran importancia en cualquier *API* y en el que nos hemos centrado para el diseño de la nuestra es la gestión de errores. Hemos especificado para cada endpoint que códigos de status *HTTP* devolverán en función del resultado para poder gestionar cuando una operación ha sido ejecutada con éxito o ha ocurrido algún error.

## Endpoints

| Endpoint         | /task/                                         |
| ---------------- | ---------------------------------------------- |
| Descripción      | Crea una tarea para el usuario que lo solicita |
| Método HTTP      | POST                                           |
| Código HTTP (OK) | 201                                            |
| Código HTTP (KO) | 409                                            |

| Endpoint         | /task/:id                                      |
| ---------------- | ---------------------------------------------- |
| Descripción      | Modifica una tarea del usuario que lo solicita |
| Método HTTP      | POST                                           |
| Código HTTP (OK) | 200                                            |
| Código HTTP (KO) | 409                                            |

| Endpoint         | /task/:id                          |
| ---------------- | ---------------------------------- |
| Descripción      | Devuelve el contenido de una tarea |
| Método HTTP      | GET                                |
| Código HTTP (OK) | 200                                |
| Código HTTP (KO) | 404                                |

| Endpoint         | /task/                                                                |
| ---------------- | --------------------------------------------------------------------- |
| Descripción      | Devuelve todas las tareas no completadas del usuario que las solicita |
| Método HTTP      | GET                                                                   |
| Código HTTP (OK) | 200                                                                   |
| Código HTTP (KO) | 404                                                                   |

## Aspectos de seguridad de la API

Introducir estos aspectos

## Implementación de OAuth 2.0 { #sec:oauth }

Uno de los aspectos más importantes que hemos podido implementar en nuestra *API* es el estándar *OAuth 2.0*. Este estándar introduce una nueva capa de autorización separando este rol del servidor de recursos y proporcionando así varias ventajas principalmente en términos de seguridad. A continuación se describe en profundidad cómo funciona este estándar y cuales son sus principales ventajas.
