# Rating calls 
* Hotornot plus Jonny5


* activate prepaid or postpaid billing

# jonny5 doc example (this would exist within each account)
```
·          {
·             "_id": "jonny5",
·             "_rev": "13-8935836403cf7ad7adace4124931cf39",
·             "default": {
·                 "default_enabled": true,
·                 "default_calls": -1,
·                 "default_resource_consuming_calls": -1,
·                 "default_inbound_trunks": 0,
·                 "default_outbound_trunks": 0,
·                 "default_twoway_trunks": -1,
·                 "default_burst_trunks": 0,
·                 "default_max_postpay_amount": 0,
·                 "default_reserve_amount": 0.5,
    "default_allow_prepay": true,
·                 "default_allow_postpay": false,
·                 "default_soft_limit_inbound": false,
·                 "default_soft_limit_outbound": false
·             }
·          }
```

# Limits doc (per account)
```
·          {
·             "_id": "limits",
·             "_rev": "3-c5e7e82ae4f9aeca8676e82ab3067201",
·             "pvt_account_db": "account%2Ffd%2F71%2F3ef5cad939bc7f204a14cbf4541a",
·             "pvt_account_id": "fd713ef5cad939bc7f204a14cbf4541a",
·             "pvt_type": "limits",
·             "inbound_trunks": 0,
·             "twoway_trunks": 1,
·           "allow_prepay": true,
·             "pvt_created": 63569818616,
·             "pvt_modified": 63569818616,
·             "pvt_vsn": 1
·          }
 
```

# Make a ratedeck..
```
·          {
·             "_id": "US-1",
·             "_rev": "1-580637de86ca66ee85d0adec14124bcb",
·             "direction": [
·                 "inbound",
·                 "outbound"
·             ],
·             "pvt_internal_rate_cost": "0.01",
·             "iso_country_code": "US",
·             "options": [
·             ],
·             "prefix": "1",
·             "rate_cost": "0.02",
·             "rate_increment": 60,
·             "rate_minimum": 60,
·             "rate_name": "US-1",
·             "rate_surcharge": "0.00",
·             "routes": [
·                 "^0111(\\d{10})$",
·                 "^\\+1(\\d{10})$"
·             ],
·             "pvt_type": "rate"
·          }
```


# Example 
```
[root@sip.stormqloud.ca]# sup hotornot_maintenance rates_for_did +1234567890
Candidates:
                                     RATE NAME |      COST | INCREMENT |   MINIMUM | SURCHARGE |    WEIGHT |          PREFIX |
                                          NA-1 |      0.01 |        60 |        60 |       0.0 |         9 |               1 |
Matching:
                                     RATE NAME |      COST | INCREMENT |   MINIMUM | SURCHARGE |    WEIGHT |          PREFIX |
                                        * NA-1 |      0.01 |        60 |        60 |       0.0 |         9 |               1 |
ok
```
