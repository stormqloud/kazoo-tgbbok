# HAPROXY
# Under-appreciated element of the stack.

So when you make a call to port 15984 on a Kazoo box, what's really happening is haproxy is running on that machine and it will proxy that request to port 5984.

HAPROXY will often proxy your request to a different server then you made the call to.  That's the *HA* part.  High Availability.


```
https://groups.google.com/forum/#!searchin/2600hz-dev/zone/2600hz-dev/3m2C374mKbg/VUTEsJjrSHEJ

Zone 1 - Customer/Region

listen bigcouch-data 127.0.0.1:15984 
    balance roundrobin 
    server db1.zone1.mydomain.com 127.0.0.1:5984 check 
    server db2.zone1.mydomain.com 127.0.0.2:5984 check 
    server db3.main.mydomain.com 127.0.0.3:5984 check backup 
    server db4.main.mydomain.com 127.0.0.4:5984 check backup 


Zone 2 - Customer/Region

listen bigcouch-data 127.0.0.1:15984
    balance roundrobin
    server db1.zone2.mydomain.com 127.0.0.1:5984 check
    server db2.zone2.mydomain.com 127.0.0.2:5984 check
    server db3.main.mydomain.com 127.0.0.3:5984 check backup
    server db4.main.mydomain.com 127.0.0.4:5984 check backup


```

