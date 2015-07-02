# CouchDB things...

* Kazoo runs Bigcouch which is a fork of Couchdb.  (Ie couchdb plus some extra stuff)
* 2600hz has said (mailing list) they intend to move back to Couchdb at some point in the future
  * most if not all bigcouch improvements have found their way back into mainstream CouchDB.
  * 
  

* Zones
  * https://cloudant.com/blog/choosing-zone-configurations-for-bigcouch


* Special URLs for bigcouch (appear to be called global handlers)..
* You might want direct these to port 15984 instead..

```
  * http://kazoocloud.stormqloud.ca:5984/_membership
  * http://kazoocloud.stormqloud.ca:5984/_config
  * http://kazoocloud.stormqloud.ca:5984/_active_tasks
  * http://kazoocloud.stormqloud.ca:5984/_all_dbs
  * http://kazoocloud.stormqloud.ca:5984/_log
  * http://kazoocloud.stormqloud.ca:5984/_oath
  * http://kazoocloud.stormqloud.ca:5984/_replicate
  * http://kazoocloud.stormqloud.ca:5984/_restart
  * http://kazoocloud.stormqloud.ca:5984/_session
  * http://kazoocloud.stormqloud.ca:5984/_stats
  * http://kazoocloud.stormqloud.ca:5984/_system
  * http://kazoocloud.stormqloud.ca:5984/_utils
  * http://kazoocloud.stormqloud.ca:5984/_uuids
```


* Things to look into one day..

  * https://github.com/danielebailo/couchdb-dump/blob/master/bin/couchdb-dump.sh
  * http://www.greenacorn-websolutions.com/couchdb/export-import-a-database-with-couchdb.php
  * http://guide.couchdb.org/draft/replication.html
 
stormloud.ca
