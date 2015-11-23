# Cisco Handsets 

* 7940 & 7960 
  * These were awesome phones, I loved mine them
  * 2005 is calling and needs some extra handsets
  * junk them
  * Replace immediately, way old SIP
    * broken remote provisioning   
* Sipura/Linksys/Cisco
  * SPA504G etc
  
  * Some sipura magic you might want to find easily like me..
  * 
```
http://192.168.100.132/admin/upgrade?http://www.prodosec.com/spa504g/firmware/spa50x-30x-7-6-1.bin
http://192.168.100.128/admin/resync?http://www.prodosec.com/spa504g/$MA.cfg

```
  * Upgrade rule to auto get over the 7.5.2b manditory bus stop 
``` 
<Upgrade_Rule group="Provisioning/Firmware_Upgrade">
($SWVER lt 7.5.2b) ? http://prov.bla.net/spa/spa50x-30x-7-5-2b.bin | http://prov.bla.net/spa/spa50x-30x-7-6-1.bin
</Upgrade_Rule>
 ```
 

http://www.stormloud.ca
