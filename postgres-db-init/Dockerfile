FROM postgres:17.7@sha256:7352e0c4d62bbac8aa69d95e40220a60967c4a19f9c4f65b4d118175f7ce9e3b

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
