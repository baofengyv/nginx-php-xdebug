#!/bin/bash
set -e

if [ -z "$XDEBUG_REMOTE_HOST" ]; then
    echo >&2 '  You need to specify XDEBUG_REMOTE_HOST,more detail see the doc.'
    echo >&2 '     try add -e XDEBUG_REMOTE_HOST=....'
    exit 1
fi

echo "xdebug.remote_enable=1" >> /etc/php5/fpm/php.ini
echo "xdebug.remote_host=$XDEBUG_REMOTE_HOST" >> /etc/php5/fpm/php.ini

php5-fpm
nginx -g "daemon off;"

exec "$@"
