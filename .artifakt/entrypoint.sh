#!/bin/bash
set -e

# Generate file holding custom keys 
[[ ! -f /data/secret-key.php ]] && \
  echo "<?php " > /data/secret-key.php && \
  curl https://api.wordpress.org/secret-key/1.1/salt >> /data/secret-key.php && \
  chown www-data:www-data /data/secret-key.php

### Cette règle ne s'applique que si la base est vide (premier build) 
### ou que vous avez complètement vider docker (conteneur mysql et volulme mysql en particulier)
if [ "$ARTIFAKT_IS_MAIN_INSTANCE" == 1 ]; then
  #### Configure wordpress in case of first install or no db found
  echo "### Check if the database is already installed"
    tableCount=$(mysql -h "$ARTIFAKT_MYSQL_HOST" -u "$ARTIFAKT_MYSQL_USER" -p"$ARTIFAKT_MYSQL_PASSWORD" "$ARTIFAKT_MYSQL_DATABASE_NAME" -B -N -e "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = '$ARTIFAKT_MYSQL_DATABASE_NAME';" | grep -v "count");
  echo "### Number of tables: $tableCount"

	if [ "$tableCount" -eq 0 ]; then
    if [ -z "$SITE_NAME" ];then SITE_NAME="Artifakt"; fi
    if [ -z "$ADMIN_NAME" ];then ADMIN_NAME="admin"; fi
    if [ -z "$ADMIN_PASSWORD" ];then ADMIN_PASSWORD="admin"; fi
    if [ -z "$ADMIN_MAIL" ];then ADMIN_MAIL="engineering@artifakt.io"; fi
    if [ -n "$HOST_WORDPRESS" ]; then
        su www-data -s /bin/bash -c "wp core install --url=$HOST_WORDPRESS --title=$SITE_NAME --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_MAIL"
	  fi
  fi
fi




