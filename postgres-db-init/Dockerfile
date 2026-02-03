FROM postgres:17.7@sha256:4493696c5ba6a9cd4a3303411d5dd6af52cf5e34cdd87ba8ebf26a19735f84d1

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
