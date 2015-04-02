# Phone numbmers

* cnam
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
