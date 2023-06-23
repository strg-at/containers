#!/usr/bin/env bash

export MYSQLHOST="${MYSQL_HOST}"
export MYSQLPASSWORD="${MYSQL_SUPER_PASS}"

if [[ -z "${MYSQLHOST}" || -z "${MYSQLPASSWORD}" || -z "${MYSQL_USER}" || -z "${MYSQL_PASS}" || -z "${MYSQL_DB}" ]]; then
  printf "\e[1;32m%-6s\e[m\n" "environment variables missing ..."
  exit 1
fi

until mysqladmin --user=root --password=${MYSQLPASSWORD} --protocol tcp ping -h ${MYSQLHOST} 2>/dev/null
do
  printf "\e[1;32m%-6s\e[m\n" "waiting for host '${MYSQLHOST}' ..."
  sleep 1
done

user_exists=$(\
  mysql --user=root \
        --password=${MYSQLPASSWORD} \
        --protocol tcp -se "SELECT 1 FROM mysql.user WHERE user = '${MYSQL_USER}';" \
        2>/dev/null | xargs
)

if [[ -z "${user_exists}" ]]; then
  printf "\e[1;32m%-6s\e[m\n" "create database user ${MYSQL_USER} ..."
  mysql --user=root \
        --password=${MYSQLPASSWORD} \
        --protocol tcp \
        -e "CREATE USER ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASS}';" \
        2>/dev/null
else
  printf "\e[1;32m%-6s\e[m\n" "database user exists, skipping creation ..."
fi

for init_db in ${MYSQL_DB}
do
  database_exists=$(\
    mysql --user=root \
          --password="${MYSQLPASSWORD}" \
          --protocol tcp \
          -e "SHOW DATABASES LIKE '${init_db}';" \
          2>/dev/null
  )

  if [[ -z "${database_exists}" ]]; then
    printf "\e[1;32m%-6s\e[m\n" "create database ${init_db} ..."
    mysql --user=root \
          --password=${MYSQLPASSWORD} \
          --protocol tcp \
          -e "CREATE DATABASE ${init_db};" \
          2>/dev/null
  else
    printf "\e[1;32m%-6s\e[m\n" "database exists, skipping creation ..."
  fi

  printf "\e[1;32m%-6s\e[m\n" "update user privileges on database ..."
  mysql --user=root \
        --password=${MYSQLPASSWORD} \
        --protocol tcp \
        -e "GRANT ALL PRIVILEGES ON ${init_db}.* TO '${MYSQL_USER}'@'%';" \
        2>/dev/null

  mysql --user=root \
        --password=${MYSQLPASSWORD} \
        --protocol tcp \
        -e "FLUSH PRIVILEGES;" \
        2>/dev/null
done
