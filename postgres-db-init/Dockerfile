FROM postgres:15.10@sha256:11423e02d34154b13d69250ad5d5635ec47fb046fb4d1431a08a6d64496efb19

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
