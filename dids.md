# DIDs

* Kazoo-ui tweak to allow non super users to "add a number", instead of just buy and port.
  * "You should add the pvt_wnm_allow_additions = true in both the account document in the accounts database as well as in the account doc in the accounts own database (If I remember correctly I read once that these two documents should be in sync anyway)."
    * https://groups.google.com/forum/#!searchin/2600hz-dev/add$20did/2600hz-dev/suN7lCY4Pag/7HrI-DtkcTYJ
* I found that this works
  * sup crossbar_maintenance allow_account_number_additions `<account_id>`
  * 
