package apollo.client.core;

import js.Error;

import apollo.client.core.UpdateQueryOptions;
import graphql.ASTDefs.DocumentNode;

typedef SubscribeToMoreOptions = SubscribeToMoreOptions_2<Any, OperationVariables>;
typedef SubscribeToMoreOptions_1<TData> = SubscribeToMoreOptions_2<TData, OperationVariables>;
typedef SubscribeToMoreOptions_2<TData, TVariables> = {
	var document:DocumentNode;
	@:optional var variables:TVariables;
	@:optional var updateQuery:UpdateQueryFn_2<TData, TVariables>;
	@:optional var onError:Error->Void;
}
