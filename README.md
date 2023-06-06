### Setup instructions 

Instructions to install and configure the Mac backup box script. The script uses rsync and perdioically runs from cron to copy any changes to files/folders you define on your Mac to your personal Box folder.

1. Create backup folder on your box folder\
```mkdir /Users/$USER/Library/CloudStorage/Box-Box/My\ Box\ Notes/backup/```

2. Install backup script\
```cd ~/```\
```git clone https://github.com/sam-paisley/mac-box-backup.git```

3. Configure list of files/folders to backup\
```cd mac-box-backup```\
Update folder-file-list.txt with list of folder / files to backup, 1 item per line\
```vi folder-file-list.txt```\
Save and exit with :wq

4. Give cron full disk access to allow backup script to write files\
First open the folder contain cron\
```open /usr/sbin/```\
Then open Apple -> System Settings -> Privacy & Security -> Full Disk Access.\
Drag and drop the cron application from the Finder window into Full Disk Access window.\
![Cron full disk](/image/cron-full-disk.png)

5. Setup cronjob to run hourly\
```crontab -e```\
```0 * * * * ~/mac-box-backup/backup.sh ~/mac-box-backup/folder-file-list.txt```\
Save and exit with :wq
