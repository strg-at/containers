FROM postgres:15.8@sha256:a001eedbcd5cc0e2aa2e96005e0a7a4d244615b336519deebb8a9db70bfc6098

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
