kazoo-tgbos
===========

The Great Book Of SUP

These are here so I can add to them easily.   There are too many sup commands listed in too many places.  The super ingenius will know how to scan the Erlang source code to sniff out there own sup commands.

This list is for the mere mortals.  Things may appear multiple times under different categories.

Mostly it's stolen from 
https://2600hz.atlassian.net/wiki/display/Dedicated/How+to+use+the+SUP+command

After that I add when I run into them.

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

This command operates on a remote host
  * `sup -h www.stormqloud.ca -c erlang_token whapps_controller restart_app crossbar`
 Of course you need to change the -h and the -c values.

Try `sup --help` for more options. 

##Flushing:

Probably the first thing you need from sup are the various cache flushing.  When you are developing or playing better to do all these every time..

Depeding on your unix experience you might want to run everything thrice.
http://utcc.utoronto.ca/~cks/space/blog/unix/TheLegendOfSync

It's probably not safe to do this on a super busy production cluster.  If you run a super busy production cluster you arn't reading this.

* Flush all cached docs for all accounts:
  * sup couch_mgr flush_cache_docs
  * sup -necallmgr ecallmgr_maintenance flush_acls -> just flushes the caches, not FreeSWITCH

##Accounts

###Reseller
* Annoint an account Reseller Status
  * sup whistle_services_maintenance make_reseller `<account_id>`
  
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

emerg,alert,crit,err,warn,notice,info,debug

* To turn off all logging use
  * sup -n ecallmgr whistle_maintenance syslog_level emerg

If you want permanent changes look in `/etc/kazoo/config.ini`


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
#####Reload stepswitch to update carriers manually:
  * /opt/kazoo/utils/sup/sup stepswitch_maintenance reload_resources
