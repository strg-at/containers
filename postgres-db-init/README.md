<!-- markdownlint-disable MD041 -->
<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD028 -->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

# postgres-db-init

database (schema) initialization helper

## ENV

|                                | Description                                    |
| :----------------------------- | :--------------------------------------------- |
| **POSTGRES_HOST**              | postgres host                                  |
| **POSTGRES_SUPER_USER**        | postgres admin user                            |
| **POSTGRES_SUPER_PASS**        | postgres admin password                        |
| **POSTGRES_SUPER_DB**          | postgres admin db                              |
| **POSTGRES_USER**              | postgres user                                  |
| **POSTGRES_PASS**              | postgres password                              |
| **POSTGRES_DB**                | postgres database                              |
| **CREATE_EXTENSION_UUID_OSSP** | create extension uuid-ossp (optional, boolean) |

| (\*) required

## How to test

build docker container

```console
docker build -t db-init ./postgres-db-init
```

create local postgres instance

```console
docker run --rm --name postgres \
  -e POSTGRES_PASSWORD=postgres \
  --network=host \
  postgres
```

run db-init container

```console
docker run --rm -it --name db-init \
  -e POSTGRES_HOST=<local-ip> \
  -e POSTGRES_SUPER_USER=postgres \
  -e POSTGRES_SUPER_PASS=postgres \
  -e POSTGRES_SUPER_DB=postgres \
  -e POSTGRES_USER=testing \
  -e POSTGRES_PASS=testing \
  -e POSTGRES_DB=testing \
  db-init
```

connect to postgres instance

```console
docker exec -it postgres psql -h <local-ip> -U postgres
```

list user and database

```console
postgres=# \du
postgres=# \l
```

## Notice

Modified version of onedr0ps [postgres-initdb][onedr0p-postgres-db-init] that can be used with any superadmin user. Thanks!

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- Links -->

[onedr0p-postgres-db-init]: https://github.com/onedr0p/containers/tree/main/apps/postgres-initdb

<!-- Badges -->

<!-- TBD -->
