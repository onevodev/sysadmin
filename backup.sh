#!/bin/bash

# cron it with
# 0 4 * * * /root/tools/backup.sh >> /var/log/sys-backup.log 2>&1

echo "###" && date && echo "###"

bak_dir="/srv/bak"
[[ -d $bak_dir ]] || exit 1

bak_file=".2backup"
[[ -f $bak_dir/$bak_file ]] || exit 1

unset bak_files
bak_files=$(cat $bak_dir/$bak_file)

# backup data
tar cfzv $bak_dir/bak-config-$(hostname)-$(date -I).tgz $bak_files

# clear all but last 3
cd $bak_dir && [[ -f $(ls | head -n -3) ]] && rm -v $(ls | head -n -3)
chmod 500 $bak_dir && chmod 400 $bak_dir/*
