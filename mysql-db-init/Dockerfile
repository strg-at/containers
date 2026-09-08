FROM mysql:8.4.11@sha256:3466ba4a4828aa8d46fb7c3bc16b67b781c98413cf4ea0fac6feaa6e881faa26

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
