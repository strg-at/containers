FROM mysql:8.4.2@sha256:a55b5347ff7d7e8e644e39dd7bc0d747834c254921010eeb5a90691987a12022

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
