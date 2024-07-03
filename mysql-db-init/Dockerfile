FROM mysql:8.4.1@sha256:d26a69e1ef146c77ecfddf3128134e3a0f4c6123133725835818107037649827

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
