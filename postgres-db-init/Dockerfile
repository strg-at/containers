FROM postgres:17.7@sha256:f337b026cb1fb954a93f2e33a62bf9ea7fffc1dafc1586c53b93922a8d6ee018

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
