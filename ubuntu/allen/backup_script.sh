#!/bin/bash
# Backup Script for Windows PC files to GitHub

REPO_DIR="/home/allen/gitbackup"
SHARED_FOLDER="/mnt/gitbackup"  # Replace with the name of your shared folder
DATE=$(date +"%Y-%m-%d-%H-%M")

# Clone the GitHub repository if not already cloned
if [ ! -d "$REPO_DIR" ]; then
    git clone https://github.com/ABreinerd/PC-backup.git $REPO_DIR
fi

# Copy files from the shared folder to the local backup directory
cp -r $SHARED_FOLDER/* $REPO_DIR/

# Navigate to the repository
cd $REPO_DIR

# Add and commit changes
git add .
git commit -m "Backup on $DATE"

# Push changes to GitHub using the Personal Access Token
git push https://ABreinerd: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@github.com/ABreinerd/PC-backup.git

# Logging
echo "Backup completed on $DATE" >> /home/allen/backup.log

