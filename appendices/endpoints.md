# Endpoints

En el este apéndice se detallan los *endpoints* implementados en la *API REST*. Cada *endpoint* se describe mediante dos tablas, una que define las características de este y otra que define los parámetros que puede recibir.

\lbegin{landscape}

## Tarea {.unnumbered}

| Endpoint                 | /task/                                         |
| ------------------------ | ---------------------------------------------- |
| Descripción              | Crea una tarea para el usuario que lo solicita |
| Método HTTP              | POST                                           |
| Cabecera de Autorización | Bearer token                                   |
| Código HTTP (OK)         | 201                                            |
| Código HTTP (KO)         | 409                                            |

| Parámetros               | Descripción             | Tipo        | Opcional |
| ------------------------ | ----------------------- | ----------- | -------- |
| title (*Body*)           | Titulo de la tarea      | *String*    | No       |
| description (*Body*)     | Descripción de la tarea | *String*    | Si       |
| state (*Body*)           | Estado de la tarea      | *Integer*   | Si       |
| important_fixed (*Body*) | Valor de importante     | *Boolean*   | Si       |
| completed (*Body*)       | Valor de completado     | *Boolean*   | Si       |
| project_id (*Body*)      | Proyecto de la tarea    | *Integer*   | Si       |
| context_id (*Body*)      | Contexto de la tarea    | *Integer*   | Si       |
| date_limit (*Body*)      | Fecha de la tarea       | *Timestamp* | Si       |

| Endpoint                 | /task/:id                                                                  |
| ------------------------ | -------------------------------------------------------------------------- |
| Descripción              | Modifica la tarea con el id indicado en la url del usuario que lo solicita |
| Método HTTP              | POST                                                                       |
| Cabecera de Autorización | Bearer token                                                               |
| Código HTTP (OK)         | 200                                                                        |
| Código HTTP (KO)         | 409                                                                        |

| Parámetros               | Descripción                        | Tipo        | Opcional |
| ------------------------ | ---------------------------------- | ----------- | -------- |
| task_id (*Path*)         | id de la tarea a modificar         | *Integer*   | No       |
| title (*Body*)           | Titulo de la tarea modificado      | *String*    | Si       |
| description (*Body*)     | Descripción de la tarea modificado | *String*    | Si       |
| state (*Body*)           | Estado de la tarea modificado      | *Integer*   | Si       |
| important_fixed (*Body*) | Valor de importante                | *Boolean*   | Si       |
| completed (*Body*)       | Valor de completado                | *Boolean*   | Si       |
| project_id (*Body*)      | Proyecto de la tarea               | *Integer*   | Si       |
| context_id (*Body*)      | Contexto de la tarea               | *Integer*   | Si       |
| date_limit (*Body*)      | Fecha de la tarea                  | *Timestamp* | Si       |

| Endpoint                 | /task/:id                                           |
| ------------------------ | --------------------------------------------------- |
| Descripción              | Devuelve el contenido de tarea con el id solicitado |
| Método HTTP              | GET                                                 |
| Cabecera de Autorización | Bearer token                                        |
| Código HTTP (OK)         | 200                                                 |
| Código HTTP (KO)         | 404                                                 |

| Parámetros       | Descripción                | Tipo      | Opcional |
| ---------------- | -------------------------- | --------- | -------- |
| task_id (*Path*) | id de la tarea a consultar | *Integer* | No       |

| Endpoint                 | /task/                                                                |
| ------------------------ | --------------------------------------------------------------------- |
| Descripción              | Devuelve todas las tareas no completadas del usuario que las solicita |
| Método HTTP              | GET                                                                   |
| Cabecera de Autorización | Bearer token                                                          |
| Código HTTP (OK)         | 200                                                                   |
| Código HTTP (KO)         | 404                                                                   |

| Endpoint                 | /task/movelist                       |
| ------------------------ | ------------------------------------ |
| Descripción              | Mueve de estado un listado de tareas |
| Método HTTP              | POST                                 |
| Cabecera de Autorización | Bearer token                         |
| Código HTTP (OK)         | 200                                  |
| Código HTTP (KO)         | 409                                  |

| Parámetros        | Descripción                                    | Tipo             | Opcional |
| ----------------- | ---------------------------------------------- | ---------------- | -------- |
| list_ids (*Body*) | Listado de ids de las tareas a mover de estado | *array[Integer]* | No       |
| state (*Body*)    | Estado al que se mueven las tareas             | *Integer*        | No       |

| Endpoint                 | /task/completelist            |
| ------------------------ | ----------------------------- |
| Descripción              | Completa un listado de tareas |
| Método HTTP              | POST                          |
| Cabecera de Autorización | Bearer token                  |
| Código HTTP (OK)         | 200                           |
| Código HTTP (KO)         | 409                           |

| Parámetros        | Descripción                                    | Tipo             | Opcional |
| ----------------- | ---------------------------------------------- | ---------------- | -------- |
| list_ids (*Body*) | Listado de ids de las tareas a mover de estado | *array[Integer]* | No       |
| completed(*Body*) | Valor de completar al que modificar las tareas | *Boolean*        | No       |

| Endpoint                 | /task/addTag                   |
| ------------------------ | ------------------------------ |
| Descripción              | Añade una etiqueta a una tarea |
| Método HTTP              | POST                           |
| Cabecera de Autorización | Bearer token                   |
| Código HTTP (OK)         | 200                            |
| Código HTTP (KO)         | 409                            |

| Parámetros       | Descripción                                      | Tipo      | Opcional |
| ---------------- | ------------------------------------------------ | --------- | -------- |
| task_id (*Body*) | Id de la tarea a la cual se le añade la etiqueta | *Integer* | No       |
| tag(*Body*)      | Etiqueta a añadir a la tarea                     | *Object*  | No       |

| Endpoint                 | /task/:id/tags                                                     |
| ------------------------ | ------------------------------------------------------------------ |
| Descripción              | Devuelve el listado de etiquetas de la tarea con el id solicitado. |
| Método HTTP              | GET                                                                |
| Cabecera de Autorización | Bearer token                                                       |
| Código HTTP (OK)         | 200                                                                |
| Código HTTP (KO)         | 404                                                                |

| Parámetros       | Descripción                            | Tipo      | Opcional |
| ---------------- | -------------------------------------- | --------- | -------- |
| task_id (*Path*) | Id de la tarea a obtener sus etiquetas | *Integer* | No       |

| Endpoint                 | /task/info                                                                                                   |
| ------------------------ | ------------------------------------------------------------------------------------------------------------ |
| Descripción              | Devuelve un resumen de la información de las tareas del usuario que lo solicita. Para mostrar en la sidebar. |
| Método HTTP              | GET                                                                                                          |
| Cabecera de Autorización | Bearer token                                                                                                 |
| Código HTTP (OK)         | 200                                                                                                          |
| Código HTTP (KO)         | 404                                                                                                          |

## Usuario {.unnumbered}

| Endpoint                 | /user/register                                         |
| ------------------------ | ------------------------------------------------------ |
| Descripción              | Realiza el registro de un usuario creandolo en la BBDD |
| Método HTTP              | POST                                                   |
| Cabecera de Autorización |                                                        |
| Código HTTP (OK)         | 200                                                    |
| Código HTTP (KO)         | 409                                                    |

| Parámetros        | Descripción            | Tipo     | Opcional |
| ----------------- | ---------------------- | -------- | -------- |
| email (*Body*)    | E-mail del usuario     | *String* | No       |
| name (*Body*)     | Nombre de usuario      | *String* | No       |
| password (*Body*) | Contraseña del usuario | *String* | No       |

## Auth {.unnumbered}

| Endpoint                 | /oauth/authorize                                                                 |
| ------------------------ | -------------------------------------------------------------------------------- |
| Descripción              | Obtiene el codigo de autorización de *OAuth* si el la autenticación es correcta. |
| Método HTTP              | POST                                                                             |
| Cabecera de Autorización |                                                                                  |
| Código HTTP (OK)         | 304                                                                              |
| Código HTTP (KO)         | 401                                                                              |

| Parámetros             | Descripción                                                             | Tipo      | Opcional |
| ---------------------- | ----------------------------------------------------------------------- | --------- | -------- |
| client_id (*Body*)     | id del cliente a autorizar                                              | *Integer* | No       |
| response_type (*Body*) | *code* por defecto ya que estamos obtieniendo el codigo de autorización | *String*  | No       |
| email (*Body*)         | E-mail del usuario                                                      | *String*  | No       |
| password (*Body*)      | Contraseña del usuario                                                  | *String*  | No       |

| Endpoint                 | /oauth/token                                                                                                            |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| Descripción              | Si el codigo de autorización es correcto devuelve el token de acceso. Tambien permite realizar la renovación del token. |
| Método HTTP              | POST                                                                                                                    |
| Cabecera de Autorización |                                                                                                                         |
| Código HTTP (OK)         | 200                                                                                                                     |
| Código HTTP (KO)         | 401                                                                                                                     |

| Parámetros             | Descripción                                                                                                                                                  | Tipo      | Opcional |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------- | -------- |
| client_id (*Body*)     | id del cliente desde donde se requiere el token                                                                                                              | *Integer* | No       |
| client_secret(*Body*)  | secreto del cliente autorizado                                                                                                                               | *String*  | No       |
| grant_type (*Body*)    | Tipo de proceso de *OAuth* puede ser *authorization_code* para obtener el token a partir de un codigo o *refresh_token* para refrescar un token ya existente | *String*  | No       |
| code (*Body*)          | Si estamos en el proceso *authorization_code* es el código de autorización obtenido previamente. Si no, no es necesario                                      | *String*  | Si       |
| redirect_uri (*Body*)  | uri a la que redireccionará al obtener el token                                                                                                              | *String*  | No       |
| refresh_token (*Body*) | Si estamos en el proceso *refresh_token* es el token de renovación necesario para obtener un nuevo token. Si no, no es necesario.                            | *String*  | Si       |
| email (*Body*)         | E-mail del usuario                                                                                                                                           | *String*  | No       |
| password (*Body*)      | Contraseña del usuario                                                                                                                                       | *String*  | No       |

## Proyecto {.unnumbered}

| Endpoint                 | /project/                                                 |
| ------------------------ | --------------------------------------------------------- |
| Descripción              | Devuelve todos los proyectos del usuario que lo requiere. |
| Método HTTP              | GET                                                       |
| Cabecera de Autorización | Bearer token                                              |
| Código HTTP (OK)         | 200                                                       |
| Código HTTP (KO)         | 404                                                       |

| Endpoint                 | /project/                                         |
| ------------------------ | ------------------------------------------------- |
| Descripción              | Crea un proyecto para el usuario que lo requiere. |
| Método HTTP              | POST                                              |
| Cabecera de Autorización | Bearer token                                      |
| Código HTTP (OK)         | 200                                               |
| Código HTTP (KO)         | 409                                               |

| Parámetros           | Descripción              | Tipo     | Opcional |
| -------------------- | ------------------------ | -------- | -------- |
| title (*Body*)       | Titulo del proyecto      | *String* | No       |
| description (*Body*) | Descripción del proyecto | *String* | Si       |
| color (*Body*)       | Color del proyecto       | *String* | No       |

| Endpoint                 | /project/:id/complete                                                                                                                                  |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Descripción              | Completa el proyecto referente al id pasado por la url para el usuario que lo requiere. Si tiene tareas asociadas sin completar, también las completa. |
| Método HTTP              | POST                                                                                                                                                   |
| Cabecera de Autorización | Bearer token                                                                                                                                           |
| Código HTTP (OK)         | 200                                                                                                                                                    |
| Código HTTP (KO)         | 404                                                                                                                                                    |

| Parámetros          | Descripción     | Tipo      | Opcional |
| ------------------- | --------------- | --------- | -------- |
| project_id (*Path*) | Id del proyecto | *Integer* | No       |

| Endpoint                 | /project/:id                                                                 |
| ------------------------ | ---------------------------------------------------------------------------- |
| Descripción              | Devuelve toda la información referente al proyecto del id pasado por la url. |
| Método HTTP              | GET                                                                          |
| Cabecera de Autorización | Bearer token                                                                 |
| Código HTTP (OK)         | 200                                                                          |
| Código HTTP (KO)         | 404                                                                          |

| Parámetros          | Descripción     | Tipo      | Opcional |
| ------------------- | --------------- | --------- | -------- |
| project_id (*Path*) | Id del proyecto | *Integer* | No       |

| Endpoint                 | /project/:id                                  |
| ------------------------ | --------------------------------------------- |
| Descripción              | Modifica el proyeto con id pasado por la url. |
| Método HTTP              | POST                                          |
| Cabecera de Autorización | Bearer token                                  |
| Código HTTP (OK)         | 200                                           |
| Código HTTP (KO)         | 404                                           |

| Parámetros           | Descripción              | Tipo      | Opcional |
| -------------------- | ------------------------ | --------- | -------- |
| title (*Body*)       | Titulo del proyecto      | *String*  | Si       |
| description (*Body*) | Descripción del proyecto | *String*  | Si       |
| color (*Body*)       | Color del proyecto       | *String*  | Si       |
| completed (*Body*)   | Valor de completado      | *Boolean* | Si       |

## Contexto {.unnumbered}

| Endpoint                 | /context/                                        |
| ------------------------ | ------------------------------------------------ |
| Descripción              | Crea un context para el usuario que lo requiere. |
| Método HTTP              | POST                                             |
| Cabecera de Autorización | Bearer token                                     |
| Código HTTP (OK)         | 200                                              |
| Código HTTP (KO)         | 404                                              |

| Parámetros    | Descripción         | Tipo     | Opcional |
| ------------- | ------------------- | -------- | -------- |
| name (*Body*) | Nombre del contexto | *String* | No       |

| Endpoint                 | /context/                                                 |
| ------------------------ | --------------------------------------------------------- |
| Descripción              | Devuelve todos los contextos del usuario que lo requiere. |
| Método HTTP              | GET                                                       |
| Cabecera de Autorización | Bearer token                                              |
| Código HTTP (OK)         | 200                                                       |
| Código HTTP (KO)         | 404                                                       |

| Endpoint                 | /context/:id                                                                                                             |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------ |
| Descripción              | Elimina el contexto con el id pasado por la url. Si ese contexto tiene tareas, se modifican para que no tengan contexto. |
| Método HTTP              | DELETE                                                                                                                   |
| Cabecera de Autorización | Bearer token                                                                                                             |
| Código HTTP (OK)         | 200                                                                                                                      |
| Código HTTP (KO)         | 404                                                                                                                      |

| Parámetros          | Descripción     | Tipo      | Opcional |
| ------------------- | --------------- | --------- | -------- |
| context_id (*Path*) | id del contexto | *Integer* | No       |

| Endpoint                 | /context/:id                                      |
| ------------------------ | ------------------------------------------------- |
| Descripción              | Modifica el contexto con el id pasado por la url. |
| Método HTTP              | POST                                              |
| Cabecera de Autorización | Bearer token                                      |
| Código HTTP (OK)         | 200                                               |
| Código HTTP (KO)         | 404                                               |

| Parámetros          | Descripción               | Tipo      | Opcional |
| ------------------- | ------------------------- | --------- | -------- |
| context_id (*Path*) | id del contexto           | *Integer* | No       |
| name (*Body*)       | Nuevo nombre del contexto | *String*  | Si       |

## Etiqueta {.unnumbered}

| Endpoint                 | /tag/                                              |
| ------------------------ | -------------------------------------------------- |
| Descripción              | Crea una etiqueta para el usuario que lo requiere. |
| Método HTTP              | POST                                               |
| Cabecera de Autorización | Bearer token                                       |
| Código HTTP (OK)         | 200                                                |
| Código HTTP (KO)         | 409                                                |

| Parámetros    | Descripción           | Tipo     | Opcional |
| ------------- | --------------------- | -------- | -------- |
| name (*Body*) | Nombre de la etiqueta | *String* | No       |

| Endpoint                 | /tag/gettags                                              |
| ------------------------ | --------------------------------------------------------- |
| Descripción              | Obtiene las etiquetas del usuario que lanza la operación. |
| Método HTTP              | GET                                                       |
| Cabecera de Autorización | Bearer token                                              |
| Código HTTP (OK)         | 200                                                       |
| Código HTTP (KO)         | 404                                                       |

| Endpoint                 | /tag/:name                                              |
| ------------------------ | ------------------------------------------------------- |
| Descripción              | Elimina la etiqueta con el nombre pasado por parametro. |
| Método HTTP              | DELETE                                                  |
| Cabecera de Autorización | Bearer token                                            |
| Código HTTP (OK)         | 200                                                     |
| Código HTTP (KO)         | 404                                                     |

| Parámetros    | Descripción                      | Tipo     | Opcional |
| ------------- | -------------------------------- | -------- | -------- |
| name (*Path*) | Nombre de la etiqueta a eliminar | *String* | No       |

\lend{landscape}