FROM mysql:8.4.5@sha256:740f4abb8df45ddc7a38907d65127ce1fd830f0ef3acae49baa954e3e232efe3

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
