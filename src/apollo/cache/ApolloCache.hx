package apollo.cache;

import js.Promise;

import apollo.cache.Cache;
import apollo.cache.DataProxy;
import apollo.util.Noise;
import graphql.ASTDefs.DocumentNode;

typedef Transaction<T> = ApolloCache<T> -> Void;

@:jsRequire('apollo-cache', 'ApolloCache')
extern class ApolloCache<TSerialized> implements DataProxy {
	public function read<T, TVariables>(query:ReadOptions_1<TVariables>):Null<T>;
	public function write<TResult, TVariables>(write:WriteOptions):Void;
	public function diff<T>(query:Cache.DiffOptions):DiffResult<T>;
	public function watch(watch:WatchOptions):Void->Void;
	public function evict<TVariables>(query:EvictOptions_1<TVariables>):EvictionResult;
	public function reset():Promise<Noise>;

	public function restore(serializedState:TSerialized):ApolloCache<TSerialized>;
	public function extract(?optimistic:Bool):TSerialized;
	public function removeOptimistic(id:String):Void;
	public function performTransaction(transaction:Transaction<TSerialized>):Void;
	public function recordOptimisticTransaction(transaction:Transaction<TSerialized>, id:String):Void;

	public function transformDocument(document:DocumentNode):DocumentNode;
	public function transformForLink(document:DocumentNode):DocumentNode;

	@:overload(function<QueryType, TVariables>(options:Query<TVariables>, optimistic:Bool):Null<QueryType> {})
	public function readQuery<QueryType, TVariables>(options:Query<TVariables>):Null<QueryType>;

	@:overload(function<FragmentType, TVariables>(options:Fragment<TVariables>, optimistic:Bool):Null<FragmentType> {})
	public function readFragment<FragmentType, TVariables>(options:Fragment<TVariables>):Null<FragmentType>;

	public function writeQuery<TData, TVariables>(
		options:WriteQueryOptions<TData, TVariables>
	):Void;

	public function writeFragment<TData, TVariables>(
		options:WriteFragmentOptions<TData, TVariables>
	):Void;

	public function writeData<TData>(
		options:WriteDataOptions<TData>
	):Void;
}

