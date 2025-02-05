FROM postgres:15.10@sha256:d609c3005478af92bddad773423df829b7402ea0b356d5b72edd2fd54d1ad3ea

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
