#Resellers

##Reseller Accounts
* Annoint an account Reseller Status
  * sup whistle_services_maintenance make_reseller `<account_id>`
  * sup whistle_services_maintenance demote_reseller `<account_id>` 
  * sup wh_services find_reseller_id `<account_id>`
  * sup wh_services is_reseller `<account_id>`

* Flush all cached docs for all accounts:
  * sup couch_mgr flush_cache_docs
* Flush all cached docs for a specific account:
  * sup couch_mgr flush_cache_docs `account%2Fab%2Fcd%2Fefghi`
  * sup couch_mgr flush_cache_docs accounts

* If you want to make a sub account use the resellers carriers do something like this for their "no_match" callflow
  *  This must be done inside couchdb directly.  No idea how to accomplish otherwise.
  *  The account_id is that of the reseller above the account you are changing.
  *  reload..

```
   "flow": {
       "data": {
           "hunt_account_id": "d99df1f8c41b9b9e333b1383f2e971f5"
       },
       "module": "resources",
       "children": {
       }
   },
 ```
 
