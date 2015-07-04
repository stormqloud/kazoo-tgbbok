# CouchDB things...

* Kazoo runs Bigcouch which is a fork of CouchDB.  (Ie CouchDB plus some extra stuff)
* 2600hz has said (mailing list) they intend to move back to CouchDB at some point in the future
  * most if not all BigCouchDB improvements have found their way back into mainstream CouchDB.
  * Futon has been replaced with Fauxton
  * BigCouch and CouchDB as terms are used fairly interchangably..

* CouchDB stuff you should know, or be prepared to learn the hard way
  * CouchDB databases don't shrink in space.
    * Append only (only grows in size..)
    * IE delete is really a soft delete, does not free disk space

* Things you cannot change easily after installation..
  * Inside ```/etc/kazoo/bigcouch/local.ini``` you will find a section looking something like this.
```
# Kazoo Single server ISO
[cluster]
q=1
r=1
w=1
n=1

# Kazoo single cluster(data center) install
[cluster]
q=3
r=2
w=2
n=3

```

* The paramters of [cluster] section are *very* hard to change without losing *many* nights sleep.
* All BigCouchDB instances that are clustered need to have the *SAME* parameter values at the *SAME* time.

* Look at this for a definition of the paramters http://www.erlang-factory.com/upload/presentations/369/Kocoloski-BigCouch-ErlangFactory.pdf

* Changing q values?
  * Clonetools to new cluster (yes you read that right)
  * You need to make a new database and migrate your data over
  * Changing the q value is *NOT* possible.
  ```
  [admin@bigcouch1 bigcouch]$ ll /srv/db/shards
total 4
drwxr-xr-x 2 bigcouch daemon 4096 Jul  4 01:53 00000000-ffffffff
  ```
  

* CloneTools..
  * https://github.com/2600hz/community-scripts/tree/master/CloneTools
  * If you need to change the parameters of [cluster]
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
