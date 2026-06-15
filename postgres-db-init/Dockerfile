FROM postgres:17.10@sha256:2203e6282d9e7de7c24d7da234e2a744fb325df366a3fd8ed940e8abbee39527

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
