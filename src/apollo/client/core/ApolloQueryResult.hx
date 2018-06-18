package apollo.client.core;

import graphql.GraphQLError;

typedef ApolloQueryResult<T> = {
	var data:T;
	@:optional var errors:Array<GraphQLError>;
	var loading:Bool;
	var networkStatus:NetworkStatus;
	var stale:Bool;
}

