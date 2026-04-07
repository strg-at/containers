FROM postgres:17.9@sha256:28ed727ae9f0f4e0e19e88055e1158c1ac2d5ac35d87bdbe869a9cc99bfe618c

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
