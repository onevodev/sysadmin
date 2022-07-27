#!/bin/bash
CRONJOB=$@
echo $CRONJOB
#(crontab -l 2>/dev/null; echo "$CRONJOB") | crontab -
