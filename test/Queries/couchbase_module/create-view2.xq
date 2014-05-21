import module namespace cb = "http://www.zorba-xquery.com/modules/couchbase";

variable $instance := cb:connect({
  "host": "74.93.6.105:8091",
  "username" : jn:null(),
  "password" : jn:null(),
  "bucket" : "default"});

variable $view-name := cb:create-view($instance, "dev_view2", ("test1", "test2"), ({"key" : "meta.id", "values" : "doc.value"},{ "key" : "meta.id", "values" : ["doc.value", "doc.value2"] }));
$view-name
