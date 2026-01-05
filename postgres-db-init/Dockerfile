FROM postgres:17.7@sha256:bac8128cd62a35471a1e97966861aa2ac88c8d2f408767a425ae70695a607c99

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
