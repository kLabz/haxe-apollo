package apollo.client.core;

import haxe.Constraints.Function;
import haxe.extern.EitherType;
import js.Error;

import apollo.cache.DataProxy;
import apollo.client.core.MutationQueryReducer;
import apollo.link.FetchResult;
import graphql.ASTDefs.DocumentNode;
import graphql.ExecutionResult;

@:enum abstract FetchPolicy(String) to String {
	var CacheFirst = 'cache-first';
	var CacheAndNetwork = 'cache-and-network';
	var NetworkOnly = 'network-only';
	var CacheOnly = 'cache-only';
	var NoCache = 'no-cache';
	var Standby = 'standby';
}

@:enum abstract ErrorPolicy(String) to String {
	var None = 'none';
	var Ignore = 'ignore';
	var All = 'all';
}


typedef QueryBaseOptions = QueryBaseOptions_1<OperationVariables>;
typedef QueryBaseOptions_1<TVariables> = {
	@:optional var variables:TVariables;
	@:optional var fetchPolicy:FetchPolicy;
	@:optional var errorPolicy:ErrorPolicy;
	@:optional var fetchResults:Bool;
}

typedef QueryOptions = QueryOptions_1<OperationVariables>;
typedef QueryOptions_1<TVariables> = {
	> QueryBaseOptions_1<TVariables>,
	var query:DocumentNode;
	@:optional var metatada:Any;
	@:optional var context:Any;
}

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

typedef UpdateQueryFn = UpdateQueryFn_2<Any, OperationVariables>;
typedef UpdateQueryFn_1<TData> = UpdateQueryFn_2<TData, OperationVariables>;
typedef UpdateQueryFn_2<TData, TVariables> = TData -> {subscriptionData: {data: TData}, ?variables:TVariables} -> TData;

typedef SubscribeToMoreOptions = SubscribeToMoreOptions_2<Any, OperationVariables>;
typedef SubscribeToMoreOptions_1<TData> = SubscribeToMoreOptions_2<TData, OperationVariables>;
typedef SubscribeToMoreOptions_2<TData, TVariables> = {
	var document:DocumentNode;
	@:optional var variables:TVariables;
	@:optional var updateQuery:UpdateQueryFn_2<TData, TVariables>;
	@:optional var onError:Error->Void;
}

typedef SubscriptionOptions = {
	var query:DocumentNode;
	@:optional var variables:Dynamic<Any>;
}

typedef RefetchQueryDescription = Array<EitherType<String, PureQueryOptions>>;

typedef MutationBaseOptions = MutationBaseOptions_1<Dynamic<Any>>;
typedef MutationBaseOptions_1<T> = {
	@:optional var optimisticResponse:EitherType<{}, Function>;
	@:optional var updateQueries:MutationQueryReducersMap_1<T>;
	@:optional var refetchQueries:EitherType<ExecutionResult->RefetchQueryDescription, RefetchQueryDescription>;
	@:optional var update:MutationUpdaterFn_1<T>;
	@:optional var errorPolicy:ErrorPolicy;
	@:optional var variables:Any;
}

typedef MutationOptions = MutationOptions_1<Dynamic<Any>>;
typedef MutationOptions_1<T> = {
	> MutationBaseOptions_1<T>,
	var mutation:DocumentNode;
	@:optional var context:Any;
	@:optional var fetchPolicy:FetchPolicy;
}

typedef MutationUpdaterFn = MutationUpdaterFn_1<Dynamic<Any>>;
typedef MutationUpdaterFn_1<T> = DataProxy -> FetchResult_1<T> -> Void;

