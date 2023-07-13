#!/usr/bin/env bash

export PGHOST="${POSTGRES_HOST}"
export PGUSER="${POSTGRES_SUPER_USER}"
export PGPASSWORD="${POSTGRES_SUPER_PASS}"
export PGDATABASE="${POSTGRES_SUPER_DB}"

if [[ -z "${PGHOST}" || -z "${PGUSER}" || -z "${PGPASSWORD}" || -z "${PGDATABASE}" || -z "${POSTGRES_USER}" || -z "${POSTGRES_PASS}" || -z "${POSTGRES_DB}" ]]; then
  printf "\e[1;32m%-6s\e[m\n" "environment variables missing ..."
  exit 1
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

if [[ -z "${user_exists}" ]]; then
  printf "\e[1;32m%-6s\e[m\n" "create database user ${POSTGRES_USER} ..."
  createuser "${POSTGRES_USER}"
  printf "\e[1;32m%-6s\e[m\n" "update super user privileges on role ..."
  psql --command "GRANT ${POSTGRES_USER} TO ${POSTGRES_SUPER_USER};"
else
  printf "\e[1;32m%-6s\e[m\n" "database user exists, skipping creation ..."
fi

printf "\e[1;32m%-6s\e[m\n" "update database user password ..."
psql --command "alter user \"${POSTGRES_USER}\" with encrypted password '${POSTGRES_PASS}';"

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
  psql --command "grant all privileges on database \"${init_db}\" to \"${POSTGRES_USER}\";"
  printf "\e[1;32m%-6s\e[m\n" "Create default SCHEMA for user ${POSTGRES_USER}"
  psql --dbname=${init_db} --command "CREATE SCHEMA IF NOT EXISTS \"${POSTGRES_USER}\" AUTHORIZATION \"${POSTGRES_USER}\";"
done
