FROM mysql:8.4.5@sha256:ca48cb49cefd64b6fd062c38719061922c2f79332669d9b86f91480b982778ae

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
