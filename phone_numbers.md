# Phone numbmers

# Numbers Lifecycle
* This is very important when you start to care about DID's.
* https://2600hz.atlassian.net/wiki/display/Dedicated/Number+Lifecycle

* CNAM
  * Cnam gets enabled or disabled on a per number basis
  * CNAM is a USA thing only
  * Canadian DID's do not support CNAM for example
  

* To make sure CNAM is enabled and running on the DID make sure to set these attributes.

```
   "cnam": {
       "inbound_lookup": true
   },

and 

   "pvt_features": [
       "inbound_cnam"
   ]
```

* If you need to be able to handle 'Dial 9 for an outside line' on a Kazoo system, you can handle that with a dial_plan on a per account basis.
* Dial 9 outside trunks is obviously not needed in Kazoo, however it makes it easier for transitioning clients.
* SIP trunking and LCR routing makes this mostly not used anymore.
```
  "dial_plan": {
       "^91?(\\d{10})$": {
           "description": "PBX Dial9",
           "prefix": "+1"
       }
   },
```


* www.stormqloud.ca
* http://www.canadadids.ca
