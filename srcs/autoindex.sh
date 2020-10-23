# if grep -q "autoindex on" "/etc/nginx/sites-enabled/nginx.config"; then
#         sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-enabled/nginx.config
# else
#         sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-enabled/nginx.config
# fi

if [ "$autoindex"=="autoindex off" ]
then
    echo "hola amigo"
    sed -i "s/autoindex on/$autoindex/" /etc/nginx/sites-enabled/nginx.config
    cp /tmp/index.html /var/www/html/
fi

# if [autoindex=="autoindex off"]; then
#     sed -i "s/autoindex on/$autoindex/" /etc/nginx/sites-enabled/nginx.config
#     cp /tmp/index.html /var/www/html/
#     echo funciona
# fi

# # restarting nginx for changes to take effect
# service php7.3-fpm restart
# service nginx restart