# nginx-php-xdebug-dev

#### This is a php-debug server for developer.  

    This image includes:
      nginx 
      php 
      php-xdebug
      php-mysql
      php-fpm

#### Run the debug server only:
~~~
docker run -e XDEBUG_REMOTE_HOST=192.168.100.2 -p 80:80 -v /nginx_ROOT:/var/www/html:ro baofengyv/nginx-php-xdebug
              # [XDEBUG_REMOTE_HOST] IP which run your IDE, listening on port 9000
~~~

#### Run the debug server linked to MySQL container:
~~~
docker run -e XDEBUG_REMOTE_HOST=192.168.100.2 --link some-mysql -p 9980:80 -v /nginx_ROOT:/var/www/html:ro baofengyv/nginx-php-xdebug
~~~
