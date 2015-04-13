#Reseller Accounts

Annoint an account Reseller Status

sup whistle_services_maintenance make_reseller <account_id>
sup whistle_services_maintenance demote_reseller <account_id>
sup wh_services find_reseller_id <account_id>
sup wh_services is_reseller <account_id>
Flush all cached docs for all accounts:

sup couch_mgr flush_cache_docs
Flush all cached docs for a specific account:
sup couch_mgr flush_cache_docs account%2Fab%2Fcd%2Fefghi
sup couch_mgr flush_cache_docs accounts

