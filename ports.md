# Ports

The following ports are involved in a running Kazoo setup.

You should firewall ACL these appropriately at your border router.

Specifically you should by default deny all public traffic to your Kazoo machines.  Open up ports below as required.

This is probably not an exhaustive list.  Remember about TCP/UDP.

Each port really exists twice.

* 25 - SMTP
* 80 - www
* 443 - HTTPS
* 2525 - Haproxy to 19025
* 4369 - epmd
* 5060 - Kamailio
* 5061 - Kamailio TLS
* 5672 - amqp 
* 5984 - CouchDB Data
* 5986 - CouchDB Mgr
* 7000 - Kamailio ALG SIP
* 7001 - Kamailio ALG TLS SIP
* 8000 - Cowboy (API into Kazoo)
* 8080 - Kamailio websocket
* 8031 - Freeswitch
* 8443 - Kamailio WebSocket TLS
* 11000 - Freeswitch (Kamailio Dispatcher sends to this)
* 11500 - BigCouch used for ?
* 15672 - RabbitMQ GUI
* 15984 - Haproxy to 5984
* 15986 - Haproxy to 5986
* 19025 - Email to Fax
* 22002 - HAProxy Stats 
