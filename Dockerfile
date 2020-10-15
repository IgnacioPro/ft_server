# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: IgnacioHB <IgnacioHB@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/02 13:16:26 by IgnacioHB         #+#    #+#              #
#    Updated: 2020/10/15 16:20:49 by IgnacioHB        ###   ########.fr        #
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
						
# COPY /srcs/wordpress/wordpress-5.5.1-es_ES.tar.gz /tmp/
COPY /srcs/wordpress/wp-config.php /var/www/html/wordpress/	
COPY /srcs/setup.sh /.
# COPY /srcs/wordpress/wp-admin/ /var/www/html/wordpress/
COPY /srcs/phpMyAdmin/ /var/www/html/phpMyAdmin/
COPY /srcs/wordpress/wordpress /etc/nginx/sites-available/
COPY /config.inc.php /var/www/html/phpMyAdmin/

CMD bash setup.sh