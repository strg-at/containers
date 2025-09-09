FROM postgres:17.6@sha256:29574e213ffaf433ca9c9441a5919868b85ec04e7a32377f48edd3d3f972103d

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
