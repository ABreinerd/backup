#!/bin/bash
# Backup Script for Ubuntu files to GitHub

REPO_DIR="/home/allen/gitbackup"
BACKUP_SOURCE="/home/allen"
DATE=$(date +"%Y-%m-%d-%H-%M")

# Clone the repository if not already cloned
if [ ! -d "$REPO_DIR" ]; then
    git clone https://github.com/ABreinerd/PC-backup.git $REPO_DIR
fi

# Copy files to the local backup directory
cp -r $BACKUP_SOURCE/* $REPO_DIR/

# Navigate to the repository
cd $REPO_DIR

# Add and commit changes
git add .
git commit -m "Backup on $DATE"

# Push changes to GitHub using the Personal Access Token (PAT)
git push https://ABreinerd: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@github.com/ABreinerd/PC-backup.git

# Logging
echo "Backup completed on $DATE" >> /home/allen/backup.log
