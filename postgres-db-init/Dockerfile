FROM postgres:17.7@sha256:929190a12e0833c89276f78c7cf665aaaa62b5930e6f852e9f733f8b737d3f8f

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
