# Diseño e implementación del Backend

La arquitectura cliente-servidor es una de las más usadas hoy en día y por lo tanto tener un *backend* robusto es de vital importancia en cualquier aplicación. Por ello hemos invertido gran cantidad de esfuerzo en el diseño y la implementación del *backend* para asegurar un correcto funcionamiento de la aplicación a nivel de lógica de negocio además de garantizar seguridad en la comunicación con los clientes a la hora de acceder a datos y ejecutar operaciones sobre los mismos.

En este capítulo vamos a comenzar analizando el proceso que hemos seguido para el diseño de la *API*, desde aspectos de diseño como el empleo de la Arquitectura *REST* a la elección de las tecnologías empleadas. A continuación describiremos el proceso de implementación del *backend*, donde explicaremos el funcionamiento de las tecnologías aplicadas y otras características importantes como los aspectos de seguridad abordados.  

## Uso de REST

Una de las características a destacar es el uso de la arquitectura *REST* [@10.5555/932295] para nuestra *API*. La clave de esta arquitectura es el uso del protocolo *HTTP* para el acceso a una interfaz de operaciones bien definidas. Además la arquitectura *REST* busca definir una sintaxis para identificar los recursos y sus diferentes operaciones consiguiendo así una organización clara y mantenible de los diferentes elementos de nuestra aplicación para facilitar el acceso desde los clientes. El uso de esta arquitectura en nuestro proyecto viene dada por la necesidad de organizar los distintos recursos a los que puede acceder la aplicación cliente con el objetivo de estandarizar el servicio y facilitar la comunicación y evolución de este.

Por otro lado, aunque *REST* permite la comunicación entre el cliente y el servidor mediante cualquier formato, usamos el formato *JSON* ya que es un formato muy sencillo de comprender y manipular. Además, en comparación a otros formatos como por ejemplo *XML*,  *JSON* es mucho más ligero en cuanto a demanda de ancho de banda.

## Descripción tecnologías: Node JS + Express

Para el desarrollo del *backend* nos hemos decantado por el uso del entorno *Node.js* en conjunto con el *framework* llamado *Express.js*, el cual proporciona una manera muy sencilla de implementar gran cantidad de servicios de aplicaciones web.

*Node.js* es un entorno de ejecución multiplataforma basado en el lenguaje de programación *JavaScript* para la capa del servidor. Este entorno utiliza el motor de *JavaScript V8* utilizado en el navegador *Google Chrome*, pero en este caso se utiliza fuera de un navegador lo cual incrementa el rendimiento considerablemente. Una aplicación con *Node.js* se ejecuta en un mismo proceso, es decir no crea un proceso para cada *request* y es por ello que este entorno provee de un conjunto de estándares asíncronos para prevenir que el código *JavaScript* tenga bloqueos. Cuando *Node.js* realiza operaciones de entrada/salida como acceder a una base de datos o leer del sistema de ficheros, en vez de bloquear el hilo y perder ciclos de *CPU* lo que hará será reanudar las operaciones cuando vuelva la respuesta a la lectura/escritura. En resumen *Node.js* permite realizar gran cantidad de conexiones en el servidor sin emplear concurrencia entre hilos. Otra de las principales características de *Node.js* es el lenguaje *JavaScript* el cual es ampliamente utilizado por desarrolladores de *front-end* en la web y que con *Node.js* tienen la posibilidad de escribir código de parte del servidor sin necesidad de aprender otros lenguajes.

Desarrollar en el entorno *Node.js* permite además utilizar gran cantidad de paquetes que se gestionan a través de la herramienta *npm*. Con esta herramienta, que se incluye con la instalación del entorno, es posible descargar e instalar paquetes de los repositorios de *npm* con gran facilidad ya que este gestiona de manera automática todas las dependencias. Una vez se instalan paquetes, *npm* genera el fichero *package.json* y *package-lock.json* los cuales contienen información sobre todos los paquetes instalados y sus dependencias. De esta manera, el proyecto puede ser instalado y ejecutado en cualquier máquina resolviendo *npm* todo el proceso de instalación. Esta característica de *Node.js* nos ha facilitado bastante la colaboración en el proceso de desarrollo de la *API* ya que en nuestros repositorios hemos incluido los ficheros mencionados previamente y *npm* ha gestionado completamente la instalación del entorno.

## Express.js

Para la implementación de la *API* hemos utilizado el *framework Express.js* [@express] el cual proporciona herramientas para implementar gran variedad de servicios de *backend* de una manera minimalista y sencilla. Express proporciona principalmente herramientas para gestionar el enrutamiento en una aplicación web, facilita el manejo de *requests* y *responses* de *HTTP* y la implementación de *middlewares* entre otras características. La razón por la que hemos escogido este *framework* es su sencillez para definir manejadores de ruta con los cuales podíamos implementar los diferentes *endpoints* de nuestra *API* además de las facilidades que proporciona para gestionar tanto *requests* como *responses* lo que nos ha servido para gestionar la de entrada de datos y los errores. 

Como hemos mencionado anteriormente, gracias a la facilidad con la que puede gestionarse la instalación de paquetes en un entorno *Node.js*, hemos hecho uso de varios paquetes que complementan a *Express.js* para el desarrollo de la *API*. Entre ellos destacan el paquete *express-validator* para facilitar la validación sintáctica de los valores de entrada a los *endpoints*. También se han empleado otros paquetes como *pg*, que es el módulo para conectar un sistema de *Node* a una base de datos *PostgreSQL*, el paquete *bcrypt* que hemos utilizado para cifrar las contraseñas de los usuarios cuando se registran en la aplicación y el módulo de *OAuth 2.0* para *Node.js*, del cual hablaremos más en profundidad en la sección \ref{sec:oauth}. 

## Diseño de la API

La arquitectura *REST* tiene como principal característica el empleo de una sintaxis para identificar los diferentes *endpoints*. Como se ha mencionado anteriormente, esta sintaxis busca relacionar de manera clara los *endpoints* con los recursos a los que accede y sus operaciones, definiendo una serie de reglas a la hora de diseñar la *API*. 

Entre estas prácticas que hemos seguido para nombrar los *endpoints*, están utilizar el nombre del recurso al que se accede sin utilizar verbos, es decir, sin utilizar por ejemplo el nombre de la operación (crear, borrar, modificar…) ya que esta información ya la proporciona el método de *HTTP* utilizado. Precisamente esta última apreciación también la hemos tenido en cuenta, ya que hemos sacado partido de los diferentes métodos de *HTTP* para definir de manera clara y organizada las operaciones. También hemos hecho uso de rutas parametrizadas, es decir el uso de parámetros directamente en la *uri*, por ejemplo `/example/:example_id`. Otros de los aspectos de gran importancia en cualquier *API* y en el que nos hemos centrado para el diseño de la nuestra es la gestión de errores. Hemos especificado para cada endpoint qué códigos de status *HTTP* devolverán en función del resultado para poder gestionar cuándo una operación ha sido ejecutada con éxito o ha ocurrido algún error.

## Aspectos de seguridad de la API

En cualquier servicio web la seguridad es uno de los aspectos más importantes a tener en cuenta, siendo más importante hoy en día debido al incremento de ataques y delitos informáticos. Además en nuestra aplicación disponer de mecanismos complejos y robustos de seguridad es principal debido a que los datos que comparten los usuarios pueden ser y principalmente serán datos personales. Esto es así porque se trata de una aplicación de organización personal y por lo tanto las tareas u otras partes de la aplicación contendrán información sensible que es importante proteger. 

Debido a las razones explicadas previamente hemos puesto gran énfasis en implementar mecanismos que dotan de seguridad a nuestro servicio. Entre estos mecanismos destacan la implementación del estándar de autorización *OAuth 2.0*, el cifrado de contraseñas o el tratado de datos de entrada para prevenir la *inyección SQL* entre otros.

### Implementación de OAuth 2.0 { #sec:oauth }

Uno de los aspectos más importantes que hemos podido implementar en nuestra *API* es el estándar *OAuth 2.0* [@rfc6749]. Este estándar introduce una nueva capa de autorización separando este rol del servidor de recursos y proporcionando así varias ventajas principalmente en términos de seguridad.  A continuación se describe en profundidad cómo funciona este estándar y cuáles son sus principales ventajas.

### Autorización, Autenticación y posibilidades de *OAuth* {.unnumbered}

Es común que con frecuencia se confundan o se mezclen los conceptos de autorización y autenticación, ya que en el modelo tradicional de autenticación entre cliente-servidor no se utilizaban y ahora es frecuente verlos siempre que se habla de acceso a *APIs* o recursos web. 

En el modelo cliente-servidor tradicional el cliente solicitaba acceso a un recurso con acceso protegido mediante el uso de credenciales del servidor propietario de los recursos, es decir el cliente realizaba un proceso de autenticación en el que necesitaba la credenciales del servidor para acceder a los recursos. De esta manera cualquier cliente o aplicación de terceros necesita las credenciales del servidor para acceder. Esto tiene varios inconvenientes y limitaciones:

- Las aplicaciones de terceros necesitan almacenar las credenciales para su futuro uso, ya que es necesario enviarlas con cada *request* al servidor. De esta manera existe un gran riesgo de brecha de seguridad en el caso de que las credenciales sean robadas, ya que con ellas se tiene acceso prácticamente ilimitado a los recursos.

- Las aplicaciones de terceros tienen prácticamente acceso ilimitado al servidor de recursos ya que disponen de las credenciales con las que pueden acceder en cualquier momento mientras que el propietario de los recursos no puede limitar la duración del acceso o el conjunto de datos al que los clientes pueden acceder.

- El propietario de los recursos no puede revocar el acceso a estos a un cliente concreto sin revocarlo a todos ya que debe hacerlo cambiando la contraseña.

- Compromete al propietario de los recursos al uso que hagan las aplicaciones de terceros con la contraseña del usuario del servidor y toda su información protegida.

*OAuth* aborda estos problemas mediante la introducción de una capa de autorización separando así esta responsabilidad del servidor de recursos. En este estándar el cliente solicita acceso a los recursos y desde el servidor se le conceden unas credenciales completamente desacopladas de las del servidor de recursos.

Por lo tanto, en vez de utilizar las credenciales del servidor de recursos, el cliente obtiene un *token* de acceso, que es una cadena de caracteres que además de garantizar acceso, denota otros atributos como el alcance o la vida de este.  

### Roles y Flujo del proceso {.unnumbered}

Existen cuatro roles en *OAuth*:

- Propietario de los recursos: Es la entidad capaz de conceder acceso a un recurso protegido.

- Servidor de recursos: Es el servidor que aloja los recursos protegidos y es capaz de responder a las peticiones que llegan para acceder a los recursos mediante *tokens* de acceso. 

- Cliente: Es una aplicación que realiza peticiones al servidor de recursos bajo la autorización del propietario. 

- Servidor de autorización: Es el servidor encargado de gestionar los *tokens* de acceso y dar autorización a los clientes. 

En la figura \ref{fig:flujooauth} se puede observar cómo interactúan entre sí los distintos roles en el proceso de autorización. En primer lugar el cliente pide acceso a los recursos al propietario y este concede o rechaza el permiso. Esta petición puede hacerse directamente al servidor de recursos o preferiblemente indirectamente a través del servidor de autorización como intermediario. A continuación al cliente ya se le ha concedido el permiso de acceso por lo que puede proceder a solicitar un *token*. De esta manera el cliente solicita un *token* y el servidor de autorización valida si el permiso es correcto devolviéndole uno en tal caso. Por último, una vez el cliente dispone del *token* de acceso, este puede solicitar al servidor de autorización el acceso a un recurso y acceder con éxito si este valida correctamente su *token*.

![Proceso de autorización OAuth](img/flujooauth.png){width=70% #fig:flujooauth}

### Aplicación del estándar *OAuth2.0* {.unnumbered}

Tras explicar los principales puntos de este estándar de autorización, a continuación se va a explicar cómo hemos implementado este proceso para nuestra aplicación. 

En primer lugar se van a identificar cuales son las diferentes entidades o roles de *OAuth* en el caso de nuestra aplicación:

- **Propietario de los recursos**: En nuestro caso esta entidad será la persona o personas que gestionen el servicio de la aplicación, ya que esta podrá ser instalada y gestionada libremente en cualquier servidor.

- **Servidor de recursos**: Para nuestra aplicación el servidor de recursos es el servidor donde se encuentra el servicio de *API REST* con todos sus *endpoints* que tienen la capacidad de interactuar con recursos de la aplicación, es decir con tareas, proyectos, usuarios, etc.

- **Cliente/s**: Los clientes son las aplicaciones de escritorio y la de móvil que realizan peticiones al servidor de recursos y que por lo tanto necesitan autorización del propietario.

- **Servidor de autorización**: Este servidor ha sido implementado dentro del mismo entorno que la *API REST* y es el encargado de gestionar la autorización del servicio.

En *OAuth* hay varios tipos de *grants* o formas de concesión de acceso a los recursos por parte del propietario. En otras palabras, hay varias formas de conseguir un *token* de acceso y cada una de estas tiene un procedimiento distinto para conseguirlo. Existen los siguientes cuatro tipos:

- **Código de autorización**: El código de autorización se obtiene utilizando el servidor de autorización como intermediario entre el cliente y el propietario de los recursos.  De esta forma en vez de pedir directamente autorización al propietario, esta petición se dirige al servidor de autorización, que devuelve al cliente un código de autorización con el que luego podrá solicitar un *token* de acceso. Este tipo de *grant* es el que hemos implementado para nuestra aplicación y es por ello que lo explicaremos con mayor extensión más adelante.

- **Implícito**: En esta forma de conceder autorización, se simplifica el flujo del código de autorización ya que este método está optimizado para para clientes implementados en navegador en lenguajes de *scripting* tipo *JavaScript*. En el flujo implícito en vez de devolver al cliente un código de autorización se le devuelve directamente un *token* de acceso. El tipo de concesión de acceso es implícito puesto que el servidor de autorización no autentica al cliente, pero en algunos casos la identidad del cliente se puede realizar a través de la URI de redirección usada.

- **Credenciales del propietario de los recursos**: Las credenciales del propietario de los recursos pueden usarse también como forma de concesión de un *token* de acceso. Estas credenciales deben usarse sólo cuando exista gran confianza entre el cliente y el propietario y cuando otros métodos de concesión no están disponibles. 

- **Credenciales del cliente**: Este tipo de concesión con credenciales del cliente se usa normalmente cuando el alcance de la autorización se limita solamente a los recursos bajo el control del mismo cliente, en otras palabras cuando el cliente también es el propietario de los recursos.

Para nuestro caso de uso nos hemos decantado por el tipo de concesión de código de autorización ya que es el que dispone de más beneficios en términos de seguridad, como la transmisión del *token* de acceso directamente al cliente sin pasar por el propietario.

En la figura \ref{fig:flujcodigoauth} se ve reflejado el proceso que sigue un cliente a la hora de solicitar autorización para acceder a recursos protegidos de la *API REST*. En primer lugar el usuario realiza un proceso de *login* clásico con este, el servidor de autorización autentica al usuario y si es correcto le devuelve un código de autorización. Después el cliente utiliza este código para solicitar un *token* de acceso que siéndole concedido puede utilizar para realizar peticiones al servidor de recursos, en nuestro caso la *API REST*.

![Flujo con código de autorización](img/flujcodigoauth.png){width=100% #fig:flujcodigoauth}

Como hemos comentado a lo largo de esta sección, el fin del proceso de autorización es la obtención por parte del cliente de un *token* de acceso con el que puede acceder a los recursos. Este *token* dispone de algunos atributos que lo complementan con el fin de añadir mayor seguridad al proceso de acceso a recursos. Estos atributos son la vida del *token* y el *refresh_token*. La vida útil representa la duración del *token*, es decir durante cuánto tiempo será válido, y por lo tanto se permitirá acceder a recursos con este. La finalidad de este atributo es que si por cualquier razón el *token* acaba en las manos equivocadas no disponga de acceso durante mucho tiempo a recursos protegidos. Es por ello que el valor en tiempo de vida de los *tokens* debe ser corto en la medida de lo posible para mitigar este posible inconveniente. Sin embargo esto propicia que haya que renovar los *tokens* con más frecuencia. En cuanto al *refresh_token* es otro *token* que sirve para renovar el *token* de acceso actual. Este también dispone de vida útil, la cual suele ser bastante más amplia que la del *token* de acceso con el fin de dar un mayor margen de renovación del mismo que caduca frecuentemente y no tener que realizar el proceso de autorización previo en caso de caducidad de ambos *tokens*. En la figura \ref{fig:flujorefreshtoken} se puede observar en forma de diagrama de flujo el proceso de refresco del *token* de acceso.

![Flujo de refresco del token de acceso](img/flujorefreshtoken.png){width=80% #fig:flujorefreshtoken}

### Implementación del estándar *OAuth2.0* en *Node.js* {.unnumbered}

Para implementar el estándar *OAuth* en un servicio existen diversas aproximaciones. Una de las más comunes es delegar este proceso en un proveedor externo al servidor de recursos, siendo estos entidades reconocidas y fiables en cuanto a seguridad. De esta manera son estos proveedores los que autorizan el acceso a tus recursos. Un ejemplo de estos proveedores es *Google* con su famosa opción que se puede encontrar en gran cantidad de servicios "*Iniciar sesión con Google*". Con servicios como estos podemos configurar el acceso a los recursos de la aplicación mediante el estándar *OAuth* gestionado por dichos proveedores. Sin embargo nosotros no hemos optado por esta manera ya que queríamos desarrollar una aplicación sobre la que el usuario gestor de sistema pudiera tener control completo sobre este, incluido el proceso de autorización. Es por esta razón que hemos realizado una implementación personalizada de este estándar y sobre el que tenemos control absoluto de su gestión.  

La implementación del servidor de autorización ha sido realizada en el mismo entorno que la *API REST* y por ello con las mismas tecnologías, es decir *Node.js* en cuanto a entorno y *PostgreSQL* para el almacenamiento de los datos necesarios para el estándar, como los *tokens* entre otros. Esto ha sido posible gracias al paquete *node-oauth2-server* y su *wrapper* para el framework *express*. Este paquete facilita la implementación de un servidor de autorización *OAuth2.0* en *Node.js*. Para ello proporciona una interfaz con las distintas operaciones del estándar donde se puede implementar la funcionalidad de éstas en base a las necesidades propias o arquitectura. Este paquete permite implementar los distintos tipos de concesión de autorización explicados en el previo apartado, habiendo implementado nosotros el ya mencionado proceso de código de autorización. 

Para la implementación del flujo ha sido necesario crear varias tablas en la base de datos para almacenar la información necesaria, por ejemplo códigos de autorización o *tokens* de acceso entre otros. En concreto son tres tablas, una para almacenar la información de los clientes de *OAuth*, otra para almacenar los códigos de autorización y por último una para almacenar los *tokens*. Estas son respectivamente *oauth_clients*, *oauth_authcode* y *oauth_tokens*. En la sección \ref{sec:secdbmodelofis} se definen con detalle dichas tablas. 

Como hemos mencionado, el paquete *oauth2-server* proporciona la interfaz de operaciones de *OAuth* que hemos utilizado para definir nuestra propia implementación, que consiste principalmente en la introducción de los datos generados por el paquete en nuestra base de datos, ya que todas las demás gestiones las realiza el propio paquete como por ejemplo la generación y validación de los *tokens* o el tratamiento de las *requests* y la *responses*. Para la implementación del tipo de concesión de código de autorización es necesario incluir dos *endpoints*, uno para realizar el proceso de obtener un código de autorización y otro para el proceso de obtener un *token*, que además también sirve para el flujo de renovación. En la figura \ref{fig:flujooauthimplement} podemos observar el flujo explicado previamente y representado en la figura \ref{fig:flujcodigoauth} pero mostrando los distintos *endpoints* implementados.

![Flujo de autorización implementado](img/flujooauthimplement.png){width=80% #fig:flujooauthimplement}

### Configuración de clientes con OAuth {.unnumbered}

Para que pueda realizarse el proceso de autorización de clientes dentro de la aplicación es necesario realizar un paso previo de configuración, ya que el servidor de autorización debe tener identificados a los clientes para poder realizar el proceso. Cada cliente tiene un identificador llamado *client_id* y además para poder validar su autenticidad a la hora de solicitar autorización el cliente también dispone de un secreto (*client_secret*), es decir una clave que debe de proporcionar al servidor para el proceso de solicitud de *tokens*. De esta manera los *tokens* y los códigos de autorización están asociados a un cliente. 

Por esta razón, para que un cliente pueda proceder a solicitar al servidor de autorización acceso a los recursos de la *API*, es necesario previamente que éste sea registrado en la base de datos de clientes de *OAuth* para próximamente poder asociarle codigos de autorización y *tokens* de acceso. Este proceso se realiza cuando desde la aplicación cliente se procede a configurar un servidor, paso que debe hacerse al menos una vez si se desea utilizar la aplicación ya que de inicio no hay ningún servidor configurado.  Desde el menú de configuración de servidores de la aplicación que se describe en el capitulo \ref{sec:manualusuario}, una vez introducimos la *URL* donde se encuentra el servidor con la parte *backend* instalada y procedemos a realizar la conexión, éste la guardará en el cliente para próximamente poder iniciar sesión y utilizar la aplicación con normalidad. Es en este proceso cuando se realiza la identificación del cliente por parte del servidor de autorización, que  genera un secreto que le devolverá al cliente y que este guardará en el dispositivo para poder realizar el proceso de autorización. De la misma manera el servidor registra en la base de datos la información del cliente para poder validarlo en futuros procesos de autorización.
