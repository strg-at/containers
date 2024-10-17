FROM mysql:8.4.3@sha256:bda6ee1f3ae5ebb3cbe9b995c9645ffbd36d7dbda3bd4b4d2ffa43d997073074

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
