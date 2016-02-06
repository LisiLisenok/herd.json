import ceylon.collection {
	MutableList,
	LinkedList
}


"
 Represents a mutable JSON Array.  
 All JSON array and JSON Object items of the array are mutable.
 If immutable item added - new mutable item contains the same elements as original is created and added instead 
 "
shared class MutableJsonList({JsonValue*} values = {}) 
    satisfies JsonArray&MutableList<JsonValue>
{
    
    value list = LinkedList<JsonValue> {
        for ( val in values )
        if ( is JsonList val )
        then MutableJsonList( val )
        else if ( is JsonMap val )
        then MutableJsonMap( val )
        else val
    };
    
    
    iterator() => list.iterator();
    
    getFromFirst(Integer index) => list.getFromFirst(index);
    
    "Returns the number of elements in this array"
    shared actual Integer size => list.size;
    
    shared actual Boolean empty => list.empty;

	
	"returns immutable array with items currently stored in this"
	shared actual JsonArray immutable()
		=>	if ( empty ) then emptyJsonList
			else JsonList( this );

    shared actual MutableJsonList clone()
       => MutableJsonList {
            for ( val in list )
            if ( is MutableJsonList val )
            then val.clone()
            else if ( is MutableJsonMap val )
            then val.clone()
            else val
        };

    shared actual Integer? lastIndex => list.lastIndex;
    
    shared actual JsonArray reversed => if ( empty ) then emptyJsonList else MutableJsonList(list.reversed);
    
    shared actual JsonArray rest => if ( empty ) then emptyJsonList else MutableJsonList(list.rest);
    
    shared actual JsonArray measure(Integer from, Integer length) 
            => if ( empty ) then emptyJsonList else MutableJsonList(list.measure(from, length));
    
    shared actual JsonArray span(Integer from, Integer to) 
            => if ( empty ) then emptyJsonList else MutableJsonList(list.span(from, to));
    
    shared actual JsonArray spanFrom(Integer from) 
            => if ( empty ) then emptyJsonList else MutableJsonList(list.spanFrom(from));
    
    shared actual JsonArray spanTo(Integer to) 
            => if ( empty ) then emptyJsonList else MutableJsonList(list.spanTo(to));
    
    
    shared actual void add(JsonValue val)
    	=> list.add (
        	if ( is JsonList val ) then MutableJsonList( val )
        	else if ( is JsonMap val ) then MutableJsonMap( val )
        	else val
    	);
    
    shared actual void addAll({JsonValue*} values) => list.addAll {
        for ( val in values )
        if ( is JsonList val )
        then MutableJsonList( val )
        else if ( is JsonMap val )
        then MutableJsonMap( val )
        else val
    };
    
    shared actual void clear() => list.clear();
    
    shared actual void insert(Integer index, JsonValue val)
            => list.insert (
        		index,
        		if ( is JsonList val ) then MutableJsonList( val )
        		else if ( is JsonMap val ) then MutableJsonMap( val )
        		else val
    		);

    
    insertAll(Integer index, {JsonValue*} elements)
            =>	list.insertAll (
        			index,
        			{
        				for ( val in elements )
        				if ( is JsonList val )
        				then MutableJsonList( val )
        				else if ( is JsonMap val )
        				then MutableJsonMap( val )
        				else val
        			}
    			);
    
    delete(Integer index) => list.delete(index);
    
    deleteMeasure(Integer from, Integer length) 
            => list.deleteMeasure(from, length);
    
    deleteSpan(Integer from, Integer to) 
            => list.deleteSpan(from, to);
    
    remove(ObjectValue val) => list.remove(val);
    
    removeAll({ObjectValue*} elements) => list.removeAll(elements);
    
    removeFirst(ObjectValue element) => list.removeFirst(element);
    
    removeLast(ObjectValue element) => list.removeLast(element);
    
    prune() => list.prune();
    
    truncate(Integer size) => list.truncate(size);
    
    replace(ObjectValue val, JsonValue newVal) 
            =>	list.replace (
        			val,
        			if ( is JsonList newVal )
        			then MutableJsonList( newVal )
        			else if ( is JsonMap newVal )
        			then MutableJsonMap( newVal )
        			else newVal
    			);
    
    replaceFirst(ObjectValue element, JsonValue replacement) 
            => list.replaceFirst (
        			element,
        			if ( is JsonList replacement )
        			then MutableJsonList( replacement )
        			else if ( is JsonMap replacement )
        			then MutableJsonMap( replacement )
        			else replacement
        		);
    
    replaceLast(ObjectValue element, JsonValue replacement) 
            => list.replaceLast (
        		element,
        		if ( is JsonList replacement )
        		then MutableJsonList( replacement )
        		else if ( is JsonMap replacement )
        		then MutableJsonMap( replacement )
        		else replacement
        	);
    
    infill(JsonValue replacement) => list.infill (
        if ( is JsonList replacement )
        then MutableJsonList( replacement )
        else if ( is JsonMap replacement )
        then MutableJsonMap( replacement )
        else replacement
    );
    
    set(Integer index, JsonValue val) => list.set (
        index,
        if ( is JsonList val )
        then MutableJsonList( val )
        else if ( is JsonMap val )
        then MutableJsonMap( val )
        else val
    );
    
    hash => list.hash;
    
    shared actual Boolean equals(Object that) {
        if ( is JsonArray that ) {
            return ( super of List<JsonValue> ).equals( that );
        }
        else {
            return false;
        }
    }
   
}
