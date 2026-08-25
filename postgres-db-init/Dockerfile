FROM postgres:18.6@sha256:1957b2ff3137e4ef7f3bc813e74fff50b1e1ffddc85c8b9d6f14ade972be8687

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
