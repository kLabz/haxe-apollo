package apollo.client.core;

import js.Promise;

import apollo.client.core.SubscribeToMoreOptions;
import apollo.client.core.WatchQueryOptions;
import apollo.client.error.ApolloError;
import apollo.client.scheduler.QueryScheduler;
import apollo.util.Observable;

typedef ObservableQueryInit<TVariables> = {
	var scheduler:QueryScheduler<Any>;
	var options:WatchQueryOptions_1<TVariables>;
	@:optional var shouldSubscribe:Bool;
}

typedef ObservableQuery = ObservableQuery_2<Any, OperationVariables>;
typedef ObservableQuery_1<TData> = ObservableQuery_2<TData, OperationVariables>;

extern class ObservableQuery_2<TData, TVariables> extends Observable<ApolloQueryResult<TData>> {

	public var options:WatchQueryOptions_1<TVariables>;
	public var queryId:String;
	public var variables:TVariables;

	public function new(init:ObservableQueryInit<TVariables>);

	public function result():Promise<ApolloQueryResult<TData>>;
	public function currentResult():ApolloCurrentResult<TData>;
	public function getLastResult():ApolloQueryResult<TData>;
	public function getLastError():ApolloError;
	public function resetLastResults():Void;
	public function refetch(?variables:TVariables):Promise<ApolloQueryResult<TData>>;
	// public function fetchMore<K extends keyof TVariables>(...) // TODO
	public function subscribeToMore(options:SubscribeToMoreOptions_2<TData, TVariables>):Void->Void;
	public function setOptions(options:ModifiableWatchQueryOptions):Promise<ApolloQueryResult<TData>>;
	public function setVariables(
		variables:TVariables,
		tryFetch:Bool = false,
		fetchResults:Bool = true
	):Promise<ApolloQueryResult<TData>>;

	public function updateQuery(mapFn:TData->UpdateQueryOptions<TVariables>->TData):Void;
	public function stopPolling():Void;
	public function starrtPolling(pollInterval:Float):Void;
}

