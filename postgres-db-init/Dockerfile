FROM postgres:17.6@sha256:bb51eb307fdaa5abc9866ab9ff9b93dbe639a56d0345e078ff7f96f39a22252e

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
