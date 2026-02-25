FROM postgres:17.8@sha256:9ba47fa6d1c34e9cc4c1758640e7774a9b73ea0fba891f14088321ba7561d253

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
