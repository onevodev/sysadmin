#!/bin/bash

date

need_command() {
        set -e
        echo "This script needs $1 to work. Please install it."
        exit 1
}
commands="ufw certbot"
for c in $commands; do
        command -v $c >/dev/null || need_command $c
done

# open up temp webserver
ufw allow from 0.0.0.0/0 to any port 80 proto tcp comment "certbot"

# execute renewal
certbot renew

# delete ufw rule
echo y | ufw delete $(ufw status numbered |(grep 'certbot'|awk -F"[][]" '{print $2}'))
