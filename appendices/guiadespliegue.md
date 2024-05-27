# Apéndice D. Guía de despliegue {#sec:guiadespl}

En este apéndice se va a detallar cómo desplegar o compilar los distintos componentes de la aplicación. También se va a explicar la estructura de carpetas del proyecto para ayudar a realizar dicho proceso de despliegue/compilación de los distintos componentes.

## Estructura de carpetas del proyecto

El proyecto está formado por 3 directorios principales. El primer directorio es *BBDD* y en este donde se encuentran los *scripts* de definición de las tablas de la aplicación. Después tenemos el directorio *Backend* que contiene todo el código referente al servidor de autorización *OAuth* y la *API REST*, además de un fichero compose.yaml el cual sirve para ejecutar los componentes con *docker*. Por últlimo podemos encontrar el directorio *Frontend* el cual contiene el código fuente referente a la aplicación cliente, este código se encuentra a partir del subdirectorio */src*.

```bash
├── BBDD
│   ├── bbdd.sql
│   └── oauth.sql
├── Backend
│   ├── app.js
│   ├── bd
│   ├── compose.yaml
│   ├── instalation
│   ├── oauth
│   ├── package-lock.json
│   ├── package.json
│   ├── public
│   ├── routes
│   └── services
├── Frontend
│   ├── app.json
│   ├── babel.config.js
│   ├── package-lock.json
│   ├── package.json
│   └── src
│   └── desktop
└── README.md
```

## Despliegue del *backend*

#### Requisitos {.unnumbered}

- *Docker* y *Docker-compose*

Para desplegar el *backend* debemos utilizar la herramienta *docker-compose* y para ello debemos definir un fichero *compose.yaml*. Este fichero puede definirse desde cero ajustándolo a las necesidades de infraestructura que tenga cada usuario, aun así proporcionamos la configuración que hemos utilizado nosotros el cual también se puede aplicar a cualquier necesidad. Dicho fichero se encuentra en la raíz del proyecto *Backend* y sigue la estructura que se puede ver en el siguiente definición:

```{.yaml}

  services:
  backend:
    image: node:18-alpine
    command: sh -c "npm install && cp ./instalation/oauth/author..."
    ports:
      - 3000:3000
    working_dir: /Backend
    volumes:
      - ./:/Backend
    environment:
      PORT: 3000
      POSTGRES_HOST: db 
      POSTGRES_USER: tfggtdUser
      POSTGRES_PASSWORD: nodenodito@69
      POSTGRES_DB: tfggtd

  db:
    image: postgres
    volumes:
      - posgresql-data:/var/lib/postgresql/data
      - ../BBDD/:/docker-entrypoint-initdb.d/
    environment:
      POSTGRES_USER: tfggtdUser
      POSTGRES_PASSWORD: nodenodito@69
      POSTGRES_DB: tfggtd
    ports:
      - 127.0.0.1:5432:5432

  volumes:
  posgresql-data:

```

Se definen dos servicios y por lo tanto dos contenedores separados, uno para la parte de la *API REST* utilizando una imagen de *Node* y otro para la base de datos utilizando una imagen de *PostgreSQL*. Dentro de cada servicio definimos las distintas variables de entorno que se utilizan en la aplicación, estas pueden modificarse a gusto del usuario. Cabe recalcar que las variables de entorno referentes a la conexión a la base de datos deben coincidir en ambos servicios. 

El primer servicio llamado *backend* realizará tres acciones, la primera es instalar las dependencias con *npm install*, después realiza la sustitución de un fichero del paquete para implementar OAuth por el mismo pero modificado para la solución de un bug de este paquete. Dicho fichero modificado se encuentra en la carpeta del proyecto */Backend/instalaton*. Por último se inicia el *backend* con *npm run start*.

En cuanto al segundo servicio, el llamado *db*, iniciará el sistema de gestión de bases de datos de *PostgreSQL*. Para que el sistema cree las tablas automáticamente al iniciar la ejecución, incluimos los *scripts* de definición de datos. Las tablas solo se crearán si no existen.

Por último, en el fichero *compose.yaml* también se define un volumen para los datos de la base de datos, esto permitirá que cuando finalicemos la ejecución de los contenedores, los datos no se borren y sigan estando cuando los levantemos de nuevo.

Para ejecutar el *backend* completo basta con ejecutar el siguiente comando:

```bash
  docker-compose up -d 
```

El flag *-d* ejecutará los contenedores en segundo plano liberando el terminal donde se haya ejecutado el comando. 

## Compilación de la aplicación web

#### Requisitos {.unnumbered}

- *Node.js - (18.18.2)*
- *npm (9.8.1)*

Las versiones indicadas son las que hemos utilizado nosotros, con versiones más modernas debería de funcionar correctamente, no así con versiones anteriores.

Para la compilación y generación de la aplicación web basta con ejecutar los siguientes comandos situándonos en el directorio *Frontend*:

```bash
  npm install
  npx expo export -p web
```

La ejecución de estos dos comandos generará una carpeta en el mismo directorio llamada *dist*, la cual contiene el *bundle* o paquete de la aplicación generada para web. Este contiene un *index.html* y los *scripts* necesarios. Por lo que para ejecutar la aplicación, bastará con iniciar cualquier servidor web sirviendo dicho directorio y el *index.html* como página de entrada.

## Compilación de la aplicación de escritorio

- *Node.js - (18.18.2)*
- *npm (9.8.1)*

Las versiones indicadas son las que hemos utilizado nosotros, con versiones más modernas debería de funcionar correctamente, no así con versiones anteriores.

La versión de escritorio está desarrollada con *Electron*, un framework que permite ejecutar aplicaciones desarrolladas con tecnologías web en escritorio, esto se consigue  incluyendo *Chromiun* y *Node.js* en los binarios generados, dicho en otras palabras el binario generado con la aplicación web se ejecuta en un navegador incrustado en el mismo binario. *Electron* permite generar binarios para todas las principales plataformas, por ello nuestra aplicación puede ser compilada para cualquiera de estas.

Para realizar la generación del binario de la aplicación de escritorio debemos situarnos en el directorio *Frontent/desktop*, donde hemos incluido un script tanto en *bash* como en *powershell* que realiza los pasos necesarios. Una vez ejecutado el *script*, se generará en la misma carpeta un directorio llamado *out* el cual contendrá el ejecutable de la aplicación de escritorio. Es importante recalcar que tal compilación se hará para la misma plataforma donde se realice la misma, por ejemplo si deseamos compilar para *windows* se deberá de realizar este proceso en *windows*.

## Compilación de la aplicación de *Android*

- *Docker*
- Cuenta *Expo*

Las versiones indicadas son las que hemos utilizado nosotros, con versiones más modernas debería de funcionar correctamente, no así con versiones anteriores. Para poder compilar la aplicación de *Android* es necesario realizar el proceso desde una máquina *linux* por ello lo hemos realizado en un contenedor de *docker* con una imagen de *ubuntu* que además contiene todas las dependencias necesarias para realizar la compilación. Todas estas dependencias se encuentran definidas en el *dockerfile* localizado en la carpeta */Frontend/dockerfile*.

La compilación de la aplicación de *Android* se realiza con la herramienta *expo* y por lo tanto es necesario disponer de una cuenta de esta plataforma. El proceso se ejecuta totalmente en local, aunque *expo* dispone también de un servicio de compilación en sus servidores.

Para realizar la compilación, nos situaremos en primer lugar en el directorio */Frontend/dockerfile* y realizaremos la *build* del contenedor de docker con el siguiente comando:

```bash

    docker build -t apkswiftdo .

```

La *flag* -t define una *tag* para nuestro contenedor con el objetivo de luego localizarlo con facilidad. Una vez ejecutado el anterior comando comenzará la *build*, cabe destacar que puede que este proceso tarde varios minutos. A continuación según acabe la *build* accederemos interactivamente al contenedor refiriéndonos a él con la *tag* previamente definida con el siguiente comando:

```bash

    docker run -it apkswiftdo 

```

Tras ejecutar el anterior comando entraremos en el terminal del contenedor. Por último ejecutamos el siguiente comando para generar el fichero *.apk* de la aplicación:

```bash

    eas build --platform android --local --profile preview

```

Este proceso puede alargarse varios minutos. Una vez acabado observaremos el siguiente mensaje:

```bash

  Build successful
  You can find the build artifacts in /project/build-1716755505051.apk

```

Tras finalizar el proceso, ya disponemos del fichero *.apk* el cual podemos exportar a nuestra máquina desde el contenedor con el siguiente comando:

```bash

  docker cp <containerId>:/project/build-1716755505051.apk ./

```

Para obtener el identificador del contenedor podemos ejecutar el siguiente comando:

```bash
  docker ps
```
