# Updating

You can tell when new yum packages are ready for Kazoo by following this site.

* Check when new software updates becomes avail
  * http://build001-fmt.2600hz.com:8080/view/Dashboard/

* Get your YUM compatabile software updates here.
  * http://repo.2600hz.com/
  * cd /etc/yum.repo.d
  * wget http://repo.2600hz.com/2600.repo

* Kamailio builds
  * https://build.opensuse.org/project/show/home:lazedo:kamailio

# Github
* Workflow of how to maintain your own Kazoo fork on github
* http://www.eqqon.com/index.php/Collaborative_Github_Workflow

# Stuff you should never use

* yum erase kazoo-librabbitmq-master kazoo-bigcouch-R15B kazoo-R15B kazoo-prompts kazoo-kamailio  kazoo-json-c-master  kazoo-freeswitch-R15B kazoo-configs
* yum install kazoo-librabbitmq-master kazoo-bigcouch-R15B kazoo-R15B kazoo-prompts kazoo-kamailio  kazoo-json-c-master  kazoo-freeswitch-R15B kazoo-configs

* chkconfig --level 2345 kz-ecallmgr off
* chkconfig --level 2345 kz-whistle_apps off
* chkconfig --level 2345 kamailio off
* chkconfig --level 2345 freeswitch off

