FROM mysql:8.4.2@sha256:a21ca6952f45280c948fec709d499acffec0dbc2a55817e1ef866bd6fc12c01b

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
