# CDR

* https://github.com/2600hz/kazoo/blob/master/applications/crossbar/doc/cdrs.md
* CDR export as a CSV
```
curl -i  -H "Accept: text/csv" -H "Content-Type: application/json" -H "X-Auth-Token: 4b2ff6d61a6654b26dad205870eb9fe2" -X GET http://api.stormqloud.ca:8000/v1/accounts/22a3a099fd4653a24bc333df5974b905/cdrs
```


* CDR to SQL or Radius direct from AMQP packets..
https://github.com/2600hz/community-scripts/blob/master/RadiusCDR/cdr_radius.rb
