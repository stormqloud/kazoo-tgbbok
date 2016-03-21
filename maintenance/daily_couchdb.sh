#!/bin/sh
# Version 0.02

# To backup BigCouch to Google Cloud Storage
# stormqloud (wlloyd@prodosec.com)

# Ideally for Kazoo from 2600hz.com!

# This can use d from a daily cronjob oneach bigcouch server.

# Signup for Google Compute Account.  You get 90 days free.

# Under permissions, create a service account
# You will get a json or pk12 (choose json)
# rename it service-account.json

# enable google storage api
# under storage tab, create bucket 

# bucket in this is calles kazoo-backups
# couchdb is a directory in the bucket that you create with the web interface (or remote it)

# gcloud auth activate-service-account --key-file service-account.json

d=`date +%Y%m%d-%H%M`
h=`hostname`
f="/tmp/couchdb_${h}_${d}.tgz"
#echo $f
cd /
tar -czf ${f} srv
gsutil -q cp -c ${f} gs://kazoo-backups/couchdb/
rm ${f}
