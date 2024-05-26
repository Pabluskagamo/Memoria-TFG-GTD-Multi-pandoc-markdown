# Integración con agentes conversacionales { #sec:agentesConver }

Desde el inicio del proyecto, nos propusimos habilitar la interacción mediante comandos de voz para mejorar la experiencia del usuario, para ello en este capítulo, profundizaremos en el proceso de integración de nuestra aplicación *SwiftDo* con la plataforma de voz de *Alexa* mediante el desarrollo de una *skill*. Para contextualizar, una *skill* en el ecosistema de *Alexa* es una capacidad o funcionalidad específica que permite a los usuarios interactuar con dispositivos habilitados para *Alexa*, utilizando comandos de voz.

Discutiremos los objetivos que persigue esta integración con *Alexa*, que incluyen proporcionar a los usuarios una forma intuitiva y práctica de administrar sus tareas diarias, así como mejorar la accesibilidad de *SwiftDo* para aquellos que prefieren la interacción por voz. Además, exploraremos la funcionalidad mínima que esperamos ofrecer a los usuarios a través de la *skill* de *Alexa*, centrándonos en la capacidad de añadir una tarea como funcionalidad básica de gestión de tareas que será compatible con esta integración.

## Configuración de la skill de Alexa

El primer paso crucial en nuestra aplicación fue obtener acceso al *Amazon Developer Console* para crear una *skill* de *Alexa*. Esta *skill* fue meticulosamente configurada para permitir a los usuarios añadir tareas a nuestra aplicación *SwiftDo* utilizando comandos de voz de manera intuitiva y eficiente. Durante la configuración, definimos cuidadosamente los tipos de interacciones que la *skill* debería admitir, como la capacidad de añadir un título obligatorio para la tarea y la opción de proporcionar información adicional, como una descripción, fecha de vencimiento o nivel de importancia.

## Vinculación de la cuenta del usuario

Para habilitar la interacción entre la *skill* de *Alexa* y nuestra aplicación, implementamos un sólido flujo de autorización *Oauth* realizado también en *Amazon Developer Console*. Optamos por el método de autenticación de código de autorización (*Auth Code Grant*) para permitir que los usuarios vinculen sus cuentas de manera segura. Sin embargo, surgió un desafío significativo: para garantizar la seguridad de la transacción, *Amazon* requiere que las aplicaciones estén protegidas mediante *HTTPS*. Si bien la implementación de *HTTPS* estaba pendiente, este requisito nos incentivó a adelantar su incorporación a nuestra plataforma web, por lo tanto incorporamos *HTTPS*  a nuestra plataforma web y permitir así la vinculación de las cuentas de usuario.

## Implementación del flujo de autorización Oauth

Al configurar la *skill* de *Alexa*, seguimos un diagrama de secuencia detallado que guía al usuario a través del proceso de vinculación de la cuenta (véase la figura \ref{fig:diagramasecalexa}). Todo este flujo de autorización *Oauth* ya se prueba en la propia aplicación de *Alexa*. Para realizar pruebas y ajustes, es necesario iniciar sesión con el mismo usuario que en *Amazon Developer Console*, donde se define la *skill*.

![Diagrama de secuencia del proceso de vinculación de la cuenta. Fuente: [@alexadiagrama]](img/diagramasecalexa.png){width=100% #fig:diagramasecalexa}

El proceso comienza cuando el usuario habilita la *skill* en su dispositivo, la cual informa al usuario que necesita vincular su cuenta a la aplicación *SwiftDo* para que funcione.

Posteriormente, se redirige al usuario a la página de autorización de nuestro servidor. Aquí, el usuario introduce sus credenciales de la cuenta de la aplicación *SwiftDo*. Nuestro servidor verifica las credenciales proporcionadas por el usuario y, una vez verificadas, genera un código de autorización y un estado.

Este código de autorización y el estado son devueltos por nuestro servidor a la *skill* de *Alexa*. La *skill* intenta entonces obtener un *token* de acceso utilizando el código de autorización proporcionado. Si hay un error en el proceso, la *skill* muestra un mensaje de error al usuario, y en caso de éxito, la *skill* vincula la cuenta del usuario y muestra un mensaje de confirmación.

## Guía para vincular Alexa con SwiftDo (Desarrollo)

Para vincular *Alexa* con *SwiftDo* durante el desarrollo, debemos seguir una serie de pasos específicos debido a las limitaciones del entorno de desarrollo. En este entorno, la *skill* solo está disponible en la cuenta en la que se ha desarrollado. Los pasos son los siguientes:

Primero, accedemos a la aplicación de "Amazon Alexa" en nuestro dispositivo móvil (véase la primera pantalla de la figura \ref{fig:fasesAlexa}). Una vez dentro de la aplicación, nos dirigimos a la sección "Más", ubicada en la parte inferior derecha de la pantalla. Desde ahí, seleccionamos "Skills y juegos" en el menú desplegable. Esta sección permite explorar y habilitar diversas *skills* que expanden las capacidades de *Alexa*.

![Guía para habilitar la skill de SwiftDo en Amazon Alexa](img/fasesAlexa.png){width=100% #fig:fasesAlexa}

Nos desplazamos hasta la parte inferior de la página, donde encontramos "Mis skills", en la cual al acceder visualizamos la pestaña "Desarrollo" (véase la segunda pantalla de la figura \ref{fig:fasesAlexa}). Ahí encontramos la *skill* de "SwiftDo". Como se muestra en la tercera pantalla de la figura \ref{fig:fasesAlexa}, una vez encontrada la *skill*, presionamos en "Permitir su uso" para habilitar la *skill* en nuestra cuenta de *Alexa*.

El siguiente paso es crucial para la vinculación de cuentas. Nos dirigimos a la opción "Configuración" dentro de la *skill* de *SwiftDo* y seleccionamos "Vincular cuenta". Esto nos redirige a una página, mostrada en la figura \ref{fig:vinculacion}, donde debemos introducir nuestro "Correo electrónico" y "Contraseña" asociados a nuestra cuenta de *SwiftDo*. Una vez integrados estos datos, presionamos "Vincular" para completar el proceso de autenticación.

![Página redirigida para vinculación de Alexa con SwiftDo](img/vinculacion.png){width=35% #fig:vinculacion}

Una vez vinculada la cuenta, es necesario activar la *skill* mediante el comando de voz: "Alexa, abre añadir tarea". Este comando inicializa la *skill* y permite a *Alexa* la capacidad de añadir una nueva tarea a nuestra aplicación.

Para añadir una tarea, indicamos el título de la tarea obligatoriamente. Por ejemplo, "Añade la tarea Prueba con Amazon". Posteriormente, podemos añadir más información a la tarea, como una descripción diciendo "Añade de descripción Esto es una prueba con Amazon". También podemos definir la importancia de la tarea con el comando "Si la tarea es importante" y establecer una fecha límite diciendo "Pon de fecha límite el 15 de junio". Si no deseamos añadir más detalles, podemos finalizar con el comando "Eso es todo".

## Guía para vincular Alexa con SwiftDo (Público)

Cuando la *skill* de *Alexa* se haga pública, el proceso de vinculación será similar al descrito anteriormente, con algunos pasos adicionales para asegurar la privacidad y seguridad de los datos del usuario. Estos pasos adicionales se detallarán en la documentación pública de la *skill*.

Para vincular *Alexa* con *SwiftDo* públicamente, los usuarios seguirán estos pasos:

1. Acceder a la aplicación de "Amazon Alexa" en su dispositivo, con cualquier cuenta a diferencia de "Desarrollo".

2. Ir a la sección "Más" y seleccionar "Skills y juegos".

3. Buscar la *skill* de "SwiftDo" en la barra de búsquedas, acceder y habilitarla presionando "Permitir su uso".

4. En la configuración de la *skill*, seleccionar "Vincular cuenta" y ser redirigido a una página de autenticación.

5. Introducir su "Correo electrónico" y "Contraseña" de *SwiftDo* y presionar "Vincular".

6. Activar la *skill* con el comando de voz "Alexa, abre añadir tarea" y disfrutar de su funcionalidad.

Actualmente, la *skill* no se ha hecho pública por motivos de privacidad y porque está pendiente de una revisión por parte del equipo de *Amazon* para asegurar el cumplimiento de sus estándares y políticas antes de su lanzamiento público.
