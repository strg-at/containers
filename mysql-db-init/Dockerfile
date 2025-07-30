FROM mysql:8.4.6@sha256:2a0308862d65d06e46c11e1b97be43a5fe1ca4f710e3d7b9b28f20a55ccddbd2

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
