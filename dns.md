# DNS
* Designing, understanding and laying out your DNS structure for Kazoo is more important then you may think.

* DNS controls Kazoo white label
* DNS controls phone handsets registration
* DNS is the key to the Faxbox system

* Decisions
  * Self host DNS mgmt or DNS hosting with ISP, provider etc.
  
## This is best explained with an example

* Pretend 3 Cluster setup
  * 3 servers, vm or otherwise is irrelevant
  * 3 Public IP that are *NOT* RFC 1918
  * Each server will provde all tasks
    * IE, Kamailio, Freeswitch, haproxy, bigcouch etc

