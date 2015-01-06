# Federation

The Holy Grail.

* http://en.wikipedia.org/wiki/Federation

I searched to fgure out really what this means in Kazoo.

Kazoo uses AMQP so Federation is best defined over there.  Kazoo federation is an extension of RabbitMQ federation.

* https://www.rabbitmq.com/federation-reference.html
* http://www.erlang-factory.com/upload/presentations/369/Kocoloski-BigCouch-ErlangFactory.pdf

Federation appear to rest on a few paramters of bigcouch
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
