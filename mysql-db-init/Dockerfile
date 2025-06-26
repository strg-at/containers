FROM mysql:8.4.5@sha256:cf80c8de37d2b90e2b8b81db0953c0b0d18cbd2ff17ee82b642dac018d38e8a4

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
