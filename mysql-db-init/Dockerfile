FROM mysql:26.10.0@sha256:4c9987f8cb7b0eca4136a993c5c2c78e9bc8db68932a8e358fbeeb60c69adcb5

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
