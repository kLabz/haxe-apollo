package graphql;

typedef ExecutionResult = {
	@:optional var errors:Array<GraphQLError>;
	@:optional var data:Dynamic;
}
