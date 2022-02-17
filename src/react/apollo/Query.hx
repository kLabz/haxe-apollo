package react.apollo;

import js.lib.Promise;

import apollo.client.ApolloClient;
import apollo.client.core.ErrorPolicy;
import apollo.client.core.FetchPolicy;
import apollo.client.core.NetworkStatus;
import apollo.client.core.OperationVariables;
import apollo.client.error.ApolloError;
import react.ReactComponent;
import graphql.ASTDefs.DocumentNode;

typedef QueryResult<TData, TVariables> = {
	> ApolloQueryResult<TData>,

	var client:ApolloClient<Any>;
	var called:Bool;
	var loading:Bool;
	var networkStatus:NetworkStatus;
	var variables:TVariables;
	@:optional var previousData:TData;
	@:optional var error:ApolloError;

	var refetch:(
		?variables:TVariables // Partial<TVariables> ...
	)->Promise<ApolloQueryResult<TData>>;

	var fetchMore:{
		?query:DocumentNode,
		?variables:TVariables,
		?updateQuery:TUpdateQuery<TData, TVariables>
	}->Promise<ApolloQueryResult<TData>>;

	var startPolling:Int->Void;
	var stopPolling:Void->Void;

	var subscribeToMore:(
		options:{
			document:DocumentNode,
			?variables:TVariables,
			?updateQuery:TUpdateQuery<TData, TVariables>,
			?onError:ApolloError->Void
		}
	)->(()->Void);

	var updateQuery:TUpdateQuery<TData, TVariables>;
}

typedef ApolloQueryResult<TData> = {
	var data:Null<TData>;
};

typedef TUpdateQuery<TData, TVariables> = (
	previousResults:TData,
	options:{variables:TVariables}
)->TData;

typedef QueryProps<TData, TVariables> = {
	var query:DocumentNode;
	var children:QueryResult<TData, TVariables>->ReactFragment;
	@:optional var fetchPolicy:FetchPolicy;
	@:optional var errorPolicy:ErrorPolicy;
	@:optional var notifyOnNetworkStatusChange:Bool;
	@:optional var pollInterval:Float;
	@:optional var variables:TVariables;
	@:optional var ssr:Bool;
	@:optional var displayName:String;
	@:optional var skip:Bool;
	@:optional var client:ApolloClient<Any>;
	@:optional var context:Dynamic<Any>;
}

@:jsRequire('react-apollo', 'Query')
extern class Query<TData, TVariables>
	extends ReactComponentOfProps<QueryProps<TData, TVariables>> {}
