FROM registry.artifakt.io/wordpress:6-apache
ARG CODE_ROOT=.
COPY --chown=www-data:www-data $CODE_ROOT /var/www/html/
WORKDIR /var/www/html

USER root
# copy the artifakt folder on root
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN  if [ -d .artifakt ]; then cp -rp /var/www/html/.artifakt/* /.artifakt/; fi

# run custom scripts install_wordpress.sh
# hadolint ignore=SC1091
RUN --mount=source=artifakt-custom-build-args,target=/tmp/build-args \
  if [ -f /tmp/build-args ]; then source /tmp/build-args; fi && \
  if [ -f /artifakt_scripts/install_wordpress.sh ]; then /artifakt_scripts/install_wordpress.sh; fi

# run custom scripts build.sh
# hadolint ignore=SC1091
RUN --mount=source=artifakt-custom-build-args,target=/tmp/build-args \
  if [ -f /tmp/build-args ]; then source /tmp/build-args; fi && \
  if [ -f /.artifakt/build.sh ]; then /.artifakt/build.sh; fi
