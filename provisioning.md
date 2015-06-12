# Provisioning

## If you are from 2600hz.org please consider renting your provisioner as a monthly service.
## Provisioning is the most commonly frequented page on this blog.  
## Let people rent the hosted provisioner...

* As of early 2015, "Open Source Provisioning" is so hopelessly complicated as to be unknown in the wild.  
* 2600hz apparently has provisioning built for master-ui.  This is not an open source product as far as I can find.

* https://groups.google.com/forum/#!searchin/2600hz-dev/provisioner/2600hz-dev/573YWxdxz9E/b6okNxauIqQJ
  * "The provisioner is in a state of flux. The old one is completely unstable so we’re not really encouraging people to use that at this point." 

# To the reader: you have two options to get Provisioning working ;-)  

* Buy support from 2600hz.com (good idea ;-)

* Research and rewrite the old unreliable provisioning yourself and send me (stormqloud.ca) the instructions ;-)

# What's in the Kazoo source tree?
* There are currently 4 versions of provisiong in the Kazoo backend.  It's unclear how different or similar these are to each other.  Based on the dates things were checked into the source tree, it would appear that provisioner_v5 is the newest.  Newest doesn;t mean the best working however!

  * super_awesome_provisioner
  * awesome_provisioner
  * simple_provisioner
  * provisioner_v5 (Feb 2014)


# Open Source Provisioning (provisioner-v5)
* The old open source code is now know as provisioner-v5 in the source tree.
* It's not secure, it's unreliable
* Making a DB mistake can take out all your phones in a matter of hours.

In the meantime here are a few random things.

Do not think this is going to get provisioning installed.  Provisioning is broken and undeveloped.  Nobody can help you except yourself.

* Some random doc links (this will not match exactly the code...)
  * https://2600hz.atlassian.net/wiki/pages/viewpage.action?pageId=27066376

* The provisioner-v5 code
  * https://github.com/provisioner/Provisioner/tree/v5-dev

* This probably refers to code that is not open source.  IE  NOT provisioner-v5, not checked.
  * https://github.com/bluesandnz/kazoo-provisioner
* The Kazoo-ui has old provisioning code in another source tree. 
  * https://github.com/2600hz/phone
  * You should install this code inside you kazoo-ui/applications/voip folder
  * /var/www/html/kazoo-ui/whapps/voip/phone/phone.js
 
* Edit /var/www/html/kazoo-ui/config/config.js 
  * Add a line like 
  * ```        provisioner_url: '/p', ```
 
* To turn on the old provisioner-v5 in kazoo-ui needs a ui_flag that does not already exist.
  * You need to track down in futon the doc for your master user in the master account.
  * In there you will find an "apps"->"voip" section where you can add these flags.

```
"ui_flags": {
               "provision_admin": true,
               "super_duper_admin": true
           }
```

  * there are about a billion other things that need to be done.
  * rewrite provisioner-v5 cause it's not compatable with Kazoo 3.18 !
