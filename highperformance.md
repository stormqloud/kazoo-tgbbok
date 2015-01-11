# Some tips..

* syslog - change to asynch


* kamaillio 4.2 anyway..
from
  * modparam("kazoo", "amqp_max_channels", 100);
  * modparam("kazoo", "amqp_internal_loop_count", 1);
  * modparam("kazoo", "amqp_consumer_loop_count", 4);

to something more like..
  * modparam("kazoo", "amqp_max_channels", 400);
  * modparam("kazoo", "amqp_internal_loop_count", 5);
  * modparam("kazoo", "amqp_consumer_loop_count", 25);
