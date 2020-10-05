# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: IgnacioHB <IgnacioHB@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/04 23:33:35 by IgnacioHB         #+#    #+#              #
#    Updated: 2020/10/06 01:14:59 by IgnacioHB        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#/bin/bash

# starting services
service nginx start
service php7.3-fpm start
service mysql start

# creating mysql database for wordpress
echo "create database wordpress default character set utf8 collate utf8_unicode_ci;" | mysql -u root
echo "grant all on wordpress.* to 'ignacio'@'localhost' identified by '42madrid';" | mysql -u root
echo "flush privileges;" | mysql -u root
echo "exit;"

# extracting all wordpress files to the correct folder
tar -xvf /tmp/wordpress-5.5.1-es_ES.tar.gz -C /var/www/html/
rm /tmp/wordpress-5.5.1-es_ES.tar.gz

# setting sites enabled on nginx
ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/
rm /etc/nginx/sites-available/default 
rm /etc/nginx/sites-enabled/default

# restarting nginx for changes to take effect
service nginx restart
# access to command line inside the container
bash
