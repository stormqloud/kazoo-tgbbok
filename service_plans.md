# Service Plans.

# Reworking in different directory.. 
### https://github.com/stormqloud/kazoo-tgbbok/tree/master/selling_services

## This is not cleaned up yet and getting old.  
## Specifically, some new service plan code has been committed to the tree in 3.19+ 
## Check back soon, I will be updating this section as I dig through the code and test..
## stormqloud.ca

* The information is mostly taken from this link written by "cando" for 3.08 or the 2600hz documents.  
  * https://docs.google.com/document/d/1--LCpmRXG4iCYUNcLvMPzt6kQztw12O3BsAoI39jguo/edit
  * https://2600hz.atlassian.net/wiki/display/Dedicated/Service+Plans

* Other useful links 
  * https://github.com/2600hz/kazoo/tree/master/core/whistle_services-1.0.0/priv
  * http://pastebin.com/wSD89nFD

## Prerequisites
* Jonny5 (limits) Also called j5
* HotOrNot (per-minute rating with rate deck - recommended)
* BrainTree https://www.braintreepayments.com (Credit card processing)

## Possible code changes needed depending on your use case
  * If you add numbers from a carrier not using the buy number method your number will be set as “local” carrier. The erlang code for that carrier definition returns false when requested if the number is billable. So it doesn’t get counted in the services for the account. If you want them billed you just need to make 1 change.
  * In /opt/kazoo/core/whistle_number_manager-1.0.0/src/carriers/wnm_local.erl
  * change
    * is_number_billable(_Number) -> 'false'.
    * to
    * is_number_billable(_Number) -> 'true'.
  * re-compile: (cd /opt/kazoo/core/whistle_number_manager-1.0.0/ ; make)
  * restart kz-whistle_apps

# Set account(s) as reseller per your needs.
* There is only ONE Braintree account for entire system.
  * You cannot have different accoutns or resellers use different Braintree accounts.
  
# Road map
  * Abstracted braintree logic to bookkeeper to support other billing connections like quickbooks, freshbooks...
  * resellers can have their own bookkeeper config/account for trickle down. (eg: customer adds money to their per-minute balance and money goes to reseller’s bank account. Reseller per-minute (local) balance is not affected)

## Setting an account as a reseller. 
* All sub accounts of it will set it as their reseller
  * sup whistle_services_maintenance make_reseller <account_id to make reseller>
*If you need to demote an account from being a reseller:
  * sup whistle_services_maintenance demote_reseller <account_id>

## Create Reseller service plan(s)
* Important notes about phone_numbers, IE: inbound assigned DIDs.
* The identifiers under phone_numbers, ex “did_us”, are derived from the classification of  numbers, the same as what is used for restriction of outbound calls. So be sure classifications cover the numbers you are selling. They are also used for j5 allotments. There can be overlap of classification definition but only the first match is used in each system. So careful planning is essential.
* http://db.fqdn:15984/_utils/document.html?system_config/number_manager
* The reseller (pvt_reseller_id) for an account is found in the doc in the services db with the _id the same as the account_id. db.myfqdn:15984/_utils/document.html?services/<account_ID>
* If pvt_account_id is the same as pvt_reseller_id, they are their own reseller.
* Service plan(s) available for an account go in the reseller’s account DB as a new document
with "pvt_type": "service_plan"
* good to make the _id for the doc be descriptive (eg: mycompany_default_plan ) rather than a uuid
* Samples from: /op/kazoo/core/whistle_services-1.0.0/priv/example_service_plan_[12].json

## Set a default service plan for a Reseller
* Open the reseller’s services/<reseller_account_id> doc
  * add a new field:
  * "default_service_plan"
  * Set the value to the resellers service plan you want to be assigned to new sub accounts of the reseller.
* Setup Braintree account service plans
* Create Add-ons and discounts for all entries in the kazoo service plan. 
  * For example, from the example_service_plan_1.json, under the bookkeepers->braintree section you have phone_numbers->did_us you would create in your braintree account an Add-on with the ID “did_ud” for the “addon”: “did_us” and create in your braintree account a discount with the ID “discount_did_us” for the “discounts”: { “cumulative”: “discount_did_us”}. 
  * When you’re creating the Add-on and Discount in your braintree account, the name and description may be seen by the customer may be seen by the billed customer depending on how you configure to bill/charge/notify them but the amount doesn’t matter. Kazoo will send the amount and override the value you put in here.
* Be sure to create Add-ons and Discounts in your Braintree account for every “addon” and “discount” entry in the braintree section of the service plan
* Create a Recurring Billing Plan in your braintree account. 
  * The Plan ID should match the “plan” name used in the braintree section of the kazoo service plan. 
  * From the plan in the example json file ("plan": "SIP_Services") the Plan ID would be "SIP_Services".

##P lan Price. 
* I don’t know if kazoo can or does sends the Price of the plan. Test for yourself and update here. :)
* Assign Add-ons and Discounts to the service plan you just created in your braintree account.
* SAVE :)
* User API to create the plan

## Assign Service Plan to Account
* HTTP POST something like this to link the plan and account
* http://server:8000/v2/accounts/{{ACCOUNT_ID}}/service_plans/{{PLAN_ID}}


* db.fqdn:15984/_utils/document.html?services/<customer_account_id>
  * example: /opt/kazoo/core/whistle_services-1.0.0/priv/example_account_services.json
* for end customers pvt_reseller: false
* pvt_reseller_id -> probably parent account
* billing_id -> most cases the customer’s account id
* plans
* match the _id of the plan created (eg: mycompany_default_plan) created above
* account_id -> match the value for pvt_reseller_id
* db.myfqdn:15984/_utils/document.html?system_config/services

## To activate service plan billing.
* for testing probably use frequent checks and syncs:
```
{   "_id": "services",
   "_rev": "<current rev>",
   "default": {
       "sync_services": true,
       "sync_buffer_period": 60,
       "scan_rate": 20000,
       "master_account_bookkeeper": "wh_bookkeeper_braintree"
   } }
```

# For production probably set 
* "scan_rate": 60000 -> check for service changes to sync every 60 sec.
* "sync_buffer_period": 600  -> wait 10 min (600 sec) after the last change to an account’s services doc before  syncing/updating the service plan (subscription) on braintree
* save the doc
* start services
* sup whapps_controller start_app whistle_services
* add whistle_services to db.myfqdn:15984/_utils/document.html?system_config/whapps_controller
* sync/re-process an account
* good for when a plan changed or configured an account to use a plan.
* sup whistle_services_maintenance sync <account_id>

## Account TOP UP - Add money to account
* https://github.com/2600hz/kazoo/blob/master/core/whistle_transactions-1.0.0/doc/top_up.md

