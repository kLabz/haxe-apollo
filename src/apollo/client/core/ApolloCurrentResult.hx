package apollo.client.core;

import haxe.extern.EitherType;

import apollo.client.error.ApolloError;
import graphql.GraphQLError;

typedef ApolloCurrentResult<T> = {
	var data:EitherType<T, {}>;
	@:optional var errors:Array<GraphQLError>;
	var loading:Bool;
	var networkStatus:NetworkStatus;
	@:optional var error:ApolloError;
	@:optional var partial:Bool;
}
