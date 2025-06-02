FROM mysql:8.4.5@sha256:8d643340d4e6a15f7aa51d46b6406f51a2a286c222f871f4d5ec116587c586da

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
