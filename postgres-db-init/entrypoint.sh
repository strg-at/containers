#!/usr/bin/env bash
set -euo pipefail

log() { printf "\e[1;32m%s\e[m\n" "$*"; }
fail() { printf "\e[1;31m%s\e[m\n" "$*" >&2; exit 1; }

export PGHOST="${POSTGRES_HOST:-}"
export PGUSER="${POSTGRES_SUPER_USER:-}"
export PGPASSWORD="${POSTGRES_SUPER_PASS:-}"
export PGDATABASE="${POSTGRES_SUPER_DB:-}"

for var in POSTGRES_HOST POSTGRES_SUPER_USER POSTGRES_SUPER_PASS POSTGRES_SUPER_DB POSTGRES_USER POSTGRES_PASS POSTGRES_DB; do
  [[ -n "${!var:-}" ]] || fail "environment variable ${var} missing"
done

until pg_isready --quiet; do
  log "waiting for host '${PGHOST}' ..."
  sleep 1
done

extensions=()
[[ "${POSTGRES_EXTENSION_UUID_OSSP:-}" == "true" ]] && extensions+=("uuid-ossp")
[[ "${POSTGRES_EXTENSION_ANON:-}" == "true" ]] && extensions+=("anon")
[[ "${POSTGRES_EXTENSION_VECTOR:-}" == "true" ]] && extensions+=("vector")

# Values reach SQL only as psql variables (:'literal', :"identifier") or through format(%I/%L),
# never by string interpolation, so passwords and names with quotes or dashes are safe.
psql_run() {
  psql --no-psqlrc --quiet --set ON_ERROR_STOP=1 \
    --set user="${POSTGRES_USER}" \
    --set pass="${POSTGRES_PASS}" \
    --set super="${POSTGRES_SUPER_USER}" \
    "$@"
}

log "ensure role ${POSTGRES_USER} ..."
psql_run <<'SQL'
SELECT format('CREATE ROLE %I LOGIN', :'user')
 WHERE NOT EXISTS (SELECT FROM pg_roles WHERE rolname = :'user')
\gexec
-- A non-superuser admin (e.g. Cloud SQL) needs membership to create the role's schema.
SELECT format('GRANT %I TO %I', :'user', :'super')
 WHERE NOT (SELECT rolsuper FROM pg_roles WHERE rolname = :'super')
\gexec
SELECT format('ALTER ROLE %I WITH PASSWORD %L', :'user', :'pass')
\gexec
SQL

for init_db in ${POSTGRES_DB}; do
  log "ensure database ${init_db} ..."
  psql_run --set db="${init_db}" <<'SQL'
SELECT format('CREATE DATABASE %I', :'db')
 WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = :'db')
\gexec
SELECT format('GRANT ALL PRIVILEGES ON DATABASE %I TO %I', :'db', :'user')
\gexec
SQL

  log "ensure schema ${POSTGRES_USER} on ${init_db} ..."
  psql_run --dbname="${init_db}" <<'SQL'
CREATE SCHEMA IF NOT EXISTS :"user" AUTHORIZATION :"user";
SQL

  for ext in "${extensions[@]}"; do
    log "ensure extension ${ext} in schema ${POSTGRES_USER} on ${init_db} ..."
    psql_run --dbname="${init_db}" --set ext="${ext}" <<'SQL'
CREATE EXTENSION IF NOT EXISTS :"ext" WITH SCHEMA :"user" CASCADE;
SQL
  done
done

log "done"
