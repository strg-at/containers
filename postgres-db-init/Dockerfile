FROM postgres:15.11@sha256:b3a3b666dfb3a7dca6858ef90bad3557da4d4e1532c090f6fe6d4de76d98ab6f

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
