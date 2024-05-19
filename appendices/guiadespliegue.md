# Guía de despliegue

En este apéndice se va a detallar como desplegar o compilar los distintos componentes de la aplicación. También se va a explicar la estructura de carpetas del proyecto para ayudar a realizar dicho proceso de despliegue/compilación de los distintos componentes.

## Estructura de carpetas del proyecto

El proyecto está formado por 3 directóricos principales. El primer directorio es *BBDD* y en este donde se encuentran los *scripts* de definición de las tablas de la aplicación. Después tenemos el directorio *Backend* que contiene todo el código referente al servidor de autorización *OAuth* y la *API REST*, además de un fichero compose.yaml el cual sirve para ejecutar los componentes con *docker*. Por útlimo podemos encontrar el directorio *Frontend* el cual contiene el código fuente referente a la aplicación cliente, este código se cuentra a partir del subdirectorio */src*.

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

## Despligue del *backend*

#### Requisitos {.unnumbered}

- *Docker* y *Docker-compose*

Para desplegar el *backend* debemos utilizar la herramienta *docker-compose* y para ello debemos definir un fichero *compose.yaml*. Este fichero puede definirse desde cero ajustandolo a las necesidades de infraestructura que tenga cada usuario, aun así proporcionamos la configuración que hemos utilizado nosotros el cual también se puede aplicar a cualquier necesidad. Dicho fichero se encuentra en la raíz del proyecto *Backend* y sigue la estructura que se puede ver en el siguiente definición:

```yaml
services:
  backend:
    image: node:18-alpine
    command: sh -c "npm install && cp ./instalation/oauth/authorize-handler.js ./node_modules/oauth2-server/lib/handlers/authorize-handler.js && npm run start"
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

El primer servicio llamado *backend* realizará tres acciones, la primera es instalar las dependencias con *npm install*, después realiza la sustitución de un fichero del paquete para implementar OAuth por el mismo pero modificado para lo solución de un bug de este paquete. Dicho fichero modificado se encuentra en la carpeta del proyecto */Backend/instalaton*. Por último se inicia el *backend* con *npm run start*.

En cuanto al segundo servicio, el llamado *db*, iniciará el sistema de gestión de bases de datos de *PostgreSQL*. Para que el sistema cree las tablas automáticamente al iniciar la ejecución, incluimos los *scripts* de definicion de datos. Las tablas solo se crearan si no existen.

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

Las versiónes indicadas son las que hemos utilizado nosotros, con versiones más modernas debería de funcionar correctamente, no así con versiones anteriores.

Para la compilación y generación de la aplicación web basta con ejecutar los siguientes comandos situandonos en el directorio *Frontend*:

```bash
npm install
npx expo export -p web
```

La ejecución de estos dos comandos generará una carpeta en el mismo directorio llamada *dist*, la cual contiene el *bundle* o paquete de la aplicación generada para web. Este contiene un *index.html* y los *scripts* necesarios. Por lo que para ejecutar la aplicación, bastará con iniciar cualquier servidor web sirviendo dicho directorio y el *index.html* como página de entrada.

## Compilación de la aplicación de escritorio

- *Node.js - (18.18.2)*
- *npm (9.8.1)*

Las versiónes indicadas son las que hemos utilizado nosotros, con versiones más modernas debería de funcionar correctamente, no así con versiones anteriores.

La versión de escritorio está desarrollada con *Electron*, un framework que permite ejecutar aplicaciones desarrolladas con tecnologías web en escritorio, esto se consigue  incluyendo *Chromiun* y *Node.js* en los binarios generados, dicho en otras palabras el binario generado con la aplicacion web se ejecuta en un navegador incrustado en el mismo binario. *Electron* permite generar binarios para todas las principales plataformas, por ello nuestra aplicación puede ser compilada para cualquiera de estas.

Para realizar la generación del binario de la aplicación de escritorio debemos situarnos en el directorio *Frontent/desktop*, donde hemos incluido un script tanto en *bash* como en *powershell* que realiza los pasos necesarios. Una vez ejecutado el *script*, se generará en la misma carpeta un directorio llamado *out* el cual contendrá el ejecutable de la apliación de escritorio. Es importante recalcar que tal compilación se hará para la misma plataforma donde se realize la misma, por ejemplo si deseamos compilar para *windows* se deberá de realizar este proceso en *windows*.