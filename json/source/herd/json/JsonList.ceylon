
"
 Represents an immutable JSON Array.  
 All items of JsonArray or JsonObject types are immutable.
 If mutable item is specified in the default constructor new immutable item contains the same elements as original
 is created and stored in the map
 "
shared class JsonList 
    satisfies JsonArray
{
	List<JsonValue> content;
	
	shared new ({JsonValue*} values = {}) {
		content = Array<JsonValue> {
			for ( val in values )
			if ( is MutableJsonList val )
			then val.immutable()
			else if ( is MutableJsonMap val )
			then val.immutable()
			else val
		};
	}
	
	new fromImmutable( List<JsonValue> values ) {
		content = values;
	}
	
	
	
	shared actual JsonArray immutable() => if ( empty ) then emptyJsonList else this;
	
	shared actual JsonArray clone() => if ( empty ) then emptyJsonList else this;
	
	shared actual Integer size => content.size;
	shared actual Boolean empty => content.empty;
	
	shared actual JsonValue getFromFirst(Integer index) => content.getFromFirst( index );
	
	shared actual Integer? lastIndex => content.lastIndex;
	
	shared actual JsonArray reversed => if ( empty ) then emptyJsonList else JsonList.fromImmutable(content.reversed);
	
	shared actual JsonArray rest => if ( empty ) then emptyJsonList else JsonList.fromImmutable(content.rest);
	
	shared actual JsonArray measure(Integer from, Integer length) 
			=> if ( empty ) then emptyJsonList else JsonList.fromImmutable(content.measure(from, length));
	
	shared actual JsonArray span(Integer from, Integer to) 
			=> if ( empty ) then emptyJsonList else JsonList.fromImmutable(content.span(from, to));
	
	shared actual JsonArray spanFrom(Integer from) 
			=> if ( empty ) then emptyJsonList else JsonList.fromImmutable(content.spanFrom(from));
	
	shared actual JsonArray spanTo(Integer to) 
			=> if ( empty ) then emptyJsonList else JsonList.fromImmutable(content.spanTo(to));
	
	
	shared actual Integer hash => content.hash;
	
	shared actual Boolean equals(Object that) {
		if ( is JsonArray that ) {
			return ( super of List<JsonValue> ).equals( that );
		}
		else {
			return false;
		}
	}
	
}
