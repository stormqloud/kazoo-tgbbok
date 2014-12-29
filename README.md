kazoo-tgbos
===========

Kazoo The Great Book Of Sup

These are here so I can add to them easily.  Mostly it's stolen from 
https://2600hz.atlassian.net/wiki/display/Dedicated/How+to+use+the+SUP+command

After that I add when I run into them.

The sup command is an almost limitless depth of command since it passes vavlues directly to Erlang
functions running out in VM land.

sup lives in /opt/kazoo/utils/sup/sup on most installations.  You might need to prefix your commands with that
or add that path into your unix shell.

#Investigation:
-----------------
*sup whapps_config get whapps_controller whapps   
-configured

*sup whapps_controller running_apps 
-actually running

*sup -n ecallmgr ecallmgr_config get fs_nodes

*sup -n ecallmgr ecallmgr_maintenance list_fs_nodes
*sup amqp_mgr get_host

#Flushing:
-----------------

When you are developing or playing better to do all these every time..
