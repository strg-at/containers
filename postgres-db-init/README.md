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

|                                  | Description                                                                                 |
| :------------------------------- | :------------------------------------------------------------------------------------------ |
| **POSTGRES_HOST**                | postgres host                                                                               |
| **POSTGRES_SUPER_USER**          | postgres admin user                                                                         |
| **POSTGRES_SUPER_PASS**          | postgres admin password                                                                     |
| **POSTGRES_SUPER_DB**            | postgres admin db                                                                           |
| **POSTGRES_USER**                | postgres user                                                                               |
| **POSTGRES_PASS**                | postgres password                                                                           |
| **POSTGRES_DB**                  | postgres database (space-separated for several)                                             |
| **POSTGRES_EXTENSIONS**          | extensions to create, space- or comma-separated, e.g. `vector uuid-ossp` (optional)         |
| **POSTGRES_EXTENSION_UUID_OSSP** | create extension uuid-ossp (optional, boolean; same as listing it in POSTGRES_EXTENSIONS)   |
| **POSTGRES_EXTENSION_ANON**      | create extension anon (optional, boolean; same as listing it in POSTGRES_EXTENSIONS)        |
| **POSTGRES_EXTENSION_VECTOR**    | create extension vector (optional, boolean; same as listing it in POSTGRES_EXTENSIONS)      |
| **POSTGRES_EXTENSIONS_SCHEMA**   | install extensions in this shared schema instead of the user's schema (optional, see below) |
| **POSTGRES_SEARCH_PATH**         | comma-separated search_path for the user, e.g. `$user, extensions` (optional)               |

| (\*) required

### Extensions

`POSTGRES_EXTENSIONS` and the per-extension flags are merged; each extension is created once with
`CASCADE`. The extension must be installed on the server, otherwise the container fails. Extensions
are only ever added: removing one from the list does not drop it. Extensions that need server
configuration (e.g. `shared_preload_libraries` for `pg_stat_statements` or `anon`) still need that
configured on the server.

### Shared extensions schema

By default extensions are created in the user's own schema, so dropping that schema also drops the
extension and every column in other schemas that uses its types. With `POSTGRES_EXTENSIONS_SCHEMA`
set, the schema is created owned by the admin user, `PUBLIC` loses its default access, and the user
gets `USAGE` only. Extensions are created there, and an extension that already exists in another
schema is moved there (`ALTER EXTENSION ... SET SCHEMA`; columns and indexes follow it). Extensions
that are not relocatable stay where they are and only log a warning. Add the schema to
`POSTGRES_SEARCH_PATH` so the user resolves the extension's types and functions.

### Errors

The container stops at the first failing statement and exits non-zero. Values are passed to SQL as
psql variables, so passwords and names may contain quotes, dashes or upper-case letters.

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
  -e POSTGRES_EXTENSION_UUID_OSSP=true \
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

list installed extensions on db

```console
postgres=# \c testing
postgres=# \dx
```

## Notice

Modified version of onedr0ps [postgres-initdb][onedr0p-postgres-db-init] that can be used with any superadmin user. Thanks!

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- Links -->

[onedr0p-postgres-db-init]: https://github.com/onedr0p/containers/tree/main/apps/postgres-initdb

<!-- Badges -->

<!-- TBD -->
