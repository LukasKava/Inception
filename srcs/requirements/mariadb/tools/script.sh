#!/bin/sh

if [ -z "$MARIADB_NAME" ] || [ -z "$MARIADB_USER" ] || [ -z "$MARIADB_PASSWORD" ]; then
  echo "One or more required environment variables are not set."
  [ -z "$MARIADB_NAME" ] && echo "Error: MARIADB_NAME environment variable is not set."
  [ -z "$MARIADB_USER" ] && echo "Error: MARIADB_USER environment variable is not set."
  [ -z "$MARIADB_PASSWORD" ] && echo "Error: MARIADB_PASSWORD environment variable is not set."
  exit 1
else
	# Create the init.sql file with necessary SQL commands
	echo "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;" > /tmp/init.sql
	echo "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" >> /tmp/init.sql
	echo "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%';" >> /tmp/init.sql
	echo "FLUSH PRIVILEGES;" >> /tmp/init.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" >> /tmp/init.sql

	# Run the MariaDB server with the init file
	exec mysqld --user=mysql --init-file=/tmp/init.sql
fi