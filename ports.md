# Ports

The following ports are involved in a running Kazoo setup.

You may want to check out https://github.com/stormqloud/kazoo-tgbbok/blob/master/firewall

This assumes a one server system.

If you run a 6/7/8/etc server cluster the same ports are at play.  It's just you may want to lock down traffic even more.

You should firewall ACL these appropriately at your border router.

Specifically you should by default deny all public traffic to your Kazoo machines.  Open up ports below as required.

This is probably not an exhaustive list.  Remember about TCP/UDP.

Each port really exists twice.


| Port | World/Private(ie FW) | What it does        |
|--------------|--------|------------------------------------|
| 25 | | SMTP
| 80 |  | www
| 443 |  | HTTPS
| 2525 | P | Haproxy to 19025
| 4369 | P | epmd
| 5060 | | Kamailio (inbound SIP, outbound to handsets)
| 5061 | | Kamailio TLS
| 5064 | | Kamailio WebRTC
| 5065 | | Kamailio WebRTC SSL
| 5672 | P | RabbitMQ amqp main port
| 5984 | P | CouchDB Data
| 5986 | P | CouchDB Mgr
| 7000 |  | Kamailio ALG SIP
| 7001 |  | Kamailio ALG TLS SIP
| 8000 |  | Cowboy (API into Kazoo), Kazoo-UI uses this..
| 8021 | P | Freeswtich Event socket
| 8080 | depreciated | Kamailio websocket
| 8031 | ? | Freeswitch
| 8443 | P | HTTPS for the Kazoo API (crossbar), old Kamailio WebSocket TLS
| 11000 | | Freeswitch (Kamailio Dispatcher sends to this), outbound to CARRIERS from here
| 11500 | ? | - BigCouch used for ?
| 15672 | P | RabbitMQ GUI (guest/guest)
| 15984 | P | Haproxy to 5984
| 15986 | P | Haproxy to 5986
| 19025 | P | Email to Fax
| 22002 | P | HAProxy Stats 


* For RTP traffic.  That's the audio packets.
  * You must have this range open for RTP audio packets.  Deal with it...
  
```
switch.conf.xml:        <param name="rtp-start-port" value="16384"/>
switch.conf.xml:        <param name="rtp-end-port" value="32768"/>
```

wlloyd@stormqloud.ca
http://www.stormqloud.ca

