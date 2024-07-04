FROM postgres:15.7@sha256:261400cf1399540d2dfa62c4420916d419bf9cd835d118674535a3830444be6e

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
