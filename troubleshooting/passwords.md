# Kazoo passwords

* Any user password hash in Kazoo can be generate manaully as follows
  * Make sure you do this using the bash shell
  * You may need to use md5sum not md5 depending on unix distribution
  * Notice how the two values are not the same.  Bash is the correct one!

  ```
bash-3.2$  echo $0
bash
bash-3.2$  echo -n "admin:foobar12and3" | md5
7aea9bb61c67caf27c21b1603b83bdcf

sh-3.2$ echo $0
sh
sh-3.2$  echo -n "admin:foobar12and3" | md5
a89c79e47ffe0988bb06eea0180a1640

  ```
  
* You lost your super duper admin user password?
  * Account is not used to generate the password.

```
This is the key where the password is hidden. 

   "pvt_md5_auth": "7aea9bb61c67caf27c21b1603b83bdcf",
   
In this example within the user couchdb document of the super user.  This document will have a name something like..

http://sipcloud.stormqloud.ca:15984/_utils/document.html?account%2Fc4%2F29%2F9f9a710f4e36930c65e363c911dc/21f03403ec9b54976e45146d51fa2a68

This is a made up example obviously.

the key parts to look for when navigating Futon would be to find the *main top level account ID* for your Kazoo system.  That's what you see above as "account%2Fc4%2F29%2F9f9a710f4e36930c65e363c911dc".

"21f03403ec9b54976e45146d51fa2a68" would be the document id of the super admin user within this account.

Inside that document you will find 
   "pvt_md5_auth": "7aea9bb61c67caf27c21b1603b83bdcf",
which you can manipulate as you wish


```
