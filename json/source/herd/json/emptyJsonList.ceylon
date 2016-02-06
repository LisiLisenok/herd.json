
"empty JSON array"
shared interface EmptyJsonList of emptyJsonList satisfies JsonArray
{
	shared actual EmptyJsonList immutable() => this;

	"Returns `null` for any given index."
	shared actual Null getFromLast(Integer index) => null;
	
	"Returns `null` for any given index."
	shared actual Null getFromFirst(Integer index) => null;
	
	"Returns `false` for any given element."
	shared actual Boolean contains(Object element) => false;
	
	"Returns `false` for any given index."
	shared actual Boolean defines(Integer index) => false;
	
	"Returns `[]`."
	shared actual [] keys => [];
	
	"Returns `[]`."
	shared actual [] indexes() => [];
	
	"Returns `true`."
	shared actual Boolean empty => true;
	
	"Returns 0."
	shared actual Integer size => 0; 
	
	"Returns `EmptyJsonArray`."
	shared actual EmptyJsonList reversed => this;
	
	"Returns `[]`."
	shared actual [] sequence() => [];
	
	"Returns a string description of the empty sequence: 
	 `[]`."
	shared actual String string => "emptyArray";
	
	"Returns `null`."
	shared actual Null lastIndex => null; 
	
	"Returns `null`."
	shared actual Null first => null;
	
	"Returns `null`."
	shared actual Null last => null;
	
	"Returns `EmptyJsonArray`."
	shared actual EmptyJsonList rest => this;
	
	"Returns `EmptyJsonArray`."
	shared actual EmptyJsonList clone() => this;
	
	"Returns `[]`."
	shared actual [] coalesced => [];
	
	"Returns `[]`."
	shared actual [] indexed => [];
	
	"Returns `EmptyJsonArray`."
	shared actual EmptyJsonList repeat(Integer times) => this;
	
	"Returns `EmptyJsonArray`."
	shared actual EmptyJsonList cycled => this;
	
	"Returns `[]`."
	shared actual [] paired => [];
	
	"Returns an iterator that is already exhausted."
	shared actual 
	Iterator<Nothing> iterator() => emptyIterator;
	
	"Returns `EmptyJsonArray` for any given measure."
	shared actual 
	EmptyJsonList measure(Integer from, Integer length) => this;
	
	"Returns `EmptyJsonArray` for any given span."
	shared actual 
	EmptyJsonList span(Integer from, Integer to) => this;
	
	"Returns `EmptyJsonArray` for any given span."
	shared actual 
	EmptyJsonList spanTo(Integer to) => this;
	
	"Returns `EmptyJsonArray` for any given span."
	shared actual 
	EmptyJsonList spanFrom(Integer from) => this;
	
	"Returns the given [[other]] iterable object."
	shared actual 
	Iterable<Other,OtherAbsent> 
			chain<Other,OtherAbsent>
			(Iterable<Other,OtherAbsent> other) 
			given OtherAbsent satisfies Null 
			=> other;
	
	shared actual 
	[] defaultNullElements<Default>
			(Default defaultValue) 
			given Default satisfies Object
			=> [];
	
	"Returns 0 for any given predicate."
	shared actual 
	Integer count(Boolean selecting(JsonValue element)) 
			=> 0;
	
	shared actual 
	[] map<Result>(Result collecting(JsonValue element)) 
			=> [];
	
	shared actual 
	[] flatMap<Result, OtherAbsent>
			(Iterable<Result,OtherAbsent> collecting(JsonValue element))
			given OtherAbsent satisfies Null 
			=> [];
	
	shared actual 
	[](*Args) spread<Result,Args>
			(Result(*Args) method(JsonValue element))
			given Args satisfies Anything[] 
			=> flatten((Args args) => []);
	
	shared actual 
	EmptyJsonList filter(Boolean selecting(JsonValue v)) 
			=> this;
	
	shared actual 
	Result fold<Result>(Result initial)
	(Result accumulating(Result partial, 
		JsonValue element)) 
			=> initial;
	
	shared actual 
	Null reduce<Result>
			(Result accumulating(Result|JsonValue partial, 
		JsonValue element))
			=> null;
	
	shared actual 
	Null find(Boolean selecting(ObjectValue element)) 
			=> null;
	
	shared actual 
	[] sort(Comparison comparing(JsonValue a, JsonValue b)) 
			=> [];
	
	shared actual 
	[] collect<Result>(Result collecting(JsonValue element)) 
			=> [];
	
	shared actual 
	[] select(Boolean selecting(JsonValue element))
			=> [];
	
	shared actual 
	Boolean any(Boolean selecting(JsonValue element)) 
			=> false;
	
	shared actual 
	Boolean every(Boolean selecting(JsonValue element)) 
			=> true;
	
	shared actual 
	EmptyJsonList skip(Integer skipping) => this;
	
	shared actual 
	EmptyJsonList take(Integer taking) => this;
	
	shared actual 
	EmptyJsonList skipWhile(Boolean skipping(JsonValue elem)) => this;
	
	shared actual 
	EmptyJsonList takeWhile(Boolean taking(JsonValue elem)) => this;
	
	shared actual 
	EmptyJsonList by(Integer step) => this;
	
	shared actual 
	{Other+} follow<Other>(Other head) => { head };
	
	shared actual 
	EmptyJsonList sublist(Integer from, Integer to) => this;
	
	shared actual 
	EmptyJsonList sublistFrom(Integer from) => this;
	
	shared actual 
	EmptyJsonList sublistTo(Integer to) => this;
	
	shared actual 
	EmptyJsonList initial(Integer length) => this;
	
	shared actual 
	EmptyJsonList terminal(Integer length) => this;
	
	shared actual 
	[] indexesWhere(Boolean selecting(ObjectValue element)) 
			=> [];
	
	shared actual 
	Null firstIndexWhere(Boolean selecting(ObjectValue element)) 
			=> null;
	
	shared actual 
	Null lastIndexWhere(Boolean selecting(ObjectValue element)) 
			=> null;
	
	shared actual 
	EmptyJsonList trim(Boolean trimming(ObjectValue elem)) => this;
	
	shared actual 
	EmptyJsonList trimLeading(Boolean trimming(ObjectValue elem)) => this;
	
	shared actual 
	EmptyJsonList trimTrailing(Boolean trimming(ObjectValue elem)) => this;
	
	shared actual 
	[EmptyJsonList,EmptyJsonList] slice(Integer index) => [this, this];
	
	shared actual 
	void each(void step(JsonValue element)) {}
}


shared object emptyJsonList extends Object() satisfies EmptyJsonList
{}
