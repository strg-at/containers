FROM mysql:8.4.4@sha256:1d967fb75a64dc3c2894c69285becfc2304ae0c3c4f4c715c297f3c12d60b01c

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
