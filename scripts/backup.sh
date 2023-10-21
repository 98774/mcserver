#!/bin/bash
DATE=$(date -d "7 days ago" +"%Y-%m-%d") # last weeks date for use in moving the latest backup
WORLD="feljon_20200412"
NETHER=$WORLD"_nether"
END=$WORLD"_the_end"
SRV_PATH="/home/jonathon/"

#make backup folder if not existant 
if ! [ -d $SRV_PATH/backups ]; then
    mkdir $SRV_PATH/backups
    mkdir $SRV_PATH/backups/weekly
    mkdir $SRV_PATH/backups/permanent
fi

#move the existing latest to the current date
if [ -f $SRV_PATH/backups/latest.zip ]; then
    echo Moving latest backup to $WORLD-$DATE.zip
    mv $SRV_PATH/backups/latest.zip $SRV_PATH/backups/weekly/$WORLD-$DATE.zip
fi

#generate new backup
zip -rq $SRV_PATH/backups/latest.zip $SRV_PATH/mcserver/$WORLD $SRV_PATH/mcserver/$NETHER $SRV_PATH/mcserver/$END

#check if date is a week 4 of year (keep quarterly backups permanent)
BACKUP_WEEK=$(($(date +"%U")%13))
if [ $BACKUP_WEEK = 3 ]; then
    #remove all weekly backups
    echo Removing all weekly backups
    rm $SRV_PATH/backups/weekly/*
    #move the latest backup into the monthly folder 
    echo Storing latest backup in the permanent folder
    mv $SRV_PATH/backups/latest.zip $SRV_PATH/backups/permanent/$WORLD-$DATE.zip
fi