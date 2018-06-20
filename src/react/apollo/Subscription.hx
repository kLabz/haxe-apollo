package react.apollo;

import apollo.client.error.ApolloError;
import react.ReactComponent;
import graphql.ASTDefs.DocumentNode;

typedef SubscriptionResult<TData> = {
	var loading:Bool;
	@:optional var data:TData;
	@:optional var error:ApolloError;
}

typedef SubscriptionProps<TData, TVariables> = {
	var subscription:DocumentNode;
	var children:SubscriptionResult<TData>->ReactElement;
	@:optional var variables:TVariables;
	@:optional var shouldResubscribe:Any;
}

@:jsRequire('react-apollo', 'Subscription')
extern class Subscription<TData, TVariables>
	extends ReactComponentOfProps<SubscriptionProps<TData, TVariables>> {}
