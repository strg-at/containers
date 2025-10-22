FROM postgres:17.6@sha256:5fb46253e1013a88b275458e753cdb174fdb3ab4bf10a997c8ee8c16b31d8c81

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
