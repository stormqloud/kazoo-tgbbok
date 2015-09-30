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

[root@k9 kazoo-master]# git fetch upstream
remote: Counting objects: 1495, done.
remote: Compressing objects: 100% (25/25), done.
remote: Total 1495 (delta 1062), reused 1055 (delta 1055), pack-reused 415
Receiving objects: 100% (1495/1495), 387.97 KiB, done.
Resolving deltas: 100% (1126/1126), completed with 176 local objects.
From https://github.com/2600hz/kazoo
   12350d9..67f936e  3.20       -> upstream/3.20
   11ca138..4d0a897  3.21       -> upstream/3.21
 + 5a9e5be...02f6812 KAZOO-3891 -> upstream/KAZOO-3891  (forced update)
 + 6980cf9...b880a88 KAZOO-3959 -> upstream/KAZOO-3959  (forced update)
   7cb5cbd..f57620c  KAZOO-4009 -> upstream/KAZOO-4009
 * [new branch]      KAZOO-4079 -> upstream/KAZOO-4079
 * [new branch]      KAZOO-4108 -> upstream/KAZOO-4108
   5c1280f..849005b  master     -> upstream/master
 * [new tag]         3.20.32    -> 3.20.32
 * [new tag]         3.21.33    -> 3.21.33
From https://github.com/2600hz/kazoo
 * [new tag]         3.21.32    -> 3.21.32
[root@k9 kazoo-master]# 


```
