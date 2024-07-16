FROM mysql:8.4.1@sha256:a7dc4a4e07a9c5d53c0cf36b5b4e8a1b3bb677cb0d544256a0581114a93ddf0f

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
