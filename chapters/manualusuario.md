# Manual de usuario {#sec:manualusuario}

A continuación mostraremos el manual de usuario de *SwiftDo* el cual mostrará de manera visual cómo podemos realizar las distintas acciones dentro de la app. Explicaremos como configurar el servidor, como iniciar sesión y registrarse, como filtrar dentro de la aplicación, como funcionan las pantallas de las distintas acciones que ofrece *SwiftDo* (inbox, hoy, cuanto antes, programadas, archivadas, proyectos), como utilizar la sidebar y los ajustes y, por último, como crear tareas y proyectos.

## Configuración del servidor

Al iniciar la aplicación, el usuario se encontrará con una pantalla para configurar el servidor cómo podemos ver en la figura \ref{fig:confServer}. Una vez damos al botón de configurar se abre otra pantalla en la cual debemos introducir el nombre del servidor y la url del mismo, pudiendo probar la conexión y, en el caso de que sea correcta, podamos conectarnos a dicho servidor. Una vez conectado, muestra una lista con los servidores configurados y permite crear nuevos o eliminar el deseado.

![Configuración del servidor](img/servidorFinal.png){width=100% #fig:confServer}

## Inicio de sesión y registro

Una vez configurado y conectado el servidor, aparece una pantalla de inicio de sesión (ver figura \ref{fig:login}), esta permite iniciar sesión introduciendo un correo y una contraseña o registrarse introduciendo un nombre de usuario, correo y contraseña en el caso de que no tengamos ninguna cuenta.

![Inicio de sesión y registro](img/loginFinal.png){width=80% #fig:login}

## Inbox

Tras haber iniciado sesión, aparece la pantalla de *inbox*, la cual almacena las tareas sin organizar del usuario. Cómo podemos observar en la figura \ref{fig:inbox}, en esta pantalla aparecen varios elementos cómo el filtrado en la esquina superior derecha, la *sidebar* en la esquina superior izquierda, el botón de creación de tareas y proyectos en la esquina inferior derecha y las propias tareas en el centro. 

![Inbox](img/inbox.png){width=50% #fig:inbox}

## Filtros

Presionando el botón de filtrado, nos encontramos con la pantalla que podemos observar en la figura \ref{fig:filtros}, la cual nos permite filtrar las tareas por los contextos, proyectos y etiquetas existentes. Una vez seleccionados los filtros que desee, el usuario podrá limpiarlos o aplicarlos.

![Filtros](img/filtrosFinal.png){width=100% #fig:filtros}

## Sidebar

Al presionar el botón de la *sidebar*, se despliega lo observado en la figura \ref{fig:sidebar}.
La *sidebar* muestra el nombre de usuario, icono, la fecha actual, un botón de ajustes y un listado de los contextos, las distintas acciones que se pueden realizar: "entrada" o "inbox", "hoy", "cuanto antes", "programadas" o "archivadas". Por último se muestra un listado con todos los proyectos creados por el usuario.

![Sidebar](img/sidebarFinal.png){width=80% #fig:sidebar}

## Ajustes

Pinchando en el botón de ajustes, se abre el modal de la figura \ref{fig:ajustes}. Este modal permite actualizar los datos personales cambiando el nombre de usuario o correo, configurar el servidor (ver figura \ref{fig:confServer}), personalizar el tema seleccionando modo claro u oscuro, eliminar contextos o etiquetas, ver una lista de las tareas completadas, conocer información acerca del GTD o ver un tutorial de la aplicación. Por último permite cerrar sesión.

![Ajustes](img/ajustesFinal.png){width=100% #fig:ajustes}

## Crear tarea y crear proyecto

Pulsando el botón naranja de la esquina inferior derecha aparece el modal para crear tarea que encontramos en la figura \ref{fig:crear}, el cual permite crear una tarea escribiendo el nombre en el texto Nueva Tarea, añadirle una descripción a la tarea, seleccionar una fecha en la que debe estar terminada, seleccionar un contexto pinchando el icono de usuario, marcar cómo importante presionando el icono de la bandera, añadirle una etiqueta y añadirla a un proyecto.
Además, manteniendo presionado el botón naranja comentado anteriormente, permite elegir si crear una tarea desplegándose el mismo modal que acabamos de mencionar o crear un proyecto añadiendo un título de proyecto, una descripción y un color.

![Crear tarea y crear proyecto](img/crearFinal.png){width=100% #fig:crear}

## Hoy

Ahora nos centraremos en los elementos de la *sidebar*, al pinchar en Hoy podemos observar en la figura \ref{fig:hoy} cómo aparecen dos listados, uno con las tareas retrasadas y otro con las tareas acumuladas.

![Hoy](img/hoyFinal.png){width=80% #fig:hoy}

## Cuanto antes

Pinchando en cuanto antes, podemos ver en la figura \ref{fig:cuantoantes} cómo se despliega una pantalla con un listado de las tareas que deben ser realizadas de manera más urgente.

![Cuanto antes](img/cuantoantes.png){width=50% #fig:cuantoantes}

## Programadas

Pinchando en Programadas, se muestra en la figura \ref{fig:programadas} cómo se abre una pantalla con las distintas tareas y la fecha programada de finalización de las mismas.

![Programadas](img/programadas.png){width=50% #fig:programadas}

## Archivadas

Pinchando en Archivadas (ver figura \ref{fig:archivadas}), se abre una pantalla con un listado de las tareas que no son urgentes y que pueden realizarse en cualquier momento.

![Archivadas](img/archivadas.png){width=50% #fig:archivadas}

## Proyectos

Por último, cuando pinchamos en cualquier proyecto (ver figura \ref{fig:proyecto}), se muestra una pantalla con un icono que muestra el porcentaje aproximado de tareas finalizadas que tiene en la parte coloreada del mismo, el nombre del proyecto, un botón para editar el proyecto, la descripción en caso de que exista y un listado de las tareas pertenecientes a dicho proyecto.

![Proyectos](img/proyecto.png){width=50% #fig:proyecto}

## Tareas

En todos los casos en los que aparecen tareas, cómo podemos ver en la figura \ref{fig:tareas}, los listados tienen tareas interactivas, de tal forma que si se arrastra el cursor hacia la derecha aparece en verde la opción de mover la tarea mediante un modal o si se arrastra el cursor a la izquierda permite completar la tarea. Pinchando en el *checkbox* de la izquierda de cada tarea se abre una opción de selección múltiple para que si queremos, podamos mover o completar varias tareas a la vez.

![Funcionalidad tareas](img/tareasFinal.png){width=100% #fig:tareas}
