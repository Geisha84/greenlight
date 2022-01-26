## Database

```docker run -d --net=greenlight_network -e POSTGRES_PASSWORD=postgres --name postgresdb postgres```

```docker exec -it postgresdb bash```

```psql -U postgres```

```create database greenlight;```

```\c greenlight```

```create role greenlight with login password 'greenlight';```

```CREATE EXTENSION IF NOT EXISTS citext;```

```docker run -d -p 4000:4000 --net=greenlight_network --name=greenlightapp geisha84/greenlight:1.0 -db-dsn=postgres://greenlight:greenlight@postgresdb/greenlight?sslmode=disable```



docker run -d --net=greenlight_network -e POSTGRES_PASSWORD=greenlight -e POSTGRES_DB=greenlight --name postgresdb greenlight_postgres_db

