# Updating

You can tell when new yum packages are ready for Kazoo by following this site.

* Short version
  * yum update
  * sup whapps_maintenance migrate
  * reboot (realistic..)
* Long version
  * Follow short version, no reboot..
  * Restart stuff, just *NOT* FreeSwitch or the OS itself
    * restart whistle apps
    * restart ecallmgr
    * restart kamaillio
    * restart omnipresence
  * Freeswitch handles calls but has no no kazoo logic, no need to disrupt calls
  * Things I've forgotten
    *  You don't know what you don't know.
   
* Check when new software updates becomes avail
  * http://build001-fmt.2600hz.com:8080/view/Dashboard/

* Get your YUM compatabile software updates here.
  * Assuming you are running CentOS, this will work for you 
  * Dig here manually if you wish.
    * http://repo.2600hz.com/
  * cd /etc/yum.repo.d
  * wget http://repo.2600hz.com/2600.repo
  * yum update
 
* Kamailio builds
  * https://build.opensuse.org/project/show/home:lazedo:kamailio

# Github
* Workflow of how to maintain your own Kazoo fork on github
* This is useful if you are going to check code out of github instead of yum
* http://www.eqqon.com/index.php/Collaborative_Github_Workflow

# Stuff you should never use

* yum erase kazoo-librabbitmq-master kazoo-bigcouch-R15B kazoo-R15B kazoo-prompts kazoo-kamailio  kazoo-json-c-master  kazoo-freeswitch-R15B kazoo-configs
* yum install kazoo-librabbitmq-master kazoo-bigcouch-R15B kazoo-R15B kazoo-prompts kazoo-kamailio  kazoo-json-c-master  kazoo-freeswitch-R15B kazoo-configs

* chkconfig --level 2345 kz-ecallmgr off
* chkconfig --level 2345 kz-whistle_apps off
* chkconfig --level 2345 kamailio off
* chkconfig --level 2345 freeswitch off
* chkconfig --level 2345 rabbitmq-server off

