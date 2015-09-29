# Account Structure

## These suggestions fall under the category of good Kazoo policy.

When you start screwing around with Kazoo it's important to understand you need to flush out the system to a *MINIMUM* of 3 levels.

Your first inclination is going to want to create some phones right after you log in.  Resist the temptation and create and account.  Use that account if you want a shortcut.  Never use the master/root/superuser for anything but creating and managing accounts.  It is not a PBX in itself (unless you force it..).

* Master Account For the entire Kazoo system (install account) [ 1st level account ]
  * Reseller account (your clients?) [ 2nd level account ]
    * PBX (Your clients clients) [ 3rd level account ]

To keep your Kazoo cluster running as cleanly as possible from an administrative perspective you need to keep your top level account to mostly (only) creating sub-accounts.

Many functions such as whitelabel require you to have sub-accounts to see the correct behavior.

As long as you keep your top level account clean you will be able to log in and perform other maintenance functions.

The structure of Kazoo is the inherit from your parent account.  Anything you want ourside of default behaviour should be done in a second level account or below.

wlloyd@stormqloud.ca
VOIP/SIP

    
