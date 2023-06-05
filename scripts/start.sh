#!/bin/bash

DIR="/home/jonathon/mcserver"
cd $DIR
JAR="server.jar"
for session in $(screen -ls | grep -o '[0-9]\{3,\}\.\S*')
    do
    	screen -r mcserver -p0 -X stuff "&9Server is restarting.\015"
    	screen -r mcserver -p0 -X stuff "stop\015" # Send "stop\r" to the minecraftServer server.
    done

counter=0
while [ $(screen -ls | grep -c 'No Sockets found in') -lt 1 ]; do
	if [ $(( $counter % 10 )) -eq 0 ]; then
		echo 'A previous server is in use. Waiting for 10 seconds before starting server...'
	fi

	sleep 1
	counter=$((counter+1))
done

echo 'Starting server...'

	screen -dmS "mcserver" java -Xmx6G -Xms2G -jar $DIR/$JAR
	sleep 1
	while [ $(screen -ls | grep -c 'No Sockets found in') -ge 1 ]; do
		echo 'Waiting for 5 seconds to start server...'
		sleep 5
		screen -dmS "mcserver" java -Xmx6G -Xms2G -jar $DIR/$JAR
	done

echo 'Server started.'
