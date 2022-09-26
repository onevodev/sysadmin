### **USEFUL SCRIPTS FOR ADMINISTERING LINUX COMPUTERS**

let's see if this is useful in any way.

*Quick explanation:*

* `add-cronjob.sh` :
	- adds its argument to current user's crontab.
* `backup.sh` :
	- makes a tgz of files/directories included in `$BAK_DIR/.2backup` inside `$BAK_DIR`.
* `install.sh` :
	- install this repo's scripts in `$TOOLS_DIR`.
* `renew-certs-LE.sh` :
	- runs a certbot renew, automatically adding and removing a ufw rule for *tcp/80* for certbot
* `routine` :
	- makes a full system upgrade *[supported package managers: apt, xbps, dnf]*
* `sshrc` :
	- custom sshrc for system status, and optional fortune cookie
* `update.sh` :
	- sync current repo with master

