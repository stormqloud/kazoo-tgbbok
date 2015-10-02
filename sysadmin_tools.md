# Useful tools

## Fabric
* http://www.fabfile.org/
* Do ssh stuff on multiple machines easily and fast.
* You *need* this the moment you have more then a single server install.

## ngrep
  * super useful to watch traffic on the network.  Crafting filters is different from wireshark/tcpdump
  * ngrep -W byline -i eth0 'dialog-info '
  * ngrep -Td lo0 port 5672
  
## wireshark
  * If you are doing VOIP you should already be using this product.  VOIP is about the SIP RFC standards.  
  Nothing better then seeing them on the wire.
 * you might have this installed on your Kamaillio and FreeSwitch machines
  *  and enough resources to run it!

http://stormqloud.ca
