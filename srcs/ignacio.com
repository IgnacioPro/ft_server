server {
	listen 80;
	root /var/www/html/;
	
	index	index.php;


	location / {
		autoindex on;
	    try_files	$uri $uri/ /index.php?$args;
	}	

	location ~ \.php$ {
		include snippets/fastcgi-php.conf;
		fastcgi_pass unix:/run/php/php7.3-fpm.sock;
	}
}
