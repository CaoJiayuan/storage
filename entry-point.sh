#!/bin/sh
if [ ! -f ".env" ]; then
    cp .env.example .env
fi

echo "Linking storage"

php artisan storage:link

/usr/sbin/nginx -c /etc/nginx/nginx.conf
/run.sh
