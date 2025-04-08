FROM postgres:17.4@sha256:6e57135d237944dddf7588b249edcdf78745a7c318e5444ae0375855b64ec6cf

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
