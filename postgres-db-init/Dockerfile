FROM postgres:19.0@sha256:4ea94de574c17f0372722806c949757050fbb1cd7648410fe45d6bba275cc00e

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
