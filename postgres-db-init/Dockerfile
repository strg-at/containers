FROM postgres:17.7@sha256:2167ad9c70a2b1072fed967ee8bc8f397b6a2d705f7c0afc6a477a7791ef8749

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
