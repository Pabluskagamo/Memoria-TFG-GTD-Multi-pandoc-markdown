# Planificación del proyecto

A la hora de gestionar y planificar un proyecto existen dos tipos de enfoque, el predictivo y el adactativo. El enfoque predictivo se utiliza cuando se tiene claro cómo va a ser el proyecto y se conocen las variables y resultados del mismo, mientras que el enfoque adaptativo es más flexible y permite modificar el alcance del proyecto conforme a las necesidades que van surgiendo a lo largo del desarrollo del propio proyecto. Este segundo enfoque conduce a una mayor calidad y productividad aumentando el compromiso del equipo.

En nuestro caso, hemos seguido un enfoque adaptativo ya que nuestro proyecto requiere flexibilidad y velocidad. Para ello, hemos seguido una metodología _agile_ para desarrollar nuestro proyecto. Esta metodología consiste en trocear el proyecto en pequeñas partes que se tienen que ir completando en cortos periodos de tiempo. Siguiendo esta idea, hemos dividido las tareas de semanalmente, de tal manera que en cada reunión definimos las tareas a realizar la próxima semana.

![Ciclo metodologías agile](img/backendgantt.png){width=80% #fig:metoagile}

Adicionalmente, hemos empleado herramientas ágiles como el tablero _Kanban_, el cual nos ayuda a gestionar el proyecto de una manera más visual, viendo en qué estado se encuentra cada tarea que hemos definido. Para ello hemos utilizado la herramienta _Notion_, la cual nos permite crear un tablero distinguiendo el estado actual de las tareas en "sin empezar", "en curso" o "terminadas", también ofrece la posibilidad de asignar cada tarea a uno o varios miembros del equipo que serán los encargados de completarlas.

![Tablero de las tareas en Notion](img/backendgantt.png){width=80% #fig:tabNotion}

Nuestro proyecto ha seguido un ciclo de vida iterativo e incremental, de tal manera que en cada iteración se ha revisado y mejorado el producto, el cual ha sido desarrollado por partes que se han ido integrando para construir el producto final.

Gracias a los servicios proporcionados por _AWS_, podemos ejecutar y administrar contenedores docker. Para ello, hemos creado un sistema de despliegue de versiones que consiste en un _script_ que despliega una rama de nuestro repositorio de _GitHub_ en el servidor de _AWS_. Esto nos permite subir con formato ágil los cambios realizados por cada miembro del equipo y que todos podamos probarlo de manera fácil y rápida.

A la hora de desarrollar el código de nuestro proyecto, hemos dividido nuestro repositorio de _GitHub_ en varias ramas. La rama "dev" es la que utilizamos diariamente para desarrollar nuestro producto, la rama "main" es la principal y la que contiene las distintas versiones terminadas y funcionales de la aplicación y, por último, tenemos ramas auxiliares que utilizamos para realizar pruebas de código, de tal manera que si los cambios realizados hacen que otras partes de la aplicación no funcionen, no afecte al resto y se pueda realizar un _backup_ de manera sencilla.

Además, contamos con un sistema de control de versiones en _GitHub_ que nos permite sincronizar las distintas versiones garantizando que los cambios realizados no entren en conflicto con los cambios del resto de compañeros. También guarda los datos de las distintas versiones para que sean recuperables en cualquier momento si fuese necesario.
