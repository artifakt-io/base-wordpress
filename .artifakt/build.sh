#!/bin/bash

set -e

echo ">>>>>>>>>>>>>> START CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "
echo "------------------------------------------------------------"
echo "The following build args are available:"
env
echo "------------------------------------------------------------"

echo "SetEnv HTTPS off" > /etc/apache2/conf-enabled/force-ssl.conf

echo ">>>>>>>>>>>>>> END CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "