FROM postgres:15.10@sha256:68bb947ec37e6cfd5486c51ecdd122babc3ddaedb490acb913130a7e325d36c5

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
