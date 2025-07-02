FROM mysql:8.4.5@sha256:c4bff32d412a3f9567d8572a1b303d7d61d514452295c984b37933540101a7cd

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
