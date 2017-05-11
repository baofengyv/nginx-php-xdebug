FROM debian

MAINTAINER nginx php xdebug dev "baofengyv@gmail.com"

RUN apt-get update \
	&& apt-get install -y \
              php5 \
              php5-mysql \
              php5-fpm \
              php5-xdebug \
              nginx \
	&& rm -rf /var/lib/apt/lists/*

# config nginx
ADD nginx.conf /etc/nginx/sites-available/default

# for TEST
#RUN echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

STOPSIGNAL SIGQUIT
