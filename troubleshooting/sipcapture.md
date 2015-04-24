# SIPCAPTURE / HOMER

* You need this the moment you have more then 1 machine for Kazoo.

* For Kazoo-Kamaillio 4.2 this is the patch you need

```
[root@kamailio]# diff -r default.cfg default.orig 
205,217d204
< 
< #############################################################                 
< ################## Homer addition  ##########################
< #############################################################
< loadmodule "siptrace.so"
< # check IP and port of your capture node                 
< modparam("siptrace", "duplicate_uri","sip:100.200.100.99:9060")
< modparam("siptrace", "hep_mode_on",1)
< modparam("siptrace", "trace_to_database",0)
< modparam("siptrace", "trace_flag",22)
< modparam("siptrace", "trace_on", 1)
< #############################################################   
< 
221,228d207
< 
< #############################################################
< ################## Homer addition  ##########################
< ### start duplicate the SIP message now for Homer Logging ###
< #############################################################
<     sip_trace();
<     setflag(22);
< 

```

SIP trunking stormqloud.ca
