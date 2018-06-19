package apollo.link.error;

import haxe.extern.EitherType;
import js.Error;

import apollo.link.FetchResult;
import apollo.link.NextLink;
import apollo.link.Observable;
import apollo.link.Operation;
import graphql.GraphQLError;
import graphql.ExecutionResult;

typedef ErrorResponse = {
	@:optional var graphQLErrors:Array<GraphQLError>;
	@:optional var networkError:Error;
	@:optional var response:ExecutionResult;
	var operation:Operation;
	var forward:NextLink;
}

typedef ErrorHandler = EitherType<ErrorResponse -> Observable<FetchResult>, ErrorResponse -> Void>;

