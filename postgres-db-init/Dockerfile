FROM postgres:17.9@sha256:7ad98329d513dd497293b951c195ca354274a77f12ddbbbbf85e68a811823d72

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
