FROM postgres:17.7@sha256:5ecd7c63c618bed8b554567d3e9959636956be2058d8acbf12d0313dd16f67f8

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
