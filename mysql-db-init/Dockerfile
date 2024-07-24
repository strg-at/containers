FROM mysql:8.4.2@sha256:a13510e6c70e4be896cb904ba1fe3d4d466193928324744bb2356e865c097ebb

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
