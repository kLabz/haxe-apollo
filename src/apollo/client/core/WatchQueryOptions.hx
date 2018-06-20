package apollo.client.core;

import apollo.client.core.QueryOptions;

typedef ModifiableWatchQueryOptions = ModifiableWatchQueryOptions_1<OperationVariables>;
typedef ModifiableWatchQueryOptions_1<TVariables> = {
	> QueryBaseOptions_1<TVariables>,
	@:optional var pollInterval:Float;
	@:optional var notifyOnNetworkStatusChange:Bool;
}

typedef WatchQueryOptions = WatchQueryOptions_1<OperationVariables>;
typedef WatchQueryOptions_1<TVariables> = {
	> QueryOptions_1<TVariables>,
	> ModifiableWatchQueryOptions_1<TVariables>,
}

// TODO: FetchMoreQueryOptions<TVariables, K extends keyof TVariables>
