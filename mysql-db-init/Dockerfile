FROM mysql:8.4.8@sha256:7fcf7bcd3fa703ff23a2b998e4ed9077e5db570bcc4468459902e33b23d2841d

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
