FROM postgres:17.5@sha256:fc50da4d6d6bb989a167cf8c48317a2a9e9387bd8b9067a2750daa9eca73a4f6

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
