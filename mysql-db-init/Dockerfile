FROM mysql:8.4.5@sha256:a458cd83af2654878d5468ff01443c8378f375b707645b597c7c75202eaad541

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
