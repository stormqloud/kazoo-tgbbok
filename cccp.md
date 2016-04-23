# CCCP

* Adventures with Calling Card Callback Platform
  * This module can do callback and dialthrough despite the name.
  * DISA and dialthrough are the same thing.
  * DISA is also available as a callflow action.
  
* CouchDB
  * CCCP seems to store things in a couple of spots in couchdb if you want to go looking
    * Inside a new CouchDB database called cccps
    * Docs are also created inside the account of the user using cccp.
  * You NEED to go looking inside system_config/cccp (which you need to create)
    * Modify below to your information...

  * The system_config/cccp doc contains the "link into the DID" to watch for.
  * In cccp a DID is not owned by anyones callflow.
  
```
{
   "_id": "cccp",
   "default": {
       "cccp_cb_number": "5142223333",
       "cccp_cc_number": "5142223333",
       "last_number_redial_code": "*0",
       "ensure_valid_caller_id": true,
       "default_caller_id_number": "+15140000000",
       "allowed_callee_regex": "^\\+?\\d{11,}$",
       "callback_delay": 3
   },
   "pvt_account_id": "system_config",
   "pvt_account_db": "system_config",
   "pvt_created": 63562529472,
   "pvt_modified": 63644318172,
   "pvt_type": "config",
   "pvt_node": "whistle_apps@kz.domain.tld"
}

```



* this will enable the modules you need.
* Make a config first.
```
sup whistle_maintenance hotload cccp
sup crossbar_maintenance start_module cb_cccps
```
  




# Callflows DISA module..
* You make this doc in system_config

```
{
   "_id": "callflow.disa",
   "default": {
       "default_use_account_caller_id": true,
       "default_pin_length": 10
   },
   "pvt_account_id": "system_config",
   "pvt_account_db": "system_config",
   "pvt_created": 63598679846,
   "pvt_modified": 63598679846,
   "pvt_type": "config",
   "pvt_node": "whistle_apps@test.stormqloud.com"
}
```
