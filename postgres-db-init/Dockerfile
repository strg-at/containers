FROM postgres:17.7@sha256:2b6239f32680c308921cf212902f881355c31ae92da0795b4fef29d8f0033021

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
