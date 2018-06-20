package apollo.link.error;

import js.Error;

import apollo.link.Operation;
import apollo.link.NextLink;
import graphql.GraphQLError;
import graphql.ExecutionResult;

typedef ErrorResponse = {
	@:optional var graphQLErrors:Array<GraphQLError>;
	@:optional var networkError:Error;
	@:optional var response:ExecutionResult;
	var operation:Operation;
	var forward:NextLink;
}
