#!/bin/bash

export $(grep -v '^#' .env | xargs)

cat <<EOF > setup.sql
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'172.%.%.%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'172.%.%.%';
FLUSH PRIVILEGES;
EOF

mysql -u root < setup.sql

rm setup.sql

exec mysqld_safe