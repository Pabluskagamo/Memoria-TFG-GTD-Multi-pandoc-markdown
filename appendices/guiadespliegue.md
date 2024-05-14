# Guía de despliegue

En este apendice se va a detalla como desplegar los distintos componentes de la aplicación. 

## Despligue del *backend*

#### Requisitos {.unnumbered}

- Docker

- Docker-compose

Para desplegar el backend debemos utilizar la herramienta *docker-compose* y para ello debemos definir un fichero *compose.yml*. Este fichero puede definirse desde cero y definirlo según se desee pero proporcionamos una plantilla de como lo hemos desplegado nosotros. Dicho fichero se encuentra en la raíz del proyecto *Backend* y sigue la estructura que se puede ver en el siguiente definición:

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

Las diferentes variables de entorno pueden modificarse dependiendo de las necesidades del usuario que vaya a desplegar el servicio.

Para ejecutar el *backend* completo basta con ejecutar el siguiente comando:

```bash
docker-compose up -d 
```

El flag -d ejecutará los contenedores en segundo plano liberando el terminal donde se haya ejecutado el comando. En el fichero *compose.yaml* se define un volumen para los datos de la base de datos, esto permitirá que cuando finalicemos la ejecución de los contenedores los datos no se borren y sigan estando cuando levantemos los contenedores de nuevo.

## Compilación de la aplicación de escritorio y web

#### Requisitos {.unnumbered}

- Node.js

Hemos incluido un script en *bash* y *powershell* que realiza los pasos necesarios para la compilación de la aplicación de escritorio. Es importante recalcar que tal compilación se hará para la misma plataforma donde se realize la misma, por ejemplo si deseamos compilar para *windows* se deberá de realizar este proceso en *windows*.
