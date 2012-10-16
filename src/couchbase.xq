module namespace cb = "http://www.zorba-xquery.com/modules/couchbase";

declare namespace ver = "http://www.zorba-xquery.com/options/versioning";
declare option ver:module-version "1.0";

(:~
 : Connect to the couchbase server
 :
 : @param $host address of the couchbase server. (example: "localhost:8091")
 : @param $username username of the couchbase server.
 : @param $password password corresponding to the username in the couchbase server.
 : @param $bucket name of the bucket to use for the couchbase opperations.
 :                (example: "default")
 :
 :)
declare function cb:connect($host as xs:string, 
                            $username as xs:string?, 
                            $password as xs:string?, 
                            $bucket as xs:string)
    as xs:anyURI external;

declare function cb:connect($options as object())
    as xs:anyURI external;

(:~
 : Get Value of the corresponding key
 : 
 : @param $key the identifier's of the asked value
 :
 : @return A sequence json objects corresponding to the key
 :)

declare function cb:find-text($db as xs:anyURI, $coll as xs:string*)
    as xs:string* external;

declare function cb:find-text($db as xs:anyURI, $coll as xs:string*, $options as object())
    as xs:string* external;

declare function cb:find-json($db as xs:anyURI, $coll as xs:string*)
    as object()*
{
  jn:parse-json(cb:find-text($db, $coll))
};

declare function cb:find-json($db as xs:anyURI, $coll as xs:string*, $options as object())
    as object()*
{
  jn:parse-json(cb:find-text($db, $coll, $options))
};

declare function cb:find-xml($db as xs:anyURI, $coll as xs:string*)
    as element()* external;

declare function cb:find-xml($db as xs:anyURI, $coll as xs:string*, $options as object())
    as element()* external;


declare function cb:find-binary($db as xs:anyURI, $coll as xs:string*)
    as xs:base64Binary* external;

declare function cb:find-binary($db as xs:anyURI, $coll as xs:string*, $options as object())
    as xs:base64Binary* external;

(:~
 : Remove key/value form the couchbase server
 :
 : @param $key the identifier's of the asked value
 :
 :)
declare function cb:remove($db as xs:anyURI, $coll as xs:string*)
    as empty-sequence() external;


(:~
 : Store key/value into the couchbase server's cache.
 :
 : @param $key the identifier of the stored value
 : @param $value json to be stored in couchbase server
 :
 :)  

declare function cb:store-text(
            $db as xs:anyURI,
            $coll as xs:string*,
            $value as xs:string*)
    as empty-sequence() external;

declare function cb:store-text(
            $db as xs:anyURI,
            $coll as xs:string*,
            $value as xs:string*,
            $options as object())
    as empty-sequence() external;

declare function cb:store-json(
            $db as xs:anyURI,
            $coll as xs:string*,
            $value as object()*)
    as empty-sequence() external;

declare function cb:store-json(
            $db as xs:anyURI,
            $coll as xs:string*,
            $value as object()*,
            $options as object())
    as empty-sequence() external;

declare function cb:store-xml(
            $db as xs:anyURI,
            $coll as xs:string*,
            $value as element()*)
    as empty-sequence() external;

declare function cb:store-xml(
            $db as xs:anyURI,
            $coll as xs:string*,
            $value as element()*,
            $options as object())
    as empty-sequence() external;

declare function cb:store-binary(
            $db as xs:anyURI,
            $coll as xs:string*,
            $value as xs:base64Binary*)
    as empty-sequence() external;

declare function cb:store-binary(
            $db as xs:anyURI,
            $coll as xs:string*,
            $value as xs:base64Binary*,
            $options as object())
    as empty-sequence() external;


(:~
 : Remove all key/value pairs from the entire cluster
 :)
declare function cb:flush($db as xs:anyURI)
    as empty-sequence() external;

declare function cb:touch($db as xs:anyURI, $coll as xs:string, $exp-time as xs:integer)
    as empty-sequence() external; 

declare function cb:destroy($db as xs:anyURI)
  as empty-sequence() external; 

