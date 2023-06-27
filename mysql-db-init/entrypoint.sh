#!/usr/bin/env bash

export MYSQL_HOST="${MYSQL_HOST}"
export MYSQL_ROOT_PASSWORD="${MYSQL_SUPER_PASS}"

if [[ -z "${MYSQL_HOST}" || -z "${MYSQL_SUPER_USER}" || -z "${MYSQL_ROOT_PASSWORD}" || -z "${MYSQL_USER}" || -z "${MYSQL_PASS}" || -z "${MYSQL_DB}" ]]; then
  printf "\e[1;32m%-6s\e[m\n" "environment variables missing ..."
  exit 1
fi

until
  mysqladmin \
    --host=${MYSQL_HOST} \
    --user=${MYSQL_SUPER_USER} \
    --password=${MYSQL_ROOT_PASSWORD} \
    --protocol tcp \
    ping -h ${MYSQL_HOST}
do
  printf "\e[1;32m%-6s\e[m\n" "waiting for host '${MYSQL_HOST}' ..."
  sleep 1
done

user_exists=$(\
  mysql \
    --host=${MYSQL_HOST} \
    --user=${MYSQL_SUPER_USER} \
    --password=${MYSQL_ROOT_PASSWORD} \
    --protocol tcp \
    -e "SELECT 1 FROM mysql.user WHERE user = '${MYSQL_USER}';"
)

if [[ -z "${user_exists}" ]]; then
  printf "\e[1;32m%-6s\e[m\n" "create database user ${MYSQL_USER} ..."
  mysql \
    --host=${MYSQL_HOST} \
    --user=${MYSQL_SUPER_USER} \
    --password=${MYSQL_ROOT_PASSWORD} \
    --protocol tcp \
    -e "CREATE USER ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASS}';"
else
  printf "\e[1;32m%-6s\e[m\n" "database user exists, skipping creation ..."
fi

printf "\e[1;32m%-6s\e[m\n" "update database user password ..."
mysql \
  --host=${MYSQL_HOST} \
  --user=${MYSQL_SUPER_USER} \
  --password=${MYSQL_ROOT_PASSWORD} \
  --protocol tcp \
  -e "ALTER USER ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASS}';"

for init_db in ${MYSQL_DB}
do
  database_exists=$(\
    mysql \
    --host=${MYSQL_HOST} \
    --user=${MYSQL_SUPER_USER} \
    --password=${MYSQL_ROOT_PASSWORD} \
    --protocol tcp \
      -e "SHOW DATABASES LIKE '${init_db}';" \
  )

  if [[ -z "${database_exists}" ]]; then
    printf "\e[1;32m%-6s\e[m\n" "create database ${init_db} ..."
    mysql \
      --host=${MYSQL_HOST} \
      --user=${MYSQL_SUPER_USER} \
      --password=${MYSQL_ROOT_PASSWORD} \
      --protocol tcp \
      -e "CREATE DATABASE ${init_db};"
  else
    printf "\e[1;32m%-6s\e[m\n" "database exists, skipping creation ..."
  fi

  printf "\e[1;32m%-6s\e[m\n" "grant all privileges on ${init_db} to user ${MYSQL_USER} ..."
  mysql \
    --host=${MYSQL_HOST} \
    --user=${MYSQL_SUPER_USER} \
    --password=${MYSQL_ROOT_PASSWORD} \
    --protocol tcp \
    -e "GRANT ALL PRIVILEGES ON ${init_db}.* TO ${MYSQL_USER}@'%';"
done

printf "\e[1;32m%-6s\e[m\n" "flush privileges ..."
mysql \
  --host=${MYSQL_HOST} \
  --user=${MYSQL_SUPER_USER} \
  --password=${MYSQL_ROOT_PASSWORD} \
  --protocol tcp \
  -e "FLUSH PRIVILEGES;"
