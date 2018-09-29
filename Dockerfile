FROM cjy632258/php-fpm-slim:latest

COPY . /var/www
RUN apk add --update --no-cache nginx gettext
RUN apk add --no-cache --virtual .dev git\
    && cd /var/www \
    && php composer.phar install --no-progress \
    && rm composer.phar \
    && rm -rf /root/.composer/cache/* \
    && rm -fr /tmp/src  \
    && rm -fr /var/cache/apk/* \
    && apk del .dev

RUN chmod +x /var/www/entry-point.sh
COPY ./nginx.conf /etc/nginx/nginx.conf
RUN chmod -R 0777 /var/www/storage \
  && chmod -R 0777 /var/www/storage

VOLUME /var/www
ENTRYPOINT  /var/www/entry-point.sh
