FROM postgres:15.8@sha256:8e97b8526ed19304b144f7478bc9201646acf0723cdc100e9bb7495712cbadb6

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
