FROM postgres:17.6@sha256:cecd364cc7ec03ab6148ab650efc5200548a89fd2e4f47a8ba6e6cf08c18805d

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
