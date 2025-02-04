FROM postgres:15.10@sha256:7304217b23c60c6fea7e8e108cb39e6b96c0fe892e0401749a3a04797defa44c

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
