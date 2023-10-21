This is a backup of the mincraft server I use with my friends. The world is stored here (and will continue to be until git doesn't like how big the files are)
There are some configuration scripts in the scripts folder that should be configured as below.
For those of us who know, the feljon world backup is stored locally as well as here.

########## RUN SERVER ON BOOT ###########

crontab runs the following line on boot:

@reboot cd /home/jonathon/mcserver && bash /home/jonathon/mcserver/scripts/start.sh

This works for now


######### SERVER CONFIG ################

To automatically reboot the server if it stops I have this in cron:

* * * * * bash /home/jonathon/mcserver/scripts/MCServerResetCheck.sh

NOTE: this file must be configured to have write permissions for the default user
(chmod 666 scripts/MCServer/ResetCheck.sh)


########## OTHER INFO #################
1. Old feljon server located in feljon_FINAL.zip
2. Scripts are located in the ./scripts directory. These automate much of the server process.
3. For authenticating to github, there is an ssh key in the above directory
4. To configure that key make sure to run eval $(ssh-agent) and then ssh-add "private key"

