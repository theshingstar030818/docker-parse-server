[![](https://images.microbadger.com/badges/image/ball6847/parse-server.svg)](https://microbadger.com/images/ball6847/parse-server "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/ball6847/parse-server.svg)](https://microbadger.com/images/ball6847/parse-server "Get your own version badge on microbadger.com")
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

Bring up the services.

```sh
docker-compose up -d
```

Your parse-server endpoint now available at http://localhost:1337/parse

## Todo

- More detail about custom configuration.
