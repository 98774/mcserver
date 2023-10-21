#!/bin/bash
DIR=/home/jonathon/mcserver


if ! screen -list | grep -q mcserver; then
	echo "$(date) $(ls -1 | wc -l):" >> $DIR/logs/MCServerRestartLog.txt 2>&1
	cd $DIR
    $DIR/scripts/start.sh | sed 's/^/  /' >> $DIR/logs/MCServerRestartLog.txt 2>&1
fi
