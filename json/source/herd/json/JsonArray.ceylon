
"Base representation of a JSON Array, one of:
 * mutable - [[MutableJsonList]]
 * immutable - [[JsonList]]
 * empty - [[EmptyJsonList]]
 "
shared interface JsonArray
		of MutableJsonList | JsonList | EmptyJsonList
		satisfies List<JsonValue>
{
	
	"generates immutable JSON array using items this array contains"
	shared formal JsonArray immutable();
	
	"Returns a serialised JSON representation"
	shared actual default String string {
		StringEmitter p = StringEmitter();
		visit(this, p);
		return p.string;
	}
	
	"Returns a pretty-printed serialised JSON representation"
	shared default String pretty {
		StringEmitter p = StringEmitter(true);
		visit(this, p, true);
		return p.string;
	}
		
	
	// auto-casting
	
	throws(`class InvalidTypeException`)
	JsonObject checkObject(JsonValue val){
		if(is JsonObject val){
			return val;
		}
		throw InvalidTypeException(
			"Expecting Object but got `` val else "null" ``");
	}
	
	"Returns this array as a sequence of [[Object]] elements."
	throws(`class InvalidTypeException`,
		"If one element in this array is not an [[Object]].")
	shared Iterable<JsonObject> objects 
			=> { for (elem in this) checkObject(elem) };
	
	throws(`class InvalidTypeException`)
	String checkString(JsonValue val){
		if(is String val){
			return val;
		}
		throw InvalidTypeException(
			"Expecting String but got `` val else "null" ``");
	}
	
	"Returns this array as a sequence of [[String]] elements."
	throws(`class InvalidTypeException`,
		"If one element in this array is not a [[String]].")
	shared Iterable<String> strings 
			=> { for (elem in this) checkString(elem) };
	
	throws(`class InvalidTypeException`)
	Integer checkInteger(JsonValue val){
		if(is Integer val){
			return val;
		}
		throw InvalidTypeException(
			"Expecting Integer but got `` val else "null" ``");
	}
	
	"Returns this array as a sequence of [[Integer]] elements."
	throws(`class InvalidTypeException`,
		"If one element in this array is not a [[Integer]].")
	shared Iterable<Integer> integers 
			=> { for (elem in this) checkInteger(elem) };
	
	throws(`class InvalidTypeException`)
	Float checkFloat(JsonValue val){
		if(is Float val){
			return val;
		}
		throw InvalidTypeException(
			"Expecting Float but got `` val else "null" ``");
	}
	
	"Returns this array as a sequence of [[Float]] elements."
	throws(`class InvalidTypeException`,
		"If one element in this array is not a [[Float]].")
	shared Iterable<Float> floats 
			=> { for (elem in this) checkFloat(elem) };
	
	throws(`class InvalidTypeException`)
	Boolean checkBoolean(JsonValue val){
		if(is Boolean val){
			return val;
		}
		throw InvalidTypeException(
			"Expecting Boolean but got `` val else "null" ``");
	}
	
	"Returns this array as a sequence of [[Boolean]] elements."
	throws(`class InvalidTypeException`,
		"If one element in this array is not a [[Boolean]].")
	shared Iterable<Boolean> booleans 
			=> { for (elem in this) checkBoolean(elem) };
	
	throws(`class InvalidTypeException`)
	JsonArray checkArray(JsonValue val){
		if(is JsonArray val){
			return val;
		}
		throw InvalidTypeException(
			"Expecting Array but got `` val else "null" ``");
	}
	
	"Returns this array as a sequence of [[Array]] elements."
	throws(`class InvalidTypeException`,
		"If one element in this array is not an [[Array]].")
	shared Iterable<JsonArray> arrays 
			=> { for (elem in this) checkArray(elem) };
	
}
