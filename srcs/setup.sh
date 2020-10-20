# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ihorcada <ihorcada@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/04 23:33:35 by IgnacioHB         #+#    #+#              #
#    Updated: 2020/10/20 11:34:35 by ihorcada         ###   ########.fr        #
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
echo "GRANT ALL PRIVILEGES ON *.* TO 'ignacio'@'localhost' IDENTIFIED BY '42madrid';" | mysql -u root
echo "flush privileges;" | mysql -u root

# downloading and extracting all wordpress files to the correct folder
wget -P /tmp/ https://es.wordpress.org/latest-es_ES.tar.gz
tar -xvf /tmp/*.tar.gz -C /var/www/html/

# setting sites enabled on nginx
ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/
rm /etc/nginx/sites-available/default 
rm /etc/nginx/sites-enabled/default

# setting up phpmyadmin space management
mkdir /var/www/html/phpMyAdmin/tmp/
chmod 777 /var/www/html/phpMyAdmin/tmp/
chown -R www-data:www-data /var/www/html/phpMyAdmin/

mysql -u root wordpress < /tmp/wordpress.sql
echo "flush privileges;" | mysql -u root

# setting up ssl
chmod 700 /etc/ssl/private
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=SP/ST=Spain/L=Madrid/O=42/CN=127.0.0.1" -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
openssl dhparam -out /etc/ssl/certs/dhparam.pem 1000

chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

# setting autoindex on or off

sed -i "s/autoindex on/$autoindex/" /etc/nginx/sites-enabled/wordpress

# if ${autoindex}=off; then
#     sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-enabled/wordpress
# else
#     sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-enabled/wordpress
# fi

# restarting nginx for changes to take effect
service php7.3-fpm restart
service nginx restart

# access to command line inside the container
bash
