FROM postgres:17.6@sha256:8a56bef4c60bef3d26193cb9d810fce93def8fd0c459f4a9b14240fbd7559a1d

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
