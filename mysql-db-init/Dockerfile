FROM mysql:8.4.6@sha256:70fe679fe46969324983655f9d02c90ab97499bc48ec98598e8fe27e91fe51f9

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
