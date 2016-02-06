import ceylon.collection {
	HashMap,
	MutableMap
}


"Represents a mutable JSON Object.  
 All JSON array and JSON Object items of the map are mutable.
 If immutable item added - new mutable item contains the same elements as original is created and added instead
 "
shared class MutableJsonMap({<String->JsonValue>*} values = {}) 
        satisfies JsonObject&MutableMap<String,JsonValue>
{
    
    value content = HashMap<String,JsonValue> {
        for ( key->item in values )
        	if ( is JsonList item )
        	then key->MutableJsonList( item )
        	else if ( is JsonMap item )
        	then key->MutableJsonMap( item )
        	else key->item
 		};

    
    shared actual void clear() => content.clear();
    
    shared actual Boolean empty => content.empty;
    
    "returns immutable array with items currently stored in this"
    shared actual JsonObject immutable()
            =>	if ( empty ) then emptyJsonMap
    			else JsonMap( this );

    
    shared actual MutableJsonMap clone()
        => MutableJsonMap {
            for ( key->val in content )
            if ( is MutableJsonList val )
            then key->val.clone()
            else if ( is MutableJsonMap val )
            then key->val.clone()
            else key->val
        };
    
    
    get(Object key) => content[key];
    
    defines(Object key) => content.defines(key);
    
    iterator() => content.iterator();
    
    put(String key, JsonValue item)
    		=>	content.put (
        			key,	
            		if ( is JsonList item )
            		then MutableJsonList( item )
            		else if ( is JsonMap item )
            		then MutableJsonMap( item )
            		else item
            	);

    
    putAll({<String->JsonValue>*} entries) 
            =>	content.putAll {
        			for ( key->item in entries )
        				if ( is JsonList item )
        				then key->MutableJsonList( item )
        				else if ( is JsonMap item )
        				then key->MutableJsonMap( item )
        				else key->item
				};
    
    remove(String key) => content.remove(key);
    
    size => content.size;
    
    hash => content.hash;
    
    shared actual Boolean equals(Object that) {
        if ( is JsonObject that ) {
        	return ( super of Map<String, JsonValue> ).equals( that );
        }
        else {
            return false;
        }
    }
    
}
