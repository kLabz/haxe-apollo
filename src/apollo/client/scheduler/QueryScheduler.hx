package apollo.client.scheduler;

import js.Promise;

import apollo.client.core.FetchType;
import apollo.client.core.ObservableQuery;
import apollo.client.core.QueryListener;
import apollo.client.core.QueryManager;
import apollo.client.core.WatchQueryOptions;
import apollo.util.Noise;

typedef QuerySchedulerInit<TCacheShape> = {
	var queryManager:QueryManager<TCacheShape>;
	@:optional var ssrMode:Bool;
}

extern class QueryScheduler<TCacheShape> {
	public var inFlightQueries:Dynamic<WatchQueryOptions>;
	public var registeredQueries:Dynamic<WatchQueryOptions>;
	public var intervalQueries:ArrayAccess<Array<String>>;
	public var queryManager:QueryManager<TCacheShape>;

	public function new(init:QuerySchedulerInit<TCacheShape>);

	public function fetchQuery<T>(queryId:String, options:WatchQueryOptions, fetchType:FetchType):Promise<Noise>;
	public function startPollingQuery<T>(options:WatchQueryOptions, queryId:String, ?listener:QueryListener):String;
	public function stopPollingQuery(queryId:String):Void;
	public function fetchQueriesOnInterval<T>(interval:Float):Void;
	public function addQueryOnInterval<T>(queryId:String, queryOptions:WatchQueryOptions):Void;
	public function registerPollingQuery<T>(queryOptions:WatchQueryOptions):ObservableQuery_1<T>;
}

