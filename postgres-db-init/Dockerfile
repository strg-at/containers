FROM postgres:15.7@sha256:68b988a164c8bdf0752fa7a4ae2d4b34a058e21c6327e69f741c081a38e97254

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
