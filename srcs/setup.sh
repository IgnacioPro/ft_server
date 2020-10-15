# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: IgnacioHB <IgnacioHB@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/04 23:33:35 by IgnacioHB         #+#    #+#              #
#    Updated: 2020/10/15 16:25:39 by IgnacioHB        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#/bin/bash

# starting services
service nginx start
service php7.3-fpm start
service mysql start

# creating mysql database for wordpress
mysql < /var/www/html/phpMyAdmin/sql/create_tables.sql
echo "create database wordpress default character set utf8 collate utf8_unicode_ci;" | mysql -u root
echo "create database phpmyadmin default character set utf8 collate utf8_unicode_ci;" | mysql -u root
# echo "grant all on wordpress.* to 'ignacio'@'localhost' identified by '42madrid';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'ignacio'@'localhost' IDENTIFIED BY '42madrid';" | mysql -u root
echo "flush privileges;" | mysql -u root
echo "exit;"

# downloading and extracting all wordpress files to the correct folder
wget -P /tmp/ https://es.wordpress.org/latest-es_ES.tar.gz
tar -xvf /tmp/*.tar.gz -C /var/www/html/

# setting sites enabled on nginx
ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/
rm /etc/nginx/sites-available/default 
rm /etc/nginx/sites-enabled/default

mkdir /var/www/html/phpMyAdmin/tmp/
chmod 777 /var/www/html/phpMyAdmin/tmp/
chown -R www-data:www-data /var/www/html/phpMyAdmin

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
echo "flush privileges;" | mysql -u root




# restarting nginx for changes to take effect
service php7.3-fpm restart
service nginx restart
# access to command line inside the container
bash