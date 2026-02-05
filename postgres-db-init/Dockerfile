FROM postgres:17.7@sha256:2006493727bd5277eece187319af1ef82b4cf82cf4fc1ed00da0775b646ac2a4

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
