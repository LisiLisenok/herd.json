# herd.json
Ceylon JSON object representation

This project is based and in general is similar to SDK module `ceylon.json`.
In contrast with SDK it contains mutable and immutable JSON object and array.

####JSON value
Value JSON operates with.
`String | Boolean | Integer | Float | JsonObject | JsonArray | Null`

####JSON Object
JSON object is enumerated with three states: mutable, immutable and empty:

      shared interface JsonObject
          of MutableJsonMap | JsonMap | EmptyJsonMap
          satisfies Map<String, JsonValue>

Mutable JSON object `MutableJsonMap` contract is very similar with SDK `ceylon.json.object`.
Any embeded objects and arrays mutable object contains are mutable.
If immutable sub-item passed to mutable object it is converted to mutable internaly.

Immutable JSON object `JsonMap` can be filled only at initialization and contains only immutable
embeded JSON objects and arrays. If mutable sub-item passed to initializer it is converted to immutable internaly.

`EmptyJsonMap` is immutable and represents object which is always empty.

####JSON Array
JSON array structure is similar to JSON object:

    shared interface JsonArray
        of MutableJsonList | JsonList | EmptyJsonList
        satisfies List<JsonValue>
