#!/bin/sh

# ad
if [ ! -d "/var/www/inception_wordpress" ]; then
	mkdir -p /var/www/inception_wordpress
fi

cd /var/www/inception_wordpress

wp core download --allow-root --locale=en_US
echo "CHECKING POSITION: "
pwd
ls
echo "Running WP-CONFIG CREATE!"
echo "CHECK: dbname:(${MARIADB_NAME}) dbuser:(${MARIADB_USER}) dbpass=(${MARIADB_PASSWORD}) dbhost:(${WP_HOST})"
wp config create --dbname="${MARIADB_NAME}" --dbuser="${MARIADB_USER}" --dbpass="${MARIADB_PASSWORD}" --dbhost="${WP_HOST}" --allow-root

echo "CHECK admin credentials url: ${WP_URL} title: ${WP_TITLE} admin_name: ${WP_ADMIN_USER} admin_password: ${WP_ADMIN_PASSWORD} admin_email: ${WP_ADMIN_EMAIL}"
wp core install --allow-root --url="${WP_URL}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN_USER}" --admin_password="${WP_ADMIN_PASSWORD}" --admin_email="${WP_ADMIN_EMAIL}" --skip-email

echo "CHECK user credentials: name: ${WP_USER_NAME} email: ${WP_USER_EMAIL} password: ${WP_USER_PASSWORD}"
wp user create "${WP_USER_NAME}" "${WP_USER_EMAIL}" --user_pass="${WP_USER_PASSWORD}" --role=author

# installs the Astra theme and activates it for the site. The --activate flag tells WP-CLI to make the theme the active theme for the site.
wp theme install astra --activate --allow-root

chown -R nobody:nobody *
echo "CHECKING FOLDER STRUCTURE:"
ls
echo "EXECUTING php-fpm83 -F -R"
exec php-fpm83 -F -R