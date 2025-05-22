FROM postgres:17.5@sha256:bbdcc0478449fa12e85e0e4aca644f42733be578ad29d2bcd28f376ed477489a

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
