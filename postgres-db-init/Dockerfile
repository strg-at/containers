FROM postgres:15.8@sha256:bf8657add1d8ba09904da03ddadd372443ff58bfe088c653e5b43bcb2cee2a10

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
