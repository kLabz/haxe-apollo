package apollo.client.core;

import js.Error;
import js.Promise;

import apollo.client.core.ObservableQuery;
import apollo.client.core.WatchQueryOptions;
import apollo.client.data.DataStore;
import apollo.client.data.MutationStore;
import apollo.client.data.QueryStore;
import apollo.client.scheduler.QueryScheduler;
import apollo.link.ApolloLink;
import apollo.link.FetchResult;
import apollo.link.Observable;
import apollo.util.Noise;
import graphql.ASTDefs.DocumentNode;

typedef QueryPromise = {
	var resolve:ApolloQueryResult<Any>->Void;
	var reject:Error->Void;
}

typedef QueryManagerInit<TStore> = {
	var link:ApolloLink;
	@:optional var queryDeduplication:Bool;
	var store:DataStore<TStore>;
	@:optional var onBroadcast:Void->Void;
	@:optional var ssrMode:Bool;
}

extern class QueryManager<TStore> {
	public var scheduler:QueryScheduler<TStore>;
	public var link:ApolloLink;
	public var mutationStore:MutationStore;
	public var queryStore:QueryStore;
	public var dataStore:DataStore<TStore>;

	private var deduplicator:ApolloLink;
	private var queryDeduplication:Bool;
	private var onBroadcast:Void->Void;
	private var idCounter:Int;
	private var queries:Map<String, QueryInfo>;
	private var fetchQueryPromises:Map<String, QueryPromise>;
	private var queryIdsByName:Dynamic<Array<String>>;

	public function new(init:QueryManagerInit<TStore>);

	public function mutate<T>(options:MutationOptions):Promise<FetchResult_1<T>>;

	public function fetchQuery<T>(
		queryId:String,
		options:WatchQueryOptions,
		?fetchType:FetchType
	):Promise<FetchResult_1<T>>;

	public function queryListenerForObserver<T>(
		queryId:String,
		options:WatchQueryOptions,
		observer:Observer<ApolloQueryResult<T>>
	):QueryListener;

	public function watchQuery<T>(
		options:WatchQueryOptions,
		shouldSubscribe:Bool = true
	):ObservableQuery_1<T>;

	public function query<T>(options:QueryOptions):Promise<ApolloQueryResult<T>>;

	public function generateQueryId():String;
	public function stopQueryInStore(queryId:String):Void;
	public function addQueryListener(queryId:String, listener:QueryListener):Void;
	public function updateQueryWatch(
		queryId:String,
		document:DocumentNode,
		options:WatchQueryOptions
	):Void->Void; // TODO: double check return type

	public function addFetchQueryPromise<T>(
		requestId:Int,
		resolve:ApolloQueryResult<T>->Void,
		reject:Error->Void
	):Void;

	public function removeFetchQueryPromise(requestId:Int):Void;
	public function removeObservableQuery(queriId:String):Void;
	public function clearStore():Promise<Noise>;
	public function resetStore():Promise<Array<ApolloQueryResult<Any>>>;

	public function reFetchObservableQueries(?includeStandby:Bool):Promise<Array<ApolloQueryResult<Any>>>;
	public function startQuery<T>(queryId:String, options:WatchQueryOptions, listener:QueryListener):String;
	public function startGraphQLSubscription(options:SubscriptionOptions):Observable<Any>;
	public function stopQuery(queryId:String):Void;
	public function removeQuery(queryid:String):Void;

	// public function getCurrentQueryResult<T>(
	// 	observableQuery:ObservableQuery<T>,
	// 	optimistic:Bool = true
	// ):TODO;

	// public function getQueryWithPreviousResult<T>(
	// 	queryIdOrObservable:EitherType<String, ObservableQuery<T>>
	// ):TODO;

	public function broadcastQueries():Void;
}
