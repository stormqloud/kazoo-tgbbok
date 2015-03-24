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


* www.stormqloud.ca
* http://www.canadadids.ca
