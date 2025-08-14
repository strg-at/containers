FROM postgres:17.6@sha256:a7fdfd815005ea658281c60b06020f49ab8a6bbe21434d3a59fe14654f6d4293

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
