#!/bin/bash
# TODO Make more generic with case statement for lock file determination and
# screen -c {screenrc} running.
# set -x

SCREEN_NAME=$1
SCREENRC=~/screen/$SCREEN_NAME
SCREENRC_LIST="mutt terms"

usage () {
    echo "Usage"
    echo "Please use one of the following: $SCREENRC_LIST"
}

# check if screen name is in the acceptable list
if ! [[ $SCREENRC_LIST =~ $SCREEN_NAME ]]; then
  usage
  exit 1
fi

RUNNING=`screen -ls | grep $SCREEN_NAME > /dev/null; echo $?`
if [ $RUNNING -eq 0 ]; then
    echo "Connecting to screen session \"$SCREEN_NAME\" in 3 seconds Ctrl-C to stop..."
    sleep 3
    exec /usr/bin/screen -rd $SCREEN_NAME
else
  # remove lock file and start screens
  echo "Starting screen session \"$SCREEN_NAME\" in 3 seconds Ctrl-C to stop..."
  sleep 3
  exec /usr/bin/screen -S $SCREEN_NAME -c $SCREENRC
fi
exit 0
