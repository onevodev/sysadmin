#!/bin/bash

# get in there
WDIR=/root/sysadmin
[[ "$WDIR" == "$(pwd)" ]] || cd $WDIR
# update
git pull
bash install.sh -y
