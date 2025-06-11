FROM postgres:17.5@sha256:cb51e9f73d5b6fd77340999cc0fdfcf56a1d580daa6f4c2f6c72264993e6de34

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
