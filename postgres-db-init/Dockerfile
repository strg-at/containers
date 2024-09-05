FROM postgres:15.8@sha256:84f20a7934b74a6f5480a15bc78a6f03d8d6f703f3408b6e2e255755bb613ba2

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
