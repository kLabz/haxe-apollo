package react.apollo;

import apollo.client.ApolloClient;
import apollo.client.core.ErrorPolicy;
import apollo.client.core.FetchPolicy;
import apollo.client.core.NetworkStatus;
import apollo.client.core.OperationVariables;
import apollo.client.error.ApolloError;
import react.ReactComponent;
import graphql.ASTDefs.DocumentNode;

typedef QueryResult<TData, TVariables> = {
	// > ObservableQueryFields<TData, TVariables>, TODO
	var client:ApolloClient<Any>;
	var data:Null<TData>;
	var loading:Bool;
	var networkStatus:NetworkStatus;
	@:optional var error:ApolloError;
}

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
