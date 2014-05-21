import module namespace cb = "http://www.zorba-xquery.com/modules/couchbase";
import module namespace f = "http://expath.org/ns/file";

variable $instance := cb:connect({
  "host": "74.93.6.105:8091",
  "username" : jn:null(),
  "password" : jn:null(),
  "bucket" : "default"});

variable $binary := f:read-binary(resolve-uri("connect.xq"));
cb:put-binary($instance, "binary-file2", $binary);
variable $result := cb:get-text($instance, "binary-file2");
$result
