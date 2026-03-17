FROM postgres:17.9@sha256:681f6b2a528c5ef8c162859b778b7e1e27728c977f587a495f34e28b041901f7

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
