#!/usr/bin/env bash

echo "This script assumes that you are inside the 'sysadmin' folder."
! [[ "$1" == "-y" ]] && read -p "Press ENTER to continue: "

# install tools
TOOLS_DIR="/root/tools"
[[ -d $TOOLS_DIR ]] || mkdir -m 700 $TOOLS_DIR
install -m 700 ./routine $TOOLS_DIR/
install -m 700 ./backup.sh $TOOLS_DIR/
install -m 700 ./update.sh $TOOLS_DIR/
install -m 700 ./renew-certs-LE.sh $TOOLS_DIR/
install -m 644 ./sshrc /etc/ssh/

# symlink
ln -sfv $TOOLS_DIR/routine /usr/local/bin

# echo crontab
echo "
Sample crontab for sysupgrade and sysbackup:

  # backup once a day
  0 4 * * * /root/tools/backup.sh >> /var/log/sys-backup.log 2>&1

  # update once a week
  5 4 * * 0 /usr/local/bin/routine >> /var/log/sysupgrade.log 2>&1

  # sync repo updates
  0 3 * * * /root/tools/update.sh >> /var/log/sys-syncrepo.log 2>&1

"
