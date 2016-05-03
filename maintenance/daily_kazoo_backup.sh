#!/bin/sh
# Version 0.21
# kazoo-tgbbok
# stormqloud (wlloyd@prodosec.com)

# This script will backup 
#     CouchDB (ie /srv)
#     /etc/kazoo
#     /tmp/*json  (files created from sup kazoo archive)

# They will be encrypted and uploaded to Google Cloud Storage
# They will not be sotred with absolute path names.  
# This should prevent you from blowing away your real config on a restore..

# To backup BigCouchDB to Google Cloud Storage
# and do a little MODB cleanup.
# IE prune your couchdb database after the backup if it's the end of the month
# and things are over 6 months.

# Ideally for Kazoo from 2600hz.com!

# Run this daily on each BigCouchDB server.
# Like this in cron..
# 0 8 * * * /bin/sh /root/daily_kazoo_backup.sh
# FYI, your big couch server should be setup for GMT(insert PC name) timezone.

# Signup for Google Compute Account.  You get 90 days free.
# This login contains storage space.  Everything will say compute engine.
# Here's the thing, when you have a compute engine (virtual machine), you need disk space right..
# "Nearline" is like $0.01 per GB per month.

# Under permissions, create a service account
# You will get a json or pk12 (choose json)
# rename it service-account.json and save it in /root on your CouchDB server

# enable google storage api
# under storage tab, create bucket 

# bucket in this is calles kazoo-backups
# couchdb is a directory in the bucket that you create with the web interface (or remote it)

# Per BigcouchDB server

# Centos6 you need 
# yum install gcc openssl-devel python-devel python-setuptools libffi-devel
# yum install python-pip
# pip install gsutil
# curl https://sdk.cloud.google.com | bash

# gcloud auth activate-service-account --key-file service-account.json

# If you are on CentOS 6 this will help remove this nag.
#diff /usr/lib/python2.6/site-packages/cryptography-1.1.2-py2.6-linux-x86_64.egg/cryptography/__init__.py /usr/lib/python2.6/sickages/cryptography-1.1.2-py2.6-linux-x86_64.egg/cryptography/__init__.py~ 21,26c21,26
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

# the actual magic is short...
# This will encrypt the files with password as below
password='password'

d=`date +%Y%m%d%H`
subdir=`date +%Y%m`
kd=`date --date "7 months ago" +%Y%m`
h=`hostname`
f="/tmp/couchdb_${h}_${d}.tar.bz2"
dest="gs://kazoo-backups/couchdb/${h}/${subdir}/"
#echo $dest
cd /
tar -cJf ${f} srv
tar --append -cJf ${f} etc/kazoo
echo ${password} | gpg -vvv --symmetric --batch --passphrase-fd 0 --output ${f}.gpg -c ${f}
/root/google-cloud-sdk/bin/gcloud auth activate-service-account --key-file /root/service-account.json
/root/google-cloud-sdk/bin/gsutil -q cp -c ${f}.gpg ${dest}
rm ${f}
rm ${f}.gpg

# Do a little cleanup while in the vicinity..
#echo 'sup kazoo_modb_maintenance archive_modbs'
sup kazoo_modb_maintenance archive_modbs

if ls /tmp/*json 1> /dev/null 2>&1; then
    /root/google-cloud-sdk/bin/gsutil -q cp -c /tmp/*json ${dest}
    #rm -rf /tmp/*json 
    echo "Archive json modb to google"
else
    echo "Nothing to archive"
fi

echo 'sup kazoo_modb_maintenance delete_modbs' ${kd}
sup kazoo_modb_maintenance delete_modbs ${kd}

# When you want to restore a copy
# cd /tmp
# echo 'password' | gpg --batch -q -o /tmp/couchdb_restore.tar.bz2 --passphrase-fd 0 --decrypt /tmp/file.tgz.gpg
# mkdir /tmp/couchdb_restore
# tar vxJf couchdb_restore.tar.bz2 --directory /tmp/couchdb_restore 
# Now if you want to copy to /srv that's your own decision..
