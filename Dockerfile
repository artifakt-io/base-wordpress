FROM registry.artifakt.io/wordpress:5-apache

COPY --chown=www-data:www-data . /var/www/html/
WORKDIR /var/www/html

# copy the artifakt folder on root
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN  if [ -d .artifakt ]; then cp -rp /var/www/html/.artifakt /.artifakt/; fi

# run custom scripts build.sh
# hadolint ignore=SC1091
RUN if [ -f /.artifakt/build.sh ]; then /.artifakt/build.sh; fi

RUN [ -f composer.lock ] && composer install --no-cache --optimize-autoloader --no-interaction --no-ansi --no-dev || true
