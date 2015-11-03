# Troubleshoot Freeswitch server

* This is only within the Kazoo context...
* Say your freeswitch isn;t doing what you need.
  * No SIP
  * No RTP 
  * Broken calls etc

* Assuming Freeswitch is already running...
  * check what ecallmanager nodes attached to it
    * Ecallmgr does the attaching, freeswitch does not attach to ecallmgr!
  * Check the order of the results.
    * Make sure all Freeswitch servers have the same information IN THE SAME ORDER

```
fs_cli -x "erlang nodes list"
ecallmgr@yul01.stormqloud.com (192.100.252.110)
ecallmgr@yul02.stormqloud.com (192.100.252.111)
```

* Check that your Kamailio IP is currently in the ACL on this server..
* Freeswitch gets the ACL's from Ecallmgr which get tehm from couchdb->system_config->ecallmgr doc

```
[root@stormqloud_fs02 ~]# fs_cli -x "acl 192.100.252.99 authoritative"
true
```

* If this fails you can also try `fs_cli -x "reloadacl"` and test again.

stormqloud.ca
