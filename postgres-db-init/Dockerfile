FROM postgres:17.6@sha256:af5fa668fd423e463dd77225cc5ad88bb49979cbed8f7b551f350c9a2b039d41

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
