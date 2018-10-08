#!/bin/bash

# set location for log archives 
LOG_DIR="/var/log/telos-backup-log-archive"
# set name/format of time stamped log file 
LOGNAME=telos_backup-`date +%Y-%m-%d-%T`.log
# define source directory
SOURCE_DIR="/opt/TelosTestnet/Data"
# define backup destination 
BACKUP_DIR="/opt/TelosTestnet/Backup"
# define path to AWS CLI executable
AWS="/home/ubuntu/.local/bin/aws"
# define S3 bucket/path
S3_DIR="s3://telos-backup-aws-region/Ubuntu-16"


if [ ! -d "$LOG_DIR" ]; then
mkdir $LOG_DIR
fi

cp /var/log/telos_backup.log $LOG_DIR/$LOGNAME
rm -f /var/log/telos_backup.log  && touch /var/log/telos_backup.log

#stop nodeos:
./stop.sh
sleep 3

echo Backup started >> /var/log/telos_backup.log
date >> /var/log/telos_backup.log

# copy blocks.test and state directories to temp storage:
echo "Copying data to temp storage" >> /var/log/telos_backup.log
cp -R $SOURCE_DIR/blocks $BACKUP_DIR/blocks_temp
cp -R $SOURCE_DIR/state $BACKUP_DIR/state_temp

# start nodeos:
./start.sh


#change to backup directory:
cd $BACKUP_DIR

# delete old backups:
 if [ -f "backup.tgz.1" ]; then
        rm backup.1.tgz
            sleep 1
    fi

# rename current backup:
echo "Renaming older backups" >> /var/log/telos_backup.log
mv backup.tgz backup.1.tgz

# create backup:
echo "Compressing files" >> /var/log/telos_backup.log
tar -czSvvf backup.tgz blocks_temp state_temp >> /var/log/telos_backup.log

# delete temp storage:
echo "Deleting temp storage" >> /var/log/telos_backup.log
rm -Rf blocks_temp
rm -Rf state_temp

# copy backup to remote storage:
echo "Copying to S3 storage" >> /var/log/telos_backup.log
$AWS s3 cp backup.tgz $S3_DIR/

# rename/timestamp remote backup:
$AWS s3 mv $S3_DIR/backup.tgz $S3_DIR/backup-`date +%Y-%m-%d-%H-%M`.tgz

# delete local backup:
# echo "Deleting local backup" >> /var/log/telos_backup.log
# rm -rf backup.tgz

# stamp the log #
echo Backup complete >> /var/log/telos_backup.log
date >> /var/log/telos_backup.log

exit
