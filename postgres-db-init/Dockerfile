FROM postgres:15.7@sha256:c317f08d888548ba8d43d69608c075d4def55478c46e491c6dab2dbb862346a2

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
