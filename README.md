This is the current minecraft server. The scripts folder contains other relevant scripts.


########## RUN SERVER ON BOOT #################
crontab runs the following line on boot:

@reboot cd /home/jonathon/mcserver && bash /home/jonathon/mcserver/scripts/start.sh

This works for now


######### SERVER CONFIG ##################
To automatically reboot the server if it stops I have this in cron:

* * * * * bash /home/jonathon/mcserver/scripts/MCServerResetCheck.sh

NOTE: this file must be configured to have write permissions for the default user
(chmod 666 scripts/MCServer/ResetCheck.sh)


########## OTHER INFO #####################
1. Old feljon server located in feljon_FINAL.zip
2. Scripts are not in use aside from the start.sh script
