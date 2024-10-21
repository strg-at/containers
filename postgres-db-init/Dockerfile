FROM postgres:15.8@sha256:491aea6e557dea673887a9008f872225b667d0f54223a10e085059a239459ccb

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
