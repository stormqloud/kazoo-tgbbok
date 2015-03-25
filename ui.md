#WTF is Kazoo-ui
  Production UI
  
## Kazoo-ui tweaks
* Extend logout 
  * Edit ```/var/www/html/kazoo-ui/config/config.js```
    * Add ```        logout_timer: '360',```
    * This gives you 6 hours (ie 60*6 min)


#WTF is Monster-ui
  Bleeding edge UI
  
Tomato or Tomato?

The reality in 2014 and early is you need to run kazoo-ui for most functionality.

monster-ui is not fully baked yet but 2600hz appears to be working hard on it.

* Suggest that most installions do not use ```yum update``` to track the kazoo-ui.
* Remove the install package and grab your own copy of kazoo-ui directly from git.
* ```yum erase kazoo-ui```
* The 2600hz supplied kazoo-ui has been compressed and the code is hard to read, and your local changes will be overwritten.  It's unlikely you will be patcking the core kazoo code, however the kazoo-ui might need a patch or two for your own location.
* 
wlloyd@stormqloud.ca



