FROM mysql:8.4.5@sha256:3a89257a3a979e46e3650628bea227a6bc318a2bdc95f954489ec89573a4c6a2

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
