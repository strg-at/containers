FROM postgres:15.12@sha256:71807dd348e024bb34c4e0fb7de060c78b01f58611b03cf1f678b796fe0bf935

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
