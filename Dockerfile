# syntax=docker/dockerfile:1

FROM    golang:1.17.6-alpine

LABEL   author="Gijs van Bavel"

ENV     port=4001
ENV     env=staging
ENV     db-dsn=postgres://greenlight:greenlight@localhost/greenlight

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY . ./

RUN go build -o=./bin/api ./cmd/api

CMD [ "/greenlight" ]
