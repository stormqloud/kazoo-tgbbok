#SUP

## Help
* I've tried to list as many SUP commands as I can casually find onto on this page.
* You need to understand what the SUP commnd does..

There are too many sup commands listed in too many places so far...  The super ingenius will know how to scan the Erlang source code to sniff out their own sup commands.

It is almost impossible to define all the sup commands.  The best way would be to write a script to parse the Erlang source.

Read below for discovering your own sup command and you should understand why.

This list is for the mere mortals but mostly me.  Things may appear multiple times under different categories.

Mostly it's stolen from https://2600hz.atlassian.net/wiki/display/Dedicated/How+to+use+the+SUP+command with additions I find around the net or needed myself.

The sup command is an almost limitless since it passes values directly to Erlang
functions running out in VM land.

sup lives in `/opt/kazoo/utils/sup/sup` on most installations.  You might need to prefix your commands with that
or add that path into your unix shell.

ie: if you have problems substitute
`sup` 
for
`/opt/kazoo/utils/sup/sup`


#### Remote hosts

Everything except this part assumes you are running the `sup` command on the same host as the the Erlang VM you want to talk to.

For example this is a local command that operates on localhost
  * `sup whapps_controller restart_app crossbar`

This is the same command operating on a remote host
  * `sup -h www.stormqloud.ca -c erlang_token whapps_controller restart_app crossbar`
 
Of course you need to change the -h and the -c values.

Try `sup --help` for more options. 

##Flushing:

Probably the first thing you need from sup are the various cache flushing.  When you are developing or playing better to do all these every time..

Depeding on your unix experience you might want to run everything thrice.
http://utcc.utoronto.ca/~cks/space/blog/unix/TheLegendOfSync

It's probably not safe to do this on a super busy production cluster.  However, if you run a super busy production cluster, you arn't reading this.

* Flush all cached docs for all accounts:
  * sup couch_mgr flush_cache_docs
  * sup -necallmgr ecallmgr_maintenance flush_acls
  * sup stepswitch_maintenance reload_resources
  * sup whapps_config flush


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


##Logging

* Increase the log level for whapps to *max*:
  * sup whistle_maintenance syslog_level debug
* Increase the log level for ecallmgr to *max*:
  * sup -n ecallmgr whistle_maintenance syslog_level debug

You can use any of the syslog severity levels (in order) to change what is logged.

* emerg,alert,crit,err,warn,notice,info,debug

* To turn off all logging use
  * sup -n ecallmgr whistle_maintenance syslog_level emerg

If you want permanent changes look in `/etc/kazoo/config.ini`

## Monthly

* sup kazoo_modb_maintenance verify_rollups

## Notify
```
sup notify_maintenance configure_smtp_relay my.relay.com
sup notify_maintenance configure_smtp_username username
sup notify_maintenance configure_smtp_password password
sup notify_maintenance configure_smtp_auth always
sup notify_maintenance configure_smtp_port 123
```

## ecallmgr
*  sup ecallmgr_maintenance channel_summary
*  sup ecallmgr_maintenance channel_detail
*  sup ecallmgr_maintenance flush_authn
*  sup ecallmgr_maintenance flush_util
*  sup ecallmgr_maintenance enable_authz
*  sup ecallmgr_maintenance registrar_details
*  sup ecallmgr_maintenance registrar_summary
*  sup ecallmgr_maintenance carrier_acls

## amqp 
sup whistle_amqp_maintenance broker_summary

## whapps_account_config
* sup whapps_account_config set `<acccount_id>` media default_language fr-ca 

## whapps_maintenance
* sup whapps_maintenance migrate
* sup whapps_maintenance refresh
* sup whapps_maintenance refresh system_schemas (covered by above?)
* sup whapps_maintenance blocking_refresh
* sup whapps_maintenance sup kazoo_modb_maintenance verify_rollups
* sup whapps_maintenance find_invalid_acccount_dbs
* sup whapps_maintenance ensure_aggregate_devices
* sup whapps_maintenance get_all_account_views

## whapps_controller
  * sup whapps_controller running_apps
  * sup whapps_controller restart_app conference

## whistle_media_maintenance
* sup whistle_media_maintenance refresh
* sup whistle_media_maintenance set_account_language `<account_id>` fr-ca

## whistle_number_manager (wnm)
* sup whistle_number_manager_maintenance reconcile_accounts
* sup whistle_number_manager_maintenance reconcile_numbers
* sup whistle_number_manager_maintenance reconcile_providers

## whistle_services
* sup whistle_services_maintenance credit account_id amount
* sup whistle_services_maintenance debit account_id amount

# crossbar
* sup whapps_controller restart_app crossbar
* sup crossbar_maintenance start_module cb_braintree
* sup crossbar_maintenance find_account_by_number 5149072508
* sup crossbar_maintenance running_modules
* sup crossbar_maintenance allow_account_number_additions `<account_id>`

##Whapps
/opt/kazoo/utils/sup/sup whapps_config get whapps_controller whapps
* Get the currently running whapps:
  * /opt/kazoo/utils/sup/sup whapps_controller running_apps
* Get list of freeswitch nodes that ecallmgr is configured to connect to::
  * /opt/kazoo/utils/sup/sup -n ecallmgr ecallmgr_config get fs_nodes
* Get list of freeswitch nodes that ecallmgr is connected to:
  * /opt/kazoo/utils/sup/sup -n ecallmgr ecallmgr_maintenance list_fs_nodes
* Restart a whapp on a remote host:
  * /opt/kazoo/utils/sup/sup -h apps002-dev-vb.2600hz.com -c change_me whapps_controller restart_app crossbar
* Check the running whapps on a remote host:
  * /opt/kazoo/utils/sup/sup -h apps002-dev-vb.2600hz.com -c change_me whapps_controller running_apps
* Check which amqp host this server is connected to:
  * /opt/kazoo/utils/sup/sup amqp_mgr get_host
* Flush the whapps_config cache: (in case you modified some settings such as FS nodes)
  * /opt/kazoo/utils/sup/sup whapps_config flush
* You can also use this command for any document in the system_config database, for example:
  * /opt/kazoo/utils/sup/sup whapps_config flush number_manager
* Flush the ecallmgr_config cache: (in case you modified some settings such as FS nodes)
  * /opt/kazoo/utils/sup/sup -n ecallmgr ecallmgr_config flush
* Add FS nodes to ecallmgr:
  This command adds a FreeSWITCH node to the currently running ecallmgr, but it does not update the persistent configuration.
  * /opt/kazoo/utils/sup/sup -n ecallmgr ecallmgr_maintenance add_fs_node freeswitch@hostname.mydomain.com
* Migrate (update) database documents:
  * /opt/kazoo/utils/sup/sup -t 3600 whapps_maintenance migrate
* Flush whistle_apps couch cache:
  * /opt/kazoo/utils/sup/sup whistle_couch_maintenance flush
* Restart conference whapp
  * /opt/kazoo/utils/sup/sup whapps_controller restart_app conference
* Stop the whistle_apps erlang VM
  * /opt/kazoo/utils/sup/sup erlang halt
  * or
  * /opt/kazoo/utils/sup/sup -n whistle_apps erlang halt
* Stop the ecallmgr erlang VM
  * /opt/kazoo/utils/sup/sup -n ecallmgr erlang halt

* Alias the sup command: (for the user you are logged as)
  * /opt/kazoo/utils/sup/add_alias.sh

* Lookup an account via the realm:
  * /opt/kazoo/utils/sup/sup crossbar_maintenance find_account_by_realm 83a99b.sip.mydomain.com
* Lookup an account via the phone number:
  * /opt/kazoo/utils/sup/sup crossbar_maintenance find_account_by_number 4158867900
* Find out which carrier will be used for a DID:
  * /opt/kazoo/utils/sup/sup stepswitch_maintenance process_number 4158867900  
* Flush the wh_cache (to refresh the schemas for example)
  * /opt/kazoo/utils/sup/sup wh_cache flush
* Manually create the first account on a Kazoo system:
( change the values for ACCOUNT_NAME, REALM, USERNAME, PASSWORD)
  * /opt/kazoo/utils/sup/sup crossbar_maintenance create_account ACCOUNT_NAME REALM USERNAME PASSWORD
* Reload stepswitch to update carriers manually:
  * /opt/kazoo/utils/sup/sup stepswitch_maintenance reload_resources
* Reload a module:
  * /opt/kazoo/utils/sup/sup crossbar_maintenance start_module cb_braintree
* List all crossbar running modules:
  * /opt/kazoo/utils/sup/sup crossbar_maintenance running_modules
* List crossbar bindings:
  * /opt/kazoo/utils/sup/sup crossbar_bindings modules_loaded
* Refresh whapps after update:
  * /opt/kazoo/utils/sup/sup whapps_maintenance refresh
(whapps_maintenance refresh can not be done in some circumstances from the foreground, it will try to output status info to a shell that has already closed and will error. The command is valid but not via sup if the command needs to output data. Use blocking_refresh)
*Blocking Refresh whapps:
  * /opt/kazoo/utils/sup/sup whapps_maintenance blocking_refresh
  
* Increase the log level for whapps:
  * /opt/kazoo/utils/sup/sup whistle_maintenance syslog_level debug
* Increase the log level for ecallmgr:
  * /opt/kazoo/utils/sup/sup -n ecallmgr whistle_maintenance syslog_level debug
* You can use any of the syslog severity levels to change what is logged.
* Show the nodes sharing the same Rabbitmq:
  * /opt/kazoo/utils/sup/sup whistle_maintenance nodes
 
* Display Registrations status:
  * /opt/kazoo/utils/sup/sup -n ecallmgr ecallmgr_maintenance registrar_summary
 

##Hotornot (Call rating)

* Lookup the cost to call a number
  * sup hotornot_maintenance rates_for_did "15149072508"
```
sup hotornot_maintenance rates_for_did +14161230000
Candidates:
                                     RATE NAME |      COST | INCREMENT |   MINIMUM | SURCHARGE |    WEIGHT |          PREFIX |
                                          US-1 |      0.01 |        60 |        60 |       0.0 |         9 |               1 |
Matching:
                                     RATE NAME |      COST | INCREMENT |   MINIMUM | SURCHARGE |    WEIGHT |          PREFIX |
                                        * US-1 |      0.01 |        60 |        60 |       0.0 |         9 |               1 |
ok


```
* sup hotornot_maintenance rates_for_did +15149072511
* sup hotornot_maintenance rates_for_did 15149072511
* sup hotornot_maintenance rates_for_did 5149072511

All three queries should return the same result if things are setup correctly.

## Jonny5
* sup jonny5_maintenance authz_summary
* sup jonny5_maintenance limits_summary
* sup jonny5_maintenance flush
  * Known undocumented variants exist...

##Carriers
* Manipulate carriers and ACLs
  * sup -necallmgr ecallmgr_maintenance allow_carrier CarrierName CarrierIP
  * sup -necallmgr ecallmgr_maintenance allow_carrier CarrierName CIDR
  * sup -necallmgr ecallmgr_maintenance allow_sbc SBCName SBCIP 
  * sup -necallmgr ecallmgr_maintenance deny_carrier CarrierName CarrierIP 
  * sup -necallmgr ecallmgr_maintenance deny_sbc SBCName SBCIP 
  * sup -necallmgr ecallmgr_maintenance remove_acl CarrierName|SBCName
  * sup -necallmgr ecallmgr_maintenance carrier_acls list_acls
  * sup -necallmgr ecallmgr_maintenance sbc_acls list_acls
  * sup -necallmgr ecallmgr_maintenance reload_acls -> issues a reloadacl on all FreeSWITCH servers 
  * sup -necallmgr ecallmgr_maintenance flush_acls -> just flushes the caches, not FreeSWITCH

####Reload stepswitch to update carriers manually:
  * /opt/kazoo/utils/sup/sup stepswitch_maintenance reload_resources

####Number Classifier

* sup wnm_util classify_number 15149072508
* sup wnm_util classify_number +15149072508
* sup wnm_util classify_number 5149072508


All three of these should give the same result.  Just different ways of saying the same thing.

## Monitoring
*  sup hangups_maintenance hangups_summary
*  sup hangups_maintenance hangup_summary progress_timeout

#### Notify..
* sup notify_account_crawler check 35822499eedbed39facb241a2f12ba5b
* sup notify_account_crawler low_balance_threshold <<account_id>>


####Secret SUP hiding places, Looking for your own sup commands..

SUP commands are actually a way of calling Erlang functions directly

For example to tunderstand how you can find your own SUP command look at this example..

The 2 example commands are below..

`/opt/kazoo/utils/sup/sup hornot_maintenance local_summary
use rates_for_did/1 to see what rates would be used for a DID
ok`
`/opt/kazoo/utils/sup/sup hotornot_maintenance rates_for_did "15149072511"`


anything that is in erlang with export and /1


[root@k6 ~]# /opt/kazoo/utils/sup/sup hotornot_maintenance local_summary
use rates_for_did/1 to see what rates would be used for a DIDok
[root@k6 ~]# 
[root@k6 ~]# 
[root@k6 ~]# 
[root@k6 ~]# 
[root@k6 ~]# 
[root@k6 ~]# /opt/kazoo/utils/sup/sup hotornot_maintenance rates_for_did "15149072511"

You can find the important bit's inside the Erlang source file
* kazoo/applications/hotornot/src/ hotornot_maintenance.erl
  * https://github.com/stormqloud/kazoo/blob/master/applications/hotornot/src/hotornot_maintenance.erl#L9-L14
`-module(hotornot_maintenance).
-module(hotornot_maintenance).

-export([local_summary/0
         ,rates_for_did/1, rates_for_did/3
         ,rates_between/2
        ]).
`



## Random unsorted crap

 1054  sup whistlr_maintenance nodes
 1055  sup whistle_maintenance nodes
 1056  sup whistle_maintenance gc_all
 1057  sup whistle_maintenance etop
 
 sup omnipresence_maintenance current_subscriptions

sup whistle_amqp_maintenance broker_summary
