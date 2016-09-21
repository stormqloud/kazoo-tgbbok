# Security

* SSL 
 * Warning, self signed certificates are basically useless for Kazoo
 * The API calls will silently fail in your browser because the cert is not part of a chain
   *  Because the requests come from javascript your browser will not ask you to accept the key.. 
 * Get a "real" cert or use Certbot to start with
   *  It's your time to waste, you have been warned. 
 * https://2600hz.atlassian.net/wiki/display/Dedicated/Secure+Your+REST+APIs+with+SSL
 * https://groups.google.com/forum/#!searchin/2600hz-dev/syslog/2600hz-dev/KGI6ss580Gg/xG_pmfblZzUJ
 
* Extra notes
 * You can use Kazoo with certbot.org (ie free certs)
 * Use certbot to create the certs. It creates all certs as "pem files"
   * These files work with Kazoo without issues
   * I just renamed them..
 * reload crossbar (changing the cert) etc
   * `sup whapps_controller restart_app crossbar`

* All *USERS* that logs into Kazoo will need to be upgraded to change their application defaults in the user 'doc'

```
cp /etc/letsencrypt/live/testkazoo.prodosec.com/cert.pem /opt/kazoo/applications/crossbar/priv/ssl/crossbar.crt
cp /etc/letsencrypt/live/testkazoo.prodosec.com/privkey.pem /opt/kazoo/applications/crossbar/priv/ssl/crossbar.key
```

* Convert Kazoo-ui config.js 
```

/bin/sed -i s/'http'/https/g /var/www/html/kazoo-ui/config/config.js
/bin/sed -i s/'httpss'/https/g /var/www/html/kazoo-ui/config/config.js
/bin/sed -i s/8000/8443/g /var/www/html/kazoo-ui/config/config.js
/bin/sed -i s/'api.stormqloud.ca'/'api2.stormqloud.ca'/g /var/www/html/kazoo-ui/config/config.js

```

* Make a daily certbot crontab..
```
23 4 * * * /opt/certbot/certbot-auto renew --renew-hook "/opt/certbot/certbot-kazoo.sh"
```


* Certbot restart script hook for kazoo
```
#!/bin/sh
# certbot-kazoo.sh
/bin/cp /etc/letsencrypt/live/kazoo.prodosec.com/cert.pem /opt/kazoo/applications/crossbar/priv/ssl/crossbar.crt
/bin/cp /etc/letsencrypt/live/kazoo.prodosec.com/privkey.pem /opt/kazoo/applications/crossbar/priv/ssl/crossbar.key
sup whapps_controller restart_app crossbar
```

http://www.stormqloud.ca
