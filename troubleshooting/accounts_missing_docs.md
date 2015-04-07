# Possible error you might see

* Notice the "500" at the end of the long line.  HTTP return code that is Mochiweb throwing up.

```
[Tue, 07 Apr 2015 22:40:41 GMT] [info] [<0.15980.5>] [30a6fda5] Stacktrace: [{mochiweb_request,send,2,
                                              [{file,
                                                "src/mochiweb_request.erl"},
                                               {line,146}]},
                                             {couch_httpd,last_chunk,1,
                                              [{file,"src/couch_httpd.erl"},
                                               {line,607}]},
                                             {chttpd,handle_request,1,
                                              [{file,"src/chttpd.erl"},
                                               {line,198}]},
                                             {mochiweb_http,headers,5,
                                              [{file,"src/mochiweb_http.erl"},
                                               {line,126}]},
                                             {proc_lib,init_p_do_apply,3,
                                              [{file,"proc_lib.erl"},
                                               {line,227}]}]
[Tue, 07 Apr 2015 22:40:41 GMT] [info] [<0.15981.5>] [ca3693c2] undefined - - 'GET' /account%2F32%2Ffb%2F866ce6bae20a3ca99994507fa634-201504/_design/sms/_view/deliver_to_offnet?limit=100 500
```
