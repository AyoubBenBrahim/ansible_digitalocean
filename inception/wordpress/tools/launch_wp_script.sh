#!/bin/sh

sleep 5

if ! wp core is-installed; then

    # ****************
    wp core download --path=/var/www/wordpress --version=6.0.1 --allow-root
    wp core config --path=/var/www/wordpress --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --skip-check --allow-root
    # ***************

    wp core install --url=$IP_ADDR --title='inception' --admin_user=$WP_ADMIN_USER --admin_email=1337@1337.ma --admin_password=$WP_ADMIN_USER_PASSWORD --path=/var/www/wordpress --allow-root 
    wp user create $WP_USER inception123@gmail.com --role=subscriber  --user_pass=$WP_USER_PASSWORD  --path=/var/www/wordpress  --allow-root
    
    # wp theme install twentytwenty --path=/var/www/wordpress  --allow-root  --activate
    wp theme install twentytwentytwo --path=/var/www/wordpress  --allow-root  --activate

    mv /var/www/wordpress/*.png /var/www/wordpress/wp-content/themes/twentytwentytwo/assets/images/
    sed -i "s/'footer-default',/ /" /var/www/wordpress/wp-content/themes/twentytwentytwo/inc/block-patterns.php

    wp post create --post_title="I am $IP_ADDR" --post_content="Hi from 1337, the Coding School from Morocco" --post_status=publish --post_author=$WP_USER --path=/var/www/wordpress  --allow-root 

     echo "DELETE FROM cloud_db.wp_posts WHERE wp_posts.post_name = 'hello-world';" | mariadb -h mariadb -P$DB_PORT -u$DB_USER -p$DB_PASSWORD
fi

php-fpm7.3 --nodaemonize
