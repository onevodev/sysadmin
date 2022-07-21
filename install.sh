#!/usr/bin/env bash

read -p "This script assumes that you are inside the 'sysadmin' folder. Press ENTER to continue: "

# install routine
ln -sfv ./routine /usr/local/bin
chmod 700 /usr/local/bin/routine

# install tools
tools_dir="/root/tools"
[[ -d $tools_dir ]] || mkdir $tools_dir

ln -sfv ./backup.sh $tools_dir/
chmod -R 700 $tools_dir

# echo crontab
echo "
Sample crontab for sysupgrade and sysbackup:

  # backup once a day
  0 4 * * * /root/tools/backup.sh 2>&1 | tee -a /var/log/sys-backup.log

  # update once a week
  5 4 * * 0 /usr/local/bin/routine 2>&1 | tee -a /var/log/sysupgrade.log

"
