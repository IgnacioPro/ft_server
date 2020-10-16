# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: IgnacioHB <IgnacioHB@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/02 13:16:26 by IgnacioHB         #+#    #+#              #
#    Updated: 2020/10/16 17:03:45 by IgnacioHB        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster 

LABEL Ignacio ihorcada <ihorcada@student.42madrid.com>

RUN apt-get update
RUN apt-get install -y	vim \
						nginx \
						mariadb-server \
						php7.3-common \
						php7.3-cli \
						php7.3-fpm \
						php7.3-mysql \
						php7.3-json \
						php7.3-opcache \
						php7.3-mbstring \
						php7.3-xml \
						php7.3-gd \
						php7.3-curl \
						wget
						
COPY /srcs/wordpress/wp-config.php /var/www/html/wordpress/	
COPY /srcs/setup.sh /.
COPY /srcs/phpMyAdmin/ /var/www/html/phpMyAdmin/
COPY /srcs/wordpress/wordpress /etc/nginx/sites-available/
COPY /srcs/wordpress.sql /tmp/
COPY /config.inc.php /var/www/html/phpMyAdmin/

CMD bash setup.sh