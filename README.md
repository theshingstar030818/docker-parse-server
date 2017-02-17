# Docker Image for parse-server

Quickly up and running parse-server using docker (Will be published to DockerHub shortly)

## Build

```sh
git clone git@github.com:ball6847/docker-parse-server.git
cd docker-parse-server
docker build -t ball6847/parse-server .
```

## Running with Docker Compose

`docker-compose.yml` example

```yml
version: '2'

services:
  parse-server:
    image: ball6847/parse-server
    depends_on:
      - mongo
    ports:
      - 1337:1337
  mongo:
    image: mongo:3.4.1
```

Bring up the services.

```sh
docker-compose up -d
```

Your parse-server endpoint now available at http://localhost:1337/parse

## Todo

- Publish to DockerHub.
- More detail about custom configuration.
