#!/bin/bash
CRONJOB=$@
(crontab -l 2>/dev/null; echo "$CRONJOB") | crontab -
