FROM postgres:17.5@sha256:aef2e621d89d3a2e6bd1fb1bc8b066277425ea60fa1d97e87ee8894c9efc0272

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
