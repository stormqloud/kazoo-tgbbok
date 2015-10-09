# Growing Freeswitch in the cluster.

* install freeswitch kazoo package
* install kazoo configs package
* no need to install haproxy if not already there
* ```chkconfig haproxy on --level 2345```
* edit /etc/kazoo/freeswitch/autoload_configs/kazoo.conf.xml
  * Erlang cookie..
  *         <param name="cookie" value="your_erlang_cookie_goes_here" />-->
