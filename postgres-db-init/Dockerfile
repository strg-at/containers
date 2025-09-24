FROM postgres:17.6@sha256:0f4f20021a065d114083d1b95d9fb89ad847cbc4c3cc9238417815c7df42350f

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
