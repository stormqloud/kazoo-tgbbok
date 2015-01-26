# Permissions issues.

* Somehow I managed to mess up permissions by `yum erase` `yum install` different versions on the same server.
  ** my issue was really when you do yum-erase it's not a clean erase.  It half fails.  The user gets removed but many of the files stay around.  Then you install on top with a new user.. 
     ** Make sure you shutdown all the daemons properly before you `yum erase`
     ** TBD
* Working kazoo installation..
```
[root@kaz kazoo]# find / -nouser | wc
find: `/proc/4241/task/4241/fd/5': No such file or directory
find: `/proc/4241/task/4241/fdinfo/5': No such file or directory
find: `/proc/4241/fd/5': No such file or directory
find: `/proc/4241/fdinfo/5': No such file or directory
      0       0       0
[root@kaz kazoo]# 
```

* Broken Kazoo installation like mine..
```
[root@k6 kazoo]# find / -nouser| wc
find: `/proc/4175/task/4175/fd/5': No such file or directory
find: `/proc/4175/task/4175/fdinfo/5': No such file or directory
find: `/proc/4175/fd/5': No such file or directory
find: `/proc/4175/fdinfo/5': No such file or directory
  61297   61297 5836963
[root@k6 kazoo]# 

```

* Thats 61297 file permissions that are assigned to non working users!

* Broken Kazoo (bigcouch won;t start unless root)
```
[root@k6 kazoo]# ls -la /srv/view_index/
total 16
drwxr-xr-x  4 bigcouch daemon 4096 Nov  3 19:18 .
drwxr-xr-x. 4 bigcouch daemon 4096 Jan 25 17:38 ..
drwxr-xr-x  2      497 daemon 4096 Jan 21 21:47 .delete
drwxr-xr-x  3      497 daemon 4096 Nov  3 19:18 .shards
[root@k6 kazoo]# 

```

* Working Kazoo (bigcouch working..)
```
[root@kaz kazoo]# ls -la /srv/view_index/
total 16
drwxr-xr-x  4 bigcouch daemon 4096 Oct 30 19:43 .
drwxr-xr-x. 4 bigcouch daemon 4096 Jan 24 05:03 ..
drwxr-xr-x  2 bigcouch daemon 4096 Jan 16 22:39 .delete
drwxr-xr-x  3 bigcouch daemon 4096 Oct 30 19:43 .shards
[root@kaz kazoo]# 

```

* What is the issue?  

* working server
```
[root@kaz kazoo]# grep bigcouch /etc/passwd
bigcouch:x:497:2::/srv:/sbin/nologin

```

* broken server
```
[root@k6 kazoo]# grep bigcouch /etc/passwd
bigcouch:x:490:2::/srv:/sbin/nologin

```


* fixing on the broken server.  Somethign is out of whack with the username/numbers.  We can manually fix this in bulk.
 
```
# Make all the unknown 496 kazoo user
chown --from=496 kazoo * -R /
# 
chown --from=497 bigcouch * -R /

```
