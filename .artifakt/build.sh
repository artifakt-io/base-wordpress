#!/bin/bash

set -e

echo ">>>>>>>>>>>>>> START CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "
echo "------------------------------------------------------------"
echo "The following build args are available:"
env
echo "------------------------------------------------------------"

echo "SetEnv HTTPS ${HTTPS}" > /etc/apache2/conf-enabled/force-ssl.conf 

# since build args is just a script like envvars, we can append it
cat /tmp/build-args >> /etc/apache2/envvars

echo ">>>>>>>>>>>>>> END CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "