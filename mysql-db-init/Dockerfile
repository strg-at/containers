FROM mysql:8.4.8@sha256:f1c7674d8dd3c94f439b0d607792187d55bd861f94e8c6d683b959b577152bdc

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
