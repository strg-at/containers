FROM postgres:17.6@sha256:5250e6187084ddf4ba407027d07eed2419d4656e30821afef43825c6c0d127df

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
