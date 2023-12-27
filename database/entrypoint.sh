#!/bin/bash
set -e

# Function to check if a MySQL user exists
user_exists() {
  local user="$1"
  local query="SELECT EXISTS (SELECT 1 FROM mysql.user WHERE user = '$user')"
  result=$(mysql -u root --skip-password -se "$query")
  [ "$result" -eq 1 ]
}

# Function to execute SQL commands
execute_sql() {
  local sql_file="$1"
  mysql -u root --password="$MYSQL_ROOT_PASSWORD" < "$sql_file"
}

# Check and update host for root user
if ! user_exists 'root'; then
  execute_sql /docker-entrypoint-initdb.d/init.sql
fi

# Check and update host for 'notes_admin' user
if ! user_exists 'notes_admin'; then
  execute_sql /docker-entrypoint-initdb.d/init.sql
fi

# Start the original entrypoint
exec docker-entrypoint.sh "$@"
