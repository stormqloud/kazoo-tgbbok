#!/bin/sh
# Version 0.03

# To backup BigCouchDB to Google Cloud Storage
# stormqloud (wlloyd@prodosec.com)

# Ideally for Kazoo from 2600hz.com!

# Run this daily on each BigCouchDB server.

# Signup for Google Compute Account.  You get 90 days free.
# This contains storage.  

# Under permissions, create a service account
# You will get a json or pk12 (choose json)
# rename it service-account.json

# enable google storage api
# under storage tab, create bucket 

# bucket in this is calles kazoo-backups
# couchdb is a directory in the bucket that you create with the web interface (or remote it)

# gcloud auth activate-service-account --key-file service-account.json

# If you are on CentOS 6 this will help remove this nag.
#diff /usr/lib/python2.6/site-packages/cryptography-1.1.2-py2.6-linux-x86_64.egg/cryptography/__init__.py /usr/lib/python2.6/site-packages/cryptography-1.1.2-py2.6-linux-x86_64.egg/cryptography/__init__.py~ 21,26c21,26
#< #if sys.version_info[:2] == (2, 6):
#< #    warnings.warn(
#< #        "Python 2.6 is no longer supported by the Python core team, please "
#< #        "upgrade your Python.",
#< #        DeprecationWarning
#< #    )
#---
#> if sys.version_info[:2] == (2, 6):
#>     warnings.warn(
#>         "Python 2.6 is no longer supported by the Python core team, please "
#>         "upgrade your Python.",
#>         DeprecationWarning
#>     )

d=`date +%Y%m%d-%H%M`
h=`hostname`
f="/tmp/couchdb_${h}_${d}.tgz"
#echo $f
cd /
tar -czf ${f} srv
gsutil -q cp -c ${f} gs://kazoo-backups/couchdb/
rm ${f}
