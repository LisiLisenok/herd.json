
"Base representation of a JSON Object, one of:
 * mutable
 * immutable
 * empty
 "
shared interface JsonObject
		of MutableJsonMap | JsonMap | EmptyJsonMap
		satisfies Map<String, JsonValue>
{
	
	"generates immutable JSON object using key->item pairs this object contains"
	shared formal JsonObject immutable();
	
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
	
	"Returns an [[Integer]] value."
	throws(`class InvalidTypeException`,
		"If the key dot not exist or points to a type that 
		 is not [[Integer]].")
	shared default Integer getInteger(String key){
		value val = get(key);
		if(is Integer val){
			return val;
		}
		throw InvalidTypeException(
			"Expecting an Integer but got: ``
			val else "null" ``");
	}
	
	"Returns an [[Float]] value."
	throws(`class InvalidTypeException`,
		"If the key dot not exist or points to a type that 
		 is not [[Float]].")
	shared default Float getFloat(String key){
		value val = get(key);
		if(is Float val){
			return val;
		}
		throw InvalidTypeException(
			"Expecting a Float but got: `` 
			val else "null" ``");
	}
	
	"Returns an [[Boolean]] value."
	throws(`class InvalidTypeException`,
		"If the key dot not exist or points to a type that 
		 is not [[Boolean]].")
	shared default Boolean getBoolean(String key){
		value val = get(key);
		if(is Boolean val){
			return val;
		}
		throw InvalidTypeException(
			"Expecting a Boolean but got: `` 
			val else "null" ``");
	}
	
	"Returns an [[String]] value."
	throws(`class InvalidTypeException`,
		"If the key dot not exist or points to a type that 
		 is not [[String]].")
	shared default String getString(String key){
		value val = get(key);
		if(is String val){
			return val;
		}
		throw InvalidTypeException(
			"Expecting a String but got: `` 
			val else "null" ``");
	}
	
	"Returns an [[JsonObject]] value."
	throws(`class InvalidTypeException`,
		"If the key dot not exist or points to a type that 
		 is not [[JsonObject]].")
	shared default JsonObject getJsonObject(String key){
		value val = get(key);
		if(is JsonObject val){
			return val;
		}
		throw InvalidTypeException(
			"Expecting an JsonObject but got: `` 
			val else "null" ``");
	}
	
	"Returns an [[JsonArray]] value."
	throws(`class InvalidTypeException`,
		"If the key dot not exist or points to a type that 
		 is not [[JsonArray]].")
	shared default JsonArray getJsonArray(String key){
		value val = get(key);
		if(is JsonArray val){
			return val;
		}
		throw InvalidTypeException(
			"Expecting an JsonArray but got: `` 
			val else "null" ``");
	}
	
	// optional auto-casting
	
	"Returns an [[Integer]] value, unless the key does not 
	 exist, or the value is null."
	throws(`class InvalidTypeException`,
		"If the key points to a type that is neither 
		 [[Integer]] nor [[Null]].")
	shared default Integer? getIntegerOrNull(String key){
		value val = get(key);
		if(is Integer? val){
			return val;
		}
		else {
			throw InvalidTypeException(
				"Expecting an Integer but got: ``val``");
		}
	}
	
	"Returns an [[Float]] value, unless the key does not 
	 exist, or the value is null."
	throws(`class InvalidTypeException`,
		"If the key points to a type that is neither 
		 [[Float]] nor [[Null]].")
	shared default Float? getFloatOrNull(String key){
		value val = get(key);
		if(is Float? val){
			return val;
		}
		else {
			throw InvalidTypeException(
				"Expecting a Float but got: ``val``");
		}
	}
	
	"Returns an [[Boolean]] value, unless the key does not 
	 exist, or the value is null."
	throws(`class InvalidTypeException`,
		"If the key points to a type that is neither 
		 [[Boolean]] nor [[Null]].")
	shared default Boolean? getBooleanOrNull(String key){
		value val = get(key);
		if(is Boolean? val){
			return val;
		}
		else {
			throw InvalidTypeException(
				"Expecting a Boolean but got: ``val``");
		}
	}
	
	"Returns an [[String]] value, unless the key does not 
	 exist, or the value is null."
	throws(`class InvalidTypeException`,
		"If the key points to a type that is neither 
		 [[String]] nor [[Null]].")
	shared default String? getStringOrNull(String key){
		value val = get(key);
		if(is String|Null val){
			return val;
		}
		else {
			throw InvalidTypeException(
				"Expecting a String but got: ``val``");
		}
	}
	
	"Returns an [[JsonObject]] value, unless the key does not 
	 exist, or the value is null."
	throws(`class InvalidTypeException`,
		"If the key points to a type that is neither 
		 [[JsonObject]] nor [[Null]].")
	shared default JsonObject? getJsonObjectOrNull(String key){
		value val = get(key);
		if(is JsonObject? val){
			return val;
		}
		else {
			throw InvalidTypeException(
				"Expecting an JsonObject but got: ``val``");
		}
	}
	
	"Returns an [[JsonArray]] value, unless the key does not 
	 exist, or the value is null."
	throws(`class InvalidTypeException`,
		"If the key points to a type that is neither 
		 [[JsonArray]] nor [[Null]].")
	shared default JsonArray? getJsonArrayOrNull(String key){
		value val = get(key);
		if(is JsonArray? val){
			return val;
		}
		else {
			throw InvalidTypeException(
				"Expecting an JsonArray but got: ``val``");
		}
	}
	
}
