# Debian packages

* copy packages from one server to another..

To backup:

sudo dpkg --get-selections > /tmp/dpkglist.txt
To Restore:

sudo dpkg --set-selections < /tmp/dpkglist.txt
sudo apt-get -y update
sudo apt-get dselect-upgrade
