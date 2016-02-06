
"A JSON value, a [[String]], [[Boolean]], [[Integer]],
 [[Float]], JSON [[Object]], JSON [[Array]], or 
 [[Null]]."
shared alias JsonValue 
        => ObjectValue|Null;

"A JSON value, a [[String]], [[Boolean]], [[Integer]],
 [[Float]], JSON [[Object]], or JSON [[Array]].
 
 This means [[JsonValue]] except [[Null]]."
shared alias ObjectValue
		=> String | Boolean | Integer | Float |
		JsonObject | JsonArray;


"`true` if `first` and `second` are equals and `false` otherwise"
Boolean equalJsonValue( JsonValue first, JsonValue second ) {
	if ( exists f = first ) {
		if ( exists s = second ) {
			return f == s;
		}
		else {
			return false;
		}
	}
	else {
		return !second exists;
	}
}
