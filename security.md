# Security

* SSL 
 * https://2600hz.atlassian.net/wiki/display/Dedicated/Secure+Your+REST+APIs+with+SSL
 * https://groups.google.com/forum/#!searchin/2600hz-dev/syslog/2600hz-dev/KGI6ss580Gg/xG_pmfblZzUJ
 
* Extra notes
 * You can use Kazoo with certbot.org (ie free certs)
 * Use certbot to create the certs. IT creates all as "pem files"
   * These files work with Kazoo without issues

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
