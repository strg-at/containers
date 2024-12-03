FROM postgres:15.10@sha256:85640e1cfb0d3a54a8a4fa03581caf23ad297b00a44a9a07e064ab9485677d86

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
