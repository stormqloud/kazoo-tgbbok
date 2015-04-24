# SIPCAPTURE / HOMER

* You need this the moment you have more then 1 machine for Kazoo.

# Preferred way

* yum -y groupinstall "Development Tools"
* yum install -y libpcap automake expat-devel libtool git libpcap-devel file make
* follow https://github.com/sipcapture/captagent

# Old way
* This way is a hassle, requires far more config changes...
  * On the plus side I'm sure it sues less CPU
  * Less stats, ie no jitter etc

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

* Kazoo-Freeswitch

```
# diff -r sofia.conf.xml sofia.conf.xml~
8d7
<       <param name="capture-server" value="udp:100.100.100.100:9060"/>
```

```
[root sip_profiles]# diff sipinterface_1.xml sipinterface_1.xml~
189d188
<             <param name="sip-capture" value="yes"/>
```


SIP trunking stormqloud.ca
