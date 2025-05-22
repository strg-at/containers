FROM postgres:17.5@sha256:bf0f80f355b3b05840279e6d441d5b59e824a26651350ced7a642f3677e18e42

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
