
"Callable interface used when traversing JSON data. 
 
 It is the callers responsiblity to ensure the 
 methods of this interface are called in a sequence 
 that corresponds to well-formed JSON. 
 For example, callers should never generate the calling
 sequence `onKey()`, `onKey()`."
by("Tom Bentley")
shared interface Visitor {
    "Called at the start of a new object.
     Further calls pertain to this new object until 
     a corresponding call to [[onEndObject]]."
    shared formal void onStartObject();
    
    "Called when encountering a key within a the current object."
    shared formal void onKey(String key);
    
    "Called at the end of an object."
    shared formal void onEndObject();
    
    "Called at the start of a new array. 
     Further calls pertain to this new object until 
     a corresponding call to [[onEndArray]]."
    shared formal void onStartArray();
    
    "Called at the end of an array."
    shared formal void onEndArray();
    
    "Called when encountering a number."
    shared formal void onNumber(Integer|Float number);
    
    "Called when encountering true or false."
    shared formal void onBoolean(Boolean boolean);
    
    "Called when encountering a null."
    shared formal void onNull();
    
    "Called when encountering a string."
    shared formal void onString(String string);
}

"Recursively visit the given subject using the given visitor. If 
 [[sortedKeys]] is true then the keys of Objects will be visited 
 in alphabetical order"
by("Tom Bentley")
shared void visit(subject, visitor, sortedKeys=false) {
    "The value to visit."
    JsonValue subject;
    "The visitor to apply."
    Visitor visitor;
    "Whether keys should be visited in alphabetical order, when visiting objects."
    Boolean sortedKeys;
    
    switch(subject)
    case (is JsonObject) {
        visitor.onStartObject();
        
        value items = sortedKeys then subject else subject.sort(compareKeys);
        for (key->child in items) {
            visitor.onKey(key);
            visit(child, visitor);
        }
        visitor.onEndObject();
    }
    case (is JsonArray) {
        visitor.onStartArray();
        for (element in subject) {
            visit(element, visitor);
        }
        visitor.onEndArray();
    }
    case (is String) {
        visitor.onString(subject);
    }
    case (is Float|Integer) {
        visitor.onNumber(subject);
    }
    case (is Boolean) {
        visitor.onBoolean(subject);
    }
    case (is Null) {
        visitor.onNull();
    }
}
