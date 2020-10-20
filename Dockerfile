# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: IgnacioHB <IgnacioHB@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/02 13:16:26 by IgnacioHB         #+#    #+#              #
#    Updated: 2020/10/20 18:35:39 by IgnacioHB        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster 

LABEL Ignacio ihorcada <ihorcada@student.42madrid.com>

ENV autoindex="autoindex on"

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
						wget \
						openssl
						
COPY /srcs/wordpress/wp-config.php /var/www/html/wordpress/	
COPY /srcs/setup.sh /.
COPY /srcs/phpMyAdmin/ /var/www/html/phpMyAdmin/
COPY /srcs/wordpress/nginx.config /etc/nginx/sites-available/
COPY /srcs/wordpress.sql /tmp/
COPY /srcs/config.inc.php /var/www/html/phpMyAdmin/
COPY /srcs/autoindex.sh /.
COPY /srcs/self-signed.conf /etc/nginx/snippets/
COPY /srcs/ssl-params.conf /etc/nginx/snippets/
COPY /srcs/html/index.html /var/www/html/
COPY /srcs/html/style.css /var/www/html/


CMD bash setup.sh