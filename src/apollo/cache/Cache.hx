package apollo.cache;

import apollo.cache.DataProxy;

extern class Cache {}

typedef WatchCallback = Any -> Void;

typedef EvictionResult = {
	var success:Bool;
}

typedef ReadOptions = ReadOptions_1<Any>;
typedef ReadOptions_1<TVariables> = {
	> Query<TVariables>,
	@:optional var rootId:String;
	@:optional var previousResult:Any;
	var optimistic:Bool;
}

typedef WriteOptions = WriteOptions_2<Any, Any>;
typedef WriteOptions_1<TResult> = WriteOptions_2<TResult, Any>;
typedef WriteOptions_2<TResult, TVariables> = {
	> Query<TVariables>,
	var dataId:String;
	var result:TResult;
}

typedef DiffOptions = {
	> ReadOptions,
	@:optional var returnPartialData:Bool;
}

typedef WatchOptions = {
	> ReadOptions,
	var callback:WatchCallback;
}

typedef EvictOptions = EvictOptions_1<Any>;
typedef EvictOptions_1<TVariables> = {
	> Query<TVariables>,
	@:optional var rootId:String;
}

