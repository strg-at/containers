FROM postgres:15.8@sha256:0836104ba0de8d09e8d54e2d6a28389fbce9c0f4fe08f4aa065940452ec61c30

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
