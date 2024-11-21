FROM mysql:8.4.3@sha256:2bed89deaa6122df7e3bfdb3006d2f09251e2fa925bdd4f6a5ccff7badf070ee

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
