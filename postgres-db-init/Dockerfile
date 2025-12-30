FROM postgres:17.7@sha256:6a2fb9aaf22abf4c5aeeeb8fcd12dfb57b7531d8d5196f90cfe0ce3f68c4c13f

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
