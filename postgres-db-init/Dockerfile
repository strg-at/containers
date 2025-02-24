FROM postgres:15.12@sha256:e897e4ad35012fb8baed1e5e8462f17b34d534d7fb52fd6b658e41f3fbaea32b

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
