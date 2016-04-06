# Compare RPM's

* This is tailored for Kazoo..

* About the only thing this is useful for is to compare RPM's of kazoo-configs
  * Comparing binaries is not as useful (possibly not at all)
  * Unlike most other things to compare RPM's on the interwebs this strategy diff's INSIDE the RPM files, not just the file name exists or not.
  
```
wget http://repo.2600hz.com/Packages/Kazoo-Configs/CentOS_6/noarch/3.20/kazoo-configs-3.20-3.el6.noarch.rpm
wget http://repo.2600hz.com/Packages/Kazoo-Configs/CentOS_6/noarch/3.20/kazoo-configs-3.20-4.el6.noarch.rpm
wget http://repo.2600hz.com/Packages/Kazoo-Configs/CentOS_6/noarch/3.22/kazoo-configs-3.22-15.el6.noarch.rpm
mkdir 3.20-3
mkdir 3.20-4
mkdir 3.22-15
cd 3.20-3
rpm2cpio ../kazoo-configs-3.20-3.el6.noarch.rpm | cpio -idmv
cd ../3.20-4
rpm2cpio ../kazoo-configs-3.20-4.el6.noarch.rpm | cpio -idmv
cd ../3.22-15
rpm2cpio ../kazoo-configs-3.22-15.el6.noarch.rpm | cpio -idmv
diff -r 3.20-3 3.20-4
diff -r 3.20-3 3.22-15
diff -r 3.20-4 3.22-15

etc

```

Enough rope to hang yourself.


wlloyd@prodosec.com
http://www.prodosec.com
