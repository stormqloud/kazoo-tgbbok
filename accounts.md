# Account Structure

When you start screwing around with Kazoo it's important to understand you need to flush out the system to a *MINIMUM* of 3 levels.

* Master Account For the entire Kazoo system (install account) [ 1st level account ]
  * Reseller account (your clients?) [ 2nd level account ]
    * PBX (Your clients clients) [ 3rd level account ]

To keep your Kazoo cluster running as cleanly as possible from an administrative perspective you need to keep your top level account to mostly (only) creating sub-accounts.

Many functions such as whitelabel require you to have sub-accounts to see the correct behavior.

As long as you keep your top level account clean you will be able to log in and perform other maintenance functions.

The structure of Kazoo is the inherit from your parent account.  Anything you want ourside of default behaviour should be done in a second level account or below.



    
