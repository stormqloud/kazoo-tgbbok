# CDR

* CDR will go into BigCouch by default.

* New parallel CDR
 * https://github.com/stormqloud/community-scripts/tree/pgcdr/PostgreSQL-CDR
 * Kazoo CDR Bigcouch unaffected
 * Parallel insert into Postres 
* CDR export as a CSV
  * https://github.com/2600hz/kazoo/blob/master/applications/crossbar/doc/cdrs.md
```
curl -i  -H "Accept: text/csv" -H "Content-Type: application/json" -H "X-Auth-Token: 4b2ff6d61a6654b26dad205870eb9fe2" -X GET http://api.stormqloud.ca:8000/v1/accounts/22a3a099fd4653a24bc333df5974b905/cdrs
```

* CDR to SQL or Radius direct from AMQP packets..
  * https://github.com/2600hz/community-scripts/blob/master/RadiusCDR/cdr_radius.rb

http://stormqloud.ca
