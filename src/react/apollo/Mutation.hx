package react.apollo;

import haxe.Constraints.Function;
import js.Promise;

import apollo.cache.DataProxy;
import apollo.client.ApolloClient;
import apollo.client.core.OperationVariables;
import apollo.client.core.PureQueryOptions;
import apollo.client.error.ApolloError;
import apollo.link.FetchResult;
import apollo.util.Noise;
import graphql.ASTDefs.DocumentNode;
import react.ReactComponent;

typedef MutationResult<TData> = {
	@:optional var data:TData;
	@:optional var error:ApolloError;
	var loading:Bool;
	var called:Bool;
	var client:ApolloClient<Any>;
}

typedef MutationUpdaterFn<T> = DataProxy -> FetchResult_1<T> -> Void;

typedef MutationOptions<TData, TVariables> = {
	@:optional var variables:TVariables;
	@:optional var opitmisticResponse:{};
	@:optional var refetchQueries:RefetchQueries;
	@:optional var update:MutationUpdaterFn<TData>;
}

@:coreType
abstract RefetchQueries
	from Array<String>
	from Array<PureQueryOptions>
	from RefetchQueriesProviderFn
	{}

@:callable
abstract MutationFn<TData, TVariables>(Function)
	from Void->Void
	from Void->Promise<Noise>
	from Void->Promise<FetchResult_1<TData>>
	from ?MutationOptions<TData, TVariables>->Promise<Noise>
	from ?MutationOptions<TData, TVariables>->Promise<FetchResult_1<TData>>
	{}

typedef MutationProps<TData, TVariables> = {
	var mutation:DocumentNode;
	var children:MutationFn<TData, TVariables>->MutationResult<TData>->ReactFragment;
	@:optional var ignoreResults:Bool;
	@:optional var optimisticResponse:{};
	@:optional var variables:TVariables;
	@:optional var refetchQueries:RefetchQueries;
	@:optional var update:MutationUpdaterFn<TData>;
	@:optional var onCompleted:TData->Void;
	@:optional var onError:ApolloError->Void;
	@:optional var client:ApolloClient<Any>;
	@:optional var context:Dynamic<Any>;
}

@:jsRequire('react-apollo', 'Mutation')
extern class Mutation<TData, TVariables>
extends ReactComponentOfProps<MutationProps<TData, TVariables>> {}
