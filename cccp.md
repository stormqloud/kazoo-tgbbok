# CCCP - Calling Card Callback Platform 
* written by https://github.com/onnet

* Adventures with Calling Card Callback Platform
  * High level overview.  
    * This module operates in a very uesful but uncommon way in Kazoo. 
    * You take 2 DID's and make them *CLUSTER WIDE* for CCCP.
     * One DID is for Callback
     * One DID is for Dialthrough/DISA
    * There are 2 types of client records
      * caller_id records
      * pin_records
      * You can see both types through views in cccps database
    * If you call call the callback number, your caller ID must exist in the database as a caller_id record
      * It will call you back and give you a dialtone
    * If you call the dialthrough number
      * If it knows your caller_id, it will give you a dialtone
      * Otherwise it will ask you for a code (PIN)
        * Make sure you use 10 digit PINS.  Serious!
        * If you enter a valid PIN it will give you a dialtone.

  * This module can do callback and dialthrough despite the name.
  * DISA and dialthrough are the same thing.
  * DISA is also available as a callflow action.
    *  DISA callflow and CCCP are 100% independant of each other.
    *  DISA callflow is not as secure or full featured. 
  

## Kazoo Cluster CCCP Setup

* CouchDB and cccp
  * cccp seems to store things in a couple of spots in couchdb where you want to go looking
    * Inside a new CouchDB database called cccps
    * Docs are also created inside the account of the user using cccp.

  * You NEED to go looking inside system_config/cccp (which you need to create)
    * Modify below to your information...

  * The system_config/cccp doc contains the "link into the DID" to watch for.
  * In cccp a DID is not owned by anyones callflow.
  
* cccp_cb_number <- this is the DID to use for CALLBACK servier for all Kazoo accounts and users!
* cccp_cc_number <- this is the DID to use for DIALTHROUGH for all Kazoo accounts and users!
  * You CANNOT user the same number for both services.

* ensure_valid_caller_id <- Will try to check that the caller ID wanted for outbound is "allowed"
* default_caller_id_number <- whenever outbound caller_id selection has an issue, it will grab this
  * This is a Kazoo cluster wide value not account level information

```
{
   "_id": "cccp",
   "default": {
       "cccp_cb_number": "5142223333",
       "cccp_cc_number": "5141115555",
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

## Account Level CCCP Setup

* Consult the original source for more information https://github.com/onnet/cccp/blob/master/doc/usage.md

```
curl -X PUT -H X-Auth-Token:{AUTH_TOKEN} https://{SERVER}:8443/v1/accounts/{ACCOUNT_ID}/cccps -d \
'{"data":{"pin":"150674729083", \
"outbound_cid":"+78122404700", \
"user_id":"e6da57c768533ebf0d349845394ccf26", "active":true}}'

curl -X PUT -H X-Auth-Token:{AUTH_TOKEN} http://{SERVER}:8000/v1/accounts/{ACCOUNT_ID}/cccps -d \
'{"data":{"pin":"150674729083", \
"outbound_cid":"+78122404700", \
"user_id":"e6da57c768533ebf0d349845394ccf26", "active":true}}'

```


# Callflows DISA module..
* You make this doc in system_config
* Overwriting caller id did not work for me..

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

wlloyd@stormqloud.ca
