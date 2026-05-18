FROM postgres:17.10@sha256:538bdb8c6b278f2f09070a4d79f04a83363a795ed23ec0d92d6b70cabc398eae

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
