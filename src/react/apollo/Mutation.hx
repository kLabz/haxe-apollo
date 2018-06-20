package react.apollo;

import haxe.extern.EitherType;
import js.Promise;

import apollo.cache.DataProxy;
import apollo.client.ApolloClient;
import apollo.client.core.OperationVariables;
import apollo.client.core.PureQueryOptions;
import apollo.client.error.ApolloError;
import apollo.link.FetchResult;
import apollo.util.Noise;
import react.ReactComponent;
import graphql.ASTDefs.DocumentNode;

typedef MutationResult<TData> = {
	@:optional var data:TData;
	@:optional var error:ApolloError;
	var loading:Bool;
	var called:Bool;
	var client:ApolloClient<{}>;
}

typedef MutationUpdaterFn<T> = DataProxy -> FetchResult_1<T> -> Void;

typedef MutationOptions<TData, TVariables> = {
	@:optional var variables:TVariables;
	@:optional var opitmisticResponse:{};
	@:optional var refetchQueries:EitherType<Array<String>, EitherType<Array<PureQueryOptions>, RefetchQueriesProviderFn>>;
	@:optional var update:MutationUpdaterFn<TData>;
}

typedef MutationFn<TData, TVariables> = EitherType<?MutationOptions<TData, TVariables>->Promise<Noise>, ?MutationOptions<TData, TVariables>->Promise<FetchResult_1<TData>>>;

typedef MutationProps<TData, TVariables> = {
	var mutation:DocumentNode;
	var children:MutationFn<TData, TVariables>->MutationResult<TData>->ReactElement;
	@:optional var ignoreResults:Bool;
	@:optional var optimisticResponse:{};
	@:optional var variables:TVariables;
	@:optional var refetchQueries:EitherType<Array<String>, EitherType<Array<PureQueryOptions>, RefetchQueriesProviderFn>>;
	@:optional var update:MutationUpdaterFn<TData>;
	@:optional var onCompleted:TData->Void;
	@:optional var onError:ApolloError->Void;
	@:optional var client:ApolloClient<{}>;
	@:optional var context:Dynamic<Any>;
}

@:jsRequire('react-apollo', 'Mutation')
extern class Mutation<TData, TVariables>
	extends ReactComponentOfProps<MutationProps<TData, TVariables>> {}
