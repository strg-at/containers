#!/usr/bin/env bash

export PGHOST="${POSTGRES_HOST}"
export PGUSER="${POSTGRES_SUPER_USER}"
export PGPASSWORD="${POSTGRES_SUPER_PASS}"
export PGDATABASE="${POSTGRES_SUPER_DB}"

if [[ -z "${PGHOST}" || -z "${PGUSER}" || -z "${PGPASSWORD}" || -z "${PGDATABASE}" || -z "${POSTGRES_USER}" || -z "${POSTGRES_PASS}" || -z "${POSTGRES_DB}" ]]; then
  printf "\e[1;32m%-6s\e[m\n" "environment variables missing ..."
  exit 1
fi

if [[ "${POSTGRES_EXTENSION_ANON}" == "true" ]]
  if [[ -z "${POSTGRES_ANON_USER}" && ! -z "${POSTGRES_ANON_PASSWORD}" ]]; then
    printf "\e[1;32m%-6s\e[m\n" "environment variables missing to configure anon role ..."
    exit 1
  fi
fi

until pg_isready; do
  printf "\e[1;32m%-6s\e[m\n" "waiting for host '${PGHOST}' ..."
  sleep 1
done

user_exists=$(\
  psql \
    --tuples-only \
    --csv \
    --command "SELECT 1 FROM pg_roles WHERE rolname = '${POSTGRES_USER}'"
)

anon_role_exists=$(\
  psql \
    --tuples-only \
    --csv \
    --command "SELECT 1 FROM pg_roles WHERE rolname = '${POSTGRES_ANON_USER}'"
)

if [[ -z "${user_exists}" ]]; then
  printf "\e[1;32m%-6s\e[m\n" "create database user ${POSTGRES_USER} ..."
  createuser "${POSTGRES_USER}"
  printf "\e[1;32m%-6s\e[m\n" "update super user privileges on role ..."
  psql --command "GRANT ${POSTGRES_USER} TO ${POSTGRES_SUPER_USER};"
else
  printf "\e[1;32m%-6s\e[m\n" "database user exists, skipping creation ..."
fi

printf "\e[1;32m%-6s\e[m\n" "update database user password ..."
psql --command "ALTER USER ${POSTGRES_USER} WITH ENCRYPTED PASSWORD '${POSTGRES_PASS}';"

for init_db in ${POSTGRES_DB}
do
  database_exists=$(\
    psql \
      --tuples-only \
      --csv \
      --command "SELECT 1 FROM pg_database WHERE datname = '${init_db}'"
  )

  if [[ -z "${database_exists}" ]]; then
      printf "\e[1;32m%-6s\e[m\n" "create database ${init_db} ..."
      createdb "${init_db}"
    else
      printf "\e[1;32m%-6s\e[m\n" "database exists, skipping creation ..."
  fi

  printf "\e[1;32m%-6s\e[m\n" "update user privileges on database ..."
  psql --command "GRANT ALL PRIVILEGES ON DATABASE ${init_db} TO ${POSTGRES_USER};"
  printf "\e[1;32m%-6s\e[m\n" "create schema ${POSTGRES_USER} for user ${POSTGRES_USER}"
  psql --dbname=${init_db} --command "CREATE SCHEMA IF NOT EXISTS ${POSTGRES_USER} AUTHORIZATION ${POSTGRES_USER};"

  if [[ "${POSTGRES_EXTENSION_UUID_OSSP}" == "true" ]]; then
    printf "\e[1;32m%-6s\e[m\n" "create extension uuid-ossp on ${init_db} with schema ${POSTGRES_USER} ..."
    psql --dbname=${init_db} --command "CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\" WITH SCHEMA ${POSTGRES_USER};"
  fi

  if [[ "${POSTGRES_EXTENSION_ANON}" == "true" ]]; then
    printf "\e[1;32m%-6s\e[m\n" "create extension anon on ${init_db} with schema ${POSTGRES_USER} ..."
    psql --dbname=${init_db} --command "CREATE EXTENSION IF NOT EXISTS \"anon\" WITH SCHEMA ${POSTGRES_USER};"
    printf "\e[1;32m%-6s\e[m\n" "create role ${POSTGRES_ANON_USER} ..."

    if [[ -z "${anon_role_exists}" ]]; then
      printf "\e[1;32m%-6s\e[m\n" "create database role ${POSTGRES_ANON_USER} ..."
      psql --command "CREATE ROLE ${POSTGRES_ANON_USER} WITH ENCRYPTED PASSWORD '${POSTGRES_ANON_PASSWORD}';"
      printf "\e[1;32m%-6s\e[m\n" "alter role ${POSTGRES_ANON_USER} to enable transparent dynamic masking ..."
      psql --dbname=${init_db} --command "ALTER ROLE ${POSTGRES_ANON_USER} SET anon.transparent_dynamic_masking TO TRUE;"
      printf "\e[1;32m%-6s\e[m\n" "set security label on ${POSTGRES_ANON_USER} role ..."
      psql --dbname=${init_db} --command "SECURITY LABEL FOR anon ON ROLE ${POSTGRES_ANON_USER} IS 'MASKED';"
      printf "\e[1;32m%-6s\e[m\n" "give read-only privileges to ${POSTGRES_ANON_USER} role on all databases ..."
      psql --command "GRANT pg_read_all_data TO ${POSTGRES_ANON_USER};"
    else
      printf "\e[1;32m%-6s\e[m\n" "database role exists, skipping creation ..."
    fi
  fi
done
