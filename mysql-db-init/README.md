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

# mysql-db-init

database (schema) initialization helper

## ENV

|                      | Description          |
| :------------------- | :------------------- |
| **MYSQL_HOST**       | MYSQL host           |
| **MYSQL_SUPER_PASS** | MYSQL admin password |
| **MYSQL_USER**       | MYSQL user           |
| **MYSQL_PASS**       | MYSQL password       |
| **MYSQL_DB**         | MYSQL database       |

| (\*) required

## How to test

build docker container

```console
docker build -t mysql-db-init ./mysql-db-init
```

create local MYSQL instance

```console
docker run --rm --name mysql \
  -e MYSQL_ROOT_PASSWORD=mysql \
  --network=host \
  mysql
```

run db-init container

```console
docker run --rm -it --name mysql-db-init \
  -e MYSQL_HOST=<local-ip> \
  -e MYSQL_SUPER_PASS=MYSQL \
  -e MYSQL_USER=testing \
  -e MYSQL_PASS=testing \
  -e MYSQL_DB=testing \
  mysql-db-init
```

connect to MYSQL instance

```console
docker exec -it mysql mysql -h <local-ip> -uroot
```

list user and databases

```console
mysql> SELECT user FROM mysql.user;
mysql> SHOW DATABASES;
```

## Notice

Modified version of onedr0ps [MYSQL-initdb][onedr0p-postgres-db-init] for MySQL (tested up to version 8.0).

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- Links -->

[onedr0p-postgres-db-init]: https://github.com/onedr0p/containers/tree/main/apps/postgres-initdb

<!-- Badges -->

<!-- TBD -->
