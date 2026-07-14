FROM postgres:17.10@sha256:ebba4f4de37f08f138f97c1443c987a435e783177afedcc4aaf2da1930fbc37a

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
