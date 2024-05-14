# Integración con agentes conversacionales

Desde el inicio del proyecto, nos propusimos habilitar la interacción mediante comandos de voz para mejorar la experiencia del usuario, para ello en este capítulo, profundizaremos en el proceso de integración de nuestra aplicación *SwiftDo* con la plataforma de voz de *Alexa* mediante el desarrollo de una *skill*. Para contextualizar, una *skill* en el ecosistema de *Alexa* es una capacidad o funcionalidad específica que permite a los ususarios interactuar con dispositivos habilitados para *Alexa*, utilizando comandos de voz.

Discutiremos los objetivos que persigue esta integración con *Alexa*, que incluyen proporcionar a los usuarios una forma intuitiva y práctica de administrar sus tareas diarias, así como mejorar la accesibilidad de *SwiftDo* para aquellos que prefieren la interacción por voz. Además, exploraremos la funcionalidad mínima que esperamos ofrecer a los usuarios a través de la *skill* de *Alexa*, centrándonos en la capacidad de añadir una tarea como funcionalidad básica de gestión de tareas que será compatible con esta integración.

## Configuración de la skill de Alexa

El primer paso crucial en nuestra aplicación fue obtener acceso al *Amazon Developer Console* para crear una *skill* de *Alexa*. Esta *skill* fue meticulosamente configurada para permitir a los usuarios añadir tareas a nuestra aplicación *SwiftDo* utilizando comandos de voz de manera intuitiva y eficiente. Durante la configuración, definimos cuidadosamente los tipos de interacciones que la *skill* debería admitir, como la capacidad de añadir un título obligatorio para la tarea y la opción de proporcionar información adicional, como una descripción, fecha de vencimiento o nivel de importancia.

## Vinculación de la cuenta del usuario

Para habilitar la interacción entre la *skill* de *Alexa* y nuestra aplicación, implementamos un sólido flujo de autorización *Oauth* realizado también en *Amazon Developer Console*. Optamos por el método de autenticación de código de autorización (*Auth Code Grant*) para permitir que los usuarios vinculen sus cuentas de manera segura. Sin embargo, surgió un desafío significativo: para garantizar la seguridad de la transacción, *Amazon* requiere que las aplicaciones estén protegidas mediante *HTTPS*. Si bien la implementación de *HTTPS* estaba pendiente, este requisito nos incentivó a adelantar su incorporación a nuestra plataforma web, por lo tanto incorporamos *HTTPS*  a nuestra plataforma web y permitir asi la vinculación de las cuentas de usuario.

## Implementación del flujo de autorización Oauth

Al configurar la *skill* de *Alexa*, seguimos un diagrama de secuencia detallado que guía al usuario a través del proceso de vinculación de la cuenta (véase la figura \ref{fig:diagramasecalexa}). Todo este flujo de autorización *Oauth* ya se prueba en la propia aplicación de *Alexa*. Para realizar pruebas y ajustes, es necesario iniciar sesión con el mismo usuario que en *Amazon Developer Console*, donde se define la *skill*.

![Diagrama de secuencia del proceso de vinculación de la cuenta](img/diagramasecalexa.png){width=100% #fig:diagramasecalexa}

El proceso comienza cuando el usuario habilita la *skill* en su dispositivo, la cual informa al usuario que necesita vincular su cuenta a la aplicación *SwiftDo* para que funcione.

Posteriormente, se redirige al usuario a la página de autorización de nuestro servidor. Aquí, el usuario introduce sus credenciales de la cuenta de la aplicación *SwiftDo*. Nuestro servidor verifica las credenciales proporcionadas por el usuario y, una vez verificadas, genera un código de autorización y un estado.

Este código de autorización y el estado son devueltos por nuestro servidor a la *skill* de *Alexa*. La *skill* intenta entonces obtener un *token* de acceso utilizando el código de autorización proporcionado. Si hay un error en el proceso, la *skill* muestra un mensaje de error al usuario, y en caso de éxito, la *skill* vincula la cuenta del usuario y muestra un mensaje de confirmación.

## Problemas en la vinculación

A pesar de nuestros esfuerzos, durante la implementación nos encontramos con un problema en el proceso de vinculación. Aunque nuestro servidor devuelve el código de autorización correctamente, *Alexa* no logra completar el paso final para solicitar el *token* de acceso. Como resultado, recibimos un mensaje de error que indica: "No fue posible vincular la cuenta Alexa". Actualmente, estamos investigando a fondo la causa de este problema y trabajando diligentemente en una solución para garantizar una integración fluida entre nuestra aplicación *SwiftDo* y la *skill* de *Alexa*.
