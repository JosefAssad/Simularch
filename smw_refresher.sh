#!/usr/bin/env bash

# run with a cron line like
# */1     *       *       *       *       sh /root/refresh.sh

PIDDIR="/var/run/wiki"
mkdir -p $PIDDIR

PIDFILE="$PIDDIR/SMW_refreshData.pid"
SMW_DIR="/ebs/var/www/html/w/extensions/SemanticMediaWiki"
LOG_DIR="/var/log/wiki"
REFRESH_RATE=100

if [ -e "${PIDFILE}" ] && (ps -u $USER -f | grep "[ ]$(cat ${PIDFILE})[ ]"); then
  echo "Already running."
  exit 99
fi

php $SMW_DIR/maintenance/SMW_refreshData.php -n $REFRESH_RATE -v --startidfile $LOG_DIR/refresh.log >> $LOG_DIR/SMW_refreshData.log &

echo $! > "${PIDFILE}"
chmod 644 "${PIDFILE}"
