## Docker

Build the nessecary Docker images:

```docker
docker build -t greenlight-api -f Dockerfile.multistage .
docker build -t greenlight-db -f Dockerfile.postgres .
```

Create a bridge-network for development purpose:

```docker
docker network create greenlight-network
```

Run the DB container:

```docker
docker run -d \
    --name greenlight-db \
    --network greenlight-network \
    -e POSTGRES_USER=greenlight \
    -e POSTGRES_PASSWORD=greenlight \
    -e POSTGRES_DB=greenlight \
    greenlight-db
```

Run the API container:

```docker
docker run -d \
    --name greenlight-api \
    -p 4000:4000 \
    --network greenlight-network \
    greenlight-api -db-dsn=postgres://greenlight:greenlight@greenlight-db/greenlight?sslmode=disable
```