# Adding Whapps/Ecallmgr/Rabbit server.

* This might be too bundled up for some people..
  * you can split this up even further.

** Rememebr to deal with your Erlang cookies that I'm skipping over..

* Install
  * haproxy
    * configure to "haproxy" to your bigcouch servers
* kazoo-configs
* kazoo itself
  * chkconfig kz-ecallmgr on
  * chkconfig kz-whistle_apps on

* kazoo librabbitmq
  * chkconfig rabbitmq-server on

* Rabbit 
  * rabbitmqctl list_bindings
  * 
