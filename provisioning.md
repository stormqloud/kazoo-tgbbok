#Provisioning

As of early 2015, Provisioning is so hopelessly complicated as to be unknown in the wild.

Several people claim to have this working.  In reality, outside of 2600hz professionally hosted platform, this is probably not used.

To the reader: you have two options to get Provisioning working ;-)  

* Buy support from 2600hz.com (good idea ;-)

* Research it yourself and send me (stormqloud.ca) the instructions to prove it!

In the meantime here are a few random things.

Do not think this is going to get provisioning installed.  Provisioning is broken and undeveloped.  Nobody can help you except yourself.

* Some random doc links (this will not match exactly the code...)
  * https://2600hz.atlassian.net/wiki/pages/viewpage.action?pageId=27066376
* The Kazoo-ui has old provisioning code. 
  * https://github.com/2600hz/phone
* You should install this code inside you kazoo-ui/applications/voip folder
  * /var/www/html/kazoo-ui/whapps/voip/phone/phone.js
 
* Edit /var/www/html/kazoo-ui/config/config.js 
  * Add a line like 
  * ```        provisioner_url: '/p', ```
 
