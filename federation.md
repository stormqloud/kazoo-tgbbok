# Federation

## The Holy Grail.

* http://en.wikipedia.org/wiki/Federation

* Bigcouch is designed to this standard which explains some background to the shards, quorum etc
  * http://www.allthingsdistributed.com/2007/10/amazons_dynamo.html

I searched to fgure out really what this means in Kazoo.

Kazoo uses AMQP and BigCouch so Federation is a mix of what is defined in the other projects.

* https://www.rabbitmq.com/federation-reference.html
* http://www.erlang-factory.com/upload/presentations/369/Kocoloski-BigCouch-ErlangFactory.pdf

Federation appear to rest on a few paramters of bigcouch

* BigCouch databases are governed by 4 parameters
  * Q: Number of shards
  * N: Number of redundant copies of each shard
  * R: Read quorum constant
  * W: Write quorum constant

Consider the following in determining how you will define these paramters.


  
# Examples
* Single Server install
  ```
[cluster]
q=1
r=1
w=1
n=1
```

* 2600hz setup
  * https://github.com/2600hz/kazoo-configs/blob/master/bigcouch/local.ini#L19-L23

  ```
[cluster]
q=3
r=2
w=2
n=3
```

From IRC
```
zones ensures data is replicated to multiple zones, typically defined geographically
mc_
so you'd have two zones, east and west, defined to group servers in la and nyc
mc_
the z param would then ensure at least one of the n replications would happen in east and west
mc_
so you would have geo-redundancy
mc_
of course, zone names are arbitrary so you could map them to whatever you want
mc_
but typically people use the datacenter, country, etc as the zone name
```
