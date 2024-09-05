FROM postgres:15.8@sha256:e600c23d564a5fc7824093c89b4c25dacb1cdd5de64e9e7ced0c630cfbcc1890

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
