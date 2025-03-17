FROM mysql:8.4.4@sha256:0f775a92980b41c87c58f934a204de80431dd4d854057160ec1cb936663eabe9

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
