#!/bin/sh

# until mariadb -h mariadb -P$DB_PORT -u$DB_USER -p$DB_PASSWORD -e '\c'; do
#   echo >&2 "\033[41mWordpress is Waiting for mariadb - sleeping.....\033[0m"
#   sleep 2
# done

sleep 5

# if ! [ -d /var/www/wordpress/index.php ] ; then

if ! wp core is-installed; then

# ****************
wp core download --path=/var/www/wordpress --version=6.0.1 --allow-root
wp core config --path=/var/www/wordpress --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --skip-check --allow-root
# ***************

wp core install --url=$IP_ADDR --title='inception' --admin_user=$WP_ADMIN_USER --admin_email=1337@1337.ma --admin_password=$WP_ADMIN_USER_PASSWORD --path=/var/www/wordpress --allow-root 
wp user create $WP_USER inception123@gmail.com --role=subscriber  --user_pass=$WP_USER_PASSWORD  --path=/var/www/wordpress  --allow-root 
# wp theme install twentytwenty --path=/var/www/wordpress  --allow-root  --activate

#ip -4 -o addr show eth0 | awk '{print $4}' | awk 'FNR == 1 {print}' | awk '{split($0,tab,"/"); print tab[1]}'

# wp user create user_1337 --role=author --user_pass=1337 --path=/var/www/wordpress  --allow-root

wp post create --post_title="I am $IP_ADDR" --post_content="Hi from 1337 , coding school from Morocco" --post_status=publish --post_author=$WP_USER --path=/var/www/wordpress  --allow-root 

fi

php-fpm7.3 --nodaemonize
