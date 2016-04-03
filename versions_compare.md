unprocessed..

 1009  wget http://repo.2600hz.com/Packages/Kazoo-Configs/CentOS_6/noarch/3.20/kazoo-configs-3.20-3.el6.noarch.rpm
 1010  wget http://repo.2600hz.com/Packages/Kazoo-Configs/CentOS_6/noarch/3.20/kazoo-configs-3.20-4.el6.noarch.rpm
 1014  mkdir 3
 1015  mkdir 4
 1016  cd 3
 1017  rpm2cpio ../kazoo-configs-3.20-3.el6.noarch.rpm | cpio -idmv
 1020  cd ../4
 1021  rpm2cpio ../kazoo-configs-3.20-4.el6.noarch.rpm | cpio -idmv
 1024  cd ..
 1026  diff -r 3 4

