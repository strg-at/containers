FROM postgres:15.8@sha256:9710421a8a74e02442c4c1422b8acd4458b4713b64c0eae8387e6ccde1e8cac2

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
