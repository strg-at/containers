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

ext_list="${POSTGRES_EXTENSIONS:-}"
read -ra requested <<< "${ext_list//,/ }"
[[ "${POSTGRES_EXTENSION_UUID_OSSP:-}" == "true" ]] && requested+=("uuid-ossp")
[[ "${POSTGRES_EXTENSION_ANON:-}" == "true" ]] && requested+=("anon")
[[ "${POSTGRES_EXTENSION_VECTOR:-}" == "true" ]] && requested+=("vector")
extensions=()
declare -A seen=()
for ext in "${requested[@]}"; do
  [[ -n "${seen[${ext}]:-}" ]] && continue
  seen[${ext}]=1
  extensions+=("${ext}")
done

# advisory lock per session: concurrent db-init runs take turns on shared objects
psql_run() {
  {
    echo "SELECT pg_advisory_lock(hashtext('strg-at/postgres-db-init')) \\gset"
    cat
  } | psql --no-psqlrc --quiet --set ON_ERROR_STOP=1 \
    --set user="${POSTGRES_USER}" \
    --set pass="${POSTGRES_PASS}" \
    --set super="${POSTGRES_SUPER_USER}" \
    --set ext_schema="${POSTGRES_EXTENSIONS_SCHEMA:-}" \
    --set search_path="${POSTGRES_SEARCH_PATH:-}" \
    "$@"
}

log "ensure role ${POSTGRES_USER} ..."
psql_run <<'SQL'
SELECT format('CREATE ROLE %I LOGIN', :'user')
 WHERE NOT EXISTS (SELECT FROM pg_roles WHERE rolname = :'user')
\gexec
-- non-superuser admins (Cloud SQL) need membership to create the role's schema
SELECT format('GRANT %I TO %I', :'user', :'super')
 WHERE NOT (SELECT rolsuper FROM pg_roles WHERE rolname = :'super')
\gexec
SELECT format('ALTER ROLE %I WITH PASSWORD %L', :'user', :'pass')
\gexec
SELECT format('ALTER ROLE %I SET search_path TO %s', :'user',
              string_agg(quote_ident(btrim(s, ' "')), ', ' ORDER BY ord))
  FROM unnest(string_to_array(:'search_path', ',')) WITH ORDINALITY AS t(s, ord)
 WHERE :'search_path' <> ''
HAVING count(*) > 0
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

  if [[ -n "${POSTGRES_EXTENSIONS_SCHEMA:-}" ]]; then
    log "ensure shared schema ${POSTGRES_EXTENSIONS_SCHEMA} on ${init_db} ..."
    psql_run --dbname="${init_db}" <<'SQL'
CREATE SCHEMA IF NOT EXISTS :"ext_schema";
REVOKE ALL ON SCHEMA :"ext_schema" FROM PUBLIC;
GRANT USAGE ON SCHEMA :"ext_schema" TO :"user";
SQL
  fi

  for ext in "${extensions[@]}"; do
    target="${POSTGRES_EXTENSIONS_SCHEMA:-${POSTGRES_USER}}"
    log "ensure extension ${ext} in schema ${target} on ${init_db} ..."
    psql_run --dbname="${init_db}" --set ext="${ext}" --set target="${target}" <<'SQL'
SELECT format('CREATE EXTENSION IF NOT EXISTS %I%s CASCADE', :'ext',
              CASE WHEN fixed IS NULL THEN format(' WITH SCHEMA %I', :'target') ELSE '' END)
  FROM (SELECT (SELECT schema FROM pg_available_extension_versions
                 WHERE name = :'ext' AND schema IS NOT NULL LIMIT 1) AS fixed) AS s
\gexec
SQL
    if [[ -n "${POSTGRES_EXTENSIONS_SCHEMA:-}" ]]; then
      psql_run --dbname="${init_db}" --set ext="${ext}" <<'SQL'
SELECT format('ALTER EXTENSION %I SET SCHEMA %I', extname, :'ext_schema')
  FROM pg_extension
 WHERE extname = :'ext' AND extrelocatable
   AND extnamespace <> to_regnamespace(:'ext_schema')
\gexec
SELECT format('DO $w$ BEGIN RAISE WARNING %L; END $w$',
              format('extension %s is not relocatable and stays in schema %s',
                     extname, extnamespace::regnamespace))
  FROM pg_extension
 WHERE extname = :'ext' AND NOT extrelocatable
   AND extnamespace <> to_regnamespace(:'ext_schema')
\gexec
SQL
    fi
  done
done

log "done"
