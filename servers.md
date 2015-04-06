# Servers 

## How many Kazoo servers do I really need?

* To be redundant everythign needs to be have two copies minimum
* couchdb requires three copies to sort out redundancy and replication

* Ergo Kazoo requires a *minimum* of 3 servers to be redundant.

* Consider seperating your SIP control plane from your RTP.
  * Put Freeswitch on it's own servers, don't run other Kazoo services on these servers
  * RTP makes your QOS
  * SIP makes your ASR, PDD etc

* In this way you can reboot ecallmanager stuff for example without interferring with ongoing calls.
* Kazoo *rarely* (they do do it..) update freeswitch itself.
* Freeswitch speaks directly to AMPQ, the config files are static.

http://stormqloud.ca
