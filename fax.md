# FAX

Kazoo has inbound and outbound faxing to/from PDF.

## Fax to Email
* This should work with no problem.  Assign a callflow with a DID number to go into "receive fax".  The "receive fax" application will associate with a user record.  The PDF will be delivered to the users email address.
* There is inbound faxbox funcationality also.  Unknown how to setup or what functionality is provided.


## Email to Fax
* This will require multiple configuration changes.

* https://groups.google.com/forum/#!topic/2600hz-users/IHtSwuuveTQ

* To get the email flowing into Kazoo you must hijack port 25 on your inbound MX mail server and point it into Kazoo instead of Postfix.

Kazoo inbound fax service should already be running on your Kazoo servers on TCP PORT 19025

```
[root@kaz ~]# telnet lh 19025
Trying 127.0.0.1...
Connected to lh.
Escape character is '^]'.
220 kaz.prodosec.com Kazoo Email to Fax Server
```
For example, this is Postgres answering the SMTP TCP port 25 in a default Linux setup.

```
[root@kaz ~]# telnet lh 25
Trying 127.0.0.1...
Connected to lh.
Escape character is '^]'.
220 kaz.prodosec.com ESMTP Postfix

```

You either need to get Kazoo to answer port 25 as below or work with Postgres to redeliver the traffic.

You can see below TCP PORT 25 is now answering with the Kazoo Email to Fax service.

```
[root@k6 kazoo]# telnet lh 25
Trying 127.0.0.1...
Connected to lh.
Escape character is '^]'.
220 k6.prodosec.com Kazoo Email to Fax Server


```
