
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
	shared Integer getInteger(String key){
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
	shared Float getFloat(String key){
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
	shared Boolean getBoolean(String key){
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
	shared String getString(String key){
		value val = get(key);
		if(is String val){
			return val;
		}
		throw InvalidTypeException(
			"Expecting a String but got: `` 
			val else "null" ``");
	}
	
	"Returns an [[Object]] value."
	throws(`class InvalidTypeException`,
		"If the key dot not exist or points to a type that 
		 is not [[Object]].")
	shared JsonObject getObject(String key){
		value val = get(key);
		if(is JsonObject val){
			return val;
		}
		throw InvalidTypeException(
			"Expecting an Object but got: `` 
			val else "null" ``");
	}
	
	"Returns an [[Array]] value."
	throws(`class InvalidTypeException`,
		"If the key dot not exist or points to a type that 
		 is not [[Array]].")
	shared JsonArray getArray(String key){
		value val = get(key);
		if(is JsonArray val){
			return val;
		}
		throw InvalidTypeException(
			"Expecting an Array but got: `` 
			val else "null" ``");
	}
	
	// optional auto-casting
	
	"Returns an [[Integer]] value, unless the key does not 
	 exist, or the value is null."
	throws(`class InvalidTypeException`,
		"If the key points to a type that is neither 
		 [[Integer]] nor [[Null]].")
	shared Integer? getIntegerOrNull(String key){
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
	shared Float? getFloatOrNull(String key){
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
	shared Boolean? getBooleanOrNull(String key){
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
	shared String? getStringOrNull(String key){
		value val = get(key);
		if(is String|Null val){
			return val;
		}
		else {
			throw InvalidTypeException(
				"Expecting a String but got: ``val``");
		}
	}
	
	"Returns an [[Object]] value, unless the key does not 
	 exist, or the value is null."
	throws(`class InvalidTypeException`,
		"If the key points to a type that is neither 
		 [[Object]] nor [[Null]].")
	shared JsonObject? getObjectOrNull(String key){
		value val = get(key);
		if(is JsonObject? val){
			return val;
		}
		else {
			throw InvalidTypeException(
				"Expecting an Object but got: ``val``");
		}
	}
	
	"Returns an [[Array]] value, unless the key does not 
	 exist, or the value is null."
	throws(`class InvalidTypeException`,
		"If the key points to a type that is neither 
		 [[Array]] nor [[Null]].")
	shared JsonArray? getArrayOrNull(String key){
		value val = get(key);
		if(is JsonArray? val){
			return val;
		}
		else {
			throw InvalidTypeException(
				"Expecting an Array but got: ``val``");
		}
	}
	
}
