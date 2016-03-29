# Growing Freeswitch in the cluster.

* Freeswitch for Kazoo requires the following packages to operate
  * kazoo-configs
  * kazoo-prompts
  * kazoo-freeswitch

* Understand that EcallManager connects to Freeswtich not the other way around.
  * Ecallmanager and stepswitch are Freeswtich conenction to RabbitMQ etc.
  * SIP/RTP too obviously
* install and config ntp and ntpdate
  * timezone is set to GMT no matter where you are in the world.  Timezones are changed in accounts.
* iptables firewall
* install freeswitch kazoo package
* install kazoo configs package
* no need to install haproxy if not already there
* ```chkconfig haproxy off --level 2345```
* edit /etc/kazoo/freeswitch/autoload_configs/kazoo.conf.xml
  * Erlang cookie..
  *  ```<param name="cookie" value="your_erlang_cookie_goes_here" />```
* ```sup -n ecallmgr ecallmgr_maintenance add_fs_node freeswitch@$FQDN ```
 * command will auto flush it seems.
*  ```fs_cli -x 'erlang status'```
  * should show that ecallmgr is connecting to freeswitch 
* you do not need to change the "acls" section in ecallmg config doc.
  * Specifically ```"network-list-name": "authoritative",``` is for Kamaillio NOT Freeswitch.
  * "TRUSTED" is for your carriers IP

* language packs.. /usr/share/freeswitch/sounds
  * make sure you have all your languages.
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

* sup -necallmgr ecallmgr_maintenance reload_acls
* 

sip trunks from www.stormqloud.ca
