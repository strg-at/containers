FROM mysql:8.4.5@sha256:134ded8601e984fd00113bf8e73c1980b6534bf62dc53e04f458bfd8d475d206

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
