#!/bin/bash

set -e

echo ">>>>>>>>>>>>>> START CUSTOM ENTRYPOINT SCRIPT <<<<<<<<<<<<<<<<< "
echo "------------------------------------------------------------"
echo "The following build args are available:"
env
echo "------------------------------------------------------------"

mkdir -p /data/wp-content/uploads && \
  chown www-data:www-data /data/wp-content/uploads && \
  ln -sfn /data/wp-content/uploads /var/www/html/wp-content/uploads

echo ">>>>>>>>>>>>>> END CUSTOM ENTRYPOINT SCRIPT <<<<<<<<<<<<<<<<< "