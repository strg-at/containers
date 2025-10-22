FROM postgres:17.6@sha256:8e5293306f65f386445ed37940abc590be73bf48986a879941fa866c45283b82

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
