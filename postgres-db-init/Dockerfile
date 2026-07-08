FROM postgres:17.10@sha256:de1e13ca94377fa5a27aafd0e9fc200df9692b15152f0090fdf074074ea5e397

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
