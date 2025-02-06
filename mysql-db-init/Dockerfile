FROM mysql:8.4.4@sha256:b14b2b73fc1242bef8fc21cbd73f247396f353cf314734d3502d72eb1ed0d93b

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
