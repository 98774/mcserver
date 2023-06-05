#!/bin/bash
DATE=$(date +"%Y%m%d%H%M")
cd /home/jonathon/mcserver
git add *
git commit -m "$DATE update"
git push

