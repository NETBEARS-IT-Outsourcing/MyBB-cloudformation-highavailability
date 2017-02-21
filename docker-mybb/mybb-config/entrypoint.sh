#!/bin/bash

echo $MYBB_ADMINEMAIL
echo $MYBB_DOMAINNAME
echo $MYBB_DBNAME
echo $MYBB_DBUSERNAME
echo $MYBB_DBPASSWORD
echo $MYBB_DBHOSTNAME
echo $MYBB_DBPORT


# Prepare and copy dynamic configuration files.
sed -e "s/MYBB_ADMINEMAIL/${MYBB_ADMINEMAIL}/g" \
    -e "s/MYBB_DOMAINNAME/${MYBB_DOMAINNAME}/g" \
    "${CONFIG}/settings.php" > "${TARGET}/inc/settings.php"

sed -e "s/MYBB_DBNAME/${MYBB_DBNAME}/g" \
    -e "s/MYBB_DBUSERNAME/${MYBB_DBUSERNAME}/g" \
    -e "s/MYBB_DBPASSWORD/${MYBB_DBPASSWORD}/g" \
    -e "s/MYBB_DBHOSTNAME/${MYBB_DBHOSTNAME}/g" \
    -e "s/MYBB_DBPORT/${MYBB_DBPORT}/g" \
    "${CONFIG}/config.php" > "${TARGET}/inc/config.php"

# Initialize database.
sed -e "s/MYBB_ADMINEMAIL/${MYBB_ADMINEMAIL}/g" \
    -e "s/MYBB_DOMAINNAME/${MYBB_DOMAINNAME}/g" \
    "${CONFIG}/mybb.sql" | mysql \
    --user="$MYBB_DBUSERNAME" \
    --password="$MYBB_DBPASSWORD" \
    --host="$MYBB_DBHOSTNAME" \
    --port="$MYBB_DBPORT" \
    --database="$MYBB_DBNAME" || echo "WE ASSUME DATA ALREADY EXISTS!"

# Set proper ownership and permissions.
cd "$TARGET"
# chown www-data:www-data *
chmod 666 inc/config.php inc/settings.php
chmod 666 inc/languages/english/*.php inc/languages/english/admin/*.php

# TODO: The "uploads/" path should be mounted on an S3 bucket.
chmod 777 cache/ cache/themes/ uploads/ uploads/avatars/
chmod 777 cache/ cache/themes/ uploads/ uploads/avatars/ admin/backups/

set -e
/usr/local/bin/apache2-foreground