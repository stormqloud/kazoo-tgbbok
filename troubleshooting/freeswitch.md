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
    * Make sure all Freeswitch servers have the same information _IN THE SAME ORDER_

```fs_cli -x "erlang nodes list"
ecallmgr@yul01.stormqloud.com (192.100.252.110)
ecallmgr@yul02.stormqloud.com (192.100.252.111)
```

* Check 


stormqloud.ca
