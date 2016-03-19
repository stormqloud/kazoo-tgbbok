# CouchDB

## Drop a month of everybody records

* Generally a good idea to only keep a few months in couchdb.
  * This will archive older then 6 months to /tmp/
    * ``` sup kazoo_modb_maintenance archive_modbs ```
  * This will then let you delete the info in couchdb now that it is archived.
    * ``` sup kazoo_modb_maintenance delete_modbs 201503 ```

