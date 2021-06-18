FROM registry.artifakt.io/wordpress:5-apache

ARG CODE_ROOT="."

COPY --chown=www-data:www-data $CODE_ROOT /var/www/html/
WORKDIR /var/www/html

RUN [ -f composer.lock ] && composer install --no-cache --optimize-autoloader --no-interaction --no-ansi --no-dev || true
RUN if [! -f wp-config.php ]; then cp -rp /.artifakt/wp-config.php /var/www/html/; fi

# copy the artifakt folder on root
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN  if [ -d .artifakt ]; then cp -rp /var/www/html/.artifakt/* /.artifakt/; fi

# run custom scripts build.sh
# hadolint ignore=SC1091
RUN if [ -f /.artifakt/build.sh ]; then /.artifakt/build.sh; fi
