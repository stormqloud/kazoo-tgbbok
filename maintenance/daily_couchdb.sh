#!/bin/sh
# Version 0.01
# To backup BigCouch to Google  Cloud Storage
# stormqloud (wlloyd@prodosec.com)

# This can use d from a daily cronjob oneach bigcouch server.

# Signup for aa  Google Compute Account.  You get 90 days free.

# Under permissions, create a service account
# enable google storage api
# under storage tab, create bucket 

# bucket in this is calles kazoo-backups
# couchdb is a directory in the bucket that you create with the web interface (or remote it)


d=`date +%Y-%m-%d`
h=`hostname`
f="/tmp/couchdb_${h}_${d}.tgz"
echo $f
tar czf ${f} /srv
gsutil cp ${f} gs://kazoo-backups/couchdb/
 
