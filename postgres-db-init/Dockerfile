FROM postgres:17.7@sha256:dca7512acaa113409df7e40d977d801e53c0c8088e45d4311a45b4065ccfdcd3

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
