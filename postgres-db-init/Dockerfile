FROM postgres:15.8@sha256:eb3747f5d0a92195ca486d2f15d9a4ee5e9461b0332fe87fbc59069490a5c659

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
