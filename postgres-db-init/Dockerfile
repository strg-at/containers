FROM postgres:17.6@sha256:b480430782a9bd1c8a6835fb5b70f89f34a70132c2f6182e534f65688bce063b

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
