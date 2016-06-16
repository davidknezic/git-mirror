#!/usr/bin/env sh

echo -e "$CRON_STRING\t/usr/local/bin/mirror.sh /opt/repo $ORIGINAL_REPO $MIRROR_REPO" > /etc/crontabs/root

crond -f
