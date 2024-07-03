FROM mysql:8.0.38@sha256:134e2d1c7c517d05e5328a77aa5a165a314dc4c4116503e7e089494f4e398ab1

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
