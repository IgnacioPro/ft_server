sed -i 's/autoindex on/${AUTOINDEX}/' /etc/nginx/sites-enabled/wordpress

# if autoindex=off; then
#     sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-enabled/wordpress
# if autoindex=on; then
#     sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-enabled/wordpress
# fi

# if grep -q "autoindex on" "/etc/nginx/sites-enabled/wordpress"; then
#         sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-enabled/wordpress
# else
#         sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-enabled/wordpress
# fi

# restarting nginx for changes to take effect
service php7.3-fpm restart
service nginx restart