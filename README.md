
[![Docker Automated buil](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/ball6847/parse-server/)

# Docker Image for parse-server

Quickly up and running parse-server using docker

## Running with Docker Compose

`docker-compose.yml` example

```yml
version: '2'

services:
  parse-server:
    image: ball6847/parse-server:2.3.2
    depends_on:
      - mongo
    environment:
      - PARSE_SERVER_APPLICATION_ID=myAppId
      - PARSE_SERVER_MASTER_KEY=masterKey
      - PARSE_SERVER_DATABASE_URI=mongodb://mongo:27017/db
      - PARSE_SERVER_MOUNT_PATH=/parse
    ports:
      - 1337:1337
  mongo:
    image: mongo

```

Enable LiveQuery server.

```yml
version: '2'

services:
  parse-server:
    image: ball6847/parse-server:2.3.2
    depends_on:
      - mongo
      - redis
    environment:
      - PARSE_SERVER_APPLICATION_ID=myAppId
      - PARSE_SERVER_MASTER_KEY=masterKey
      - PARSE_SERVER_DATABASE_URI=mongodb://mongo:27017/db
      - PARSE_SERVER_MOUNT_PATH=/parse
      - PARSE_SERVER_LIVE_QUERY_CLASSNAMES=Task
      - PARSE_SERVER_LIVE_QUERY_REDIS_URL=redis://redis:6379
    ports:
      - 1337:1337
  mongo:
    image: mongo
  redis:
    image: redis:3-alpine
    entrypoint: redis-server --appendonly yes --protected-mode no

```

Parse Dashboard

```yml
version: '2'

services:
  parse-server:
    image: ball6847/parse-server:2.3.2
    depends_on:
      - mongo
    environment:
      - PARSE_SERVER_APPLICATION_ID=myAppId
      - PARSE_SERVER_MASTER_KEY=masterKey
      - PARSE_SERVER_DATABASE_URI=mongodb://mongo:27017/db
      - PARSE_SERVER_MOUNT_PATH=/parse
    ports:
      - 1337:1337
  parse-dashboard:
    image: ball6847/parse-dashboard:1.0.25
    depends_on:
      - parse-server
    environment:
      - PARSE_DASHBOARD_SERVER_URL=http://localhost:1337/parse
      - PARSE_DASHBOARD_ALLOW_INSECURE_HTTP=true
      - PARSE_DASHBOARD_MASTER_KEY=masterKey
      - PARSE_DASHBOARD_APP_ID=myAppId
      - PARSE_DASHBOARD_APP_NAME=myApp
      - PARSE_DASHBOARD_USER_ID=admin
      - PARSE_DASHBOARD_USER_PASSWORD=admin
    ports:
      - 4040:4040
  mongo:
    image: mongo
```

Bring up the services.

```sh
docker-compose up -d
```

Your parse-server endpoint now available at http://localhost:1337/parse

## Todo

- More detail about custom configuration.
