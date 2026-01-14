FROM postgres:17.7@sha256:11cf4dcbc5181663d0227de04b70b8b48e59560755af23f2b279ba88ad8937b6

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
