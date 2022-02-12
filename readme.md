## Database

```docker run -d --net=greenlight_network -e POSTGRES_PASSWORD=postgres --name postgresdb postgres```

```docker exec -it postgresdb bash```

```psql -U postgres```

```create database greenlight;```

```\c greenlight```

```create role greenlight with login password 'greenlight';```

```CREATE EXTENSION IF NOT EXISTS citext;```

```docker run -d -p 4000:4000 --net=greenlight-network --name greenlight-api greenlight-api -db-dsn=postgres://greenlight:greenlight@greenlight-db/greenlight?sslmode=disable```






docker build -t greenlight-api -f Dockerfile.multistage .
docker build -t greenlight-db -f Dockerfile.postgres .
docker network create greenlight-network

docker run -d \
    --name greenlight-db \
    --network greenlight-network \
    -e POSTGRES_USER=greenlight \
    -e POSTGRES_PASSWORD=greenlight \
    -e POSTGRES_DB=greenlight \
    greenlight-db

docker run -d \
    --name greenlight-api \
    -p 4000:4000 \
    --network greenlight-network \
    greenlight-api -db-dsn=postgres://greenlight:greenlight@greenlight-db/greenlight?sslmode=disable