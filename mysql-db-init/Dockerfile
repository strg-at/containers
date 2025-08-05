FROM mysql:8.4.6@sha256:475221fcdc1c8972a9b2370f051d80488b49a9a972bf75a22903881b97afec3b

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
