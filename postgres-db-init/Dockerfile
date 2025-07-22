FROM postgres:17.5@sha256:4d89c904835259bc58876520e56267ca07a4ebd6a027f7814bbbf91b50d685be

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
