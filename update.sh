#!/bin/sh

# update this repo
REPO_DIR="/root/sysadmin"
cd $REPO_DIR
git pull
echo | bash install.sh
cd -
