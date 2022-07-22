#!/usr/bin/env bash

read -p "This script assumes that you are inside the 'sysadmin' folder. Press ENTER to continue: "

# install tools
tools_dir="/root/tools"
[[ -d $tools_dir ]] || mkdir -m 700 $tools_dir
install -m 700 ./routine $tools_dir/
install -m 700 ./backup.sh $tools_dir/
install -m 644 ./sshrc /etc/ssh/

# symlink
ln -sfv $tools_dir/routine /usr/local/bin

# echo crontab
echo "
Sample crontab for sysupgrade and sysbackup:

  # backup once a day
  0 4 * * * /root/tools/backup.sh 2>&1 | tee -a /var/log/sys-backup.log

  # update once a week
  5 4 * * 0 /usr/local/bin/routine 2>&1 | tee -a /var/log/sysupgrade.log

"
