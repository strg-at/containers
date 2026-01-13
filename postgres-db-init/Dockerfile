FROM postgres:17.7@sha256:f070e09fa5b77a36d029cd57d8607ab83d290bc07bf463d8a42452ae360a191f

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
