# On the random chance you want to compile FreeSwitch yourself to add in an extra module.

* yum groupinstall 'Development Tools'
* git clone https://github.com/2600hz/kazoo-freeswitch.git --branch=1.4.15
* ./bootstrap.sh
* yum install git gcc-c++ autoconf automake libtool wget python ncurses-devel zlib-devel libjpeg-devel openssl-devel e2fsprogs-devel sqlite-devel libcurl-devel pcre-devel speex-devel ldns-devel libedit-devel
* I was doing this for xml_rpc ..

