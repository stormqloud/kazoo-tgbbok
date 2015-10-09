# Growing Freeswitch in the cluster.

* install and config ntp and ntpdate
  * timezone is GMT no matter where you are in t he world for Kazoo.  Timezones are changed in accounts.
* install freeswitch kazoo package
* install kazoo configs package
* no need to install haproxy if not already there
* ```chkconfig haproxy on --level 2345```
* edit /etc/kazoo/freeswitch/autoload_configs/kazoo.conf.xml
  * Erlang cookie..
  *  ```<param name="cookie" value="your_erlang_cookie_goes_here" />```
* ```sup -n ecallmgr ecallmgr_maintenance add_fs_node freeswitch@$FQDN ```
 * command will auto flush it seems.
*  ```fs_cli -x 'erlang status'```
  * should show that ecallmgr is connecting to freeswitch 
* you do not need to change the "acls" section in ecallmg config doc.
  * Specifically ```"network-list-name": "authoritative",``` is for Kamaillio no Freeswitch.
 
* language packs.. /usr/share/freeswitch/sounds
  * make sure you have all your languages.
    * 
    * 
``` 
[root@fs01 sounds]# ls -la  /usr/share/freeswitch/sounds
total 20
drwxr-xr-x 4 freeswitch daemon 4096 Oct  9 19:32 .
drwxr-xr-x 6 root       root   4096 Apr 24 04:13 ..
drwxr-xr-x 3 freeswitch daemon 4096 Jul 17 21:26 en
drwxr-xr-x 3 freeswitch daemon 4096 Jul 17 21:26 music
-rw-r--r-- 1 freeswitch daemon  125 Jul 17 21:26 VERSION
```
