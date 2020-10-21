if grep -q "autoindex on" "/etc/nginx/sites-enabled/nginx.config"; then
        sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-enabled/wordpress
else
        sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-enabled/wordpress
fi

# restarting nginx for changes to take effect
service php7.3-fpm restart
service nginx restart