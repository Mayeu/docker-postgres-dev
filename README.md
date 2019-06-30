# 🐘 Postgres Dev image

[![](https://badgen.net/badge//mayeu%2Fmultipostgres/blue?icon=docker)](https://hub.docker.com/r/mayeu/multipostgres)

This is a postgres docker image taillored toward software devlopement and
testing.

**It should not be run in production at all**. You **will** lose data if you do
so (see the features.)

This image is enterily based on [the official postgres one][opi]. Thus, the
following documentation only covers the additional configuration specific to
this image.

## ✨ Features

**Multiple databases support.**

You can declare multiple databases directly via an environment variable. So you
can have `my-project-dev`, `my-project-test`, etc. easily. All of them share
the same user and password.

**Really really fast write operation.**

The image **breaks all write guarantee** and thus goes really fast. This is
ideal for dev & testing, not so for production. It uses [libeatmydata][lemd] to
achieve this.

[opi]: https://hub.docker.com/_/postgres/
[lemd]: https://www.flamingspork.com/projects/libeatmydata/

## 🌳 Configuration

### POSTGRES\_ADDITIONAL\_DB

In addition to the database created with the `POSTGRES_DB` environment
variable, this image provide support to have any number of DB via the
`POSTGRES_ADDITIONAL_DB`.

Note that all the DB created like this will use the same user and password that
you provided via `POSTGRES_USER` and `POSTGRES_PASSWORD`

Example of use in a `docker-compose.yml` file:
```yaml
version: '3'
services:
  db:
    image: mayeu/postgres-dev
    environment:
      POSTGRES_PASSWORD: password
      POSTGRES_USER: user
      POSTGRES_DB: db1
      POSTGRES_ADDITIONAL_DB: db2,db3,db4
```

You can put one or more databse. All databases must be separated by a coma
(',').
