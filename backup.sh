#!/bin/bash

USER=$(whoami)
BACKUP_DIR="/Users/$USER/Library/CloudStorage/Box-Box/My Box Notes/backup/"
LOG_FILE=~/mac-box-backup/log-rsync.txt
input=$1
rm -f LOG_FILE 

echo "I am "$USER
env
echo "Sync to box folder started at "$(date +"%T")
while read -r file
do
   rsync -avzh --progress --exclude '*.ova' $file "$BACKUP_DIR" >> $LOG_FILE
done < "$input"
echo "Sync to box folder finished at "$(date +"%T")
