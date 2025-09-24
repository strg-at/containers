FROM mysql:8.4.6@sha256:5367102acfefeaa47eb0eb57c8d4f8b96c8c14004859131eac9bbfaa62f81e34

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
