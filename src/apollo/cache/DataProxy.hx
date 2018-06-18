package apollo.cache;

import graphql.ASTDefs.DocumentNode;

typedef Query<TVariables> = {
	var query:DocumentNode;
	@:optional var variables:TVariables;
}

typedef Fragment<TVariables> = {
	var id:String;
	var fragment:DocumentNode;
	@:optional var fragmentName:String;
	@:optional var variables:TVariables;
}

typedef WriteQueryOptions<TData, TVariables> = {
	> Query<TVariables>,
	var data:TData;
}

typedef WriteFragmentOptions<TData, TVariables> = {
	> Fragment<TVariables>,
	var data:TData;
}

typedef WriteDataOptions<TData> = {
	var data:TData;
	@:optional var id:String;
}

typedef DiffResult<T> = {
	@:optional var result:T;
	@:optional var complete:Bool;
}

interface DataProxy {
	public function readQuery<QueryType, TVariables>(options:Query<TVariables>):Null<QueryType>;

	public function readFragment<FragmentType, TVariables>(options:Fragment<TVariables>):Null<FragmentType>;

	public function writeQuery<TData, TVariables>(
		options:WriteQueryOptions<TData, TVariables>
	):Void;

	public function writeFragment<TData, TVariables>(
		options:WriteFragmentOptions<TData, TVariables>
	):Void;

	public function writeData<TData>(options:WriteDataOptions<TData>):Void;
}
