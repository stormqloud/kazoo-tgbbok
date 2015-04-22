# Carriers & Long distance

These are some random notes for now on setting up a carrier.  

You should be aware that the base Kazoo install comes is not able to dial "international".  IE anything outside of +1.

Kazoo supports local carriers and global carriers.  Inherited reseller carriers even.

Carriers are often listed under "resources" in the Futon CouchDB filter views.

The following offnet db document works to send calls to StormQloud or Prodosec

Make sure to reload the docs before oyu do anything.

If you want backup and promary VOIP carriers etc you handle that with weight_cost.  The lower weight_cost will be picked first.

## sup stepswitch_maintenance reload_resources

format_from_uri controls what you send as your outbound header when the call heads to the carrier.

### offnet document 
```
{
   "_id": "7214b87afc96d2450b0bd0f6068891eb",
   "_rev": "4-22e26d9d41e33aebd4b7c387dcd5f60b",
   "weight_cost": "50",
   "enabled": true,
   "gateways": [
       {
           "prefix": "1",
           "codecs": [
               "PCMU"
           ],
           "progress_timeout": "20",
           "server": "68.71.63.38",
           "username": "",
           "password": "",
           "realm": "68.71.63.38",
           "format_from_uri": false,
           "suffix": "",
           "enabled": true,
           "custom_sip_headers": {
           },
           "invite_format": "route",
           "endpoint_type": "sip",
           "channel_selection": "ascending",
           "skype_rr": true,
           "emergency": false
       }
   ],
   "rules": [
       "^\\+{0,1}1{0,1}(\\d{10})$"
   ],
   "caller_id_options": {
       "type": "external"
   },
   "type": "local",
   "name": "PP OFFNET",
   "peer": false,
   "ui_metadata": {
       "ui": "kazoo-ui",
       "version": "v3.18-2"
   },
   "emergency": false,
   "grace_period": 5,
   "flags": [
   ],
   "media": {
       "audio": {
           "codecs": [
               "PCMU"
           ]
       },
       "video": {
           "codecs": [
           ]
       }
   },
   "id": "7214b87afc9655450b0bd0f6068891eb",
   "pvt_type": "resource",
   "pvt_vsn": "1",
   "pvt_account_db": "offnet",
   "pvt_created": 63582342728,
   "pvt_modified": 63582342964,
   "pvt_request_id": "1f979c5334211f566f70c8a179043ea5"
}

```

# Send a call to another account carriers (IE reseller)
```
  "flow": {
       "data": {
           "hunt_account_id": "5555555555"
       },
       "module": "resources",
       "children": {
       }
   },
```
