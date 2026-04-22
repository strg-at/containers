FROM postgres:17.9@sha256:7b405451d054ec04a90f1ce4d5a188b184e265e3facf671d96fe2a540e6c4532

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
