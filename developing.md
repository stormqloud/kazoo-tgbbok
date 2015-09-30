# Kazoo Development

* I'm a newb to git, this is where I write down the commands that are commonly used.
  * You should have already created a github account

```
[root@k9 kazoo-master]# pwd
/opt/kazoo-master

cat .git/config
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[remote "origin"]
        fetch = +refs/heads/*:refs/remotes/origin/*
        url = ssh://git@github.com/stormqloud/kazoo
[branch "master"]
        remote = origin
        merge = refs/heads/master
[remote "upstream"]
        url = https://github.com/2600hz/kazoo
        fetch = +refs/heads/*:refs/remotes/upstream/*
        

[root@k9 kazoo-master]# git status
# On branch master
# Your branch is ahead of 'origin/master' by 18 commits.
#
nothing to commit (working directory clean)

```
