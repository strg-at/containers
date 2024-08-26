FROM mysql:8.4.2@sha256:ad77a7c4e2031597e0c73a21993f780cdde6cef15d3dae734fe550c6142f8097

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
