FROM postgres:15.12@sha256:afe31bc78e0104222f8b1d7a005ec5f90688c3e68b5c878f1bf01dfa90ddb10e

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
