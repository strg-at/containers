FROM postgres:17.10@sha256:3faba5d113bdbdfda79ed7f0d68ddae736d17473e8888e250f2471c651694f3f

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
