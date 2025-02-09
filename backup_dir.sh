#!/bin/bash

# Source folder to backup
SOURCE_FOLDER="/devops_workspace"

# Backup destination directory
BACKUP_DIR="/opt/backups"

# Create a timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Backup folder name with timestamp
BACKUP_FOLDER_NAME="backup_${TIMESTAMP}.tar.gz"

# Full path for the backup folder
BACKUP_PATH="${BACKUP_DIR}/${BACKUP_FOLDER_NAME}"

tar -czf "$BACKUP_PATH" "$SOURCE_FOLDER"


# Check if the backup was successful
if [ $? -eq 0 ]; then
#  echo "`date`Backup completed successfully! Backup saved to: $BACKUP_PATH" >> /opt/backups/log
  echo -e "\e[32m `date` Backup completed successfully! Backup saved to: $BACKUP_PATH\e[0m" >> /opt/backups/log
else
  echo "Backup failed!" `date` >> /opt/backups/log
fi
