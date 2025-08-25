FROM mysql:8.4.6@sha256:0a2a40b552410757015645e28f727f6ad18b7ff8a7cb697871ccadd238778dcb

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
