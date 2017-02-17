FROM node:7-alpine
MAINTAINER Porawit Poboonma <ball6847@gmail.com>

ENV TERM=xterm-256colors
ENV PARSE_SERVER_VERSION=2.3.2
ENV PARSE_SERVER_APPLICATION_ID=appId
ENV PARSE_SERVER_MASTER_KEY=masterKey
ENV PORT=1337
ENV PARSE_SERVER_DATABASE_URI=mongodb://mongo:27017/db
# for full list please

ADD app /app
WORKDIR /app

RUN npm install

EXPOSE 1337

ENTRYPOINT [ "./node_modules/.bin/parse-server" ]
