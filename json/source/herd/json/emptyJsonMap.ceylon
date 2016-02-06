
"empty JSON object"
shared interface EmptyJsonMap of emptyJsonMap satisfies JsonObject
{
	get(Object key) => null;
	
	shared actual EmptyJsonMap immutable() => this;
	
	shared actual Default getOrDefault<Default>
			(Object key, Default default) => default;
	
	keys => emptySet;
	items => emptySet;
	
	clone() => this;
	iterator() => emptyIterator;
	size => 0;
	empty => true;
	
	defines(Object index) => false;
	
	contains(Object element) => false;
	containsAny({Object*} elements) => false;
	containsEvery({Object*} elements) => false;
	
	shared actual 
	Map<Nothing, Nothing> mapItems<Result>
			(Result mapping(String key, JsonValue item))
			given Result satisfies Object 
			=> emptyMap;
	
	count(Boolean selecting(String->JsonValue element)) => 0;
	any(Boolean selecting(String->JsonValue element)) => false;
	every(Boolean selecting(String->JsonValue element)) => true;
	
	shared actual 
	Null find(Boolean selecting(String->JsonValue element)) 
			=> null;
	
	shared actual 
	Null findLast(Boolean selecting(String->JsonValue element)) 
			=> null;
	
	skip(Integer skipping) => this;
	take(Integer taking) => this;
	by(Integer step) => this;
	
	shared actual 
	void each(void step(String->JsonValue element)) {}
	
}

shared object emptyJsonMap extends Object() satisfies EmptyJsonMap
{}
