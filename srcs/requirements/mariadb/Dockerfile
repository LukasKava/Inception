
FROM alpine:3.19.0


#System tables for mariadb examples
#	Information Schema: special database that holds info about other databases.
#		You can look up details about tables, columns, users etc.

#	Priveleges and Grants:	For example permissions or access rights.
#		-When you create a user account in MariaDB, you decide what that use
#			can do (like read data, modify tables, or create new databases).

#	Performance Schema: virtual database focused on monitoring server performance.

#	System Tables in the mysql Database:	The mysql database contains important 
#		tables that manage user accounts and their privileges. These tables keep track of who can do what within the database.
#		For example, the user table stores usernames, passwords, and what actions each user is allowed to perform.
# System tables help organize and control access to MariaDB database. It makes sure that everything runs smoothly.

#
RUN apk update && \
	apk add mariadb mariadb-client && \
		mkdir -p /run/mysqld && \
		chown -R mysql:mysql /run/mysqld && \
	mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
		chown -R mysql:mysql /var/lib/mysql && \
		sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf && \
	sed -i 's/#bind-address/bind-address/g' /etc/my.cnf.d/mariadb-server.cnf

COPY ./tools/script.sh /tmp/script.sh

RUN chmod +x /tmp/script.sh

WORKDIR /tmp

# Use the MySQL user to run the container
USER mysql

CMD ["/tmp/script.sh"]
