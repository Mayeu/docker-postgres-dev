# Multi Postgres

![](https://badgen.net/badge//mayeu%2Fmultipostgres/blue?icon=docker)

A postgres docker image where you can create multiple database.

This image is enterily based on [the official postgres
one](https://hub.docker.com/_/postgres/).

Thus I only document the additional variable I added.

## Environement variable

### POSTGRES\_ADDITIONAL\_DB

Beside the database created with `POSTGRES_DB`, this image provide support to
have any number of DB via the `POSTGRES_ADDITIONAL_DB`.

Note that all the DB created like this will use the same user and password that
you provided via `POSTGRES_USER` and `POSTGRES_PASSWORD`

Example of use in a `docker-compose.yml` file:
```yaml
version: '3'
services:
  db:
    image: mayeu/multipostgres
    environment:
      POSTGRES_PASSWORD: password
      POSTGRES_USER: user
      POSTGRES_DB: db1
      POSTGRES_ADDITIONAL_DB: db2,db3,db4
```

You can put one or more databse. All database must be separated by a coma
(',').
