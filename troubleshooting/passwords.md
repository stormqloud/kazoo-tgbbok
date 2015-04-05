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
