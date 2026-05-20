FROM postgres:17.10@sha256:3a83c3e2e6f5507ba4bfd2f2981936d055f81a40c08d7ea80f7a5e46d6512d6e

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
