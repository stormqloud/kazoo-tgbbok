# CCCP

* Adventures with Calling Card Callback Platform
  * This module can do callback and dialthrough despite the name.

* CouchDB
  * CCCP seems to store things in a couple of spots in couchdb if you wan tto go looking
    * Inside a new CouchDB database called cccp
    * Docs are also created inside the account of the user using cccp.

```


```



* this will enable the modules you need.
* Make a config first.
```
sup whistle_maintenance hotload cccp
sup crossbar_maintenance start_module cb_cccps
```
  
