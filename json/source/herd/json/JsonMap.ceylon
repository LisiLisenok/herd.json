import ceylon.language {
	makeMap=map
}


"
 Represents an immutable JSON Object.  
 All embeded JSON arrays and objects are immutable.
 If mutable item is specified in the [[values]] new immutable item contains the same elements as original
 is created and stored in the map
 "
shared class JsonMap({<String->JsonValue>*} values = {}) 
        satisfies JsonObject
{
	
	Map<String, JsonValue> content = makeMap {
		for ( key->val in values )
		if ( is MutableJsonList val )
		then key->val.immutable()
		else if ( is MutableJsonMap val )
		then key->val.immutable()
		else key->val
	};
	
	
	shared actual Integer size => content.size;
	shared actual Boolean empty => content.empty;
	
	shared actual JsonObject immutable() => if ( empty ) then emptyJsonMap else this;
		
	shared actual JsonObject clone() => if ( empty ) then emptyJsonMap else this;
	
	shared actual Boolean defines(Object key) => content.defines( key );
	
	shared actual JsonValue get(Object key) => content.get( key );
	
	shared actual Iterator<String->JsonValue> iterator() => content.iterator();
	
	shared actual Collection<String> keys => content.keys;
	shared actual Collection<JsonValue> items => content.items;
	
	
	shared actual Integer hash => content.hash;
	
	shared actual Boolean equals(Object that) {
		if ( is JsonObject that ) {
			return ( super of Map<String, JsonValue> ).equals( that );
		}
		else {
			return false;
		}
	}
	
}
