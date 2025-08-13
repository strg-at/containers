FROM postgres:17.5@sha256:0f9d52b237395d0512efd1e5493ac9bd60606839994422bba9bfa7ab3ddc32ea

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
