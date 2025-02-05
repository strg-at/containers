FROM postgres:15.10@sha256:8d9643654c72e25816b595adfbd262cb047b18000286a7df29f52cf720e871fb

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
